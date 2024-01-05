//
//  DesignUIViewModel.swift
//  UIDesign
//
//  Created by Pratiksha Jagtap on 03/10/23.
//

import Foundation
import UIKit

struct UICell{
    var title: String
    var fieldType: String
    var tag: Int
    var image: UIImage
    var backgroundImage: UIImage?
    var color: UIColor
    init(title:String, FieldType:String, tag: Int, image: UIImage, color: UIColor) {
        self.title = title
        self.fieldType = FieldType
        self.tag = tag
        self.image = image
        self.color = color
    }
}

enum UIScreenTag: Int{
    case requestForAssistance = 1
    case myCases
    case officeLocation
    case victimServices
    case victimResources
    case victimsRights
    case lgbtqVictimAssistance
    case mediaGallery
    
}
protocol DesignUIViewModelDelegate: DesignUICoordinator{
    
    func mySRScreen()
    
}


class DesignUIViewModel {
    var tableArray: [UICell] = []
    var delegates: DesignUIViewModelDelegate?
    func initArray(){
        let obj1 = UICell.init(title: "REQUEST FOR ASSISTANCE" , FieldType: "DesignUICollectionViewCell", tag: UIScreenTag.requestForAssistance.rawValue, image: (UIImage(named: "requestForAssistance") ?? UIImage()), color: UIColor(red: 250/255, green: 110/255, blue: 34/255, alpha: 1))
        tableArray.append(obj1)
        let obj2 = UICell.init(title: "MY CASES" , FieldType: "DesignUICollectionViewCell", tag: UIScreenTag.myCases.rawValue, image: UIImage(named: "My-Cases") ?? UIImage(), color: UIColor(red: 153/255, green: 67/255, blue: 59/255, alpha: 1))
        tableArray.append(obj2)
        let obj3 = UICell.init(title: "OFFICE LOCATION" , FieldType: "DesignUICollectionViewCell", tag: UIScreenTag.officeLocation.rawValue, image:  UIImage(named: "img_office_locations") ?? UIImage(), color: UIColor(red: 76/255, green: 133/255, blue: 243/255, alpha: 1))
        tableArray.append(obj3)
        let obj4 = UICell.init(title: "VICTIM SERVICES" , FieldType: "DesignUICollectionViewCell", tag: UIScreenTag.victimServices.rawValue, image:  UIImage(named: "img_services") ?? UIImage(), color: UIColor(red: 234/255, green: 187/255, blue: 47/255, alpha: 1))
        tableArray.append(obj4)
        let obj5 = UICell.init(title: "VICTIM RESOURCES" , FieldType: "DesignUICollectionViewCell", tag: UIScreenTag.victimResources.rawValue, image:  UIImage(named: "img_victim_resources") ?? UIImage(), color: UIColor(red: 35/255, green: 50/255, blue: 85/255, alpha: 1))
        tableArray.append(obj5)
        let obj6 = UICell.init(title: "VICTIMS' RIGHTS" , FieldType: "DesignUICollectionViewCell", tag: UIScreenTag.victimsRights.rawValue, image:  UIImage(named: "img_victim_rights") ?? UIImage(), color: UIColor(red: 73/255, green: 110/255, blue: 212/255, alpha: 1))
        tableArray.append(obj6)
        var obj7 = UICell.init(title: "LGBTQ VICTIM ASSISTANCE" , FieldType: "DesignUICollectionViewCell", tag: UIScreenTag.lgbtqVictimAssistance.rawValue, image:  UIImage(named: "img_lgbtq_victim_assistance") ?? UIImage(), color: UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0))
        obj7.backgroundImage = UIImage(named: "img_lgbtqBackground") ?? UIImage()
        tableArray.append(obj7)
        let obj8 = UICell.init(title: "MEDIA GALLERY" , FieldType: "DesignUICollectionViewCell", tag: UIScreenTag.mediaGallery.rawValue, image:  UIImage(named: "img_mediaGalary") ?? UIImage(), color: UIColor(red: 81/255, green: 76/255, blue: 159/255, alpha: 1))
        tableArray.append(obj8)
    }
}
