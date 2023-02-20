//
//  NetworkError.swift
//  PreOnboardingiOS
//
//  Created by 서보경 on 2023/02/20.
//

import Foundation

enum NetworkError: Error {
    case creationURLFailed
    case connectionFailed
    case noData
    case decodingFailed
}
