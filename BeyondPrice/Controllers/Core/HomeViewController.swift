//
//  HomeViewController.swift
//  BeyondPrice
//
//  Created by 권정근 on 12/16/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - UI Components
    private let homeHeaderView: CustomHeaderView = CustomHeaderView(title: "투데이")
    
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        
        configureConstraints()
    }
    
    // MARK: - Layouts
    private func configureConstraints() {
        view.addSubview(homeHeaderView)
        
        homeHeaderView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            homeHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            homeHeaderView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            homeHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            homeHeaderView.heightAnchor.constraint(equalToConstant: 60)
            
        ])
    }
}


