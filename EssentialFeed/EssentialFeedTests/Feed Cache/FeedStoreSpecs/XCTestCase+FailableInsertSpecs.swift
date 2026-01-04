//
//  XCTestCase+FailableInsertSpecs.swift
//  EssentialFeedTests
//
//  Created by Ilana Haddad on 2026-01-03.
//

import Foundation


import XCTest
import EssentialFeed

extension FailableInsertSpecs where Self: XCTestCase {
    func assertThatInsertDeliversErrorOnInsertionError(
        on sut: FeedStore,
        _ file: StaticString = #file,
        _ line: UInt = #line
    ) {
        let insertionError = insert((uniqueImageFeed().local, Date()), to: sut)
        
        XCTAssertNotNil(insertionError, "Expected cache insertion to fail with an error", file: file, line: line)
    }
    
    func assertThatInsertHasNoSideEffectsOnInsertionError(
        on sut: FeedStore,
        _ file: StaticString = #file,
        _ line: UInt = #line
    ) {
        insert((uniqueImageFeed().local, Date()), to: sut)
        
        expect(sut, toRetrieve: .empty, file, line)
    }
}
