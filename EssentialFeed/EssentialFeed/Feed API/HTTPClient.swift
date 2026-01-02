//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Ilana Haddad on 2025-12-04.
//

import Foundation

public protocol HTTPClient {
    /// The completion handler can be invoked in any thread.
    /// Clients are responsible to dispatch to appropriate theads, if needed
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void
    )
}

public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case failure(Error)
}


