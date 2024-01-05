//
//  RegisterViewController.swift
//  UIDesign
//
//  Created by Pratik Morge on 19/09/23.
//

import UIKit
import SkyFloatingLabelTextField
class RegisterViewController: UIViewController {
    var registerViewModel = RegisterViewModel()
    @IBOutlet weak var registerView: UIView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var passwardLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var registerNowBtn: UIButton!
    @IBOutlet weak var passwardTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var emailTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var userNameTextField: SkyFloatingLabelTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.black
        setUI()
        emailLabel.text = ""
        passwardLabel.text = ""
        passwardTextField.delegate = self
        userNameTextField.delegate = self
        emailTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    func setUI(){
        registerNowBtn.setTitle("Register Now", for: .normal)
        registerNowBtn.backgroundColor = .orange
        registerNowBtn.configuration?.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in  var outgoing = incoming
            outgoing.font = UIFont.systemFont(ofSize: 18, weight: .bold)
            return outgoing
        }
        registerView.layer.cornerRadius = 10
        registerView.layer.shadowColor = UIColor.black.cgColor
        registerView.layer.shadowOpacity = 0.2
        registerView.layer.shadowOffset = CGSize(width: 4, height: 4)
        registerView.layer.shadowRadius = 4
        registerNowBtn.layer.cornerRadius = registerNowBtn.frame.height/2
        ConstantMethod.text(textField: emailTextField , imageView: UIImageView(image: UIImage(named: "userIcon")))
        ConstantMethod.text(textField: passwardTextField , imageView: UIImageView(image: UIImage(named: "phoneIcon")))
        ConstantMethod.text(textField: userNameTextField , imageView: UIImageView(image: UIImage(named: "userIcon")))
    }
    
    @IBAction func registerNowBtn(_ sender: Any) {
        self.registerViewModel.delegates?.infoViewScreen()
    }
    @IBAction func loginBtn(_ sender: Any) {
        self.registerViewModel.delegates?.homeScreen()
    }
    
}
extension RegisterViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return false }
        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        switch textField{
        case userNameTextField :
            textField.text = Validation.firstName(with: "XXXXXXXXXXXXXXXXXXXX", firstName: newString, label: userNameLabel)
        case emailTextField:
            textField.text = Validation.lastName(with: "XXXXXXXXXXXXXXXXXXXX", lastName: newString, label: emailLabel)
        case passwardTextField:
            textField.text = Validation.format(with: "(XXX) XXX-XXXX", phone: newString, label: passwardLabel)
            
        default:
            return true
        }
        return true
    }
}


