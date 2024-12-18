//
//  FeaturedCell.swift
//  BeyondPrice
//
//  Created by 권정근 on 12/17/24.
//

import UIKit

class FeaturedCell: UICollectionViewCell, SelfConfiguringCell {
    
    // MARK: - Variables
    static var reuseIdentifier: String = "FeaturedCell"
    
    // MARK: - UI Components
    
    private let separator: UIView = {
        let view = UIView()
        view.backgroundColor = .quaternaryLabel
        return view
    }()
    
    private let tagline: UILabel = {
        let label = UILabel()
        label.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 12, weight: .bold))
        label.textColor = .systemBlue
        return label
    }()
    
    private let title: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.textColor = .label
        return label
    }()
    
    private let subTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let feedimageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var totalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [separator, tagline, title, subTitle, feedimageView])
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    }()
    
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .clear
        
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    private func configureConstraints() {
        contentView.addSubview(totalStackView)
        
        totalStackView.translatesAutoresizingMaskIntoConstraints = false
        separator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            separator.heightAnchor.constraint(equalToConstant: 1),
            
            totalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            totalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            totalStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            totalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ])
        
        totalStackView.setCustomSpacing(10, after: separator)
        totalStackView.setCustomSpacing(5, after: subTitle)
        
    }
    
    // MARK: - Functions
    func configure(with app: App) {
        tagline.text = app.tagline.uppercased()
        title.text = app.name
        subTitle.text = app.subheading
        feedimageView.image = UIImage(named: app.image)
    }
}
