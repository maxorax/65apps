//
//  task4Tests.swift
//  task4Tests
//
//  Created by Maxorax on 04.04.2021.
//

import XCTest
@testable import task4

class task4Tests: XCTestCase {
    
    var validator: ValidatorText!
    var vc: ViewController!

    override func setUpWithError() throws {
        super.setUp()
        vc = ViewController()
        validator = ValidatorText()
    }

    override func tearDownWithError() throws {
        validator = nil
        vc = nil
        super.tearDown()
    }

    func testValidatorThrowsFirstCharacterError() throws {
        
        XCTAssertThrowsError(try validator.validateText(text: ".trttrtt")){ error in
            XCTAssertEqual(error as! ValidateError, ValidateError.firstCharacterError)
        }
        XCTAssertThrowsError(try validator.validateText(text: "1trttyr")){ error in
            XCTAssertEqual(error as! ValidateError, ValidateError.firstCharacterError)
        }
        XCTAssertThrowsError(try validator.validateText(text: "-rerert")){ error in
            XCTAssertEqual(error as! ValidateError, ValidateError.firstCharacterError)
        }
        
    }
    func testValidatorThrowsLengthError() throws {
        XCTAssertThrowsError(try validator.validateText(text: "")){ error in
            XCTAssertEqual(error as! ValidateError, ValidateError.lengthError)
        }
        XCTAssertThrowsError(try validator.validateText(text: "maxoraxmaxoraxmaxoraxmaxoraxmaxorax")){ error in
            XCTAssertEqual(error as! ValidateError, ValidateError.lengthError)
        }

    }
    func testValidatorThrowsCharacterError() throws {
        XCTAssertThrowsError(try validator.validateText(text: "maxorax@.qw")){ error in
            XCTAssertEqual(error as! ValidateError, ValidateError.characterError)
        }
        XCTAssertThrowsError(try validator.validateText(text: "maxorax@.sdf")){ error in
            XCTAssertEqual(error as! ValidateError, ValidateError.characterError)
        }
        XCTAssertThrowsError(try validator.validateText(text: "maxorax@sdf.")){ error in
            XCTAssertEqual(error as! ValidateError, ValidateError.characterError)
        }
        XCTAssertThrowsError(try validator.validateText(text: "maxorax@sdf")){ error in
            XCTAssertEqual(error as! ValidateError, ValidateError.characterError)
        }
        XCTAssertThrowsError(try validator.validateText(text: "maxorax@.qw")){ error in
            XCTAssertEqual(error as! ValidateError, ValidateError.characterError)
        }
        XCTAssertThrowsError(try validator.validateText(text: "maxorax@")){ error in
            XCTAssertEqual(error as! ValidateError, ValidateError.characterError)
        }
        XCTAssertThrowsError(try validator.validateText(text: "maxы")){ error in
            XCTAssertEqual(error as! ValidateError, ValidateError.characterError)
        }
    }
    
    func testValidatorNoThrow() throws {
        XCTAssertNoThrow(try validator.validateText(text: "maxorax"))
        XCTAssertNoThrow(try validator.validateText(text: "maxorax@mail.ru"))
    }

}
