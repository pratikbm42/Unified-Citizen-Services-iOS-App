//
//  InfoViewController.swift
//  UIDesign
//
//  Created by Pratik Morge on 13/10/23.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var infoTableView: UITableView!
    let viewModel = InfoViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.initArray()
        infoTableView.delegate = self
        infoTableView.dataSource = self
        self.infoTableView.sectionHeaderHeight = 0
        self.infoTableView.sectionFooterHeight = 0
        let uinibName = UINib(nibName: "TitleTableViewCell", bundle: nil)
        self.infoTableView.register(uinibName, forCellReuseIdentifier: "TitleTableViewCell")
        let uinibName1 = UINib(nibName: "HeaderTableViewCell", bundle: nil)
        self.infoTableView.register(uinibName1, forCellReuseIdentifier: "HeaderTableViewCell")
        let uinibName2 = UINib(nibName: "ImageTableViewCell", bundle: nil)
        self.infoTableView.register(uinibName2, forCellReuseIdentifier: "ImageTableViewCell")
        let uinibName3 = UINib(nibName: "FireDepartmentTableViewCell", bundle: nil)
        self.infoTableView.register(uinibName3, forCellReuseIdentifier: "FireDepartmentTableViewCell")
        let uinibName4 = UINib(nibName: "MainTitleTableViewCell", bundle: nil)
        self.infoTableView.register(uinibName4, forCellReuseIdentifier: "MainTitleTableViewCell")
        self.navigationItem.title = "My Service Requests Details"
        self.navigationController?.navigationBar.barTintColor = .white
        let attributes = [NSAttributedString.Key.foregroundColor:UIColor.white, NSAttributedString.Key.font:UIFont(name: "SFProDisplay-Semibold", size: 18)]
        self.navigationController?.navigationBar.titleTextAttributes = attributes as [NSAttributedString.Key : Any]
        self.infoTableView.reloadData()
        // Do any additional setup after loading the view.
    }
    @objc func tapSection(sender: UIButton) {
        print("trying to expand amd Close setion")
        let section = sender.tag
        // we'll try to close the section first by deleting the rows
        var indexPaths = [IndexPath]()
        for row in viewModel.tableArray[section].rowArray.indices {
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
        }
        let overLayer = AddDocumentPopUp()
        overLayer.appear(sender: self)
        
        let isExpand = viewModel.tableArray[section].isExapand
        viewModel.tableArray[section].isExapand = !isExpand
        if isExpand{
            infoTableView.deleteRows(at: indexPaths, with: .fade)
        }else{
            infoTableView.insertRows(at: indexPaths, with: .fade)
            
        }
    }
    @objc func imageTapped() {
        let overLayer = AddDocumentPopUp()
        overLayer.appear(sender: self)
        }
}

