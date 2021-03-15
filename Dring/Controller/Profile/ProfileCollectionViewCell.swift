//
//  ProfileCollectionViewCell.swift
//  Dring
//
//  Created by Fabrice Mourou on 08/12/2020.
//  Copyright © 2020 Fabrice Mourou. All rights reserved.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageCollectionView: UIImageView!

    
    static let identifier = "ProfileCollectionViewCell"
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
      
    }
    
    override func layoutSubviews() {
        self.layer.cornerRadius = 15.0
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.white.cgColor
    
    }
    
    public func configure(with imageName: String) {
        guard let image = UIImage(named: imageName) else { return }
        
        imageCollectionView.image = image
        
        
       
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "ProfileCollectionViewCell", bundle: nil)
    }

}
