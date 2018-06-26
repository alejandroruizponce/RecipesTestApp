//
//  RecipeCell.swift
//  MisRecetas
//
//  Created by Alejandro Ruiz Ponce on 20/6/18.
//  Copyright © 2018 Alejandro Ruiz Ponce. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {

    @IBOutlet var imageRecipe: UIImageView!
    @IBOutlet var nameRecipe: UILabel!
    @IBOutlet var timeRecipe: UILabel!
    @IBOutlet var ingredientsRecipe: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
