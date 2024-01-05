//
//  LoginViewController.swift
//  UIDesign
//
//  Created by Pratik Morge on 19/09/23.
//

import UIKit
import SkyFloatingLabelTextField
class LoginViewController: UIViewController {
    var loginViewMode = LoginViewModel()
    
    @IBOutlet weak var emailIdTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwardLabel: UILabel!
    @IBOutlet weak var passwardTextField: SkyFloatingLabelTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.black
        setUI()
        emailLabel.text = ""
        passwardLabel.text = ""
        // Do any additional setup after loading the view.
    }
    private func setUI(){
        // login Btn
        loginBtn?.setTitle("Login", for: .normal)
        loginBtn?.backgroundColor = .orange
        loginBtn?.layer.cornerRadius = loginBtn.frame.size.height/2
        loginBtn?.configuration?.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in var outgoing = incoming
            outgoing.font = UIFont.systemFont(ofSize: 18, weight: .bold)
            return outgoing
        }
        
        // login View
        loginView?.layer.cornerRadius = 5
        loginView?.layer.shadowColor = UIColor.black.cgColor
        loginView?.layer.shadowOpacity = 0.2
        loginView?.layer.shadowOffset = CGSize(width: 4, height: 4)
        loginView?.layer.shadowRadius = 4
        ConstantMethod.text(textField: emailIdTextField , imageView: UIImageView(image: UIImage(named: "email icon")))
        ConstantMethod.text(textField: passwardTextField , imageView: UIImageView(image: UIImage(named: "lockicon")))
    }
    func checkValidate() -> Bool{
        //Check Validation
        let emailValidation = Validation.isValidEmail(value: emailIdTextField.text ?? "", label: emailLabel)
        print("The email: \(emailIdTextField.text ?? "")")
        print(emailLabel.text ?? "")
        let passwardValidation = Validation.isValidPassword(value: passwardTextField.text ?? "", label: passwardLabel)
        print("The passward: \(passwardTextField.text ?? "")")
        print(passwardLabel.text ?? "")
        let validate : Bool =  emailValidation && passwardValidation
        return validate
    }
    @IBAction func loginBtn(_ sender: Any) {
        if checkValidate() == true {
            self.loginViewMode.delegates?.myServiceRequestScreen()
        }
        
    }
    @IBAction func goDashBoardSreen(_ sender: Any) {
        self.loginViewMode.delegates?.dashBoardScreen()
    }
}

  



