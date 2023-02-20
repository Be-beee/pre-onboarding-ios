//
//  ImageDownloadView.swift
//  PreOnboardingiOS
//
//  Created by 서보경 on 2023/02/20.
//

import UIKit

final class ImageDownloadView: UIView {
    
    // MARK: - UI Properties
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let progressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.backgroundColor = .systemGray2
        
        return progressView
    }()
    
    private let downloadButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Load", for: .normal)
        
        return button
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        
        return stackView
    }()
    
    // MARK: - Properties
    
    private(set) var url = ""
    
    // MARK: - Init
    
    convenience init(url: String, frame: CGRect = .zero) {
        self.init(frame: frame)
        self.url = url
    }
    
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
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        [imageView, progressView, downloadButton].forEach { subview in
            stackView.addArrangedSubview(subview)
        }
        
        addSubview(stackView)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}
