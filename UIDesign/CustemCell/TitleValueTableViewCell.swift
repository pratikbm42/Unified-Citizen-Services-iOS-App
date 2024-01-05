//
//  TitleValueTableViewCell.swift
//  UIDesign
//
//  Created by Pratik Morge on 12/10/23.
//

import UIKit

class TitleValueTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var lineLabel: UILabel!
    
    @IBOutlet weak var designView: UIView!
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
