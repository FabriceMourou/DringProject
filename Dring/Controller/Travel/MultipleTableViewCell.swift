//
//  MultipleTableViewCell.swift
//  Dring
//
//  Created by Fabrice Mourou on 10/12/2020.
//  Copyright © 2020 Fabrice Mourou. All rights reserved.
//

import UIKit

class MultipleTableViewCell: UITableViewCell {
    
    static let identifier = "MultipleTableViewCell"

    private let multipleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let multipleImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    public func configure() {
        contentView.addSubview(multipleLabel)
        contentView.addSubview(multipleImageView)
        
        
        
        multipleLabel.text = "Etape 1"
        multipleLabel.textAlignment = .center
        multipleLabel.font = UIFont.init(name: "Menlo", size: 20)
        multipleLabel.textColor = .init(cgColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        multipleImageView.image = UIImage(named: "IM5")
        multipleImageView.contentMode = .scaleAspectFill
        multipleImageView.layer.borderColor = UIColor.orange.cgColor
        multipleImageView.layer.borderWidth = 0.5
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        multipleImageView.frame = CGRect(x: 20, y: 30, width: 40, height: 40)
        multipleLabel.frame = CGRect(x: 105, y: 5, width: contentView.frame.size.width-105, height: 100)
        
        multipleImageView.layer.masksToBounds = true
        multipleImageView.layer.cornerRadius = 5.0
    }

}
