//
//  ForgotPasswordViewController.swift
//  Assignment_02
//
//  Created by Aress109 on 11/6/23.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var emailId : UITextField!
    @IBAction func forgotPasswordBtn (_ sender : Any) {
        if(emailId.text?.isEmpty == true){
            self.showAlert(title: "Alert!!!", msg: "Please enter your email address")
        }
        else if !isValidEmail(emailId.text ?? "none") {
            self.showAlert(title: "Alert!!!", msg: "Please enter valid email address")
        }
        else {
            self.showAlert(title: "Alert!!!", msg: "Forgot Password Successfull")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //  Validate email address
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    //  Show Alert
    func showAlert(title : String,msg : String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default){ (action) in
            self.dismiss(animated: true)
        }
        alert.addAction(action)
        self.present(alert, animated: true)
    }
}
