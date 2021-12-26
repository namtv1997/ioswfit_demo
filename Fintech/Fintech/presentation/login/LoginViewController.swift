//
//  LoginViewController.swift
//  Fintech
//
//  Created by Ta Noah on 09/12/2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var passWordTextField: UITextField!
    
    @IBOutlet weak var ivPassWord: UIImageView!
    
    @IBOutlet weak var lblForgotPass: UILabel!
    @IBOutlet weak var lblRegister: UILabel!
    
    var isShowPass = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ivPassWord.addTapGesture {
            if(self.isShowPass == true) {
                self.passWordTextField.isSecureTextEntry = true
                self.ivPassWord.image = UIImage(named: "ic_hide")
            } else {
                self.passWordTextField.isSecureTextEntry = false
                self.ivPassWord.image = UIImage(named: "ic_show")
            }
            self.isShowPass = !self.isShowPass
        }
        
        lblForgotPass.addTapGesture {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "ForgotPassWordViewController") as! ForgotPassWordViewController
            self.navigationController?.pushViewController(vc,animated: true)
        }
    }
    

    @IBAction func loginTaped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MainTabBarViewController") as! MainTabBarViewController
        self.navigationController?.pushViewController(vc,animated: true)
    }
    
}
