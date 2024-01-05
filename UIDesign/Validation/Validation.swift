//
//  Validation.swift
//  UIDesign
//
//  Created by Pratik Morge on 03/10/23.
//

import Foundation
import UIKit

struct Validation{
    // MARK RISTRICTED_CHARACTERS
    
    static func isValidEmail(value : String, label: UILabel)-> Bool{
        let email = (value).trimmingCharacters(in: .whitespaces)
        if email.isEmpty{
            label.text = "Email id cannot be empty"
            return false
        }
        else{
            let regexExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            let predicate = NSPredicate(format: "SELF MATCHES %@", regexExpression)
            if !predicate.evaluate(with: email){
                label.text = "Email id should be valid"
                return false
            }
            else{
                label.text = "Email is Correct"
                return true
            }
        }
    }
    //    static func isValidFirstName(value : String, label: UILabel)-> Bool{
    //        let email = (value ?? "").trimmingCharacters(in: .whitespaces)
    //        if email.isEmpty{
    //            label.text = "FirstName cannot be empty"
    //            return false
    //        }
    //        else{
    //            let regexExpression = "abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ"
    //            let predicate = NSPredicate(format: "SELF MATCHES %@", regexExpression)
    //            if !predicate.evaluate(with: email){
    //                label.text = "FirstName should be valid"
    //                return false
    //            }
    //            else{
    //                label.text = "FirstName is Correct"
    //                return true
    //            }
    //        }
    //    }
    //    static func isValidLastName(value : String, label: UILabel)-> Bool{
    //        let email = (value ?? "").trimmingCharacters(in: .whitespaces)
    //        if email.isEmpty{
    //            label.text = "LastName cannot be empty"
    //            return false
    //        }
    //        else{
    //            let regexExpression = "[A-Za-z]{2,20}"
    //            let predicate = NSPredicate(format: "SELF MATCHES %@", regexExpression)
    //            if !predicate.evaluate(with: email){
    //                label.text = "LastName should be valid"
    //                return false
    //            }
    //            else{
    //                label.text = "LastName is Correct"
    //                return true
    //            }
    //        }
    //    }
    
    
    static func isValidPassword(value : String, label: UILabel)-> Bool{
        let password = (value ).trimmingCharacters(in: .whitespaces)
        if password.isEmpty{
            label.text = "password cannot be empty"
            print("ekmjndjng")
            return false
        }
        else{
            let regexExpression = "((?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,16})"
            let predicate = NSPredicate(format: "SELF MATCHES %@", regexExpression)
            if !predicate.evaluate(with: password){
                label.text = "password should be valid"
                return false
            }
            else{
                label.text = "Passward is Correct"
                return true
            }
        }
    }
    static func format(with mask: String, phone: String, label: UILabel) -> String {
        let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex // numbers iterator
        // iterate over the mask characters until the iterator of numbers ends
        for ch in mask where index < numbers.endIndex {
            if ch == "X" {
                result.append(numbers[index])
                // move numbers iterator to the next index
                index = numbers.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
    static func firstName(with mask: String, firstName: String, label: UILabel) -> String {
        let numbers = firstName.replacingOccurrences(of: "[^A-Za-z]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex // numbers iterator
        
        // iterate over the mask characters until the iterator of numbers ends
        for ch in mask where index < numbers.endIndex {
            if ch == "X" {
                // mask requires a number in this place, so take the next one
                result.append(numbers[index])
                // move numbers iterator to the next index
                index = numbers.index(after: index)
                
            } else {
                result.append(ch) // just append a mask character
            }
        }
        return result
    }
    static func lastName(with mask: String, lastName: String, label: UILabel) -> String {
        let numbers = lastName.replacingOccurrences(of: "[^A-Za-z]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex // numbers iterator
        
        // iterate over the mask characters until the iterator of numbers ends
        for ch in mask where index < numbers.endIndex {
            if ch == "X" {
                // mask requires a number in this place, so take the next one
                result.append(numbers[index])
                
                // move numbers iterator to the next index
                index = numbers.index(after: index)
                
            } else {
                result.append(ch) // just append a mask character
            }
        }
        return result
    }
    
}




