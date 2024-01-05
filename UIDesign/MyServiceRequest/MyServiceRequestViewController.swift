//
//  MyServiceRequestViewController.swift
//  UIDesign
//
//  Created by Pratiksha Jagtap on 06/10/23.
//

import UIKit

class MyServiceRequestViewController: UIViewController{
    
    
    @IBOutlet weak var mySRTableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var searchBar: UISearchBar!
    let searchController = UISearchController(searchResultsController: nil)
    let viewModel = MyServiceRequestViewModel()
    var searchData = [MySRequestCell]()
    override func viewDidLoad() {
        super.viewDidLoad()
        mySRtableView()
        self.viewModel.initArray()
        configureNavigation()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.frame = CGRect(x: 0, y: 0, width: 656, height: 76)
        //navigationItem.searchController = searchController
        searchBar.delegate = self
        self.searchData = self.viewModel.tableArray
        segmentedControl.tintColor = .white
        self.mySRTableView.reloadData()
        // Do any additional setup after loading the view.
    }
    @IBAction func segmentCntrol(_ sender: Any) {
        
    }
    
    func mySRtableView(){
        mySRTableView.delegate = self
        mySRTableView.dataSource = self
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        mySRTableView.rowHeight = UITableView.automaticDimension
        mySRTableView.estimatedRowHeight = UITableView.automaticDimension
    }
    func configureNavigation()  {
        self.navigationItem.title = "My Service Requests"
        self.navigationController?.navigationBar.barTintColor = .white
        let attributes = [NSAttributedString.Key.foregroundColor:UIColor.white, NSAttributedString.Key.font:UIFont(name: "SFProDisplay-Semibold", size: 18)]
        self.navigationController?.navigationBar.titleTextAttributes = attributes as [NSAttributedString.Key : Any]
    }
    
}
extension MyServiceRequestViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // let object = viewModel.tableArray[indexPath.row]
        let object = searchData[indexPath.row]
        let cell = self.mySRTableView.dequeueReusableCell(withIdentifier: object.fieldType, for: indexPath) as? MyServiceRequestTableViewCell
        cell?.adressLabel.text = object.address
        cell?.srValueLabel.text = object.srValue
        cell?.sumittedValueLabel.text = object.sumittedDate
        cell?.modiffiedValueLabel.text = object.modifiedDate
        cell?.srTypeValueLabel.text = object.srType
        cell?.statusValueLabel.text = object.status
        cell?.addImage.image = object.image
        cell?.adressLabel.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        cell?.srLabel.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        cell?.modifiedLabel.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        cell?.srTypeLabel.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        cell?.statusLabel.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        cell?.sumittedLabel.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        cell?.srValueLabel.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        cell?.sumittedValueLabel.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        cell?.modiffiedValueLabel.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        cell?.srTypeValueLabel.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        cell?.statusValueLabel.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        cell?.addImage.layer.cornerRadius = 5
        cell?.cellView.layer.borderColor = .init(red: CGFloat(230/255), green: CGFloat(230/255), blue: CGFloat(230/255), alpha: 0.1)
        cell?.cellView.layer.borderWidth = 1
        
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.delegates?.detailSRScreen()
        
        
    }
    
}

extension MyServiceRequestViewController:UISearchResultsUpdating,UISearchBarDelegate{
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else{return}
        if searchText == ""{
            self.searchData = self.viewModel.tableArray
        }
        else{

            searchData = viewModel.tableArray.filter({
                return $0.address.contains(searchText) || $0.srType.contains(searchText) || $0.srValue.contains(searchText)
                })
        }
        self.mySRTableView.reloadData()
    }
}

    

