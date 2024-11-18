//
//  LoginViewController.swift
//  Assignment_02
//
//  Created by Aress109 on 11/3/23.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginCardView: UIView!
    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    @IBAction func loginBtn(_ sender: Any) {
        loader.startAnimating()
        self.validateUser()
        loader.stopAnimating()
    }
    
    @IBOutlet weak var loader: UIActivityIndicatorView!
   
    @IBAction func forgotPasswordBtn(_ sender: Any) {
    }
    
    @IBAction func registerBtn(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // change appearence of views
        changeAppearnce()
        loader.hidesWhenStopped = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        userNameTxt.text = ""
        passwordTxt.text = ""
    }
    
    func changeAppearnce() {
        loginCardView.layer.cornerRadius = 15
        loginCardView.layer.shadowRadius = 5
        loginCardView.layer.shadowColor = UIColor.gray.cgColor
    }
    
    //  Validate user
    func validateUser(){
        if (userNameTxt.text?.isEmpty == true && passwordTxt.text?.isEmpty == true) {
            self.showAlert(title: "Alert!!!", msg:"Please enter your username and password")
        }
        else if (userNameTxt.text?.isEmpty == true){
            self.showAlert(title: "Alert!!!", msg:"Please enter your username.")
        }
        else if !isValidEmail(userNameTxt.text ?? "nil"){
            self.showAlert(title: "Alert", msg: "Please enter valid email address")
        }
        else if(passwordTxt.text?.isEmpty == true){
            self.showAlert(title: "Alert!!!", msg:"Please enter your password.")
        }
        else {
            let storyB = UIStoryboard(name: "Main", bundle: nil)
            // reference of ViewController
            let vc = storyB.instantiateViewController(withIdentifier: "EmployeesTableViewController") as! EmployeesTableTableViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
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
