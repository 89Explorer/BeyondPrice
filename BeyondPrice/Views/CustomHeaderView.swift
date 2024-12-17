//
//  CustomHeaderView.swift
//  BeyondPrice
//
//  Created by 권정근 on 12/17/24.
//

import UIKit

class CustomHeaderView: UIView {
    
    // MARK: - UI Components
    private let titleLabel: UILabel = {
        let label = UILabel()
        // label.text = "게임" // 텍스트 설정
        //label.backgroundColor = .red
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.textColor = .label
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal) // 늘어나지 않도록 설정
        return label
    }()
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Shopping") // 이미지 설정
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20 // 원형으로 만들기
        imageView.clipsToBounds = true
        imageView.setContentHuggingPriority(.required, for: .horizontal) // 우선순위 높임
        imageView.setContentCompressionResistancePriority(.required, for: .horizontal)
        return imageView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 5 // 좌우 간격 설정
        return stackView
    }()
    
    // MARK: - Life Cycle
    init(title: String) {
        super.init(frame: .zero)
        self.titleLabel.text = title
        configureUI()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout Setup
    private func configureUI() {
        self.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(profileImageView)
        
        //self.backgroundColor = .black // 배경 색상 설정 (테스트용)
    }
    
    
    private func configureConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // 스택뷰의 제약 조건
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            // 이미지 뷰 크기 설정
            profileImageView.widthAnchor.constraint(equalToConstant: 40),
            profileImageView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

