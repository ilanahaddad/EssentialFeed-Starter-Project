//
//  XCTTestCase+MemoryLeakTracking.swift
//  EssentialFeedTests
//
//  Created by Ilana Haddad on 2025-12-06.
//

import XCTest

extension XCTestCase {
    func trackForMemoryLeaks(
        _ instance: AnyObject,
        file: StaticString = #filePath,
        line: UInt = #line
    ) {
        // make sure SUT was dealocated from memory after each test run
        addTeardownBlock { [weak instance] in // run after each test
            XCTAssertNil(instance, "Instance should have been deallocated. Potential memory leak", file: file, line: line)
        }
    }
    
    func anyData() -> Data {
        return Data("any data".utf8)
    }
}
