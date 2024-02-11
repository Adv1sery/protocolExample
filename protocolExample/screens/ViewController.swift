//
//  ViewController.swift
//  protocolExample
//
//  Created by Abdylda Mamashev on 1/2/24.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var Views: [View] = []
    
    static var balance: Int = 5555
    
    private lazy var iconImage: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "1")
        icon.contentMode = .scaleAspectFit
        icon.clipsToBounds = true
        icon.layer.borderColor = UIColor.white.cgColor
        icon.layer.borderWidth = 1
        icon.frame.size = CGSize(width: 50, height: 50)
        icon.layer.cornerRadius = icon.frame.size.width / 3
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    private lazy var bankName: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var balanceLabel: UILabel = {
        let label = UILabel()
        label.text = "Your Balance"
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textColor = .white
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    private lazy var summLabel: UILabel = {
//        let label = UILabel()
//        label.text = "$ 5,555"
//        label.font = .systemFont(ofSize: 40, weight: .bold)
//        label.textColor = .white
//        label.backgroundColor = .clear
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
    
    private lazy var summLabel: UILabel = {
            let label = UILabel()
            label.textColor = .white
            label.font = UIFont.systemFont(ofSize: 40)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width / 3) * 1.5 , height: 190)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private lazy var financeLabel: UILabel = {
        let label = UILabel()
        label.text = "Transfer"
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textColor = .white
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var View1: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 40
        view.backgroundColor = .darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var View2: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 40
        view.backgroundColor = .darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var View3: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 40
        view.backgroundColor = .darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var financeStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.backgroundColor = .clear
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var bottomNavBarView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var image1: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Home")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var image2: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Shop")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var image3: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Unactive")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var image4: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Chat")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var image5: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "History")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var mbankButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Mbank", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.backgroundColor = .clear
        button.tintColor = .white
        button.frame = CGRect(x: 100, y: 200, width: 40, height: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(MBankTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var optimaButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Optima", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.backgroundColor = .clear
        button.tintColor = .white
        button.frame = CGRect(x: 100, y: 200, width: 40, height: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(optimaTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var kicbButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("KICB", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.backgroundColor = .clear
        button.tintColor = .white
        button.frame = CGRect(x: 100, y: 200, width: 40, height: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(kicbTapped), for: .touchUpInside)
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        setupViews()
    
        view.addSubview(iconImage)
        view.addSubview(bankName)
        view.addSubview(balanceLabel)
        view.addSubview(summLabel)
        view.addSubview(collectionView)
        view.addSubview(financeLabel)
        view.addSubview(financeStack)
        financeStack.addArrangedSubview(View1)
        financeStack.addArrangedSubview(View2)
        financeStack.addArrangedSubview(View3)
        view.addSubview(bottomNavBarView)
        bottomNavBarView.addSubview(image1)
        bottomNavBarView.addSubview(image2)
        bottomNavBarView.addSubview(image3)
        bottomNavBarView.addSubview(image4)
        bottomNavBarView.addSubview(image5)
        financeStack.addSubview(mbankButton)
        financeStack.addSubview(optimaButton)
        financeStack.addSubview(kicbButton)
        
        NSLayoutConstraint.activate([
            
            iconImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            iconImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            iconImage.heightAnchor.constraint(equalToConstant: 40),
            iconImage.widthAnchor.constraint(equalToConstant: 40),
            
            bankName.centerYAnchor.constraint(equalTo: iconImage.centerYAnchor),
            bankName.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor),
            bankName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bankName.heightAnchor.constraint(equalToConstant: 26),
            bankName.widthAnchor.constraint(equalToConstant: 90),
            
            balanceLabel.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: 40),
            balanceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            balanceLabel.widthAnchor.constraint(equalToConstant: 120),
            balanceLabel.heightAnchor.constraint(equalToConstant: 20),
            
            summLabel.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor, constant: 10),
            summLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            balanceLabel.widthAnchor.constraint(equalToConstant: 120),
            balanceLabel.heightAnchor.constraint(equalToConstant: 40),
            
            collectionView.topAnchor.constraint(equalTo: summLabel.bottomAnchor, constant: 30),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16),
            collectionView.heightAnchor.constraint(equalToConstant: 190),
            
            financeLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 30),
            financeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            financeLabel.widthAnchor.constraint(equalToConstant: 120),
            financeLabel.heightAnchor.constraint(equalToConstant: 40),
            
            financeStack.topAnchor.constraint(equalTo: financeLabel.bottomAnchor, constant: 25),
            financeStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            financeStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            financeStack.heightAnchor.constraint(equalToConstant: 130),
            
            bottomNavBarView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 5),
            bottomNavBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            bottomNavBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            bottomNavBarView.heightAnchor.constraint(equalToConstant: 90),
            
            image1.topAnchor.constraint(equalTo: bottomNavBarView.topAnchor, constant: 15),
            image1.leadingAnchor.constraint(equalTo: bottomNavBarView.leadingAnchor, constant: 30),
            image1.widthAnchor.constraint(equalToConstant: 40),
            image1.heightAnchor.constraint(equalToConstant: 40),
            
            image2.topAnchor.constraint(equalTo: bottomNavBarView.topAnchor, constant: 15),
            image2.leadingAnchor.constraint(equalTo: image1.leadingAnchor, constant: 70),
            image2.heightAnchor.constraint(equalToConstant: 40),
            image2.widthAnchor.constraint(equalToConstant: 40),
            
            image3.topAnchor.constraint(equalTo: bottomNavBarView.topAnchor, constant: 15),
            image3.centerXAnchor.constraint(equalTo: bottomNavBarView.centerXAnchor),
            image3.heightAnchor.constraint(equalToConstant: 40),
            image3.widthAnchor.constraint(equalToConstant: 40),
            
            image4.topAnchor.constraint(equalTo: bottomNavBarView.topAnchor, constant: 15),
            image4.trailingAnchor.constraint(equalTo: image5.trailingAnchor, constant: -70),
            image4.heightAnchor.constraint(equalToConstant: 40),
            image4.widthAnchor.constraint(equalToConstant: 40),
            
            image5.topAnchor.constraint(equalTo: bottomNavBarView.topAnchor, constant: 15),
            image5.trailingAnchor.constraint(equalTo: bottomNavBarView.trailingAnchor, constant: -30),
            image5.heightAnchor.constraint(equalToConstant: 40),
            image5.widthAnchor.constraint(equalToConstant: 40),
            
            mbankButton.topAnchor.constraint(equalTo: View1.topAnchor, constant: 75),
            mbankButton.leadingAnchor.constraint(equalTo: View1.leadingAnchor, constant: 16),
            mbankButton.heightAnchor.constraint(equalToConstant: 40),
            
            optimaButton.topAnchor.constraint(equalTo: View2.topAnchor, constant: 75),
            optimaButton.leadingAnchor.constraint(equalTo: View2.leadingAnchor, constant: 16),
            optimaButton.heightAnchor.constraint(equalToConstant: 40),
            
            kicbButton.topAnchor.constraint(equalTo: View3.topAnchor, constant: 75),
            kicbButton.leadingAnchor.constraint(equalTo: View3.leadingAnchor, constant: 16),
            kicbButton.heightAnchor.constraint(equalToConstant: 40),
            
        ])
        
        summLabel.text = "\(5555) $"
        
        
        
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.black.cgColor, UIColor.darkGray.cgColor] // Указываем цвета градиента
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0) // Начало градиента
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0) // Конец градиента
        
        // Добавляем градиентный слой к основному слою представления
        view.layer.insertSublayer(gradientLayer, at: 0)
        //        view.backgroundColor = .cyan
        
    }
    
    private func setupViews() {
        Views = [
            View(visaImage: "visa", label1: "Salary", label2: "$ 3,333", label3: "**3486"),
            View(visaImage: "visa", label1: "Savings Account", label2: "$ 19,348", label3: "**9273"),
            View(visaImage: "visa", label1: "Saving Account", label2: "$ 7,987", label3: "**4783"),
        ]
    }
    
    @objc func buttonTapped() {
        print("")
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Views.count
    }
    
    
    // ... (ваш имеющийся код)
    
    
    // ... (ваш имеющийся код)
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.collectionView {
            
            
            
            
            guard indexPath.row < Views.count else {
                
                return UICollectionViewCell()
            }
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
            
            
            cell.configure(with: Views[indexPath.row])
            
            
            cell.layer.cornerRadius = 30
            
            
            if indexPath.row % 2 == 0 {
                cell.backgroundColor = .lightGray
            } else {
                cell.backgroundColor = .systemGray3
            }
            
            
            return cell
        }
        
        
        return UICollectionViewCell()
    }
    
    @objc func MBankTapped(_ sender: UIButton) {
        let vc = MbankViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func optimaTapped(_ sender: UIButton) {
        let vc = optimaViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func kicbTapped(_ sender: UIButton) {
        let vc = kicbViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}
