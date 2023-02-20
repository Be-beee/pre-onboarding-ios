//
//  MainView.swift
//  PreOnboardingiOS
//
//  Created by 서보경 on 2023/02/20.
//

import UIKit

final class MainView: UIView {
    
    // MARK: - UI Properties
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private let downloadAllButton: UIButton = {
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
        MainView.dummies.forEach { dummyURL in
            stackView.addArrangedSubview(ImageDownloadView(url: dummyURL))
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
}

// MARK: - Extensions, Namespaces

extension MainView {
    enum StringLiteral {
        static let downloadAllTitle = "Load All Images"
    }
}

// MARK: - Extensions, Dummies

extension MainView {
    static let dummies = [
        "https://product.cdn.cevaws.com/var/storage/images/_aliases/reference/media/feliway-2017/images/kor-kr/1_gnetb-7sfmbx49emluey4a/6341829-1-kor-KR/1_gNETb-7SfMBX49EMLUeY4A.jpg",
        "https://img4.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/201907/23/hani/20190723100603336scjk.jpg",
        "https://images.mypetlife.co.kr/content/uploads/2021/10/19151330/corgi-g1a1774f95_1280-1024x682.jpg",
        "https://mirochuu.com/wp-content/uploads/2022/11/5JoTsMk7cG2oWUN9HG.jpg",
        "https://static.hubzum.zumst.com/hubzum/2020/08/21/10/16af61affa8841f58caaedd241064824.jpg"
    ]
}
