//
//  LoginVC.swift
//  hushPro
//
//  Created by harikrishnan on 25/06/20.
//  Copyright © 2020 ErbauenLabs. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let loginViewModel = LoginViewModel(user: User())
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func login(_ sender: Any) {
        
        switch loginViewModel.validate() {
            
        case .Valid:
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.loginViewModel.saveUserIsLoggedIn()
                UIApplication.setRootView(MainTabbarVC.instantiate(from: .Main), options: .curveLinear, animated: true, duration: 0.5, completion: nil)
            }
            
        case .InValid(let message):
            showAlert(message: message)
        }
    }
}

extension LoginVC: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        
        guard let stringRange = Range(range, in: currentText) else { return false}
        
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        if textField == emailTextField {
            loginViewModel.updateEmail(email: updatedText)
        }else{
            loginViewModel.updatePassword(password: updatedText)
        }
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

private extension LoginVC{
    func showAlert(message: String) {
        let alertController: UIAlertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: NSLocalizedString("Okay", comment: ""), style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
