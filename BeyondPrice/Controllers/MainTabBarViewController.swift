//
//  ViewController.swift
//  BeyondPrice
//
//  Created by 권정근 on 12/16/24.
//

import UIKit

class MainTabBarViewController: UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // view.backgroundColor = .systemBackground
        
        // let homeVC = UINavigationController(rootViewController: HomeViewController())
        
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        let searchVC = UINavigationController(rootViewController: SearchViewController())
        let feedVC = UINavigationController(rootViewController: FeedViewController())
        let todoListVC = UINavigationController(rootViewController: TodoListViewController())        
        
        homeVC.tabBarItem.image = UIImage(systemName: "square.stack.3d.up")
        searchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        feedVC.tabBarItem.image = UIImage(systemName: "note.text.badge.plus")
        todoListVC.tabBarItem.image = UIImage(systemName: "checklist")
        
        homeVC.tabBarItem.title = "Home"
        searchVC.tabBarItem.title = "Search"
        feedVC.tabBarItem.title = "Feed"
        todoListVC.tabBarItem.title = "Todo"
        
        tabBar.tintColor = .label
        tabBar.backgroundColor = .secondarySystemBackground
        
        setViewControllers([homeVC, todoListVC, feedVC, searchVC], animated: true)
        
    }
}

extension UINavigationController {
    
    func setupNavigationAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.shadowColor = nil
        appearance.backgroundColor = .red
        
        navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        
        navigationBar.standardAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
        
    }
}
