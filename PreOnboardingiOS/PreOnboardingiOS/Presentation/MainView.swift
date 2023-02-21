//
//  MainView.swift
//  PreOnboardingiOS
//
//  Created by 서보경 on 2023/02/20.
//

import UIKit

final class MainView: UIView {
    
    // MARK: - UI Properties
    
    private(set) var imageDownloadViews: [ImageDownloadView] = []
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private(set) var downloadAllButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(StringLiteral.downloadAllTitle, for: .normal)
        
        return button
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Functions
    
    private func configure() {
        configureBackground()
        
        configureSubviews()
        configureConstraints()
    }
    
    private func configureBackground() {
        backgroundColor = .systemBackground
    }
    
    private func configureSubviews() {
        for _ in 0 ..< 5 {
            let subview = ImageDownloadView()
            stackView.addArrangedSubview(subview)
            imageDownloadViews.append(subview)
        }
        stackView.addArrangedSubview(downloadAllButton)
        
        addSubview(stackView)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func configureImage(at index: Int, with image: UIImage?) {
        imageDownloadViews[index].configureImage(with: image)
    }
}

// MARK: - Extensions, Namespaces

extension MainView {
    enum StringLiteral {
        static let downloadAllTitle = "Load All Images"
    }
}
