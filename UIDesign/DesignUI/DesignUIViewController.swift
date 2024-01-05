//
//  DesignUIViewController.swift
//  UIDesign
//
//  Created by Pratik Morge on 03/10/23.
//

import UIKit

class DesignUIViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var designUIView: UIView!
    let viewModel = DesignUIViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        self.viewModel.initArray()
        registerXib()
        swipe()
        self.collectionView.reloadData()
        // Do any additional setup after loading the view.
    }
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        self.navigationController?.popViewController(animated: true)
    }
    func registerXib(){
        collectionView.delegate = self
        collectionView.dataSource = self
        let uinibName = UINib(nibName: "DesignUICollectionViewCell", bundle: nil)
        self.collectionView.register(uinibName, forCellWithReuseIdentifier: "DesignUICollectionViewCell")
    }
    func swipe(){
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
    }
}
extension DesignUIViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.tableArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let object = viewModel.tableArray[indexPath.row]
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: object.fieldType, for: indexPath) as? DesignUICollectionViewCell
        cell?.colorView.backgroundColor =  object.color
        
        if object.tag == 1 || object.tag == 2 {
            cell?.titleLabel1.text = object.title
            cell?.titleLabel.isHidden = true
            cell?.titleLabel1.isHidden = false
            cell?.image1.image = object.image
            cell?.image.isHidden = true
            cell?.image1.isHidden = false
        }else{
            cell?.titleLabel.text = object.title
            cell?.titleLabel.numberOfLines = 0
            cell?.titleLabel1.isHidden = true
            cell?.titleLabel.isHidden = false
            cell?.image.image = object.image
            cell?.image.isHidden = false
            cell?.image1.isHidden = true
        }
        cell?.backgroundImage.image = object.backgroundImage
        cell?.titleLabel.tag = object.tag
        cell?.titleLabel1.tag = object.tag
        return cell ?? UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let object = viewModel.tableArray[indexPath.row]
        switch object.tag{
        case 1:
            self.viewModel.delegates?.infoScreen()
        case 2:
            self.viewModel.delegates?.mySRScreen()
        default:
            break
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let object = viewModel.tableArray[indexPath.row]
        if object.tag == 1 || object.tag == 2 {
            return CGSize(width: designUIView.frame.width, height: designUIView.frame.height/5.25)
        }else{
            return CGSize(width:designUIView.frame.width/2 - 3.2, height: designUIView.frame.height/5.25)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4.8
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4.8
    }
    
}

