//
//  DesignUICollectionViewCell.swift
//  UIDesign
//
//  Created by Pratiksha Jagtap on 05/10/23.
//

import UIKit

class DesignUICollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var titleLabel1: UILabel!
    @IBOutlet weak var image: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


}
