//
//  CustomCollectionViewCell.swift
//  protocolExample
//
//  Created by Abdylda Mamashev on 3/2/24.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    let visaImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "visa")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let label1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let label2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 25, weight: .bold)
        return label
    }()
    
    let label3: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(visaImage)
        contentView.addSubview(label1)
        contentView.addSubview(label2)
        contentView.addSubview(label3)
        
        
        NSLayoutConstraint.activate([
        
            visaImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            visaImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            visaImage.widthAnchor.constraint(equalToConstant: 40),
            visaImage.heightAnchor.constraint(equalToConstant: 20),
            
            label1.topAnchor.constraint(equalTo: visaImage.topAnchor, constant: 45),
            label1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17),
            label1.widthAnchor.constraint(equalToConstant: 130),
            label1.heightAnchor.constraint(equalToConstant: 20),
            
            label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 5),
            label2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17),
            label2.widthAnchor.constraint(equalToConstant: 120),
            label2.heightAnchor.constraint(equalToConstant: 40),
            
            label3.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 20),
            label3.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17),
            label3.widthAnchor.constraint(equalToConstant: 70),
            label3.heightAnchor.constraint(equalToConstant: 20),
            
            
            
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure (with Images: View) {
        visaImage.image = UIImage(named: Images.visaImage)
        label1.text = Images.label1
        label2.text = Images.label2
        label3.text = Images.label3
    }
}
