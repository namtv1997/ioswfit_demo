//
//  SuggestMoneyCollectionViewCell.swift
//  Fintech
//
//  Created by Ta Noah on 15/12/2021.
//

import UIKit

class SuggestMoneyCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblMoney: UILabel!
    @IBOutlet weak var viewBackground: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
  
    }
    
    func setup(money: Int, position: Int){
        if position == 0 {
            viewBackground.backgroundColor = UIColorFromHex(rgbValue: 0xFEF3DE)
        }else if position == 1 {
            viewBackground.backgroundColor = UIColorFromHex(rgbValue: 0xE2E9FE)
        }else {
            viewBackground.backgroundColor = UIColorFromHex(rgbValue: 0xE9FFDF)
        }
        lblMoney.text = "\(convertIntToCurrency(amount: money)) vnđ"
    }

}
