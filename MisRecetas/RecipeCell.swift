//
//  RecipeCell.swift
//  MisRecetas
//
//  Created by Cesar Avila on 27/08/17.
//  Copyright © 2017 Cesar Avila. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {

    @IBOutlet var thumbnailimageView: UIImageView!
    @IBOutlet var namelabel: UILabel!
    @IBOutlet var timelabel: UILabel!
    @IBOutlet var ingredientslabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
