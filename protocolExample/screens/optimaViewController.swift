//
//  MbankViewController.swift
//  protocolExample
//
//  Created by Abdylda Mamashev on 8/2/24.
//

import UIKit

class optimaViewController: UIViewController, ValidateProtocol {
    
   
    
    
    private lazy var topView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray3
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var sendMoneyView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray3
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var sendSummView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray3
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var warrantView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray3
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var translateView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray3
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
//    private lazy var translateButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.backgroundColor = .clear
//        button.addTarget(self, action: #selector(transferButtonTapped), for: .touchUpInside)
//        button.layer.cornerRadius = 10
//        button.setTitle("Translate", for: .normal)
//        button.setTitleColor(.black, for: .normal)
//        button.contentMode = .center
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
//
    private lazy var translateButton: UIButton = {
            let but = UIButton(type: .system)
            but.setTitle("Translate", for: .normal)
            but.tintColor = .white
            but.backgroundColor = .systemGray3
            but.layer.cornerRadius = 16
            but.titleLabel?.textAlignment = .center
            but.translatesAutoresizingMaskIntoConstraints = false
            return but
        }()
    
    
    private lazy var walletImage: UIImageView = {
        let image = UIImageView()
        let systemeImageName = "heart.fill"
        image.image = UIImage(systemName: systemeImageName)
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var cardImage: UIImageView = {
        let image = UIImageView()
        let systemeImageName = "heart.fill"
        image.image = UIImage(systemName: systemeImageName)
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var vosklImage: UIImageView = {
        let image = UIImageView()
        let systemeImageName = "heart.fill"
        image.image = UIImage(systemName: systemeImageName)
        image.contentMode = .scaleAspectFit
        image.frame.size = CGSize(width: 50, height: 50)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var balanceLabel1 = {
        let label = UILabel()
        label.text = "996*********"
        label.textColor = .black
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var balanceLabel2 = {
        let label = UILabel()
        label.text = "на Балансе: $5, 555"
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var cardTF = {
        let TxtF = UITextField()
        TxtF.placeholder = "4577**** enter a card number"
        TxtF.layer.borderWidth = 0
        TxtF.textColor = .black
        TxtF.attributedPlaceholder = NSAttributedString(string: "4577**** enter a card number", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        TxtF.translatesAutoresizingMaskIntoConstraints = false
        return TxtF
    }()
    
    private lazy var commissionLabel = {
        let label = UILabel()
        label.text = "Commission 0,00$"
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var summTF = {
        let label = UITextField()
        label.placeholder = "0 $"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var warningLabel = {
        let label = UILabel()
        label.text = "if the card owner is incorrectly indicated, \n the issuing bank may refuse the transfer"
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.darkGray.cgColor, UIColor.black.cgColor] // Указываем цвета градиента
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0) // Начало градиента
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0) // Конец градиента
        
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        view.addSubview(topView)
        view.addSubview(sendMoneyView)
        view.addSubview(sendSummView)
        view.addSubview(warrantView)
        view.addSubview(translateView)
        translateView.addSubview(translateButton)
        view.addSubview(vosklImage)
        view.addSubview(cardImage)
        view.addSubview(walletImage)
        view.addSubview(balanceLabel1)
        view.addSubview(balanceLabel2)
        view.addSubview(cardTF)
        view.addSubview(commissionLabel)
        view.addSubview(summTF)
        view.addSubview(warningLabel)
        
        
        NSLayoutConstraint.activate([
            
            topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            topView.heightAnchor.constraint(equalToConstant: 50),
            
            sendMoneyView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 15),
            sendMoneyView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            sendMoneyView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            sendMoneyView.heightAnchor.constraint(equalToConstant: 50),
            
            sendSummView.topAnchor.constraint(equalTo: sendMoneyView.bottomAnchor, constant: 25),
            sendSummView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            sendSummView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            sendSummView.heightAnchor.constraint(equalToConstant: 120),
            
            warrantView.topAnchor.constraint(equalTo: sendSummView.bottomAnchor, constant: 15),
            warrantView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            warrantView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            warrantView.heightAnchor.constraint(equalToConstant: 120),
            
            translateView.topAnchor.constraint(equalTo: warrantView.bottomAnchor, constant: 20),
            translateView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            translateView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            translateView.heightAnchor.constraint(equalToConstant: 50),
            
            translateButton.topAnchor.constraint(equalTo: translateView.topAnchor, constant: 5),
            translateButton.centerXAnchor.constraint(equalTo: translateView.centerXAnchor),
            translateButton.widthAnchor.constraint(equalToConstant: 200),
            translateButton.heightAnchor.constraint(equalToConstant: 40),
            
            vosklImage.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            vosklImage.topAnchor.constraint(equalTo: topView.topAnchor, constant: 16),
            vosklImage.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 16),
            vosklImage.heightAnchor.constraint(equalToConstant: 30),
            vosklImage.widthAnchor.constraint(equalToConstant: 30),
            
            walletImage.centerYAnchor.constraint(equalTo: warrantView.centerYAnchor),
            walletImage.topAnchor.constraint(equalTo: warrantView.topAnchor, constant: 16),
            walletImage.leadingAnchor.constraint(equalTo: warrantView.leadingAnchor, constant: 16),
            walletImage.heightAnchor.constraint(equalToConstant: 30),
            walletImage.widthAnchor.constraint(equalToConstant: 30),
            
            cardImage.centerYAnchor.constraint(equalTo: sendMoneyView.centerYAnchor),
            cardImage.topAnchor.constraint(equalTo: sendMoneyView.topAnchor, constant: 16),
            cardImage.leadingAnchor.constraint(equalTo: sendMoneyView.leadingAnchor, constant: 16),
            cardImage.heightAnchor.constraint(equalToConstant: 30),
            cardImage.widthAnchor.constraint(equalToConstant: 30),
            
            balanceLabel1.leadingAnchor.constraint(equalTo: vosklImage.leadingAnchor, constant: 35),
            balanceLabel1.topAnchor.constraint(equalTo: topView.topAnchor, constant: 13),
            balanceLabel1.widthAnchor.constraint(equalToConstant: 100),
            balanceLabel1.heightAnchor.constraint(equalToConstant: 20),
            
            balanceLabel2.leadingAnchor.constraint(equalTo: vosklImage.leadingAnchor, constant: 35),
            balanceLabel2.topAnchor.constraint(equalTo: topView.topAnchor, constant: 30),
            balanceLabel2.widthAnchor.constraint(equalToConstant: 250),
            balanceLabel2.heightAnchor.constraint(equalToConstant: 20),
            
            cardTF.leadingAnchor.constraint(equalTo: cardImage.leadingAnchor, constant: 35),
            cardTF.centerYAnchor.constraint(equalTo: sendMoneyView.centerYAnchor),
            cardTF.topAnchor.constraint(equalTo: sendMoneyView.topAnchor, constant: 16),
            
            commissionLabel.centerXAnchor.constraint(equalTo: sendSummView.centerXAnchor),
            commissionLabel.bottomAnchor.constraint(equalTo: sendSummView.bottomAnchor, constant: -10),
            
            summTF.centerXAnchor.constraint(equalTo: sendSummView.centerXAnchor),
            summTF.topAnchor.constraint(equalTo: sendSummView.topAnchor, constant: 40),
            
            warningLabel.centerYAnchor.constraint(equalTo: walletImage.centerYAnchor),
            warningLabel.topAnchor.constraint(equalTo: warrantView.topAnchor, constant: 13),
            warningLabel.leadingAnchor.constraint(equalTo: walletImage.leadingAnchor, constant: 35),
            warningLabel.trailingAnchor.constraint(equalTo: warrantView.trailingAnchor, constant: -16)
            
        ])
        cardTF.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        summTF.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        translateButton.addTarget(self, action: #selector(transferButtonTapped), for: .touchUpInside)
        
    }
  

    @objc func textFieldDidChange(_ textField: UITextField) {
            // Вызываем метод протокола ValidateProtocol для обновления состояния кнопки
            updateTransferButtonState(cardNumber: cardTF.text, enteredMoney: summTF.text, transferButton: translateButton)
        }

        @objc func transferButtonTapped(_ sender: UIButton) {
            // Вызываем метод протокола ValidateProtocol для обработки нажатия кнопки перевода
            let _ = transferButtonTapped(amountText: summTF.text, cardNumber: cardTF.text, transferButton: translateButton, navigationController: navigationController)
        }


    
}

