//
//  MainViewModel.swift
//  PreOnboardingiOS
//
//  Created by 서보경 on 2023/02/21.
//

import UIKit

final class MainViewModel {
    
    // MARK: - Properties
    
    private let urls: [String] = MainViewModel.dummies
    
    private(set) var images: [UIImage?] = Array(repeating: nil, count: MainViewModel.dummies.count)
    
    weak var delegate: MainViewModelDelegate?
    
    // MARK: - Functions
    
    func download(at index: Int) {
        images[index] = UIImage(systemName: "photo")
        delegate?.mainViewImageChanged(at: index)
        
        DispatchQueue.global().async { [weak self] in
            guard let self,
                  let request = NetworkManager.shared.request(urlString: self.urls[index])
            else { return }
            
            NetworkManager.shared.fetchData(request: request) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let data):
                        self.images[index] = UIImage(data: data)
                        self.delegate?.mainViewImageChanged(at: index)
                    case .failure:
                        self.delegate?.mainViewDownloadErrorOccured()
                    }
                }
            }
        }
    }
    
    func downloadAll() {
        for i in urls.indices {
            download(at: i)
        }
    }
    
}

// MARK: - Extensions, Dummies

extension MainViewModel {
    static let dummies = [
        "https://product.cdn.cevaws.com/var/storage/images/_aliases/reference/media/feliway-2017/images/kor-kr/1_gnetb-7sfmbx49emluey4a/6341829-1-kor-KR/1_gNETb-7SfMBX49EMLUeY4A.jpg",
        "https://img4.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/201907/23/hani/20190723100603336scjk.jpg",
        "https://images.mypetlife.co.kr/content/uploads/2021/10/19151330/corgi-g1a1774f95_1280-1024x682.jpg",
        "https://mirochuu.com/wp-content/uploads/2022/11/5JoTsMk7cG2oWUN9HG.jpg",
        "https://static.hubzum.zumst.com/hubzum/2020/08/21/10/16af61affa8841f58caaedd241064824.jpg"
    ]
}
