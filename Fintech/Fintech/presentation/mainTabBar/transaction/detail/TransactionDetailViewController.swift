//
//  TransactionDetailViewController.swift
//  Fintech
//
//  Created by Ta Noah on 14/12/2021.
//

import UIKit

class TransactionDetailViewController: UIViewController {

    @IBOutlet weak var viewContent: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewContent.roundCorners(corners: [.topRight,.topLeft], radius: 30)

    }

    @IBAction func backTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func goHomeTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MainTabBarViewController") as! MainTabBarViewController
        self.navigationController?.pushViewController(vc,animated: true)
    }
}
