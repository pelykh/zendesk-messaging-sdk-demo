//
//  AppDelegate.swift
//  Messaging demo
//
//  Created by Andriy Pelykh on 19.01.2023.
//

import UIKit
import ZendeskSDKMessaging
import ZendeskSDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //Initialize Zendesk Messaging SDK
        Zendesk.initialize(withChannelKey: "eyJzZXR0aW5nc191cmwiOiJodHRwczovL2Nvbi1sZWFmd29ya3MuemVuZGVzay5jb20vbW9iaWxlX3Nka19hcGkvc2V0dGluZ3MvMDFHTlk0MjVWNUtTSkcxQkJEVEQ5NU5BSlouanNvbiJ9",
                           messagingFactory: DefaultMessagingFactory()) { result in
                if case let .failure(error) = result {
                    print("Messaging did not initialize.\nError: \(error.localizedDescription)")
                }
            }
        
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

