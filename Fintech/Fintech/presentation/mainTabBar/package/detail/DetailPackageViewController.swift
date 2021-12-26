//
//  DetailPackageViewController.swift
//  Fintech
//
//  Created by Ta Noah on 15/12/2021.
//

import UIKit

class DetailPackageViewController: UIViewController , UITextFieldDelegate,  UICollectionViewDataSource, UICollectionViewDelegate , UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var interestRateTableView: UITableView!
    
    @IBOutlet weak var moneyTextField: UITextField!

    @IBOutlet weak var suggestMoneyCollectionView: UICollectionView!
    
    var currentString = ""
    var moneyList = [Int] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moneyTextField.delegate = self
        initCollectionView()
        initTableView()
        initData()
  
    }
    
    @IBAction func paymentTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PayMoneyViewController") as! PayMoneyViewController
        self.navigationController?.pushViewController(vc,animated: true)
    }
    
    func initData(){
        moneyTextField.text = formatCurrency(numberString: "50000")
        getListNumber(numberCurrent: "50000")
        suggestMoneyCollectionView.reloadData()
    }
    
    @IBAction func backTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    func initCollectionView(){
        let nib = UINib(nibName: "SuggestMoneyCollectionViewCell", bundle: nil)
        suggestMoneyCollectionView.register(nib, forCellWithReuseIdentifier: "SuggestMoneyCollectionViewCell")
        
        suggestMoneyCollectionView.dataSource = self
        suggestMoneyCollectionView.delegate = self
    }
    
    func initTableView(){
        let nib = UINib(nibName: "InterestRateTableViewCell", bundle: nil)

        interestRateTableView.register(nib, forCellReuseIdentifier: "InterestRateTableViewCell")
        interestRateTableView.dataSource = self
        interestRateTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InterestRateTableViewCell", for: indexPath) as! InterestRateTableViewCell
        cell.selectionStyle = .none
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.moneyList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SuggestMoneyCollectionViewCell", for: indexPath) as! SuggestMoneyCollectionViewCell
        cell.setup(money: moneyList[indexPath.row], position: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        moneyTextField.text = formatCurrency(numberString: "\(moneyList[indexPath.row])")
        suggestMoneyCollectionView.isHidden = true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        suggestMoneyCollectionView.isHidden = false
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        moneyTextField.resignFirstResponder()
        var inte: Int = Int(textField.text!) ?? 0
        if inte < 50000 && inte > 9999999999 {
            return false
        }
        else {
            return true
        }
    }

    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool { // return NO to not change text
        guard let textFieldText = textField.text,
             let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                 return false
         }
         let substringToReplace = textFieldText[rangeOfTextToReplace]
         let count = textFieldText.count - substringToReplace.count + string.count
      
         switch string {
         case "0","1","2","3","4","5","6","7","8","9":
             currentString += string
             if count < 12 {
                 moneyTextField.text = formatCurrency(numberString: currentString)
                 getListNumber(numberCurrent: currentString)
             }
         default:
             var array = Array(string)
             var currentStringArray = Array(currentString)
             if array.count == 0 && currentStringArray.count != 0 {
                 currentStringArray.removeLast()
                 currentString = ""
                 for character in currentStringArray {
                     currentString += String(character)
                 }
                 if count < 12 {
                     moneyTextField.text = formatCurrency(numberString: currentString)
                     getListNumber(numberCurrent: currentString)
                 }
             }
             
         }
         return false
     }

    func getListNumber(numberCurrent: String){
        var firstNumber = Int(numberCurrent) ?? 0
        var secondNumber = Int(numberCurrent) ?? 0
        var threeNumber = Int(numberCurrent) ?? 0
        firstNumber *= 2
        secondNumber *= 10
        threeNumber *= 100
        
        moneyList.removeAll()
        moneyList.append(firstNumber)
        moneyList.append(secondNumber)
        moneyList.append(threeNumber)
        suggestMoneyCollectionView.reloadData()
    }

}
