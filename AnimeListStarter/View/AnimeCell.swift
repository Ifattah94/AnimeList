//
//  AnimeCell.swift
//  AnimeListStarter
//
//  Created by C4Q on 10/10/19.
//  Copyright © 2019 Iram Fattah. All rights reserved.
//

import UIKit

class AnimeCell: UITableViewCell {
    
    
    
    @IBOutlet weak var animeImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
