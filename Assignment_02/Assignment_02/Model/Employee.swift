// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let employee = try? JSONDecoder().decode(Employee.self, from: jsonData)

import Foundation

// MARK: - EmployeeElement
struct EmployeeElement: Codable {
    let id: Int
    let imageURL: String
    let firstName, lastName, email, contactNumber: String
    let age: Int
    let dob: String
    let salary: Int
    let address: String

    enum CodingKeys: String, CodingKey {
        case id
        case imageURL = "imageUrl"
        case firstName, lastName, email, contactNumber, age, dob, salary, address
    }
}

typealias Employee = [EmployeeElement]
