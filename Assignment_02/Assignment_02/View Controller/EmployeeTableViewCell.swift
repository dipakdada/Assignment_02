//
//  EmployeeTableViewCell.swift
//  Assignment_02
//
//  Created by Aress109 on 11/2/23.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {

    @IBOutlet weak var tableCellView: UIView!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var employeeNameLbl: UILabel!
    @IBOutlet weak var designationLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        tableCellView.backgroundColor = .white
        tableCellView.layer.cornerRadius = 8
        tableCellView.layer.borderWidth = 0.5
        tableCellView.layer.borderColor = UIColor.gray.cgColor
        tableCellView.layer.shadowRadius = 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
