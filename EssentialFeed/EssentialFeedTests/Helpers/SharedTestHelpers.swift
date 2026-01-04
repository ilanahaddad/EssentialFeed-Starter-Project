//
//  SharedTestHelpers.swift
//  EssentialFeedTests
//
//  Created by Ilana Haddad on 2025-12-29.
//

import Foundation

func anyNSError() -> NSError {
    return NSError(domain: "any error", code: 0)
}

func anyURL() -> URL {
    return URL(string: "http://any-url.com")!
}
