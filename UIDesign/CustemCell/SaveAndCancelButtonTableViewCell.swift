//
//  SaveAndCancelButtonTableViewCell.swift
//  UIDesign
//
//  Created by Pratik Morge on 30/11/23.
//

import UIKit

class SaveAndCancelButtonTableViewCell: UITableViewCell {
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var saveBtn: UIButton!
    var cornerRadius: (UIRectCorner, CGFloat)?
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cancelBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.font = UIFont(name: "SFProDisplay-Semibold", size: 17)
    }
        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
            setCellCornerRadius()
            // Configure the view for the selected state
        }
    func setCellCornerRadius() {
        DispatchQueue.main.async{
            if let radius = self.cornerRadius {
                self.view.roundCorners(corners: radius.0, radius: radius.1)
            }
        }
        
    }
}
