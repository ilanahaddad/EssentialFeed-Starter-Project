//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Ilana Haddad on 2025-12-04.
//

import Foundation

public protocol HTTPClient {
    func get(
        from url: URL,
        completion: @escaping (HTTPClientResult) -> Void
    )
}

public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case failure(Error)
}


