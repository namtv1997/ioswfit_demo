//
//  OtpViewController.swift
//  Fintech
//
//  Created by Ta Noah on 09/12/2021.
//

import UIKit

class OtpViewController: UIViewController {

    @IBOutlet weak var otpStackView: OTPStackView!
    
    @IBOutlet weak var lblTimer: UILabel!
    @IBOutlet weak var lblError: UILabel!
    @IBOutlet weak var lblSendCodeAgain: UILabel!
    
    var timer: Timer!
    var totalSecond = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        otpStackView.delegate = self
        setupTimer()
    }
    
    func setupTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(UpdateTime), userInfo: nil, repeats: true)
    }
    
    @objc func UpdateTime() {
        
        totalSecond -= 1
          
        if totalSecond >= 0{
            lblTimer.text = "Gửi lại mã OTP sau \(totalSecond)s"
        }else{
            timer.invalidate()
            lblTimer.isHidden = true
            lblSendCodeAgain.isHidden = false
        }
      
          
      }
    
    @IBAction func backTaped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}

extension OtpViewController: OTPDelegate {
    
    func didChangeValidity(isValid: Bool) {
    }
    
}
