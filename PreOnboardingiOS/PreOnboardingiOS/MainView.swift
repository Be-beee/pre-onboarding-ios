//
//  MainView.swift
//  PreOnboardingiOS
//
//  Created by 서보경 on 2023/02/20.
//

import UIKit

final class MainView: UIView {
    
    // MARK: - Properties
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureBackground()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Functions
    
    private func configureBackground() {
        backgroundColor = .systemCyan
    }
}
