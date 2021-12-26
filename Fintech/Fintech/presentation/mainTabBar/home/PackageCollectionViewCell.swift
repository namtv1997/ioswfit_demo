//
//  PackageCollectionViewCell.swift
//  Fintech
//
//  Created by Ta Noah on 14/12/2021.
//

import UIKit

class PackageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imagePackage: UIImageView!
    @IBOutlet weak var viewNew: UIView!
    
    @IBOutlet weak var lblMore: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imagePackage.roundCorners(corners: [.topRight,.topLeft], radius: 10)
        viewNew.roundCorners(corners: [.bottomLeft,.topRight], radius: 10)
}
}

