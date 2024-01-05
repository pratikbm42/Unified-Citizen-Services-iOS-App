//
//  InfoViewModel.swift
//  UIDesign
//
//  Created by Pratiksha Jagtap on 13/10/23.
//

import Foundation
import UIKit

struct InfoCell{
    var title: String
    var fieldType: String
    var tag: Int
    var value: String
    var mainImage: UIImage
    init(title: String, fieldType: String, tag: Int, value: String, mainImage: UIImage) {
        self.title = title
        self.fieldType = fieldType
        self.tag = tag
        self.value = value
        self.mainImage = mainImage
    }
}


struct SectionObject {
    var title: String
    var rowArray: [InfoCell]
    var tag: Int
    var image: UIImage
    var isExapand: Bool
    init(title: String, rowArray: [InfoCell], tag: Int, image: UIImage, isExapand: Bool) {
        self.title = title
        self.rowArray = rowArray
        self.tag = tag
        self.image = image
        self.isExapand = isExapand
    }
    
}
enum TableViewCellsTag: Int{
    case titleTableViewCell = 1
    case imageTableViewCell
    case fireDepartmentTableViewCell
    case adressTableViewCell
    
}

class InfoViewModel {
    var tableArray: [SectionObject] = []
    var rowArray: [InfoCell] = []
    func getHeaderObject(cell: [InfoCell], headerTitle: String) -> SectionObject {
        return SectionObject(title: "", rowArray: rowArray, tag: 0, image: UIImage(named: "") ?? UIImage(), isExapand: false)
    }
    func initArray(){
        let sectrow1 = InfoCell(title: "", fieldType: "ImageTableViewCell", tag: TableViewCellsTag.imageTableViewCell.rawValue, value: "", mainImage: UIImage(named: "backgroundimage") ?? UIImage())
        rowArray.append(sectrow1)
        tableArray.append(SectionObject(title: "", rowArray: rowArray, tag: TableViewCellsTag.imageTableViewCell.rawValue, image: UIImage(named: "") ?? UIImage(), isExapand: true))
        let sectrow2 = InfoCell(title: "Fire Department :", fieldType: "FireDepartmentTableViewCell", tag: TableViewCellsTag.fireDepartmentTableViewCell.rawValue, value: "BATH TOWNSHIP FIRE DEPARTMENT", mainImage: UIImage(named: "backgroundimage") ?? UIImage())
        let sectrow3 = InfoCell(title: "FDID:", fieldType: "FireDepartmentTableViewCell", tag: TableViewCellsTag.fireDepartmentTableViewCell.rawValue, value: "02107", mainImage: UIImage(named: "backgroundimage") ?? UIImage())
        let sectrow4 = InfoCell(title: "Educator Name :", fieldType: "FireDepartmentTableViewCell", tag: TableViewCellsTag.fireDepartmentTableViewCell.rawValue, value: "Chuck Arnold", mainImage: UIImage(named: "backgroundimage") ?? UIImage())
        let sectrow5 = InfoCell(title: "Educator Email:", fieldType: "FireDepartmentTableViewCell", tag: TableViewCellsTag.fireDepartmentTableViewCell.rawValue, value: "charles.arnold@com.ohio.gov", mainImage: UIImage(named: "backgroundimage") ?? UIImage())
        let sectrow6 = InfoCell(title: "Educator Phone:", fieldType: "FireDepartmentTableViewCell", tag: TableViewCellsTag.fireDepartmentTableViewCell.rawValue, value: "NIA", mainImage: UIImage(named: "backgroundimage") ?? UIImage())
        let sectrow7 = InfoCell(title: "Status:", fieldType: "FireDepartmentTableViewCell", tag: TableViewCellsTag.fireDepartmentTableViewCell.rawValue, value: "Active", mainImage: UIImage(named: "backgroundimage") ?? UIImage())
        let sectrow8 = InfoCell(title: "Incident Reporting Method :", fieldType: "FireDepartmentTableViewCell", tag: TableViewCellsTag.fireDepartmentTableViewCell.rawValue, value: "OFIRMS Direct", mainImage: UIImage(named: "backgroundimage") ?? UIImage())
        tableArray.append(SectionObject(title: "", rowArray: [sectrow2,sectrow3,sectrow4,sectrow5,sectrow6,sectrow7,sectrow8], tag: TableViewCellsTag.fireDepartmentTableViewCell.rawValue, image: UIImage(named: "") ?? UIImage(), isExapand: true))
        let adressrow1 = InfoCell(title: "Mailing Address" , fieldType: "MainTitleTableViewCell", tag: TableViewCellsTag.adressTableViewCell.rawValue, value: "", mainImage: UIImage(named: "") ?? UIImage())
        let adressrow2 = InfoCell(title: "340 W 12th Ave Columbus OH 43210 US" , fieldType: "TitleTableViewCell", tag: TableViewCellsTag.adressTableViewCell.rawValue, value: "", mainImage: UIImage(named: "rightArrow(LTR)") ?? UIImage())
        let adressrow3 = InfoCell(title: "123 W Lane Ave Columbus OH 43210 US" , fieldType: "TitleTableViewCell", tag: TableViewCellsTag.adressTableViewCell.rawValue, value: "", mainImage: UIImage(named: "rightArrow(LTR)") ?? UIImage())
        let adressrow4 = InfoCell(title: "Office" , fieldType: "MainTitleTableViewCell", tag: TableViewCellsTag.adressTableViewCell.rawValue, value: "", mainImage: UIImage(named: "") ?? UIImage())
        let adressrow5 = InfoCell(title: "1787 N DIXIE HWY LIMA OH 45801 US" , fieldType: "TitleTableViewCell", tag: TableViewCellsTag.adressTableViewCell.rawValue, value: "", mainImage: UIImage(named: "rightArrow(LTR)") ?? UIImage())
        let adressrow6 = InfoCell(title: "894 Frank Rd Columbus OH 43223 US" , fieldType: "TitleTableViewCell", tag: TableViewCellsTag.adressTableViewCell.rawValue, value: "", mainImage: UIImage(named: "rightArrow(LTR)") ?? UIImage())
        tableArray.append(SectionObject(title: "Address", rowArray: [adressrow1, adressrow2, adressrow3, adressrow4, adressrow5, adressrow6], tag: TableViewCellsTag.adressTableViewCell.rawValue, image: UIImage(named: "plusBlue") ?? UIImage(), isExapand: true))
        rowArray.removeAll()
        
        let departmentrow1 = InfoCell(title: "Disciplines", fieldType: "TitleTableViewCell", tag: TableViewCellsTag.fireDepartmentTableViewCell.rawValue, value: "Fire, Government", mainImage: UIImage(named: "") ?? UIImage())
        let departmentrow2 = InfoCell(title: "Email Address", fieldType: "TitleTableViewCell", tag: TableViewCellsTag.fireDepartmentTableViewCell.rawValue, value: "jkitchen@bathtwpfd.com", mainImage: UIImage(named: "") ?? UIImage())
        let departmentrow3 = InfoCell(title: "County", fieldType: "TitleTableViewCell", tag: TableViewCellsTag.fireDepartmentTableViewCell.rawValue, value: "Allen", mainImage: UIImage(named: "") ?? UIImage())
        let departmentrow4 = InfoCell(title: "FIPS County Code", fieldType: "TitleTableViewCell", tag: TableViewCellsTag.fireDepartmentTableViewCell.rawValue, value: "N/A", mainImage: UIImage(named: "") ?? UIImage())
        let departmentrow5 = InfoCell(title: "# of Paid Fire Fighters", fieldType: "TitleTableViewCell", tag: TableViewCellsTag.fireDepartmentTableViewCell.rawValue, value: "N/A", mainImage: UIImage(named: "") ?? UIImage())
        let departmentrow6 = InfoCell(title: "# of Paid Fire Fighters Per Call", fieldType: "TitleTableViewCell", tag: TableViewCellsTag.fireDepartmentTableViewCell.rawValue, value: "N/A", mainImage: UIImage(named: "") ?? UIImage())
        let departmentrow7 = InfoCell(title: "# of Volunteer Fire Fighters", fieldType: "TitleTableViewCell", tag: TableViewCellsTag.fireDepartmentTableViewCell.rawValue, value: "N/A", mainImage: UIImage(named: "") ?? UIImage())
        let departmentrow8 = InfoCell(title: "EMS Transporting Agency", fieldType: "TitleTableViewCell", tag: TableViewCellsTag.fireDepartmentTableViewCell.rawValue, value: "N/A", mainImage: UIImage(named: "") ?? UIImage())
        let departmentrow9 = InfoCell(title: "Are you a Fire District?", fieldType: "TitleTableViewCell", tag: TableViewCellsTag.fireDepartmentTableViewCell.rawValue, value: "N/A", mainImage: UIImage(named: "") ?? UIImage())
        tableArray.append(SectionObject(title: "Department Information", rowArray: [departmentrow1, departmentrow2, departmentrow3, departmentrow4, departmentrow5, departmentrow6, departmentrow7, departmentrow8, departmentrow9], tag: TableViewCellsTag.fireDepartmentTableViewCell.rawValue, image: UIImage(named: "plusBlue") ?? UIImage(), isExapand: true))
        rowArray.removeAll()
        let fireStationrow1 = InfoCell(title: "Fire Station", fieldType: "TitleTableViewCell", tag: TableViewCellsTag.titleTableViewCell.rawValue, value: "3", mainImage: UIImage(named: "rightArrow(LTR)") ?? UIImage())
        tableArray.append(SectionObject(title: "Fire Station", rowArray: [fireStationrow1], tag: TableViewCellsTag.titleTableViewCell.rawValue, image: UIImage(named: "") ?? UIImage(), isExapand: true))
        rowArray.removeAll()
        
        let additionalInforow1 = InfoCell(title: "Apparatus", fieldType: "TitleTableViewCell", tag: TableViewCellsTag.fireDepartmentTableViewCell.rawValue, value: "7", mainImage: UIImage(named: "rightArrow(LTR)") ?? UIImage())
        let additionalInforow2 = InfoCell(title: "Personnel", fieldType: "TitleTableViewCell", tag: TableViewCellsTag.fireDepartmentTableViewCell.rawValue, value: "1", mainImage: UIImage(named: "rightArrow(LTR)") ?? UIImage())
        let additionalInforow3 = InfoCell(title: "Registration Cases", fieldType: "TitleTableViewCell", tag: TableViewCellsTag.fireDepartmentTableViewCell.rawValue, value: "4", mainImage: UIImage(named: "rightArrow(LTR)") ?? UIImage())
        let additionalInforow4 = InfoCell(title: "Decal Requests", fieldType: "TitleTableViewCell", tag: TableViewCellsTag.fireDepartmentTableViewCell.rawValue, value: "5", mainImage: UIImage(named: "rightArrow(LTR)") ?? UIImage())
        tableArray.append(SectionObject(title: "Additional Info", rowArray: [additionalInforow1, additionalInforow2, additionalInforow3, additionalInforow4], tag: TableViewCellsTag.fireDepartmentTableViewCell.rawValue, image: UIImage(named: "") ?? UIImage(), isExapand: true))
        let jurisdictionrow1 = InfoCell(title: "Jurisdiction", fieldType: "TitleTableViewCell", tag: TableViewCellsTag.titleTableViewCell.rawValue, value: "", mainImage: UIImage(named: "rightArrow(LTR)") ?? UIImage())
        tableArray.append(SectionObject(title: "Jurisdiction", rowArray: [jurisdictionrow1], tag: TableViewCellsTag.titleTableViewCell.rawValue, image: UIImage(named: "") ?? UIImage(), isExapand: true))
        let associatedrow1 = InfoCell(title: "Associated Vendor Info", fieldType: "TitleTableViewCell", tag: TableViewCellsTag.titleTableViewCell.rawValue, value: "", mainImage: UIImage(named: "rightArrow(LTR)") ?? UIImage())
        tableArray.append(SectionObject(title: "Associated Vendor Info", rowArray: [associatedrow1], tag: TableViewCellsTag.titleTableViewCell.rawValue, image: UIImage(named: "") ?? UIImage(), isExapand: true))
        
        let documentsrow1 = InfoCell(title: "Documents", fieldType: "TitleTableViewCell", tag: TableViewCellsTag.titleTableViewCell.rawValue, value: "", mainImage: UIImage(named: "rightArrow(LTR)") ?? UIImage())
        tableArray.append(SectionObject(title: "Documents", rowArray: [documentsrow1], tag: TableViewCellsTag.titleTableViewCell.rawValue, image: UIImage(named: "plusBlue") ?? UIImage(), isExapand: false))
        
        let changeLogrow1 = InfoCell(title: "Change Log", fieldType: "TitleTableViewCell", tag: TableViewCellsTag.titleTableViewCell.rawValue, value: "388", mainImage: UIImage(named: "rightArrow(LTR)") ?? UIImage())
        tableArray.append(SectionObject(title: "Change Log", rowArray: [changeLogrow1], tag: TableViewCellsTag.titleTableViewCell.rawValue, image: UIImage(named: "") ?? UIImage(), isExapand: true))
        
    }
}
