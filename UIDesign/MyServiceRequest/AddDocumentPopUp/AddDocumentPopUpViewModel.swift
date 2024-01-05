//
//  AddDocumentPopUpViewModel.swift
//  UIDesign
//
//  Created by Pratik Morge on 30/11/23.
//

import Foundation
import UIKit

struct AddDocumentCell {
    var title: String
    var placeHolder: String
    var fieldType: String
    init(title: String, placeHolder: String, fieldType: String) {
        self.title = title
        self.placeHolder = placeHolder
        self.fieldType = fieldType
    }
}

class AddDocumentPopUpViewModel {
    var tableArray: [AddDocumentCell] = []
    // var delegate: DetailSRViewModeldelegate?
    func initArray(){
        let obj1 = AddDocumentCell(title: "Add Documents", placeHolder: "", fieldType: "SaveAndCancelButtonTableViewCell")
        tableArray.append(obj1)
        let obj2 = AddDocumentCell(title: "Documents Type*", placeHolder: "", fieldType: "DocumentTypeTableViewCell")
        tableArray.append(obj2)
        let obj3 = AddDocumentCell(title: "  Select", placeHolder: "", fieldType: "PickerTableViewCell")
        tableArray.append(obj3)
        let obj4 = AddDocumentCell(title: "Add Note", placeHolder: "", fieldType: "DocumentTypeTableViewCell")
        tableArray.append(obj4)
        let obj5 = AddDocumentCell(title: "Enter a description", placeHolder: "", fieldType: "DescriptionTableViewCell")
        tableArray.append(obj5)
        let obj6 = AddDocumentCell(title: "Select files...", placeHolder: "(doc,.docx,.pdf,.jpg, jpeg, png, xls, xIsx,.pst)", fieldType: "SelectFileTableViewCell")
        tableArray.append(obj6)
    }
}
