//
//  ImageTravelTableViewCell.swift
//  Dring
//
//  Created by Fabrice Mourou on 09/12/2020.
//  Copyright © 2020 Fabrice Mourou. All rights reserved.
//

import UIKit

class ImageTravelTableViewCell: UITableViewCell {
    
    @IBOutlet weak var travelImage: UIImageView!
    
    static let identifier = "ImageTravelTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "ImageTravelTableViewCell", bundle: nil)
    }
    
    public func configure(with imageName: String) {
        travelImage.layer.cornerRadius = 20
        travelImage.image = UIImage(named: imageName)
        travelImage.layer.borderColor = UIColor.orange.cgColor
        travelImage.layer.borderWidth = 1
    }

    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
