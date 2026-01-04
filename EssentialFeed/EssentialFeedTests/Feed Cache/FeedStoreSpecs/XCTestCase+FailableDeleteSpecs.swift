//
//  XCTestCase+FailableDeleteSpecs.swift
//  EssentialFeedTests
//
//  Created by Ilana Haddad on 2026-01-03.
//

import XCTest
import EssentialFeed

extension FailableDeleteSpecs where Self: XCTestCase {
    func assertThatDeleteDeliversErrorOnDeletionError(
        on sut: FeedStore,
        _ file: StaticString = #file,
        _ line: UInt = #line
    ) {
        let deletionError = deleteCache(from: sut)
        
        XCTAssertNotNil(deletionError, "Expected cache deletion to fail", file: file, line: line)
    }
    
    func assertThatDeleteHasNoSideEffectsOnDeletionError(
        on sut: FeedStore,
        _ file: StaticString = #file,
        _ line: UInt = #line) {
        deleteCache(from: sut)
        
        expect(sut, toRetrieve: .empty, file, line)
    }
}
