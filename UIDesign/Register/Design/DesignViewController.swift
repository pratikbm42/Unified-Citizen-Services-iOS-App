//
//  DesignViewController.swift
//  UIDesign
//
//  Created by Pratiksha Jagtap on 26/09/23.
//

import UIKit

class DesignViewController: UIViewController {
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view6: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var imageView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        setUI()
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
            swipeRight.direction = .right
            self.view.addGestureRecognizer(swipeRight)
            }
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        self.navigationController?.popViewController(animated: true)
        }
   
    func setUI(){
        view1.layer.cornerRadius = 10
        view1.layer.borderWidth = 1
        view1.layer.borderColor = UIColor.white.cgColor
        view2.layer.cornerRadius = 10
        view2.layer.borderWidth = 1
        view2.layer.borderColor = UIColor.white.cgColor
        view3.layer.cornerRadius = 10
        view3.layer.borderWidth = 1
        view3.layer.borderColor = UIColor.white.cgColor
        view4.layer.cornerRadius = 10
        view4.layer.borderWidth = 1
        view4.layer.borderColor = UIColor.white.cgColor
        view5.layer.cornerRadius = 10
        view5.layer.borderWidth = 1
        view5.layer.borderColor = UIColor.white.cgColor
        view6.layer.cornerRadius = 10
        view6.layer.borderWidth = 1
        view6.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = imageView.frame.size.width/2
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
