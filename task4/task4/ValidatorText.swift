//
//  ValidatorText.swift
//  task4
//
//  Created by Maxorax on 05.04.2021.
//

import Foundation

class ValidatorText {
    func validateText(text: String) throws {
        let number = text.first?.isNumber ?? false
        guard text.count >= 3 && text.count <= 32 else {
            throw ValidateError.lengthError
        }
        guard  !number  && text.first! != "-"  &&  text.first! != "." else  {
            throw ValidateError.firstCharacterError
        }
        
        guard let _ = text.range(of: "^[0-9a-zA-z\\.\\-]+(@[0-9a-zA-z]+\\.[0-9a-zA-z]+)?$", options: .regularExpression) else {
            throw ValidateError.characterError
        }
    }
}
