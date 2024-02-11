//
//  LastViewController.swift
//  protocolExample
//
//  Created by Abdylda Mamashev on 11/2/24.
//

import UIKit

class LastViewController: UIViewController {

    private lazy var SuccesLabel: UILabel = {
        let label = UILabel()
        label.text = "Finally you did it \n Succes!"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
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

        view.addSubview(SuccesLabel)
        
        NSLayoutConstraint.activate([
        
            SuccesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            SuccesLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            
        ])
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
