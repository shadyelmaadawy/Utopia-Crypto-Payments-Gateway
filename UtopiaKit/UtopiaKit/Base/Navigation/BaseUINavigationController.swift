//
//  BaseUINavigationController.swift
//  UtopiaKit
//
//  Created by Shady El-Maadawy on 27/01/2024.
//

import UIKit
import SwiftUI

public final class BaseUINavigationController: UINavigationController, UINavigationControllerDelegate, NavigatorControllerProtocol {
    
    // MARK: - Properties
    
    // dependency cycle
//    private let notifierPosterer: NotifierManagerPostProtocol = UtopiaNotifierManager.shared
    
    // MARK: - Initialization
    
    public init() {
        super.init(nibName: nil, bundle: nil)
        self.delegate = self
    }

    public override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }

    /// Learn the rules like a PRO, so you can break them like an ARTIST!
    public convenience init<T: View>(contentView: T) {
        self.init(
            rootViewController: BaseUIHostingController.init(
                rootView: contentView
            )
        )
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Operations

public extension BaseUINavigationController {
    
    func setView(contentView: BaseUIHostingController<some View>, animated: Bool) {
        
        self.setViewControllers(
            [contentView],
            animated: true
        )
        
    }
    
    func pushView<T>(contentView: BaseUIHostingController<T>, animated: Bool) where T : View {
        
        self.pushViewController(
            contentView,
            animated: animated
        )

    }

    func popView(animated: Bool) {
        self.popViewController(
            animated: animated
        )
    }
    

}

// MARK: - Delegates

public extension BaseUINavigationController {
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }

        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
//        notifierPosterer.postToNotifier(notificationIdentifier: "")
        NotificationCenter.default.post(
            name: Notification.Name(String.init(describing: fromViewController.self)),
            object: self,
            userInfo: nil
        )

    }

}
