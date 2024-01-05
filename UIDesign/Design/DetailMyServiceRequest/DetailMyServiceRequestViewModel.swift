//
//  DetailMyServiceRequestViewModel.swift
//  UIDesign
//
//  Created by Pratiksha Jagtap on 11/10/23.
//

import Foundation
import UIKit
import GoogleMaps
struct MySRequestDetailCell{
    var coordinates: [Double] = []
    var fieldType: String
    var tag: Int
    var title: String
    var value: String
    init(fieldType: String, tag: Int, title: String, value: String) {
        self.fieldType = fieldType
        self.tag = tag
        self.title = title
        self.value = value
    }
}

enum TableViewCellTag: Int{
    case titleValueTableViewCell = 1
    case mapTableViewCell
    case descriptionTableViewCell
    
}
protocol DetailSRViewModeldelegate: DetailMyServiceRequestViewCoordinator{
    
    func srDetails()
    
}

class DetailMyServiceRequestViewModel {
    var tableArray: [MySRequestDetailCell] = []
    var delegate: DetailSRViewModeldelegate?
    func initArray(){
        let obj1 = MySRequestDetailCell.init(fieldType: "TitleValueTableViewCell", tag: TableViewCellTag.titleValueTableViewCell.rawValue, title: "Service Request Type", value: "Animal Service")
        tableArray.append(obj1)
        let obj2 = MySRequestDetailCell.init(fieldType: "TitleValueTableViewCell", tag: TableViewCellTag.titleValueTableViewCell.rawValue, title: "Service Request Number", value: "AS-2304307")
        tableArray.append(obj2)
        let obj3 = MySRequestDetailCell.init(fieldType: "TitleValueTableViewCell", tag: TableViewCellTag.titleValueTableViewCell.rawValue, title: "Service Request Category", value: "Parks & Recreation")
        tableArray.append(obj3)
//        let lat = 23.6978
//        let log = 120.9605
        var obj4 = MySRequestDetailCell.init(fieldType: "MapTableViewCell", tag: TableViewCellTag.mapTableViewCell.rawValue, title: "Service Request Location", value: "")
        obj4.coordinates = [20.5937,78.9629]
        tableArray.append(obj4)
        let obj5 = MySRequestDetailCell.init(fieldType: "TitleValueTableViewCell", tag: TableViewCellTag.titleValueTableViewCell.rawValue, title: "Status", value: "Open")
        tableArray.append(obj5)
        let obj6 = MySRequestDetailCell.init(fieldType: "TitleValueTableViewCell", tag: TableViewCellTag.titleValueTableViewCell.rawValue, title: "Submitted Date", value: "10/05/2023 07:53 AM")
        tableArray.append(obj6)
        let obj7 = MySRequestDetailCell.init(fieldType: "DescriptionTableViewCell", tag: TableViewCellTag.descriptionTableViewCell.rawValue, title: "If this is an emergency, please call 911. Contact the Burbank Animal Shelter at 818-238-3340 for matters needino immediate attention durino husiness hours", value: "")
        tableArray.append(obj7)
    }
    
    }


