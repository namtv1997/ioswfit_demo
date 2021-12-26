//
//  MainTabBarViewController.swift
//  Fintech
//
//  Created by Ta Noah on 13/12/2021.
//

import UIKit

class MainTabBarViewController: UIViewController {

    @IBOutlet weak var viewMail: UIView!
    @IBOutlet weak var viewHome: UIView!
    @IBOutlet weak var viewNewFeed: UIView!
    @IBOutlet weak var viewAdd: UIView!
    @IBOutlet weak var viewProfile: UIView!
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var btnEmail: UIButton!
    @IBOutlet weak var btnHome: UIButton!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var btnNewFeed: UIButton!
    @IBOutlet weak var btnProfile: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showHomeVC()
    }
    
    @IBAction func onclickTabbar(_ sender: Any) {
        let tag = (sender as AnyObject).tag
        switch tag {
        case 0:
            showHomeVC()
            break
        case 1:
            showTransactionVC()
            break
        case 2:
            showPackageVC()
            break
        case 3:
            changeBackGround(viewNewFeed, viewHome, viewMail, viewAdd, viewProfile, btnNewFeed, btnHome, btnEmail, btnAdd, btnProfile)
            break
        case 4:
            changeBackGround(viewProfile, viewHome, viewMail, viewAdd, viewNewFeed, btnProfile, btnHome, btnEmail, btnAdd, btnNewFeed)
            break
    
        default:
            showHomeVC()
            break
            
        }
    }
    
    func showHomeVC(){
        guard let home = self.storyboard?.instantiateViewController(identifier: "HomeViewController") as? HomeViewController else { return}
        addChild(home)
        contentView.addSubview(home.view)
        home.view.frame = contentView.bounds
        home.didMove(toParent: self)
        changeBackGround(viewHome, viewMail, viewAdd, viewNewFeed, viewProfile, btnHome, btnEmail, btnAdd, btnNewFeed, btnProfile)
    }
    
    func showPackageVC(){
        guard let package = self.storyboard?.instantiateViewController(identifier: "PackageViewController") as? PackageViewController else { return}
        addChild(package)
        contentView.addSubview(package.view)
        package.view.frame = contentView.bounds
        package.didMove(toParent: self)
        changeBackGround(viewAdd, viewHome, viewMail, viewNewFeed, viewProfile, btnAdd, btnHome, btnEmail, btnNewFeed, btnProfile)
    }
    
    func showTransactionVC(){
        guard let transaction = self.storyboard?.instantiateViewController(identifier: "TransactionViewController") as? TransactionViewController else { return}
        addChild(transaction)
        contentView.addSubview(transaction.view)
        transaction.view.frame = contentView.bounds
        transaction.didMove(toParent: self)
        changeBackGround(viewMail, viewHome, viewAdd,viewNewFeed, viewProfile, btnEmail, btnHome, btnAdd, btnNewFeed, btnProfile)
    }
    
    func changeBackGround (_ view: UIView, _ view1: UIView,_ view2: UIView,_ view3: UIView,_ view4: UIView,
                           _ button: UIButton,_ button1: UIButton,_ button2: UIButton,_ button3: UIButton,
                           _ button4: UIButton){
        view.backgroundColor = UIColorFromHex(rgbValue: 0xFEF3DE)
        view1.backgroundColor = UIColorFromHex(rgbValue: 0xFFFFFF)
        view2.backgroundColor = UIColorFromHex(rgbValue: 0xFFFFFF)
        view3.backgroundColor = UIColorFromHex(rgbValue: 0xFFFFFF)
        view4.backgroundColor = UIColorFromHex(rgbValue: 0xFFFFFF)
        button.imageView?.tintColor =  UIColorFromHex(rgbValue: 0xF5B04C)
        button1.imageView?.tintColor =  UIColorFromHex(rgbValue: 0xADADAD)
        button2.imageView?.tintColor =  UIColorFromHex(rgbValue: 0xADADAD)
        button3.imageView?.tintColor =  UIColorFromHex(rgbValue: 0xADADAD)
        button4.imageView?.tintColor =  UIColorFromHex(rgbValue: 0xADADAD)
    }
    
}

 
