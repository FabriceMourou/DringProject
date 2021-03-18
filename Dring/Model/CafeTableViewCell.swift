//
//  CafeTableViewCell.swift
//  Dring
//
//  Created by Fabrice Mourou on 18/03/2021.
//  Copyright © 2021 Fabrice Mourou. All rights reserved.
//

import UIKit

class CafeTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var businessStatutsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
