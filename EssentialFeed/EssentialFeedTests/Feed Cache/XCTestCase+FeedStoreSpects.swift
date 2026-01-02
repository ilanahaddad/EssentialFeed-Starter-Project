//
//  XCTestCase+FeedStoreSpects.swift
//  EssentialFeedTests
//
//  Created by Ilana Haddad on 2026-01-02.
//

import EssentialFeed
import XCTest

extension FeedStoreSpecs where Self: XCTestCase {
    @discardableResult
    func insert(
        _ cache: (feed: [LocalFeedImage], timestamp: Date),
        to sut: FeedStore
    ) -> Error? {
        let exp = expectation(description: "Wait for cache insertion")
        var insertionError: Error?
        sut.insert(cache.feed, timestamp: cache.timestamp) { error in
            insertionError = error
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1.0)
        return insertionError
    }
    
    @discardableResult
    func deleteCache(from sut: FeedStore) -> Error? {
        let exp = expectation(description: "Wait for cache deletion")
        var deletionError: Error?
        sut.deleteCachedFeed { receivedDeletionError in
            deletionError = receivedDeletionError
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1.0)
        return deletionError
    }
    
    func expect(
        _ sut: FeedStore,
        toRetrieveTwice expectedResult: RetrieveCachedFeedResult,
        _ file: StaticString = #filePath,
        _ line: UInt = #line
    ) {
        expect(sut, toRetrieve: expectedResult, file, line)
        expect(sut, toRetrieve: expectedResult, file, line)
    }
    
    func expect(
        _ sut: FeedStore,
        toRetrieve expectedResult: RetrieveCachedFeedResult,
        _ file: StaticString = #filePath,
        _ line: UInt = #line
    ) {
        let exp = expectation(description: "Wait for cache retrieval")
        sut.retrieve { retrievedResult in
            switch (expectedResult, retrievedResult) {
            case (.empty, .empty),
                    (.failure, .failure):
                break
            case let (.found(expected), .found(retrieved)):
                XCTAssertEqual(retrieved.feed, expected.feed, file: file, line: line)
                XCTAssertEqual(retrieved.timestamp, expected.timestamp, file: file, line: line)
            default:
                XCTFail("Expected to retrieve \(expectedResult), got \(retrievedResult) instead", file: file, line: line)
            }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1.0)
    }
}
