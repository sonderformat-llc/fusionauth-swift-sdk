// AuthorizationManager swift test case with MemoryStorage

import XCTest
@testable import FusionAuth

class AuthManagerMemoryStorageTest: XCTestCase {
    var authorizationManager: AuthorizationManager!
    var memoryStorage: MemoryStorage!
    var tokenManager: TokenManager!
    var userInfo: UserInfo!

    override func setUp() {
        super.setUp()
        memoryStorage = MemoryStorage()
        tokenManager = TokenManager()
        userInfo = UserInfo()
    }

    override func tearDown() {
        super.tearDown()
        memoryStorage = nil
        authorizationManager = nil
        tokenManager = nil
        userInfo = nil
    }

    func testAuthorizationManager() {
        let auth = authorizationManager
        XCTAssertNotNil(auth)
    }

    func testTokenManager() {
        let token = tokenManager
        XCTAssertNotNil(token)
    }

    func testUserInfo() {
        let user = userInfo
        XCTAssertNotNil(user)
    }
}
