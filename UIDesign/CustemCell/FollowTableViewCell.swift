//
//  FollowTableViewCell.swift
//  UIDesign
//
//  Created by Pratik Morge on 02/11/23.
//

import UIKit

class FollowTableViewCell: UITableViewCell {
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var followBtn: UIButton!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        designCell()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func designCell(){
        followBtn.setTitle("Follow", for: .normal)
        followBtn.titleLabel?.font =  UIFont(name: "GillSans-SemiBold", size: 20)
        view.roundCorners(corners: [.topLeft,.topRight],radius: 100)
        followBtn.layer.cornerRadius = 15
        followBtn.layer.borderWidth = 2
        followBtn.layer.borderColor = .init(red: 130, green: 0, blue: 0, alpha: 0.5)
        nameLabel.text = "Pratiksha"
        nameLabel.font = UIFont(name: "AvenirNext-Bold" , size: 17)
        label1.text = "France Nander"
        label1.font = UIFont(name: "Avenir-Book" , size: 17)
    }
    
}
