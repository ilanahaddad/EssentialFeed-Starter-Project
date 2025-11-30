//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Ilana Haddad on 2025-11-30.
//

import Foundation

public protocol HTTPClient {
    func get(from url: URL)
}

// final: don't allow subclasses of this type
public final class RemoteFeedLoader {
    private let url: URL
    private let client: HTTPClient
    
    public init(
        url: URL,
        client: HTTPClient
    ) {
        self.client = client
        self.url = url
    }
    
    public func load() {
        client.get(from: url)
    }
}
