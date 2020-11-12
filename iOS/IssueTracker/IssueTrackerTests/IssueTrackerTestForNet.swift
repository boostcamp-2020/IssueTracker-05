//
//  IssueTrackerTests.swift
//  IssueTrackerTests
//
//  Created by 조정래 on 2020/11/11.
//  Copyright © 2020 ralph. All rights reserved.
//

import XCTest

class IssueTrackerTestsForNet: XCTestCase {

    func test_Local_로그인요청을_성공했다면_유저아이디가_존재해야한다() {
        
        let userid = "aaa111"
        let userpassword = "a1a!a1"
        
        timeout(5) { expectation in
            LoginManager.shared.requestLoginPost(userId: userid, password: userpassword) { success in
                XCTAssertTrue(success)
                expectation.fulfill()
            }
        }
        
    }

    func test_Local_로그인요청을_실패했다면_유저아이디가_없어야한다() {
        
        let userid = "aaa111"
        let userpassword = "a1a!a12"
        
        timeout(5) { expectation in
            LoginManager.shared.requestLoginPost(userId: userid, password: userpassword) { success in
                XCTAssertFalse(success)
                expectation.fulfill()
            }
        }
        
    }
    
    func test_github_로그인요청을_성공했다면_유저아이디가_존재해야한다() {
        
    }
    
}

extension XCTestCase {
    func timeout(_ timeout: TimeInterval, completion: (XCTestExpectation) -> Void) {
        let exp = expectation(description: "Timeout: \(timeout) seconds")

        completion(exp)

        waitForExpectations(timeout: timeout) { error in
            guard let error = error else { return }
            XCTFail("Timeout error: \(error)")
        }
    }
}
