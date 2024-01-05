//
//  InstaViewModel.swift
//  UIDesign
//
//  Created by Pratiksha Jagtap on 02/11/23.
//

import Foundation
import UIKit

struct InstaCell {
    var title: String
    var fieldType: String
    var tag: Int
    var images: [Image]
    init(title: String, fieldType: String, tag: Int, images: [Image]) {
        self.title = title
        self.fieldType = fieldType
        self.tag = tag
        self.images = images
    }
}
struct Image {
    let image: String
    
}
class InstaViewModel{
    var tableArray: [InstaCell] = []
    var imageArray: [Image] = []
    func initArray(){
        let obj1 = InstaCell(title: "", fieldType: "FollowTableViewCell", tag:0, images: [] )
        tableArray.append(obj1)
        let obj2 = InstaCell(title: "(-:The greatest happiness you can have is knowing that you do not necessarily require happiness:-)", fieldType: "DescriptionTableViewCell", tag: 0, images: [])
        tableArray.append(obj2)
        let obj3 = InstaCell(title: "Photos", fieldType: "HeaderTableViewCell", tag:0, images: [])
        tableArray.append(obj3)
        let obj4 = InstaCell(title: "Photos", fieldType: "PhotosTableViewCell", tag:0, images: [Image(image: "a1"),Image(image: "a1"),Image(image: "a1"),Image(image: "a1")])
        tableArray.append(obj4)
    }
    
    func saveImageToDocumentDirectory(image: UIImage) -> String? {
        
        let fileManager = FileManager.default
        let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        // Create a unique name for the image file
        
        let imageName = "myImage.jpg" // You can use any name or generate a unique name
        
        let fileURL = documentsURL.appendingPathComponent(imageName)
        if let imageData = image.jpegData(compressionQuality: 1.0) {
            do {
                try imageData.write(to: fileURL)
                return fileURL.path // Return the file path
            } catch {
                print("Error saving image: \(error)")
                return nil
            }
        }
        return nil
    }
    
    
}



