//
//  ImageTableViewCell.swift
//  UIDesign
//
//  Created by Pratiksha Jagtap on 13/10/23.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    @IBOutlet weak var mainImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
       
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
