//
//  MediumTableCell.swift
//  BeyondPrice
//
//  Created by 권정근 on 12/17/24.
//

import UIKit

class MediumTableCell: UICollectionViewCell, SelfConfiguringCell {
    
    // MARK: - Variables
    static let reuseIdentifier: String = "MediumTableCell"
    
    // MARK: - UI Components
    private let title: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.textColor = .label
        return label
    }()
    
    private let subTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let feedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return imageView
    }()
    
    private let goToButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.tintColor = .label
        button.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return button
    }()
    
    private lazy var innerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [title, subTitle])
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    }()
    
    private lazy var outerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [feedImageView, innerStackView, goToButton])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        return stackView
    }()
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    private func configureConstraints() {
        
        contentView.addSubview(outerStackView)
        
        outerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            outerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            outerStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            outerStackView.topAnchor.constraint(equalTo: contentView.topAnchor)
            
        ])
    }
    
    // MARK: - Functions
    func configure(with app: App) {
        title.text = app.name
        subTitle.text = app.subheading
        feedImageView.image = UIImage(named: app.image)
    }
}
