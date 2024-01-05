//
//  AddDocumentPopUp.swift
//  UIDesign
//
//  Created by Pratiksha Jagtap on 30/11/23.
//

import UIKit

class AddDocumentPopUp: UIViewController, UIDocumentPickerDelegate{
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var documentsTableView: UITableView!
    
    @IBOutlet weak var contentView: UIView!
    let viewModel = AddDocumentPopUpViewModel()
    
    init() {
        super.init (nibName: "AddDocumentPopUp", bundle: nil)
    self.modalPresentationStyle = .overFullScreen
    }
    required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented" )
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configView ()
        self.viewModel.initArray()
        self.documentsTableView.separatorColor = UIColor.clear
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 0.2
        contentView.layer.shadowOffset = CGSize(width: 4, height: 4)
        contentView.layer.shadowRadius = 4
        documentsTableView.delegate = self
        documentsTableView.dataSource = self
        let uinibName1 = UINib(nibName: "SaveAndCancelButtonTableViewCell", bundle: nil)
        self.documentsTableView.register(uinibName1, forCellReuseIdentifier: "SaveAndCancelButtonTableViewCell")
        let uinibName2 = UINib(nibName: "DocumentTypeTableViewCell", bundle: nil)
        self.documentsTableView.register(uinibName2, forCellReuseIdentifier: "DocumentTypeTableViewCell")
        let uinibName3 = UINib(nibName: "PickerTableViewCell", bundle: nil)
        self.documentsTableView.register(uinibName3, forCellReuseIdentifier: "PickerTableViewCell")
        let uinibName4 = UINib(nibName: "DescriptionTableViewCell", bundle: nil)
        self.documentsTableView.register(uinibName4, forCellReuseIdentifier: "DescriptionTableViewCell")
        let uinibName5 = UINib(nibName: "SelectFileTableViewCell", bundle: nil)
        self.documentsTableView.register(uinibName5, forCellReuseIdentifier: "SelectFileTableViewCell")
        self.documentsTableView.reloadData()
        // Do any additional setup after loading the view.
    }
    func configView() {
        self.view.backgroundColor = .clear
        self.backView.backgroundColor = .black.withAlphaComponent (0.6)
        self.backView.alpha = 0
        self.contentView.alpha = 0
        self.contentView.layer.cornerRadius = 50
    }
    func appear (sender: UIViewController) {
        sender.present(self, animated: false) {
            self.show()
        }
    }
    private func show() {
        UIView.animate(withDuration: 1, delay: 0) {
            self.backView.alpha = 1
            self.contentView.alpha = 1
        }
    }
    func hide() {
        UIView.animate(withDuration: 1, delay: 0.0, options: .curveEaseOut) {
            self.backView.alpha = 0
            self.contentView.alpha = 0
        } completion: {_ in
                self.dismiss(animated: false)
                self.removeFromParent ()
            }
        }
    @objc func buttonAction(sender: UIButton!) {
        hide()
        }
    @objc func openFileManager() {
        let documentPicker = UIDocumentPickerViewController(documentTypes: ["public.item"], in: .import)
             documentPicker.delegate = self
            present(documentPicker, animated: true, completion: nil)
        }
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            // Handle the selected file URLs here
            for url in urls {
                print("Selected file URL: \(url)")
                // You can perform operations with the selected file URL
            }
        }
        
        func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
            // Handle if the user cancels document picker
            print("Document picker was cancelled")
        }
    func uploadFile(at fileURL: URL) {
           // Simulate file upload
           // Replace this with your actual file upload code
           print("Uploading file: \(fileURL.lastPathComponent)")
           // Perform your file upload operation here
           // For example, you can use URLSession to upload the file to a server
           // URLSession.shared.uploadTask(with: URLRequest(url: yourUploadURL), fromFile: fileURL) { data, response, error in
           //     // Handle response or error
           // }.resume()
       }
    }

extension AddDocumentPopUp: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let object = viewModel.tableArray[indexPath.row]
        switch object.fieldType{
    case "SaveAndCancelButtonTableViewCell":
            let cell = self.documentsTableView.dequeueReusableCell(withIdentifier: object.fieldType, for: indexPath) as? SaveAndCancelButtonTableViewCell
            cell?.titleLabel.text = object.title
            cell?.cancelBtn.setTitle("Cancel", for: .normal)
            cell?.cancelBtn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            cell?.saveBtn.setTitle("Save", for: .normal)
            cell?.view.roundCorners(corners: [.topLeft,.topRight], radius: 10)
            return cell ?? UITableViewCell()
    case "DocumentTypeTableViewCell":
            let cell = self.documentsTableView.dequeueReusableCell(withIdentifier: object.fieldType, for: indexPath) as? DocumentTypeTableViewCell
            cell?.mainTitleLabel.text = object.title
            cell?.mainTitleLabel.font = UIFont(name: "SFProDisplay-Semibold", size: 14)
            return cell ?? UITableViewCell()
    case "PickerTableViewCell":
        let cell = self.documentsTableView.dequeueReusableCell(withIdentifier: object.fieldType, for: indexPath) as? PickerTableViewCell
            cell?.titleLabel.text = object.title
            cell?.titleLabel.layer.borderColor = .init(gray: 0.4, alpha: 0.3)
            cell?.titleLabel.layer.borderWidth = 1
            cell?.titleLabel.layer.cornerRadius = 5
            cell?.arrowImage.image = UIImage(named: "downArrow2")
            return cell ?? UITableViewCell()
        case "DescriptionTableViewCell":
            let cell = self.documentsTableView.dequeueReusableCell(withIdentifier: object.fieldType, for: indexPath) as? DescriptionTableViewCell
            cell?.discriptionLabel.text = object.title
            cell?.designView.layer.borderColor = .init(gray: 0.4, alpha: 0.3)
            cell?.designView.layer.cornerRadius = 5
            cell?.discriptionLabel.textColor = .lightGray
            cell?.discriptionLabel.font = UIFont(name: "SFProDisplay-Semibold", size:14)
           // cell?.designView.layer.borderColor = .init(red: CGFloat(128/255), green: CGFloat(128/255), blue: CGFloat(128/255), alpha: 0.4)
            cell?.designView.layer.borderWidth = 1
                return cell ?? UITableViewCell()
        case "SelectFileTableViewCell":
                let cell = self.documentsTableView.dequeueReusableCell(withIdentifier: object.fieldType, for: indexPath) as? SelectFileTableViewCell
            cell?.titleLabel.text = object.title
            cell?.titleLabel.font = UIFont(name: "SFProDisplay-Semibold", size: 12)
            cell?.placeHolderLabel.text = object.placeHolder
            cell?.placeHolderLabel.textColor = .init(white: 0.4, alpha: 0.6)
            cell?.placeHolderLabel.font = UIFont(name: "SFProDisplay-Semibold", size: 12)
            cell?.selectFileBtn.addTarget(self, action: #selector(openFileManager), for: .touchUpInside)
            
                return cell ?? UITableViewCell()
        default:
            break;
        }
        return UITableViewCell()
    }

}
