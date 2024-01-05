//
//  PhotosTableViewCell.swift
//  UIDesign
//
//  Created by Pratiksha Jagtap on 03/11/23.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    var selectedImages = [Image]()
    // var cartVC:UIViewController?
    @IBOutlet weak var photosCollectionView: UICollectionView!
    let viewModel = InstaViewModel()
    override func awakeFromNib() {
        super.awakeFromNib()
        viewModel.initArray()
        photosCollectionView.dataSource = self
        photosCollectionView.delegate = self
        let uinibName6 = UINib(nibName: "ImageCollectionViewCell", bundle: nil)
        self.photosCollectionView.register(uinibName6, forCellWithReuseIdentifier: "ImageCollectionViewCell")
        photosCollectionView.reloadData()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    //    func setcollectionImage(images: [Image]){
    //        selectedImages = images
    //        photosCollectionView.reloadData()
    //    }
}
extension PhotosTableViewCell: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let object = selectedImages[indexPath.section]
        let cell = self.photosCollectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as? ImageCollectionViewCell
        cell?.imageView.image = UIImage(named: object.image)
        return cell ?? UICollectionViewCell()
    }
    
}

extension PhotosTableViewCell :UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}






                       
                       
                       
                       
                       
                       
                       
                       
                       
                       
                       
                       
                       
                       
                       
   
