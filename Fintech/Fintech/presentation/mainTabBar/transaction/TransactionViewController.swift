//
//  TransactionViewController.swift
//  Fintech
//
//  Created by Ta Noah on 14/12/2021.
//

import UIKit

class TransactionViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var transactionTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initTableView()
    }
    
    func initTableView(){
        let nib = UINib(nibName: "TransactionTableViewCell", bundle: nil)

        transactionTableView.register(nib, forCellReuseIdentifier: "TransactionTableViewCell")
        transactionTableView.delegate = self
        transactionTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionTableViewCell", for: indexPath) as! TransactionTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TransactionDetailViewController") as! TransactionDetailViewController
        self.navigationController?.pushViewController(vc,animated: true)
    }
}
