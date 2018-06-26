//
//  ReviewController.swift
//  MisRecetas
//
//  Created by Alejandro Ruiz Ponce on 25/6/18.
//  Copyright © 2018 Alejandro Ruiz Ponce. All rights reserved.
//

import UIKit

class ReviewController: UIViewController {
    
    var ratingSelected: String?

    @IBOutlet var ratingStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scale = CGAffineTransform(scaleX: 0.0, y: 0.0)
        let translation = CGAffineTransform(translationX: 0, y: 500)
        
        ratingStackView.transform = scale.concatenating(translation)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        
        /*UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
            self.ratingStackView.transform = CGAffineTransform.identity
        }, completion: nil)*/
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
            self.ratingStackView.transform = CGAffineTransform.identity
        }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        switch sender.tag {
        case 1:
            ratingSelected = "dislike"
        case 2:
            ratingSelected = "good"
        case 3:
            ratingSelected = "great"
        default:
            break
        }
        
        performSegue(withIdentifier: "unwindToDetailView", sender: sender)
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
