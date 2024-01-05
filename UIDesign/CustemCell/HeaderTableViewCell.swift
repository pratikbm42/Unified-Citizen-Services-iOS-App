//
//  HeaderTableViewCell.swift
//  UIDesign
//
//  Created by Pratiksha Jagtap on 13/10/23.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {
    

   
    @IBOutlet weak var hederView: UIView!
    @IBOutlet weak var showListBtn: UIButton!
    @IBOutlet weak var headerTitleLabel: UILabel!
    @IBOutlet weak var editImage: UIImageView!
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
        headerTitleLabel.font = UIFont(name: "SFProDisplay-Semibold", size: 20)
    }
}
