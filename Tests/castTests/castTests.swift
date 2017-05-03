import XCTest
@testable import cast

class castTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(cast().text, "Hello, World!")
    }


    static var allTests : [(String, (castTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
