//
//  DataViewController.swift
//  Assignment_02
//
//  Created by Aress109 on 11/3/23.
//

import UIKit

class DataViewController: UIViewController {

    @IBOutlet weak var employeeCardView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var employeeNameLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var designationLbl: UILabel!
    @IBOutlet weak var employeeIdLbl: UILabel!
    @IBOutlet weak var emailIdLbl: UILabel!
  
    // employee data from table view
    var employeeDataDictionary : [String:String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set title of the controller
        title = employeeDataDictionary["name"]
        
        // change appearence of views
        changeAppearnce()
        
        // set data into views
        setData()
    }
    
    func changeAppearnce() {
        // change appearnce of empCardView
        employeeCardView.layer.cornerRadius = 15
                
        // profile image
        profileImage.image = UIImage(named: "profile_image")
        profileImage.layer.cornerRadius = 15
        profileImage.layer.maskedCorners = 	[.layerMaxXMinYCorner, .layerMinXMinYCorner]
        profileImage.layer.borderWidth = 3
        profileImage.layer.borderColor = UIColor.white.cgColor
    }
    
    func setData() {
        employeeNameLbl.text = "Name : \(employeeDataDictionary["name"] ?? "No Name")"
        ageLbl.text = "Age : \(employeeDataDictionary["age"] ?? "No Name")"
        designationLbl.text = "Designation : \(employeeDataDictionary["designation"] ?? "No designation")"
        employeeIdLbl.text = "EmployeeId : \(employeeDataDictionary["empId"] ?? "No id")"
        emailIdLbl.text = "EmailId : \(employeeDataDictionary["emailId"] ?? "No email")"
    }
}
