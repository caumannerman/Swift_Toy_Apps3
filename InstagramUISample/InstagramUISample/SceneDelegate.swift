//
//  SceneDelegate.swift
//  InstagramUISample
//
//  Created by 양준식 on 2022/04/04.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.backgroundColor = .systemBackground
        window?.rootViewController = TabBarController()
        window?.tintColor = .label //다크모드 여부에 따라 흑 or 백
        window?.makeKeyAndVisible()
    }

   


}

