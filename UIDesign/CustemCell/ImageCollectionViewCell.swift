//
//  ImageCollectionViewCell.swift
//  UIDesign
//
//  Created by Pratik Morge on 30/10/23.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 15
    }
  
    
}
