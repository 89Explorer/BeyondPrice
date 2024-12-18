//
//  SelfConfiguringCell.swift
//  BeyondPrice
//
//  Created by 권정근 on 12/17/24.
//

import Foundation

protocol SelfConfiguringCell {
    static var reuseIdentifier: String { get }
    func configure(with app: App)
}
