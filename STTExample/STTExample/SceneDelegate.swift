//
//  SceneDelegate.swift
//  STTExample
//
//  Created by 김효성 on 2020/11/02.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = MainViewController(mainView: MainView())
        window.makeKeyAndVisible()
        self.window = window
    }
}

