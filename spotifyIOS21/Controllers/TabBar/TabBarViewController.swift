//
//  TabBarViewController.swift
//  spotifyIOS21
//
//  Created by Isa Melsov on 18/2/24.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        generateTabBar()
        setTabBarAppearance()
        self.navigationItem.setHidesBackButton(true, animated: false)
    }

    private func generateTabBar() {
            viewControllers = [
                generareVC(viewController: HomeViewController(), title: "Home", image: UIImage(systemName: "music.note.house")),
                generareVC(viewController: SearchViewController(), title: "Search", image: UIImage(systemName: "magnifyingglass")),
                generareVC(viewController: LibraryViewController(), title: "Your Library", image: UIImage(systemName: "book"))
            ]
        }
        
        private func generareVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
            viewController.tabBarItem.title = title
            viewController.tabBarItem.image = image
            viewController.navigationItem.largeTitleDisplayMode = .always
            return viewController
        }
        
        private func setTabBarAppearance() {
            let roundLayer = CAShapeLayer()
            roundLayer.fillColor = UIColor.mainWhite.cgColor
            tabBar.tintColor = .tabBarItemAccent
            tabBar.unselectedItemTintColor = .tabBarItemLight
            tabBar.barTintColor = .tabBarTintBackground
        }
}

