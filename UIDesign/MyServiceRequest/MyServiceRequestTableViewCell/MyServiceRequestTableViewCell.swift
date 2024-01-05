//
//  MyServiceRequestTableViewCell.swift
//  UIDesign
//
//  Created by Pratik Morge on 06/10/23.
//

import UIKit

class MyServiceRequestTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var statusValueLabel: UILabel!
    @IBOutlet weak var srTypeValueLabel: UILabel!
    @IBOutlet weak var modiffiedValueLabel: UILabel!
    @IBOutlet weak var sumittedValueLabel: UILabel!
    @IBOutlet weak var srValueLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var srTypeLabel: UILabel!
    @IBOutlet weak var sumittedLabel: UILabel!
    @IBOutlet weak var srLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var addImage: UIImageView!
    @IBOutlet weak var adressLabel: UILabel!
    @IBOutlet weak var modifiedLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
