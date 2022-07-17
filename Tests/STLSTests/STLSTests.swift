import XCTest
import Bow
import Foundation
@testable import STLS

final class STLSTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual("Hello, World!", "Hello, World!")
    }
    
    func testLambdaSerializer() throws {
        func lambdaExample<A: LambdaAlg>(alg: A) -> Kind<A.F, (Int) -> Int> {
            return A.fun { (x: Kind<A.F, Int>) in
                x
            }
        }
        
        let serialized = try? JSONEncoder()
            .encode(lambdaExample(alg: LambdaAlgSerializer())^.value)
        let json = String(data: serialized!, encoding: String.Encoding.utf8)
        
        print(json?.description ?? "")
    }
}
