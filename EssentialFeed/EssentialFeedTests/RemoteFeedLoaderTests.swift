//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Ilana Haddad on 2025-11-30.
//

import XCTest

class RemoteFeedLoader {
    
}

class HTTPClient {
    var requestedURL: URL?
    
    func request(url: URL) async throws -> Data {
        requestedURL = url
        return Data()
    }
}

class RemoteFeedLoaderTests: XCTestCase {
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClient()
        _ = RemoteFeedLoader()
        XCTAssertNil(client.requestedURL)
    }
}
