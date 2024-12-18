//
//  SectionHeader.swift
//  BeyondPrice
//
//  Created by 권정근 on 12/18/24.
//

import UIKit

/*
class SectionHeader: UICollectionReusableView {
    
    // MARK: - Variables
    static let reuseIdentifier = "SectionHeader"
    
    // MARK: - UI Components
    private let separator: UIView = {
        let view = UIView()
        view.backgroundColor = .quaternaryLabel
        return view
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 22, weight: .bold))
        return label
    }()
    
    let subTitle: UILabel = {
        let label = UILabel()
        label.textColor = .label
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [separator, title, subTitle])
        stackView.axis = .vertical
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
    
    // MARK: - Layouts
    private func configureConstraints() {
        self.addSubview(stackView)
        self.addSubview(separator)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        separator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            separator.heightAnchor.constraint(equalToConstant: 1),
            
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            
        ])
        stackView.setCustomSpacing(10, after: separator)
    }
}
*/

//
//  SectionHeader.swift
//  TapStore
//
//  Created by Paul Hudson on 01/10/2019.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//


class SectionHeader: UICollectionReusableView {
    static let reuseIdentifier = "SectionHeader"

    let title = UILabel()
    let subtitle = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        let separator = UIView(frame: .zero)
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .quaternaryLabel

        title.textColor = .label
        title.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 22, weight: .bold))
        subtitle.textColor = .secondaryLabel

        let stackView = UIStackView(arrangedSubviews: [separator, title, subtitle])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        addSubview(stackView)

        NSLayoutConstraint.activate([
            separator.heightAnchor.constraint(equalToConstant: 1),

            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])

        stackView.setCustomSpacing(10, after: separator)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("Stop trying to make storyboards happen.")
    }
}

