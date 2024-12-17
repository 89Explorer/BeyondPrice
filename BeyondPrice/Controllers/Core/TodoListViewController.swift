//
//  TodoListViewController.swift
//  BeyondPrice
//
//  Created by 권정근 on 12/16/24.
//

import UIKit

class TodoListViewController: UIViewController {

    // MARK: - UI Components
    private let todoHeaderView: CustomHeaderView = CustomHeaderView(title: "투두리스트")
    

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        configureConstraints()
    }
    
    // MARK: - Layouts
    private func configureConstraints() {
        view.addSubview(todoHeaderView)
        
        todoHeaderView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            todoHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            todoHeaderView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            todoHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            todoHeaderView.heightAnchor.constraint(equalToConstant: 60)
            
        ])
    }
}
