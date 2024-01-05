//
//  DescriptionTableViewCell.swift
//  UIDesign
//
//  Created by Pratiksha Jagtap on 12/10/23.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {

    @IBOutlet weak var designView: UIView!
    @IBOutlet weak var discriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        designCell()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func designCell(){
        discriptionLabel.font = UIFont(name: "ArialMT" , size: 16)
    }
}

