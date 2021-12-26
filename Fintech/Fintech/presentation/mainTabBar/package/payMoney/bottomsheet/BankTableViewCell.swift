//
//  BankTableViewCell.swift
//  Fintech
//
//  Created by Ta Noah on 17/12/2021.
//

import UIKit

class BankTableViewCell: UITableViewCell {

    @IBOutlet weak var lblBankName: UILabel!
    
    @IBOutlet weak var viewBackground: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUp(name: String){
        lblBankName.text = name
    }

    
}
