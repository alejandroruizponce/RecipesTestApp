//
//  DetailViewController.swift
//  MisRecetas
//
//  Created by Alejandro Ruiz Ponce on 22/6/18.
//  Copyright © 2018 Alejandro Ruiz Ponce. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var detailImage: UIImageView!
    
    @IBOutlet var detailGuia: UILabel!
    @IBOutlet var detailTitle: UILabel!
    var recipe: Recipe!

    @IBOutlet var ratingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailImage.image = recipe.image
        self.detailTitle.text = recipe.name
        self.detailGuia.text = recipe.steps.description
        
        self.title = recipe.name
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    @IBAction func close(segue: UIStoryboardSegue){
        if let reviewVC = segue.source as? ReviewController {
            if let rating = reviewVC.ratingSelected {
                self.ratingButton.setImage(UIImage(named: rating), for: .normal)
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
