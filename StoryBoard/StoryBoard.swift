//
//  StoryBoard.swift
//  UIDesign
//
//  Created by Pratiksha Jagtap on 30/10/23.
//

import UIKit

enum StoryBoards: String {
    case main = "Main"
    case design = "Design"
    func storyboard() -> UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: nil)
    }
}

extension UIViewController {
    class func instanceController(_ storyboard: StoryBoards) -> UIViewController? {
        return storyboard.storyboard().instantiateViewController(withIdentifier: self.nameOfClass)
    }
    
}
extension NSObject {
    static var nameOfClass: String {
        guard let className = NSStringFromClass(self).components(separatedBy: ".").last else {
            return ""
        }
        return className
    }
}
