//
//  MainTitleTableViewCell.swift
//  UIDesign
//
//  Created by Pratik Morge on 17/10/23.
//

import UIKit

class MainTitleTableViewCell: UITableViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var mainTitleLabel: UILabel!
    var cornerRadius: (UIRectCorner, CGFloat)?
    override func awakeFromNib() {
        super.awakeFromNib()
        setCellCornerRadius()
    }
    func setCellCornerRadius() {
        DispatchQueue.main.async{
            if let radius = self.cornerRadius {
                self.view.roundCorners(corners: radius.0, radius: radius.1)
            }
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
