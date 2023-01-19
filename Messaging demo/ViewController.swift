//
//  ViewController.swift
//  Messaging demo
//
//  Created by Andriy Pelykh on 19.01.2023.
//

import UIKit
import ZendeskSDKMessaging
import ZendeskSDK

// Code is taken from Zendesk official IOS demo app, but replaced parts related to Messaging SDK
// https://github.com/zendesk/ios_sdk_demo_apps/blob/master/UnifiedSDK/UnifiedSDK/ViewController.swift

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private var modalBackButton: UIBarButtonItem {
          UIBarButtonItem(barButtonSystemItem: .close,
                          target: self,
                          action: #selector(dismissViewController))
      }
    
    @IBAction func startMessaging(_ sender: Any) {
        // Create view controller for Messaging SDK
        guard let viewController = Zendesk.instance?.messaging?.messagingViewController() else { return }
        presentModally(viewController)
    }
    
    private func pushViewController(_ viewController: UIViewController) {
            self.navigationController?.pushViewController(viewController, animated: true)
        }

        private func presentModally(_ viewController: UIViewController,
                                    presenationStyle: UIModalPresentationStyle = .automatic) {
            viewController.navigationItem.leftBarButtonItem = modalBackButton
            
            let navigationController = UINavigationController(rootViewController: viewController)
            navigationController.modalPresentationStyle = presenationStyle

            present(navigationController, animated: true)
            
            self.navigationController?.show(viewController, sender: self)
        }

        /// Dismiss modal `viewController` action
        @objc private func dismissViewController() {
            navigationController?.dismiss(animated: true, completion: nil)
        }


}

