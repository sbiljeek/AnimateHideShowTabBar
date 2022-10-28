//
//  MainTabBarController.swift
//  AnimateHideShowTabBar
//
//  Created by Salman Biljeek on 10/27/22.
//

import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = nil
        tabBar.tintColor = .label
        
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBar.standardAppearance = tabBarAppearance
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = tabBarAppearance
        }
        
        let homeController = ViewController()
        let searchController = UIViewController()
        let addController = UIViewController()
        let notificationsController = UIViewController()
        let profileController = UIViewController()
        
        let houseFill = UIImage(systemName: "house.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.label)
        let magnifyingGlass = UIImage(systemName: "magnifyingglass")?.withRenderingMode(.alwaysOriginal).withTintColor(.label)
        let plusCircle = UIImage(systemName: "plus.circle")?.withRenderingMode(.alwaysOriginal).withTintColor(.label)
        let bellFill = UIImage(systemName: "bell.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.label)
        let personCropCircle = UIImage(systemName: "person.crop.circle")?.withRenderingMode(.alwaysOriginal).withTintColor(.label)
        
        let homeIcon = houseFill?.withRenderingMode(.alwaysTemplate).withConfiguration(UIImage.SymbolConfiguration(weight: .bold)).withBaselineOffset(fromBottom: 12) ?? UIImage()
        let searchIcon = magnifyingGlass?.withRenderingMode(.alwaysTemplate).withConfiguration(UIImage.SymbolConfiguration(weight: .bold)).withBaselineOffset(fromBottom: 12) ?? UIImage()
        let plusIcon = plusCircle?.withRenderingMode(.alwaysTemplate).withConfiguration(UIImage.SymbolConfiguration(weight: .bold)).withBaselineOffset(fromBottom: 12) ?? UIImage()
        let bellIcon = bellFill?.withRenderingMode(.alwaysTemplate).withConfiguration(UIImage.SymbolConfiguration(weight: .bold)).withBaselineOffset(fromBottom: 12) ?? UIImage()
        let profileIcon = personCropCircle?.withRenderingMode(.alwaysTemplate).withConfiguration(UIImage.SymbolConfiguration(weight: .bold)).withBaselineOffset(fromBottom: 12) ?? UIImage()
        
        viewControllers = [
            createNavController(viewController: homeController, tabBarImage: homeIcon),
            createNavController(viewController: searchController, tabBarImage: searchIcon),
            createNavController(viewController: addController, tabBarImage: plusIcon),
            createNavController(viewController: notificationsController, tabBarImage: bellIcon),
            createNavController(viewController: profileController, tabBarImage: profileIcon)
        ]
    }
    
    fileprivate func createNavController(viewController: UIViewController, tabBarImage: UIImage) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = tabBarImage
        navController.tabBarItem.imageInsets = .init(top: 5, left: 0, bottom: -5, right: 0)
        return navController
    }
}