extension InfoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !viewModel.tableArray[section].isExapand {
            return 0
        }
        return viewModel.tableArray[section].rowArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionObject = self.viewModel.tableArray[indexPath.section]
        let rowObj = sectionObject.rowArray[indexPath.row]
        
        var cornerradius: (UIRectCorner, CGFloat) = ([UIRectCorner.bottomLeft, UIRectCorner.bottomRight, UIRectCorner.topLeft, UIRectCorner.topRight], 0.0)
        if sectionObject.rowArray.count == 1 {
            cornerradius = ([UIRectCorner.topLeft, UIRectCorner.topRight, UIRectCorner.bottomLeft, UIRectCorner.bottomRight], 10.0)
        } else if indexPath.row == 0 {
            cornerradius = ([UIRectCorner.topLeft, UIRectCorner.topRight], 10.0)
        } else if indexPath.row == sectionObject.rowArray.count - 1 {
            cornerradius = ([UIRectCorner.bottomLeft, UIRectCorner.bottomRight], 10.0)
        }  else{
            cornerradius = ([UIRectCorner.bottomLeft, UIRectCorner.bottomRight, UIRectCorner.topLeft, UIRectCorner.topRight], 0.0)
        }
        
        
        switch rowObj.fieldType{
        case "TitleTableViewCell":
            let cell = self.infoTableView.dequeueReusableCell(withIdentifier: "TitleTableViewCell", for: indexPath) as? TitleTableViewCell
            cell?.titleLabel.text = rowObj.title
            cell?.valueLabel.text = rowObj.value
            if sectionObject.rowArray.count == 1 {
                cell?.view.roundCorners(corners: [.topLeft, .topRight, .bottomLeft, .bottomRight], radius: 10)
            }else if(indexPath.row == 0){
                cell?.view.roundCorners(corners: [.topLeft, .topRight], radius: 10)
            }else if (indexPath.row == sectionObject.rowArray.count - 1) {
                cell?.view.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 10)
            }else{
                cell?.view.roundCorners(corners: [.topLeft, .topRight, .bottomLeft, .bottomRight], radius: 0)
            }
            
            if(UIDevice.current.userInterfaceIdiom == .pad){
                cell?.valueLabel.font = UIFont(name: "SFProDisplay-Medium", size: 18)
                cell?.titleLabel.font = UIFont(name: "SFProDisplay-Medium", size: 18)
            }else{
                cell?.valueLabel.font = UIFont(name: "SFProDisplay-Medium", size: 14)
                cell?.titleLabel.font = UIFont(name: "SFProDisplay-Medium", size: 14)
            }
            cell?.valueLabel.textColor = .gray
            cell?.rightArrowImageView.image = rowObj.mainImage
            return cell ?? UITableViewCell()
        case "ImageTableViewCell":
            let cell = self.infoTableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell", for: indexPath) as? ImageTableViewCell
            cell?.mainImage.image = rowObj.mainImage
            
            return cell ?? UITableViewCell()
        case "FireDepartmentTableViewCell":
            let cell = self.infoTableView.dequeueReusableCell(withIdentifier: "FireDepartmentTableViewCell", for: indexPath) as? FireDepartmentTableViewCell
            cell?.titleLabel.text = rowObj.title
            cell?.valueLabel.text = rowObj.value
            
            if(UIDevice.current.userInterfaceIdiom == .pad){
                cell?.titleLabel.font = UIFont(name: "SFProDisplay-Medium", size: 19)
                cell?.valueLabel.font = UIFont(name: "SFProDisplay-Medium", size: 18)
            }else{
                cell?.titleLabel.font = UIFont(name: "SFProDisplay-Medium", size: 15)
                cell?.valueLabel.font = UIFont(name: "SFProDisplay-Medium", size: 14)
            }
            cell?.valueLabel.textColor = .gray
            return cell ?? UITableViewCell()
        case "MainTitleTableViewCell":
            let cell = self.infoTableView.dequeueReusableCell(withIdentifier: "MainTitleTableViewCell", for: indexPath) as? MainTitleTableViewCell
            cell?.mainTitleLabel.text = rowObj.title
            cell?.cornerRadius = cornerradius
            if(indexPath.row == 0){
                cell?.view.roundCorners(corners: [.topLeft,.topRight], radius: 10)
            }
            if(UIDevice.current.userInterfaceIdiom == .pad){
                cell?.mainTitleLabel.font = UIFont(name: "SFProDisplay-Semibold", size: 20)
            }else{
                cell?.mainTitleLabel.font = UIFont(name: "SFProDisplay-Semibold", size: 16)
            }
            return cell ?? UITableViewCell()
        default:
            break
        }
        return UITableViewCell()
        
    }
    
}
extension InfoViewController: UITableViewDelegate {
    
    internal func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let object = self.viewModel.tableArray[section]
        if object.title.count > 0 {
            guard let cell = infoTableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell") as? HeaderTableViewCell else { return HeaderTableViewCell()}
            cell.headerTitleLabel.text = object.title
            cell.showListBtn.addTarget(self, action: #selector(tapSection(sender:)), for: .touchUpInside)
            cell.showListBtn.tag = section
            cell.editImage.image = object.image
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
            cell.editImage.addGestureRecognizer(tapGesture)
            if(UIDevice.current.userInterfaceIdiom == .pad){
                cell.headerTitleLabel.font = UIFont(name: "SFProDisplay-Semibold", size: 20)
            }else{
                cell.headerTitleLabel.font = UIFont(name: "SFProDisplay-Semibold", size: 16)
            }
            return cell.contentView
        }
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let object = self.viewModel.tableArray[section]
        if object.title.count > 0 {
            return UITableView.automaticDimension
        }
        return CGFloat.leastNonzeroMagnitude
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}



