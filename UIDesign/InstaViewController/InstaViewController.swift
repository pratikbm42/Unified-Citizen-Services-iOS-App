//
//  InstaViewController.swift
//  UIDesign
//
//  Created by Pratiksha Jagtap on 02/11/23.
//

import UIKit
class InstaViewController: UIViewController{
    
    
    @IBOutlet weak var tabbar: UITabBar!
    @IBOutlet weak var detailsTableView: UITableView!
    let viewModel = InstaViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.initArray()
        registerNib()
        self.tabbar.delegate = self
        detailsTableView.delegate = self
        detailsTableView.dataSource = self
        self.navigationController?.navigationBar.tintColor = UIColor.black
        detailsTableView.rowHeight = UITableView.automaticDimension
        detailsTableView.estimatedRowHeight = UITableView.automaticDimension
        // Do any additional setup after loading the view.
    }
    
    func registerNib(){
        let nibname = UINib(nibName: "FollowTableViewCell", bundle: nil)
        self.detailsTableView.register(nibname, forCellReuseIdentifier: "FollowTableViewCell")
        let nibname1 = UINib(nibName: "DescriptionTableViewCell", bundle: nil)
        self.detailsTableView.register(nibname1, forCellReuseIdentifier: "DescriptionTableViewCell")
        let nibname2 = UINib(nibName: "HeaderTableViewCell", bundle: nil)
        self.detailsTableView.register(nibname2, forCellReuseIdentifier: "HeaderTableViewCell")
        let nibname3 = UINib(nibName: "PhotosTableViewCell", bundle: nil)
        self.detailsTableView.register(nibname3, forCellReuseIdentifier: "PhotosTableViewCell")
    }
    
    
}
extension InstaViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let object = viewModel.tableArray[indexPath.row]
        switch object.fieldType{
        case "FollowTableViewCell":
            let cell = self.detailsTableView.dequeueReusableCell(withIdentifier: object.fieldType) as? FollowTableViewCell
            return cell ?? UITableViewCell()
        case "DescriptionTableViewCell":
            let cell = self.detailsTableView.dequeueReusableCell(withIdentifier: object.fieldType) as? DescriptionTableViewCell
            cell?.discriptionLabel.text = object.title
            cell?.discriptionLabel.backgroundColor = .white
            return cell ?? UITableViewCell()
        case "HeaderTableViewCell":
            let cell = self.detailsTableView.dequeueReusableCell(withIdentifier: object.fieldType) as? HeaderTableViewCell
            cell?.headerTitleLabel.text = object.title
            cell?.hederView.backgroundColor = .white
            return cell ?? UITableViewCell()
        case "PhotosTableViewCell":
            let cell = self.detailsTableView.dequeueReusableCell(withIdentifier: object.fieldType) as? PhotosTableViewCell
            cell?.selectedImages = object.images
            cell?.photosCollectionView.reloadData()
            return cell ?? UITableViewCell()
        default:
            break
        }
        return  UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
        
    }
}
extension InstaViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage]
        if let selectedImage = image {
            if let imagePath = viewModel.saveImageToDocumentDirectory(image: selectedImage as! UIImage) {
                print("Image saved to document directory: \(imagePath)")
                // Use the saved image path to load the image into the image view
                viewModel.tableArray.append(InstaCell(title: "", fieldType:"PhotosTableViewCell", tag: 0, images: [Image.init(image: imagePath)]))
            } else {
                print("Failed to save image to document directory")
            }
        } else {
            print("Unable to load image from gallery")
        }
        picker.dismiss(animated: true)
        self.detailsTableView.reloadData()
    }
    
}
    

extension InstaViewController: UITabBarDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item == tabBar.items?[2] {
            // Handle click on the first tab item (index 0)
            print("middle tab item clicked")
            let imagePickerController = UIImagePickerController()
                   imagePickerController.delegate = self
                   let actionSheet = UIAlertController(title: "Photo source", message: "Choose a source", preferredStyle: .actionSheet)
                   actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in
                      
                   }))
                   actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action:UIAlertAction) in
                       imagePickerController.sourceType = .photoLibrary
                       self.present(imagePickerController, animated: true, completion: nil)
                   }))
                   actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                   self.present(actionSheet, animated: true, completion: nil)
            imagePickerController.allowsEditing = true
            
            // Add more conditions for other tab items if needed
        }
    }
}
