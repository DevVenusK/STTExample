//
//  AppDelegate.swift
//  STTExample
//
//  Created by 김효성 on 2020/11/02.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow()
        let mainView = MainView()
        guard let speechRecognizer = SpeechRecognizer(locale: Locale(identifier: "ko-KR")) else { return false }
        window.rootViewController = MainViewController(mainView: mainView, speechRecognizer: speechRecognizer)
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}

