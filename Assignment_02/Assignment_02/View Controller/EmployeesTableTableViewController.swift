//
//  EmployeesTableTableViewController.swift
//  Assignment_02
//
//  Created by Aress109 on 11/2/23.
//

import UIKit

class EmployeesTableTableViewController: UITableViewController {
    
    //  logout btn
    @IBAction func logoutBtn(_ sender: Any) {
        let alert = UIAlertController(title: "Alert!!!", message: "Do you really want to logout?", preferredStyle:  .alert)
        let yesAction = UIAlertAction(title: "YES", style: .default){ (action) in
            self.navigationController?.popViewController(animated: true)
        }
        let noAction = UIAlertAction(title: "NO", style: .default) {action in
            self.dismiss(animated: true)
        }
        alert.addAction(yesAction)
        alert.addAction(noAction)
        self.present(alert, animated: true)
    }
    var name: String? = nil
    var email: String? = nil
    
    let employeeName = ["dipak","yash","shivani","isha","vivek","gaurav","rushi","varun","kunal"]
    
    //  Employee's Data
    let employeesData : [String : [String : String]] = [ "dipak" : ["name" : "Dipak Patil","age" : "21","designation" : "Trainee Software Engineer","empId" : "232","emailId" : "dipak@aress.net"], "yash" : ["name" : "Yash Boraste","age" : "23","designation" : "Trainee Software Engineer","empId" : "633","emailId" : "yash@aress.net"], "shivani" : ["name" : "Shivani P","age" : "22","designation" : "Software Engineer","empId" : "456","emailId" : "shiavni@aress.net"], "isha" : ["name" : "Isha Vaidya","age" : "22","designation" : "Backend Developer","empId" : "546","emailId" : "isha@aress.net"], "vivek" : ["name" : "vivek Patil","age" : "21","designation" : "Software Engineer","empId" : "543","emailId" : "vivek@aress.net"], "gaurav" : ["name" : "Gaurav Patil","age" : "20","designation" : ".Net Engineer","empId" : "435","emailId" : "gaurav@aress.net"], "rushi" : ["name" : "Rushi Patil","age" : "21","designation" : "QA","empId" : "877","emailId" : "rushi@aress.net"], "varun" : ["name" : "Varun K","age" : "22","designation" : "Tester","empId" : "893","emailId" : "varun@aress.net"], "kunal" : ["name" : "Kaunal D","age" : "21","designation" : "Web Developer","empId" : "336","emailId" : "kunal@aress.net"]]
    
    var employeeDataFromWeb : Employee? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    }
    
    // load employee
    func loadData() {
        
        let url = URL(string: "https://hub.dummyapis.com/employee?noofRecords=10&idStarts=1001")!
        var urlRequest = URLRequest(url: url)
        
        //        // body parameters
        //        urlRequest.httpBody =
        
        urlRequest.httpMethod = "GET"
        
        // default configuration, store cache and cookie in the disk storage and other urlsession can access it
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let myTask =  session.dataTask(with: urlRequest){ [self] (data, response, error )in
            if error == nil {
                if data != nil {
                    do {
                        employeeDataFromWeb = try JSONDecoder().decode(Employee.self, from: data!)
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }catch let error{
                        print("Error : \(error)")
                    }
                }
            }
        }
        myTask.resume()
    }
    
    // return number of section in table view
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // return number in the section in table view
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeesData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EMPT", for: indexPath) as! EmployeeTableViewCell
        
        print("Name is : \(employeeDataFromWeb?[indexPath.row].firstName) and Email is : \(employeeDataFromWeb?[indexPath.row].email)")
        
        // bind the employee data with the view in storyboard
        cell.employeeNameLbl.text = employeesData[employeeName[indexPath.row]]?["name"]
        cell.designationLbl.text = employeesData[employeeName[indexPath.row]]?["designation"]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // reference of storyboard Main
        let storyB = UIStoryboard(name: "Main", bundle: nil)
        // reference of ViewController
        let vc = storyB.instantiateViewController(withIdentifier: "DataViewController") as! DataViewController
        
        //  setting value of employeeDataDictionary
        vc.employeeDataDictionary = employeesData[employeeName[indexPath.row]]!
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

//
//let myURL = URL(string: myUrlStr)
//       var myRequest = URLRequest(url: myURL!)
//       myRequest.httpMethod = "GET"
//       let session = URLSession.shared
//       let myTask =  session.dataTask(with: myURL!){ [self] (data, response, error )in
//           if error == nil {
//               if data != nil {
//                   do {
//                       empolyeeList = try JSONDecoder().decode(Employees.self, from: data!)
//                       print("employees : \(empolyeeList)")
//                       DispatchQueue.main.async {
//                           self.userShareTV.reloadData()
//                       }
//                   }catch let error{
//                       print("Error : \(error)")
//                   }
//               }
//           }
//       }
//       myTask.resume()
