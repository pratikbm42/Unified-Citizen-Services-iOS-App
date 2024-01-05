//
//  ViewController.swift
//  UIDesign
//
//  Created by Pratiksha Jagtap on 19/09/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var loginbtn: UIButton!
    @IBOutlet weak var registerbtn: UIButton!
    var viewModel = ViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonTitle()
        // Do any additional setup after loading the view.
    }
    
    func setButtonTitle() {
        loginbtn?.layer.cornerRadius = loginbtn.frame.size.height/2
        loginbtn?.backgroundColor = .white
        registerbtn?.layer.cornerRadius = loginbtn.frame.size.height/2
        registerbtn?.backgroundColor = .white
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 18, weight: .bold)
        ]
        let attributedText = NSAttributedString(string: "Login", attributes: attributes)
        loginbtn.setAttributedTitle(attributedText, for: .normal)
        let attributedText1 = NSAttributedString(string: "Register", attributes: attributes)
        registerbtn.setAttributedTitle(attributedText1, for: .normal)
    }
    @IBAction func loginbtn(_ sender: Any) {
        
        self.viewModel.delegates?.showLogin()
        
    }
    
    @IBAction func registerbtn(_ sender: Any) {
        self.viewModel.delegates?.showRegister()
    }
    @IBAction func instaBtn(_ sender: Any) {
        self.viewModel.delegates?.instaScreen()
    }
    
    
}


