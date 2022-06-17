//
//  ViewController.swift
//  SummaryScreen
//
//  Created by Nitin Bhatia on 06/06/22.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collView: UICollectionView!
    var isFirstTime :  Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        collView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        isFirstTime = true
    }


    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .red
        let border = CALayer()
            
            let borderWidth: CGFloat = 1
            
            // Set the color your want
            border.backgroundColor = UIColor.white.cgColor
            
            // Create a rect only on the right of the view
        border.frame = CGRect(x: cell.bounds.maxX - borderWidth,
                                  y: 0,
                                  width: borderWidth,
                              height: cell.bounds.maxY)
            
        cell.layer.addSublayer(border)
        return cell
    }
    
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 107, height: collectionView.frame.height)
    }
}

