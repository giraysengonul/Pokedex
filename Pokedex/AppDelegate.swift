//
//  AppDelegate.swift
//  Pokedex
//
//  Created by hakkı can şengönül on 11.10.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.makeKeyAndVisible()
        let layout = UICollectionViewFlowLayout()
        window?.rootViewController = navigationController(rootViewController: PokedexController(collectionViewLayout: layout))
        return true
    }
    
    private func navigationController(rootViewController: UICollectionViewController) -> UINavigationController{
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .mainPink
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.navigationBar.compactAppearance = appearance
        navigationController.navigationBar.standardAppearance = appearance
        navigationController.navigationBar.scrollEdgeAppearance = appearance
        navigationController.navigationBar.compactScrollEdgeAppearance = appearance
        return navigationController
    }
}

