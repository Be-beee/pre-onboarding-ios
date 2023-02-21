//
//  ViewController.swift
//  PreOnboardingiOS
//
//  Created by 서보경 on 2023/02/19.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Properties
    
    private let rootView = MainView()
    
    private let viewModel = MainViewModel()

    // MARK: - Life Cycle
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindToViewModel()
        configureActions()
    }

    // MARK: - Functions
    
    private func bindToViewModel() {
        viewModel.delegate = self
    }
    
    private func configureActions() {
        let downloadAllAction = UIAction { [weak self] _ in
            self?.viewModel.downloadAll()
        }
        rootView.downloadAllButton.addAction(downloadAllAction, for: .touchUpInside)
        
        for (i, view) in rootView.imageDownloadViews.enumerated() {
            let downloadAction = UIAction { [weak self] _ in
                self?.viewModel.download(at: i)
            }
            view.downloadButton.addAction(downloadAction, for: .touchUpInside)
        }
    }

}

extension MainViewController: MainViewModelDelegate {
    func mainViewImageChanged(at index: Int) {
        rootView.configureImage(at: index, with: viewModel.images[index])
    }
    
    func mainViewDownloadErrorOccured() {
        print("다운로드 실패")
    }
    
}

