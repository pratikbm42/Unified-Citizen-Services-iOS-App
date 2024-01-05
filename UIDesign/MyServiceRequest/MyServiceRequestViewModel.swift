//
//  MyServiceRequestViewModel.swift
//  UIDesign
//
//  Created by Pratiksha Jagtap on 06/10/23.
//


import Foundation
import UIKit

struct MySRequestCell{
    var address: String
    var fieldType: String
    var tag: Int
    var image: UIImage
    var srValue: String
    var sumittedDate: String
    var modifiedDate: String
    var srType: String
    var status: String
    
    init(address: String, fieldType: String, tag: Int, image: UIImage, srValue: String, sumittedDate: String, modifiedDate: String, srType: String, status: String) {
        self.address = address
        self.fieldType = fieldType
        self.tag = tag
        self.image = image
        self.srValue = srValue
        self.sumittedDate = sumittedDate
        self.modifiedDate = modifiedDate
        self.srType = srType
        self.status = status
    }
    
}
protocol MyServiceRequestDelegate: MyServiceRequestCoordinator{
    
    func detailSRScreen()
    
}
class MyServiceRequestViewModel {
    var tableArray: [MySRequestCell] = []
    var segmentCheck = false
    var delegates: MyServiceRequestDelegate?
    func initArray(){
        let obj1 = MySRequestCell.init(address: "125 E Palm Ave, Burbank, CA91502, USA", fieldType:  "MyServiceRequestTableViewCell", tag: 0, image: (UIImage(named: "loadingimage") ?? UIImage()), srValue: "AS-2304307", sumittedDate: "10/05/2023 07:53 AM", modifiedDate: "10/05/2023 07:53 AM", srType: "Animal Services", status: "Open")
        tableArray.append(obj1)
        let obj2 = MySRequestCell.init(address: "229 N 1st St, Burbank, CA 91502, USA", fieldType: "MyServiceRequestTableViewCell", tag: 0, image: (UIImage(named: "loadingimage") ?? UIImage()),srValue: "AS-2304306", sumittedDate: "10/05/2023 07:52 AM", modifiedDate: "10/05/2023 07:52 AM", srType: "Animal Services", status: "Open")
        tableArray.append(obj2)
        let obj3 = MySRequestCell.init(address: "3820 W. Jefferies Avenue, Burbank,", fieldType: "MyServiceRequestTableViewCell", tag: 0, image: (UIImage(named: "loadingimage") ?? UIImage()),srValue: "AS-2304307", sumittedDate: "10/05/2023 07:53 AM", modifiedDate: "10/05/2023 07:53 AM", srType: "Bulky Item Pick Up", status: "Open")
        tableArray.append(obj3)
        let obj4 = MySRequestCell.init(address: "323 S Front St, Burbank, CA", fieldType: "MyServiceRequestTableViewCell", tag: 0, image: (UIImage(named: "loadingimage") ?? UIImage()),srValue: "AS-2304307", sumittedDate: "10/05/2023 07:53 AM", modifiedDate: "10/05/2023 07:53 AM", srType: "Animal Services", status: "Open")
        tableArray.append(obj4)
        let obj5 = MySRequestCell.init(address: "125 E Palm Ave, Burbank, CA", fieldType: "MyServiceRequestTableViewCell", tag: 0, image: (UIImage(named: "loadingimage") ?? UIImage()),srValue: "AS-2304307", sumittedDate: "10/05/2023 07:53 AM", modifiedDate: "10/05/2023 07:53 AM", srType: "Forestry", status: "Open")
        tableArray.append(obj5)
        let obj6 = MySRequestCell.init(address: "125 E Palm Ave, Burbank, CA", fieldType: "MyServiceRequestTableViewCell", tag: 0, image: (UIImage(named: "loadingimage") ?? UIImage()),srValue: "AS-2304307", sumittedDate: "10/05/2023 07:53 AM", modifiedDate: "10/05/2023 07:53 AM", srType: "Bulky Item Pick Up", status: "Open")
        tableArray.append(obj6)
        let obj7 = MySRequestCell.init(address: "125 E Palm Ave, Burbank, CA", fieldType: "MyServiceRequestTableViewCell", tag: 0, image: (UIImage(named: "loadingimage") ?? UIImage()),srValue: "AS-2304307", sumittedDate: "10/05/2023 07:53 AM", modifiedDate: "10/05/2023 07:53 AM", srType: "Forestry", status: "Open")
        tableArray.append(obj7)
    }
    
}
