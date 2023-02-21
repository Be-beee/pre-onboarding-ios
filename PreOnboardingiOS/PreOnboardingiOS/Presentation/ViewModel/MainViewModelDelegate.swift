//
//  MainViewModelDelegate.swift
//  PreOnboardingiOS
//
//  Created by 서보경 on 2023/02/21.
//

import Foundation

protocol MainViewModelDelegate: AnyObject {
    func mainViewImageChanged(at index: Int)
    
    func mainViewDownloadErrorOccured()
    
}
