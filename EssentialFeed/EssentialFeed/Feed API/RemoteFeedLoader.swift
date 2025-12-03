//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Ilana Haddad on 2025-11-30.
//

import Foundation

public protocol HTTPClient {
    func get(
        from url: URL,
         completion: @escaping (Error) -> Void
    )
}

// final: don't allow subclasses of this type
public final class RemoteFeedLoader {
    private let url: URL
    private let client: HTTPClient
    
    public enum Error: Swift.Error {
        case connectivity
    }
    
    public init(
        url: URL,
        client: HTTPClient
    ) {
        self.client = client
        self.url = url
    }
    
    public func load(completion: @escaping (Error) -> Void) {
        client.get(from: url) { error in
            completion(.connectivity)
        }
    }
}
