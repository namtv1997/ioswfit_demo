//
//  HomeViewController.swift
//  Fintech
//
//  Created by Ta Noah on 13/12/2021.
//

import UIKit

class HomeViewController: UIViewController , UICollectionViewDataSource, UICollectionViewDelegate{

    @IBOutlet weak var packageCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initCollectionView()
    }
    
    func initCollectionView(){
        let nib = UINib(nibName: "PackageCollectionViewCell", bundle: nil)
        packageCollectionView.register(nib, forCellWithReuseIdentifier: "PackageCollectionViewCell")
        
        packageCollectionView.dataSource = self
        packageCollectionView.delegate = self
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PackageCollectionViewCell", for: indexPath) as! PackageCollectionViewCell
        cell.lblMore.addTapGesture {
            print("uuu--->\(indexPath.row)")
        }
        return cell
        
 
    }
    
    
}
