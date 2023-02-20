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

    // MARK: - Life Cycle
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

