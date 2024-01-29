<p align="center">

  <img width="250" height="350" src="https://upload.wikimedia.org/wikipedia/commons/0/01/Ethereum_logo_translucent.svg">

</p>

# Utopia-Crypto-Payments-Gateway

HEY HEY HEY, howwwww are you mates!! hope things go well with you in this somalia weather.

To be honest I do not know what is this exactly, semi-bank? maybe, a payment gateway? why not, both of them? I think so!

As usual, this project, is like the person behind it.. filled of simplicity, and contrary to usual, I will talk much more this time, because working on this project was ***filled with fantasy***!

 - Based on Web3 protocol and Infura Ethereum erc-20 node 
 - NFC tags as used as credit cards.

## Requirements:

 - Generate new public/private keys for securing the gateway, put the public key here [#](https://github.com/shadyelmaadawy/Utopia-Crypto-Payments-Gateway/blob/master/Utopia-Crypto%20Payments%20Port/Utopia-Crypto%20Payments%20Port/Application/Delegates/UtopiaPortApp.swift#L19), and private key here [#](https://github.com/shadyelmaadawy/Utopia-Crypto-Payments-Gateway/blob/master/Utopia-Crypto%20Payments%20Gateway/Application/Delegates/UtopiaGatewayApp.swift#L18)
 - Register a new account at Infura or build your own node and take a new node key or full address to use the project, change it as this line. [#](https://github.com/shadyelmaadawy/Utopia-Crypto-Payments-Gateway/blob/master/Utopia-Crypto%20Payments%20Gateway/Data/Network/End-Points/BaseEnd-Points.swift#L11)

## What is that?

It's five buttons, three text fields, and four labels LOL, yeah design is not super fancy.

To be honest, I do not know what I should call it, but It’s FinTech project, It’s uses Ethereum network to pay via it to make it efficiently work, We (Development/business team) could say It’s a real-world payment gateway.

Nfc is used here as a credit card, the client/customer will save his wallet private key at it, and from your side, you will just set the amount of the pay and scan the tag, bingo!

It’s kinda secure, modern, and well-designed, uses the power of mobile devices that we use it for texting only LOL.

## A few details about system design: 

 - Business Software Design approach: **Clean Architecture** 
 
 ![](https://miro.medium.com/v2/resize:fit:1050/1*gNMlCdPkghf_2F8v3MGtqA.png)
 
 - User-Interface architecture pattern: **MVVM**
 
    ![](https://miro.medium.com/v2/resize:fit:1400/0*inCqLix0iJSg4Nj7)

 - Naviagtor design pattern: **Coordinator**

![](https://assets-global.website-files.com/5e305a6cb7083222527a89cc/5e3adace3eccb56cfcce6e42_1*dVJv23ChJixjayLKzL9HRg.png)

## NFC Cryptography algorithms:

 - Asymmetric-Key algorithm:
     - RSA With 512 bits key size , unfortunately very low-capacity in NFC Tag, but It's still safe
 - Symmetric-key algorithm:
     - AES With 256 bits key size.

## Challenges that had been passed In this project:

- Secure NFC tag, if you lose your tag, it's not easy to know your wallet secret key.
- Implement Coordinator pattern without need to use SwiftUI Navigationor. 
- Support multiple-levels of coordinators, you can be the millionth coordinator, and with one line of code, you will re-initialize the whole system, no magic  ✨.

```swift
    override func execute() {
    
        let configureView = ConfigurationConfigurator.assemble(
            coordinator: self
        )
        super.initializationCoordinator(
            with: configureView,
            animated: true,
            operation: .rootView
        )
        
    }
```
-------
Although the size of the codebase is not huge, <u>**This system is free of memory leaks**</u>, we are in the third-millennium, not the Dark ages.

![](https://i.imgur.com/ZXoslhj.png)


## Project structure:

- Binaries:
     - Port:
         - Used from customer/client side to scan NFC Tag and write the wallet private key inside it. 
     - Gateaway:
         - Used to scan NFC Tag and get paid from it.
- Frameworks:
    - Utilities:
        - Contains cryptography, Keychain, Userdefaults.. etc, and most of project logic is located there.
    - Kit:
        - Contains user-interface components, base, and custom, shared between binaries and can be used between them.

## Project tree:

```
 Utopia-Crypto-Payments-Gateway
├─ .DS_Store
├─ README.md
├─ Utopia-Crypto Payments Gateway.xcodeproj
│  ├─ project.pbxproj
│  ├─ project.xcworkspace
│  │  ├─ contents.xcworkspacedata
│  │  ├─ xcshareddata
│  │  │  └─ IDEWorkspaceChecks.plist
│  │  └─ xcuserdata
│  │     └─ shadudiix.xcuserdatad
│  │        └─ UserInterfaceState.xcuserstate
│  ├─ xcshareddata
│  │  └─ xcschemes
│  │     └─ Utopia-Crypto Payments Gateway.xcscheme
│  └─ xcuserdata
│     └─ shadudiix.xcuserdatad
│        ├─ xcdebugger
│        │  └─ Breakpoints_v2.xcbkptlist
│        └─ xcschemes
│           └─ xcschememanagement.plist
├─ Utopia-Crypto Payments Gateway
│  ├─ .DS_Store
│  ├─ Application
│  │  ├─ App Coordinator
│  │  │  └─ AppCoordinator.swift
│  │  ├─ Configuration
│  │  │  ├─ Utopia-Crypto Payments Gateway.entitlements
│  │  │  └─ Utopia-Crypto-Payments-Gateway-Info.plist
│  │  ├─ Delegates
│  │  │  ├─ AppDelegate.swift
│  │  │  ├─ SceneDelegate.swift
│  │  │  └─ UtopiaGatewayApp.swift
│  │  ├─ Documentation.docc
│  │  │  └─ Documentation.md
│  │  ├─ Preview Content
│  │  │  └─ Preview Assets.xcassets
│  │  │     └─ Contents.json
│  │  └─ Resources
│  │     ├─ Assets.xcassets
│  │     │  ├─ AccentColor.colorset
│  │     │  │  └─ Contents.json
│  │     │  ├─ AppIcon.appiconset
│  │     │  │  └─ Contents.json
│  │     │  ├─ Contents.json
│  │     │  └─ IndianRed.colorset
│  │     │     └─ Contents.json
│  │     └─ Preview Content
│  │        └─ Preview Assets.xcassets
│  │           └─ Contents.json
│  ├─ Data
│  │  ├─ Decryption Service
│  │  │  └─ DecryptionServiceImplementation.swift
│  │  ├─ NFC Service
│  │  │  └─ NFCServiceImplementation.swift
│  │  ├─ Network
│  │  │  ├─ End-Points
│  │  │  │  └─ BaseEnd-Points.swift
│  │  │  ├─ Messages
│  │  │  │  └─ PayRequestMessage.swift
│  │  │  └─ Web3EngineService.swift
│  │  ├─ Repositories
│  │  │  ├─ NFCRepositoryImplementation.swift
│  │  │  └─ PayRepositoryImplementation.swift
│  │  └─ Storage
│  │     ├─ UtopiaStorageManager.swift
│  │     └─ WalletMangerProtocols.swift
│  ├─ Domain
│  │  ├─ Entities
│  │  │  ├─ NFC
│  │  │  │  └─ OutputNFCWalletMessage.swift
│  │  │  └─ Pay
│  │  │     ├─ InputPayMessage.swift
│  │  │     └─ OutputPayMessage.swift
│  │  ├─ Interfaces
│  │  │  ├─ Repositories
│  │  │  │  ├─ NFCRepositoryProtocol.swift
│  │  │  │  └─ PayRepositoryProtocol.swift
│  │  │  ├─ Services
│  │  │  │  ├─ DecryptionServiceProtocol.swift
│  │  │  │  ├─ NFCServiceProtocol.swift
│  │  │  │  └─ PayEngineServiceProtocol.swift
│  │  │  └─ UseCases
│  │  │     ├─ ConfigureUseCaseProtocol.swift
│  │  │     ├─ PayUseCaseProtocol.swift
│  │  │     ├─ ReconfigureUseCaseProtocol.swift
│  │  │     ├─ ValidateEthereumPayValueUseCaseProtocol.swift
│  │  │     └─ ValidateEthereumWalletUseCaseProtocol.swift
│  │  └─ UseCases
│  │     ├─ ConfigureUseCaseImplementation.swift
│  │     ├─ PayUseCaseImplementation.swift
│  │     ├─ ReconfigureUseCaseImplementation.swift
│  │     ├─ ValidateEthereumPayValueUseCaseImplementation.swift
│  │     └─ ValidateEthereumWalletUseCaseImplementation.swift
│  └─ Presentation
│     └─ Modules
│        ├─ Configure
│        │  ├─ Configuration
│        │  │  ├─ ConfigurationConfigurator.swift
│        │  │  └─ ConfigurationProtocols.swift
│        │  ├─ Coordinator
│        │  │  ├─ ConfigureCoordinator.swift
│        │  │  └─ ConfigureCoordinatorProtocols.swift
│        │  ├─ View
│        │  │  └─ ConfigureView.swift
│        │  └─ ViewModel
│        │     └─ ConfigureViewModel.swift
│        ├─ Home
│        │  ├─ Configuration
│        │  │  ├─ HomeViewConfigurator.swift
│        │  │  └─ HomeViewProtocols.swift
│        │  ├─ Coordinator
│        │  │  ├─ HomeCoordinator.swift
│        │  │  └─ HomeCoordinatorProtocols.swift
│        │  ├─ View
│        │  │  └─ HomeView.swift
│        │  └─ ViewModel
│        │     └─ HomeViewModel.swift
│        └─ Scan To Pay
│           ├─ Configuration
│           │  ├─ ScanToPayConfigurator.swift
│           │  └─ ScanToPayProtocols.swift
│           ├─ Coordinator
│           │  ├─ ScanToPayCoordinator.swift
│           │  └─ ScanToPayCoordinatorProtocols.swift
│           ├─ View
│           │  └─ ScanToPayView.swift
│           └─ ViewModel
│              └─ ScanToPayViewModel.swift
├─ Utopia-Crypto Payments Port
│  ├─ .DS_Store
│  ├─ Utopia-Crypto Payments Port.xcodeproj
│  │  ├─ project.pbxproj
│  │  ├─ xcshareddata
│  │  │  └─ xcschemes
│  │  │     └─ Utopia-Crypto Payments Port.xcscheme
│  │  └─ xcuserdata
│  │     └─ shadudiix.xcuserdatad
│  │        └─ xcschemes
│  │           └─ xcschememanagement.plist
│  ├─ Utopia-Crypto Payments Port
│  │  ├─ .DS_Store
│  │  ├─ Application
│  │  │  ├─ .DS_Store
│  │  │  ├─ App Coordinator
│  │  │  │  └─ AppCoordinator.swift
│  │  │  ├─ Delegates
│  │  │  │  ├─ AppDelegate.swift
│  │  │  │  ├─ SceneDelegate.swift
│  │  │  │  └─ UtopiaPortApp.swift
│  │  │  ├─ Documentation.docc
│  │  │  │  └─ Documentation.md
│  │  │  ├─ Extensions
│  │  │  │  └─ Jotunheimr+Ext.swift
│  │  │  └─ Resources
│  │  │     ├─ .DS_Store
│  │  │     ├─ Assets.xcassets
│  │  │     │  ├─ AccentColor.colorset
│  │  │     │  │  └─ Contents.json
│  │  │     │  ├─ AppIcon.appiconset
│  │  │     │  │  └─ Contents.json
│  │  │     │  ├─ Contents.json
│  │  │     │  └─ IndianRed.colorset
│  │  │     │     └─ Contents.json
│  │  │     ├─ Configuration
│  │  │     │  ├─ .DS_Store
│  │  │     │  ├─ Utopia-Crypto Payments-Port.entitlements
│  │  │     │  └─ Utopia-Crypto-Payments-Port-Info.plist
│  │  │     └─ Preview Content
│  │  │        └─ Preview Assets.xcassets
│  │  │           └─ Contents.json
│  │  ├─ Data
│  │  │  ├─ Encryption Service
│  │  │  │  └─ EncryptionServiceImplementation.swift
│  │  │  ├─ NFC Service
│  │  │  │  ├─ Messages
│  │  │  │  │  └─ NFCWriteRequestMessage.swift
│  │  │  │  └─ NFCServiceImplementation.swift
│  │  │  └─ Repositories
│  │  │     └─ NFCRepositoryImplementation.swift
│  │  ├─ Domain
│  │  │  ├─ Entities
│  │  │  │  └─ InputNFCPayload.swift
│  │  │  ├─ Interfaces
│  │  │  │  ├─ Repositories
│  │  │  │  │  └─ NFCRepositoryProtocol.swift
│  │  │  │  ├─ Services
│  │  │  │  │  ├─ EncryptionServiceProtocol.swift
│  │  │  │  │  └─ NFCServiceProtocol.swift
│  │  │  │  ├─ ValidateUseCaseProtocol.swift
│  │  │  │  └─ WriteUserCaseProtocol.swift
│  │  │  └─ UseCases
│  │  │     ├─ ValidatePrivateKeyUseCaseImplementation.swift
│  │  │     └─ WriteUseCaseImplementation.swift
│  │  └─ Presentation
│  │     ├─ .DS_Store
│  │     └─ Modules
│  │        ├─ .DS_Store
│  │        └─ Write NFC
│  │           ├─ .DS_Store
│  │           ├─ Configurator
│  │           │  ├─ WriteNFCConfigurator.swift
│  │           │  └─ WriteNFCProtocols.swift
│  │           ├─ Coordinator
│  │           │  ├─ WriteNFCCoordinator.swift
│  │           │  └─ WriteNFCCoordinatorProtocols.swift
│  │           ├─ View
│  │           │  └─ WriteNFCView.swift
│  │           └─ ViewModel
│  │              └─ WriteNFCViewModel.swift
│  └─ Utopia-Crypto-Payments-Writer-Info.plist
├─ Utopia-Gateway.xcworkspace
│  ├─ contents.xcworkspacedata
│  ├─ xcshareddata
│  │  ├─ IDEWorkspaceChecks.plist
│  │  ├─ WorkspaceSettings.xcsettings
│  │  └─ swiftpm
│  │     └─ Package.resolved
│  └─ xcuserdata
│     └─ shadudiix.xcuserdatad
│        ├─ IDEFindNavigatorScopes.plist
│        ├─ UserInterfaceState.xcuserstate
│        ├─ WorkspaceSettings.xcsettings
│        ├─ xcdebugger
│        │  └─ Breakpoints_v2.xcbkptlist
│        └─ xcschemes
│           └─ xcschememanagement.plist
├─ UtopiaKit
│  ├─ .DS_Store
│  ├─ UtopiaKit.xcodeproj
│  │  ├─ project.pbxproj
│  │  └─ xcuserdata
│  │     └─ shadudiix.xcuserdatad
│  │        └─ xcschemes
│  │           └─ xcschememanagement.plist
│  └─ UtopiaKit
│     ├─ .DS_Store
│     ├─ Base
│     │  ├─ BaseContainerView.swift
│     │  ├─ BaseDivider.swift
│     │  ├─ BaseLabel.swift
│     │  ├─ BasePlainList.swift
│     │  ├─ BaseProgressView.swift
│     │  ├─ BaseSpacer.swift
│     │  ├─ BaseTextField.swift
│     │  ├─ BaseUIHostingController.swift
│     │  ├─ BaseView.swift
│     │  ├─ Buttons
│     │  │  ├─ BaseButton.swift
│     │  │  └─ BaseCircleButton.swift
│     │  └─ Navigation
│     │     ├─ BaseUINavigationController.swift
│     │     └─ NavigatorControllerProtocols.swift
│     ├─ Configuration
│     │  ├─ UserInterfaceKit.docc
│     │  │  └─ UserInterfaceKit.md
│     │  └─ UserInterfaceKit.h
│     ├─ Custom
│     │  ├─ NFCView.swift
│     │  ├─ PayTextField.swift
│     │  ├─ PayView.swift
│     │  └─ TransactionView.swift
│     └─ Extensions
│        ├─ Color+Ext.swift
│        ├─ Date+Ext.swift
│        └─ Image+Ext.swift
└─ UtopiaUtilities
   ├─ .DS_Store
   ├─ UtopiaUtilities.xcodeproj
   │  ├─ project.pbxproj
   │  ├─ project.xcworkspace
   │  │  ├─ contents.xcworkspacedata
   │  │  └─ xcshareddata
   │  │     ├─ IDEWorkspaceChecks.plist
   │  │     └─ swiftpm
   │  │        └─ Package.resolved
   │  └─ xcuserdata
   │     └─ shadudiix.xcuserdatad
   │        └─ xcschemes
   │           └─ xcschememanagement.plist
   └─ UtopiaUtilities
      ├─ Core
      │  ├─ Common
      │  │  ├─ Configuration
      │  │  │  ├─ Utilities.docc
      │  │  │  │  └─ Utilities.md
      │  │  │  └─ Utilities.h
      │  │  └─ Extensions
      │  │     ├─ CharacterSet+Ext.swift
      │  │     ├─ NSObject+Ext.swift
      │  │     └─ String+Ext.swift
      │  ├─ Navigation Layer
      │  │  ├─ Coordinator
      │  │  │  ├─ BaseAppCoordinator.swift
      │  │  │  └─ CoordinatorProtocol.swift
      │  │  └─ Navigator
      │  │     ├─ AppNavigator.swift
      │  │     └─ NavigatorProtocols.swift
      │  └─ Presentation Layer
      │     └─ ViewModel
      │        └─ UtopiaBaseViewModel.swift
      ├─ Cryptography
      │  ├─ CryptographyEngine.swift
      │  └─ CryptographyProtocols.swift
      ├─ Ethereum Module
      │  ├─ EthereumModule.swift
      │  └─ EthereumModuleProtocols.swift
      ├─ KeyChain
      │  ├─ KeyChainEngine.swift
      │  ├─ KeyChainManagementProtocol.swift
      │  └─ Vault
      │     ├─ UtopiaVaultManager.swift
      │     └─ VaultManagerProtocols.swift
      ├─ Notification Center
      │  ├─ Notifier Manager
      │  │  ├─ NotifierManagerProtocols.swift
      │  │  └─ UtopiaNotifierManager.swift
      │  └─ Notifier
      │     ├─ UtopiaNotifier.swift
      │     └─ UtopiaNotifierProtocols.swift
      └─ Storage Management
         ├─ StorageManagementProtocol.swift
         └─ UserDefaultsEngine.swift
```

## 3rd-Party Modules:

 1. [Jotunheimr / NFC Tag
    Reader](https://github.com/shadyelmaadawy/Jotunheimr/tree/master) -
    Thanks to <u>SHADY EL-MAADAWY </u>  ✨
2. [Web3 Protocol Implementation](https://github.com/Boilertalk/Web3.swift) ( Maybe I
    will Implement it from scratch later ) - <u>Thanks to Boilertalk</u>

## PoC:

I donna own cryptocurrency, so success message will never appear on my side.

 - Wallet address:
    - 0x1c8Ea886A727AC3145Ad16176060436d72a52AE2  
- Wallet private key:
    - af7eae110ae0c4582a3338f67210c37fe03d4344a98a5fac659a6037d8e32834

 - Port:

![](https://raw.githubusercontent.com/shadyelmaadawy/Utopia-Crypto-Payments-Gateway/master/PoC/Port-PoC.gif)

- Gateaway:

![](https://raw.githubusercontent.com/shadyelmaadawy/Utopia-Crypto-Payments-Gateway/master/PoC/Gateaway-PoC.gif)


## To Infinity and beyond!

This project was super-fun to work on, from concept, user interface design, technical design, and implementation, and even documentation writing ( ***Almost every line is documented*** ), I enjoyed writing this project, it made a huge revival for my experiences, as usual, I mixed a lot of my knowledge and experiences In the same place, hope you enjoyed reading the source code 💜✨

## License: 

This project is an express patent and <u>**licensed under *Apache 2.0***</u>

## Credits

### Copyright (©) 2024, Shady K. Maadawy, All rights reserved. 
 [@shadudiix](https://github.com/shadyelmaadawy) ✨
