//
//  Recipe.swift
//  MisRecetas
//
//  Created by Alejandro Ruiz Ponce on 19/6/18.
//  Copyright © 2018 Alejandro Ruiz Ponce. All rights reserved.
//

import Foundation
import UIKit

class Recipe: NSObject {
    
    var name: String!
    var image: UIImage?
    var time: Int!
    var ingredients: [String]!
    var steps: [String]!
    
    var isFavourite: Bool = false
    
    init(name: String, image: UIImage?, time: Int, ingredients: [String], steps: [String]){
        self.name = name
        self.image = image
        self.time = time
        self.ingredients = ingredients
        self.steps = steps
    }
    
}
