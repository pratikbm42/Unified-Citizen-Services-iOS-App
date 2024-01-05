//
//  FireDepartmentTableViewCell.swift
//  UIDesign
//
//  Created by Pratiksha Jagtap on 16/10/23.
//

import UIKit

class FireDepartmentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
