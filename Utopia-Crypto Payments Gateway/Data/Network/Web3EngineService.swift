//
//  Web3EngineService.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 21/01/2024.
//

import Web3
import Web3PromiseKit
import Web3ContractABI
import Combine
import Foundation

final class Web3EngineService {
    
    // MARK: - Enums

    private enum PayErrorsCode: Error {
        case payFailed
        case invalidAddress
        case badQuantity
    }

}
// MARK: - Operations

extension Web3EngineService: PayEngineServiceProtocol {
    
    func pay(with message: PayMessageRequestProtocol) -> AnyPublisher<String, Error> {

        return Future.init { [weak self] futureResult in
            
            guard let _ = self else { return }
            
            Task.init {
                do  {
                    
                    let webClient = Web3.init(
                        rpcURL: message.rpcURLAddress.rawValue
                    )

                    let customerWallet = try? EthereumPrivateKey.init(
                        privateKey: message.requestPayMessage.walletPrivateKey.bytes
                    )
                    guard let customerWallet = customerWallet else {
                        throw PayErrorsCode.invalidAddress
                    }
                    
                    let receivingWallet = EthereumAddress.init(
                        hexString: message.requestPayMessage.receivingWalletAddress
                    )
                    
                    guard let receivingWallet = receivingWallet else {
                        throw PayErrorsCode.invalidAddress
                    }
                    
                    do {

                        let transactionNonce = try await webClient.eth.getTransactionCount(
                            address: customerWallet.address, block: .latest
                        ).async()
                        
                        let sendQuantity = BigUInt.init(integerLiteral: UInt64(
                            message.requestPayMessage.sendQuantity)
                        )

                        let ethereumTransaction = EthereumTransaction(
                            nonce: transactionNonce,
                            gasPrice: EthereumQuantity(quantity: 21.gwei),
                            to: receivingWallet,
                            value: EthereumQuantity(quantity: sendQuantity)
                        )
                        
                        let signedTransaction = try await ethereumTransaction.sign(
                            with: customerWallet, chainId: 1
                        ).promise.async()
                        futureResult(
                            .success(
                                signedTransaction.data.hex()
                            )
                        )
                        
                    }
                    catch {
                        throw error
                    }

                }
                catch {
                    futureResult(.failure(error))
                }

            }
            
        }
        .receive(on: DispatchQueue.global(qos: .userInitiated))
        .eraseToAnyPublisher()

    }

}
