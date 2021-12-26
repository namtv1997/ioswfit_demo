//
//  PayMoneyViewController.swift
//  Fintech
//
//  Created by Ta Noah on 16/12/2021.
//

import UIKit

class PayMoneyViewController: UIViewController, SelectBankClick{
    
    @IBOutlet weak var lblBankName: UILabel!
    @IBOutlet weak var ivArrowDown: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ivArrowDown.addTapGesture {
            
            let openNewVC = self.storyboard?.instantiateViewController(withIdentifier: "PaymentBottomSheetViewController") as! PaymentBottomSheetViewController
            
            openNewVC.delegate = self
            openNewVC.modalPresentationStyle = UIModalPresentationStyle.pageSheet
                          if let sheetPresentationController = openNewVC.presentationController as? UISheetPresentationController {
                              sheetPresentationController.preferredCornerRadius = 30
                    
                              // Let's have the grabber always visible
                             // sheetPresentationController.prefersGrabberVisible = true
                              // Define which heights are allowed for our sheet
                              sheetPresentationController.detents = [
                                  UISheetPresentationController.Detent.medium(),
                                  UISheetPresentationController.Detent.large()
                              ]
                          }
            self.present(openNewVC, animated: true, completion: nil)
        }
    }
    
    func selectItem(bankName: String) {
        lblBankName.text = bankName
    }
    
    @IBAction func backTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}
