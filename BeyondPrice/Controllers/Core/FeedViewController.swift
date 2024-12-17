//
//  FeedViewController.swift
//  BeyondPrice
//
//  Created by 권정근 on 12/16/24.
//

import UIKit

class FeedViewController: UIViewController {
    
    // MARK: - UI Components
    private let feedHeaderView: CustomHeaderView = CustomHeaderView(title: "피드")
    
    
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        configureConstraints()
    }
    
    // MARK: - Layouts
    private func configureConstraints() {
        view.addSubview(feedHeaderView)
        
        feedHeaderView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            feedHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            feedHeaderView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            feedHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            feedHeaderView.heightAnchor.constraint(equalToConstant: 60)
            
        ])
    }

}
