//
//  PaymentBottomSheetViewController.swift
//  Fintech
//
//  Created by Ta Noah on 16/12/2021.
//

import UIKit

class PaymentBottomSheetViewController: UIViewController , UITableViewDataSource, UITableViewDelegate , UITextFieldDelegate  {

    @IBOutlet weak var bankTableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    
    var delegate: SelectBankClick?
    var bankName: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
        
        dummyData()
        initTableView()
    }
    
    func initTableView(){
        let nib = UINib(nibName: "BankTableViewCell", bundle: nil)

        bankTableView.register(nib, forCellReuseIdentifier: "BankTableViewCell")
        bankTableView.delegate = self
        bankTableView.dataSource = self
    }
    
    func dummyData(){
        bankName = [String] ()
        bankName?.append("VietCombank")
        bankName?.append("BIDV")
        bankName?.append("TechCombank")
        bankName?.append("VietTinbank")
        bankName?.append("TPbank")
        bankName?.append("Oceanbank")
        bankName?.append("VPbank")
        bankName?.append("Mbbank")
        bankName?.append("ACBbank")
        bankName?.append("SHBbank")
    }

    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{

        let searchText  = textField.text! + string

        if searchText.count >= 1 {

            bankName = bankName?.filter({ (result) -> Bool in
                return result.range(of: searchText, options: .caseInsensitive) != nil
            })

            bankTableView.reloadData()
        }
        if string == ""{
            bankName = []
            bankTableView.reloadData()
        }
        

        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.resignFirstResponder()
        return true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.bankName?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BankTableViewCell", for: indexPath) as! BankTableViewCell
//        cell.viewBackground.backgroundColor = UIColorFromHex(rgbValue: 0xFEF3DE)
//        cell.selectedBackgroundView = cell.viewBackground
        cell.setUp(name: bankName?[indexPath.row] ?? "")

        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        delegate?.selectItem(bankName: bankName?[indexPath.row] ?? "")
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }

}

protocol SelectBankClick {
    func selectItem(bankName : String)
    
}
