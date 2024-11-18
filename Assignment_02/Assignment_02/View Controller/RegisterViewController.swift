//
//  RegisterViewController.swift
//  Assignment_02
//
//  Created by Aress109 on 11/3/23.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var registerCardView: UIView!
    
    @IBOutlet weak var firstNameTxt: UITextField!
    @IBOutlet weak var lastNameTxt: UITextField!
    @IBOutlet weak var emailIdTxt: UITextField!
    @IBOutlet weak var dateOfBirthTxt: UITextField!
    @IBOutlet weak var cityTxt: UITextField!
    @IBOutlet weak var stateTxt: UITextField!
    @IBOutlet weak var pinCodeTxt: UITextField!
    @IBOutlet weak var mobileNumberTxt: UITextField!
    
    @IBAction func registerBtn(_ sender: Any){
        validateUser()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // change appearence of views
        changeAppearnce()
    }
    
    func changeAppearnce() {
        registerCardView.layer.cornerRadius = 15
        registerCardView.layer.shadowRadius = 5
        registerCardView.layer.shadowColor = UIColor.gray.cgColor
    }
    
    //  Validate user
    func validateUser(){
        if (firstNameTxt.text?.isEmpty == true && lastNameTxt.text?.isEmpty == true && emailIdTxt.text?.isEmpty == true && cityTxt.text?.isEmpty == true && stateTxt.text?.isEmpty == true && pinCodeTxt.text?.isEmpty == true && mobileNumberTxt.text?.isEmpty == true) {
            self.showAlert(title: "Alert!!!", msg:"Please enter all details")
        }
        else if (firstNameTxt.text?.isEmpty == true){
            self.showAlert(title: "Alert!!!", msg:"Please enter your first name.")
        }
        else if (lastNameTxt.text?.isEmpty == true){
            self.showAlert(title: "Alert!!!", msg:"Please enter your last name.")
        }
        else if (emailIdTxt.text?.isEmpty == true){
            self.showAlert(title: "Alert!!!", msg:"Please enter your email address.")
        }
        else if !isValidEmail(emailIdTxt.text ?? "nil"){
            self.showAlert(title: "Alert", msg: "Please enter valid email address")
        }
        else if(cityTxt.text?.isEmpty == true){
            self.showAlert(title: "Alert", msg: "Please enter your city")
        }
        else if(stateTxt.text?.isEmpty == true){
            self.showAlert(title: "Alert", msg: "Please enter your state")
        }
        else if(pinCodeTxt.text?.isEmpty == true){
            self.showAlert(title: "Alert", msg: "Please enter your pin code")
        }
        else if !isNumber(phone: pinCodeTxt.text ?? ""){
            self.showAlert(title: "Alert", msg: "Please enter valid pin code")
        }
        else if(mobileNumberTxt.text?.isEmpty == true){
            self.showAlert(title: "Alert!!!", msg:"Please enter your mobile Number.")
        }
        else if !isNumber(phone: mobileNumberTxt.text ?? "nil") && (mobileNumberTxt.text?.count != 10){
            self.showAlert(title: "Alert", msg: "Please enter valid mobile number.")
        }
        else {
            self.showAlert(title: "Alert", msg: "Successfully Registered.")
        }
    }
    
    //  Validate email address
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    //  Validate phone number
    func isNumber(phone: String) -> Bool {
        let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: phone)
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
