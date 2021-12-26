//
//  Ext.swift
//  Fintech
//
//  Created by Ta Noah on 09/12/2021.
//

import Foundation
import UIKit

func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
    let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
    let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
    let blue = CGFloat(rgbValue & 0xFF)/256.0

    return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
}

func convertIntToCurrency(amount: Int, symbol: String = "") -> String{
    let numberFormatter = NumberFormatter()
    numberFormatter.currencySymbol = symbol
    numberFormatter.numberStyle = .currency
    numberFormatter.locale = Locale.current
    numberFormatter.positiveFormat = "#,##0 ¤"
    return numberFormatter.string(from: NSNumber(value: amount))!
}

func formatCurrency(numberString: String) -> String{
    let numberFormatter = NumberFormatter()
    numberFormatter.currencySymbol = ""
    numberFormatter.numberStyle = .currency
    numberFormatter.locale = Locale.current
    numberFormatter.positiveFormat = "#,##0 ¤"
    return numberFormatter.string(from: NSNumber(value: (NSString(string: numberString).doubleValue)))!
}


extension UIView {

    func addTapGesture(action : @escaping ()->Void ){
        let tap = MyTapGestureRecognizer(target: self , action: #selector(self.handleTap(_:)))
        tap.action = action
        tap.numberOfTapsRequired = 1

        self.addGestureRecognizer(tap)
        self.isUserInteractionEnabled = true

    }
    @objc func handleTap(_ sender: MyTapGestureRecognizer) {
        sender.action!()
    }
}

class MyTapGestureRecognizer: UITapGestureRecognizer {
    var action : (()->Void)? = nil
}

extension UIViewController {
    
    func showToast(message : String) {
        
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
         alert.view.backgroundColor = .black
         alert.view.alpha = 0.5
         alert.view.layer.cornerRadius = 15
         self.present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
             alert.dismiss(animated: true)
         }
    }
}

extension NSAttributedString {

    convenience init(htmlString html: String, font: UIFont? = nil, useDocumentFontSize: Bool = true) throws {
        let options: [NSAttributedString.DocumentReadingOptionKey : Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]

        let data = html.data(using: .utf8, allowLossyConversion: true)
        guard (data != nil), let fontFamily = font?.familyName, let attr = try? NSMutableAttributedString(data: data!, options: options, documentAttributes: nil) else {
            try self.init(data: data ?? Data(html.utf8), options: options, documentAttributes: nil)
            return
        }

        let fontSize: CGFloat? = useDocumentFontSize ? nil : font!.pointSize
        let range = NSRange(location: 0, length: attr.length)
        attr.enumerateAttribute(.font, in: range, options: .longestEffectiveRangeNotRequired) { attrib, range, _ in
            if let htmlFont = attrib as? UIFont {
                let traits = htmlFont.fontDescriptor.symbolicTraits
                var descrip = htmlFont.fontDescriptor.withFamily(fontFamily)

                if (traits.rawValue & UIFontDescriptor.SymbolicTraits.traitBold.rawValue) != 0 {
                    descrip = descrip.withSymbolicTraits(.traitBold)!
                }

                if (traits.rawValue & UIFontDescriptor.SymbolicTraits.traitItalic.rawValue) != 0 {
                    descrip = descrip.withSymbolicTraits(.traitItalic)!
                }

                attr.addAttribute(.font, value: UIFont(descriptor: descrip, size: fontSize ?? htmlFont.pointSize), range: range)
            }
        }

        self.init(attributedString: attr)
    }
}

extension UIView
{
    func roundCorners(corners:UIRectCorner, radius: CGFloat)
    {
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
        self.layer.mask = maskLayer
    }
}

