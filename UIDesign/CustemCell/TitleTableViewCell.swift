//
//  TitleTableViewCell.swift
//  UIDesign
//
//  Created by Pratik Morge on 13/10/23.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var rightArrowImageView: UIImageView!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var view: UIView!
    
    var cornerRadius: (UIRectCorner, CGFloat)?
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        func setCellCornerRadius() {
            DispatchQueue.main.async{
                if let radius = self.cornerRadius {
                    self.view.roundCorners(corners: radius.0, radius: radius.1)
                }
            }
        }
        // Configure the view for the selected state
    }
    
}
