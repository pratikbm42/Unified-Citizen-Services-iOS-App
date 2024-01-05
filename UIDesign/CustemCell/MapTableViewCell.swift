//
//  MapTableViewCell.swift
//  UIDesign
//
//  Created by Pratiksha Jagtap on 12/10/23.
//

import UIKit
import GoogleMaps
class MapTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var lineLabel: UILabel!
    @IBOutlet weak var designView: UIView!
    
    
    @IBOutlet weak var mapMainView: GMSMapView!
    
    var marker : GMSMarker = GMSMarker()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
