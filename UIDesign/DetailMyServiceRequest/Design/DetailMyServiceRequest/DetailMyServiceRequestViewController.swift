//
//  DetailMyServiceRequestViewController.swift
//  UIDesign
//
//  Created by Pratiksha Jagtap on 11/10/23.
//

import UIKit
import GoogleMaps
class DetailMyServiceRequestViewController: UIViewController {
    @IBOutlet weak var mySRDetailTableView: UITableView!
    let viewModel = DetailMyServiceRequestViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.initArray()     //-Important
        mySRDetailTableView.delegate = self
        mySRDetailTableView.dataSource = self
        mySRDetailTableView.rowHeight = UITableView.automaticDimension
        mySRDetailTableView.estimatedRowHeight = UITableView.automaticDimension
        let uinibName = UINib(nibName: "TitleValueTableViewCell", bundle: nil)
        self.mySRDetailTableView.register(uinibName, forCellReuseIdentifier: "TitleValueTableViewCell")
        let uinibName1 = UINib(nibName: "MapTableViewCell", bundle: nil)
        self.mySRDetailTableView.register(uinibName1, forCellReuseIdentifier: "MapTableViewCell")
        let uinibName2 = UINib(nibName: "DescriptionTableViewCell", bundle: nil)
        self.mySRDetailTableView.register(uinibName2, forCellReuseIdentifier: "DescriptionTableViewCell")
        self.navigationItem.title = "My Service Requests Details"
        self.navigationController?.navigationBar.barTintColor = .white
        let attributes = [NSAttributedString.Key.foregroundColor:UIColor.white, NSAttributedString.Key.font:UIFont(name: "SFProDisplay-Semibold", size: 18)]
        self.navigationController?.navigationBar.titleTextAttributes = attributes as [NSAttributedString.Key : Any]
        self.mySRDetailTableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
}

extension DetailMyServiceRequestViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let object = viewModel.tableArray[indexPath.row]
        switch object.fieldType{
        case "TitleValueTableViewCell":
            let cell = self.mySRDetailTableView.dequeueReusableCell(withIdentifier: object.fieldType, for: indexPath) as? TitleValueTableViewCell
            cell?.titleLabel.text = object.title
            cell?.valueLabel.text = object.value
            cell?.titleLabel.font = UIFont(name: "SFProDisplay-Semibold", size: 16)
            cell?.valueLabel.font = UIFont(name: "SFProDisplay-Regular", size: 16)
            cell?.lineLabel.backgroundColor = .init(red: CGFloat(128/255), green: CGFloat(128/255), blue: CGFloat(128/255), alpha: 0.4)
            cell?.designView.layer.cornerRadius = 5
            cell?.designView.layer.borderColor = .init(red: CGFloat(128/255), green: CGFloat(128/255), blue: CGFloat(128/255), alpha: 0.4)
            cell?.designView.layer.borderWidth = 1
            return cell ?? UITableViewCell()
        case "MapTableViewCell":
            let cell = self.mySRDetailTableView.dequeueReusableCell(withIdentifier: object.fieldType, for: indexPath) as? MapTableViewCell
            let dataObject = viewModel.tableArray[indexPath.row]
            cell?.titleLabel.text = object.title
            cell?.titleLabel.font = UIFont(name: "SFProDisplay-Semibold", size: 16)
            cell?.lineLabel.backgroundColor = .init(red: CGFloat(128/255), green: CGFloat(128/255), blue: CGFloat(128/255), alpha: 0.4)
            cell?.designView.layer.cornerRadius = 5
            cell?.designView.layer.borderColor = .init(red: CGFloat(128/255), green: CGFloat(128/255), blue: CGFloat(128/255), alpha: 0.4)
            cell?.designView.layer.borderWidth = 1
            cell?.setDataForCell(srDetails: dataObject)
            return cell ?? UITableViewCell()
        case "DescriptionTableViewCell":
            let cell = self.mySRDetailTableView.dequeueReusableCell(withIdentifier: object.fieldType, for: indexPath) as? DescriptionTableViewCell
            cell?.discriptionLabel.text = object.title
            cell?.discriptionLabel.textColor = .red
            cell?.discriptionLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12)
            cell?.designView.layer.cornerRadius = 5
            cell?.designView.layer.borderColor = .init(red: CGFloat(128/255), green: CGFloat(128/255), blue: CGFloat(128/255), alpha: 0.4)
            cell?.designView.layer.borderWidth = 1
            return cell ?? UITableViewCell()
        default:
            break
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

