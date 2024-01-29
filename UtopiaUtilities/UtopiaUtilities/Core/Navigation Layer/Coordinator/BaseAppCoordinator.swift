//
//  BaseAppCoordinator.swift
//  UtopiaUtilities
//
//  Created by Shady El-Maadawy on 28/01/2024.
//

import SwiftUI
import UtopiaKit
import Foundation

open class BaseAppCoordinator: CoordinatorProtocol {

    // MARK: - Properties
    
    public weak var parentCoordinator: CoordinatorProtocol?
    private var navigator: NavigatorProtocol = AppNavigator.instance
    
    public lazy var childCoordinators: [CoordinatorProtocol] = {
        let baseCoordinators: [CoordinatorProtocol] = .init()
        return baseCoordinators
    }()
    
    private let notifierListener: NotifierManagerListenerProtocol = UtopiaNotifierManager.shared

    // MARK: - Initialization
    
    public required init(parentCoordinator: CoordinatorProtocol?) {
        
        self.parentCoordinator = parentCoordinator
        self.configure()
    }
    

    // MARK: - Object Life Cycle;
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    // MARK: - Operations
    
    open func execute() { }
    
    /// initialize coordinator function
    /// - Parameters:
    ///   - contentView: View that will be initialized
    ///   - animated: true or false for animation
    ///   - operation: push to stack or set as root view
    public func initializationCoordinator<T: View>(with contentView: T, animated: Bool, operation: InitializationOperation = .rootView) {
        
        let view = BaseUIHostingController.init(
            rootView: contentView
        )
        notifierListener.listenToNotifier(
            observer: self,
            selector: #selector(self.deallocationNotificationReceived(notification:)),
            notificationIdentifier: view.instanceIdentifier,
            object: nil
        )
        
        if(operation == .rootView) {
          
            guard let parentCoordinator = parentCoordinator,
                  parentCoordinator.parentCoordinator == nil else {
                
                reInitialization(for: self, rawCoordinator: self)
                self.navigator.setView(contentView: view, animated: animated)
                
                return
            }
            self.navigator.setView(contentView: view, animated: animated)

            
        } else {
            
            self.navigator.pushView(contentView: view, animated: animated)

        }

    }
    
    /// Set view to as main view in navigation stack and remove all previous view
    /// - Parameters:
    ///   - contentVie: SwiftUI View
    ///   - animated: a bool value with true or false
    public func setView<T: View>(contentView: T, animated: Bool) {
       
        let baseViewController = BaseUIHostingController.init(rootView: contentView)

        self.navigator.setView(contentView: baseViewController, animated: animated)
    }
    
    /// Push SwiftUI View to stack
    /// - Parameters:
    ///   - contentView:required view to be pushed
    ///   - animated: animate view push or disable it
    public func pushView<T: View>(contentView: T, animated: Bool) {
      
        let baseViewController = BaseUIHostingController.init(rootView: contentView)
        self.navigator.pushView(contentView: baseViewController, animated: animated)

    }
    
    /// Pop SwiftUI View from stack
    /// - Parameter animated: animate view pop or disable it
    public func popView(animated: Bool) {
        self.navigator.popView(animated: animated)
    }
    

}

// MARK: - Configure

private extension BaseAppCoordinator {
    
    func configure() {
        
        parentCoordinator?.childDidStart(for: self)
        
    }
    
}

public extension BaseAppCoordinator {
    
    func initWindow(window: inout UIWindow) {
        
        self.navigator.initWindow(window: &window)
        
    }

}

// MARK: - Notifications

private extension BaseAppCoordinator {
    
    @objc func deallocationNotificationReceived(notification: NSNotification) {
        
        self.parentCoordinator?.childDidFinish(for: self)
    }



}

