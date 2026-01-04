//
//  XCTestCase+FailableRetrieveSpecs.swift
//  EssentialFeedTests
//
//  Created by Ilana Haddad on 2026-01-03.
//

import EssentialFeed
import XCTest

extension FailableRetrieveSpecs where Self: XCTestCase {
    func assertThatRetrieveDeliversFailureOnRetrievalError(
        on sut: FeedStore,
        _ file: StaticString = #file,
        _ line: UInt = #line
    ) {
        expect(sut, toRetrieve: .failure(anyNSError()), file, line)
    }
    
    func assertThatRetrieveHasNoSideEffectsOnFailure(
        on sut: FeedStore,
        _ file: StaticString = #file,
        _ line: UInt = #line
    ) {
        expect(sut, toRetrieveTwice: .failure(anyNSError()), file, line)
    }
}
