//
//  ViewController.swift
//  task4
//
//  Created by Maxorax on 04.04.2021.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let validator = ValidatorText()

    @IBOutlet weak var loginTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        loginTF.delegate = self
    }
    

    //MARK: -UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text else {
            return false
        }
        do {
            try validator.validateText(text: text)
        } catch {
            alertError(error: error)
        }
        alertSuccess(textField: textField)

        return true
    }
    
    
    //MARK: -UIAlertController
    func alertError(error: Error){
        var message = ""
        switch error {
        case ValidateError.firstCharacterError:
           message = "Логин не может начинаться на цифру, точку, минус."
        case ValidateError.lengthError:
            message = "Минимальная длина логина - 3 символа, максимальная - 32."
        case ValidateError.characterError:
            message = "Логин может состоять из латинских букв, цифр, минуса и точки."
        default:
            message = error.localizedDescription
        }
        let alertController = UIAlertController(title: "Неправильно введен логин", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "ок", style: .default, handler: nil)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func alertSuccess(textField: UITextField){
        textField.resignFirstResponder()
        let alertController = UIAlertController(title: "Логин введен верно!", message: "", preferredStyle: .actionSheet)
        self.present(alertController, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7){
        alertController.dismiss(animated: true, completion: nil)
        }
    }
}

