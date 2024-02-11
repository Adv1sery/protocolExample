//
//  protocolExample.swift
//  protocolExample
//
//  Created by Abdylda Mamashev on 11/2/24.
//

//
//  protocolExample.swift
//  protocolExample
//
//  Created by Abdylda Mamashev on 11/2/24.
//

import UIKit

protocol ValidateProtocol {
    
    func validateText(_ amount: String?) -> Bool
    
    func updateTransferButtonState(cardNumber: String?, enteredMoney: String?, transferButton: UIButton) -> Bool
    
    func transferButtonTapped(amountText: String?, cardNumber: String?, transferButton: UIButton, navigationController: UINavigationController?) -> Bool
}

extension ValidateProtocol {
    
    func validateText(_ amount: String?) -> Bool {
        guard let cardNumber = amount else {
            return false
        }
        let strippedCardNumber = cardNumber.replacingOccurrences(of: " ", with: "")
        
        guard strippedCardNumber.count == 16 else {
            return false
        }
        
        guard strippedCardNumber.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil else {
            return false
        }
        
        return true
    }
    
    func updateTransferButtonState(cardNumber: String?, enteredMoney: String?, transferButton: UIButton) -> Bool {
           let isCardNumberValid = self.validateText(cardNumber)
           let isMoneyValid = enteredMoney?.count ?? 0 >= 2
           let isEnabled = isCardNumberValid && isMoneyValid
           
           transferButton.isEnabled = isEnabled
           transferButton.backgroundColor = isEnabled ? .systemBlue : .systemGray3
           
           return isEnabled
       }
       
       func transferButtonTapped(amountText: String?, cardNumber: String?, transferButton: UIButton, navigationController: UINavigationController?) -> Bool {
           guard let amountText = amountText,
                 let moneyValue = Int(amountText),
                 amountText.count >= 2 else {
               transferButton.isEnabled = true
               transferButton.backgroundColor = .systemGray2
               return true
           }
           
           let isCardNumberValid = self.validateText(cardNumber)
           
           if isCardNumberValid && moneyValue <= ViewController.balance {
               transferButton.isEnabled = true
               transferButton.backgroundColor = .systemBlue
               
               let vc = LastViewController()
               navigationController?.pushViewController(vc, animated: true)
               return true
           } else {
               transferButton.isEnabled = false
               transferButton.backgroundColor = .systemGray3
               return false
           }
       }
   }
