//
//  CoordinatorProtocol.swift
//  UtopiaUtilities
//
//  Created by Shady El-Maadawy on 27/01/2024.
//

import UtopiaKit
import SwiftUI
import Foundation

// MARK: - Enums

public enum InitializationOperation {
    case rootView
    case push
}

// MARK: - Protocols

public protocol CoordinatorProtocol: AnyObject {
    /// Parent coordinator reference
    var parentCoordinator: CoordinatorProtocol? { get set }
    /// An array of child coordinators in coordinator pattern
    var childCoordinators: [CoordinatorProtocol] { get set }
    /// Initialization coordinator instance with required parameters
    init(parentCoordinator: CoordinatorProtocol?)
    /// Execute root view controller in coordinator
    func execute()

}

internal extension CoordinatorProtocol {
    
    /// Deinitialization a coordinator
    func childDidFinish(for coordinator: CoordinatorProtocol?){
        
        guard let coordinator = coordinator else {
            return
        }
        for (index, child) in childCoordinators.enumerated() {
            if child === coordinator {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    /// Initialize a child coordinator
    func childDidStart(for coordinator: CoordinatorProtocol?) {
        
        guard let coordinator = coordinator else {
            return
        }
        childCoordinators.append(coordinator)
    }
    
    /// ReInitializlation child
    /// - Parameters:
    func childDidInitialization(rawCoordinator: CoordinatorProtocol, submitParentCoordinator: CoordinatorProtocol) {
        
        submitParentCoordinator.childDidStart(for: rawCoordinator)
        rawCoordinator.parentCoordinator = submitParentCoordinator
    }
    
    /// Re initialization for Initialization
    /// - Parameters:
    ///   - coordinator: coordinator description
    ///   - rawCoordinator: same as the past, for save
    func reInitialization(for coordinator: CoordinatorProtocol?, rawCoordinator: CoordinatorProtocol) {
        
        guard let coordinator = coordinator else {
            return
        }
        guard let parentCoordinator = coordinator.parentCoordinator else {
            return
        }

        for(_, child) in parentCoordinator.childCoordinators.enumerated() {
            
            if(parentCoordinator.parentCoordinator == nil) {

                parentCoordinator.childDidFinish(
                    for: child
                )
                childDidInitialization(
                    rawCoordinator: rawCoordinator,
                    submitParentCoordinator: parentCoordinator
                )
            } else {
                
                parentCoordinator.childDidFinish(
                    for: child
                )
                reInitialization(for: child.parentCoordinator, rawCoordinator: rawCoordinator)

            }

        }
    }
}

