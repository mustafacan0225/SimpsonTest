//
//  DetailsViewController.swift
//  SimpsonBook
//
//  Created by mustafacan on 3.05.2020.
//  Copyright © 2020 mustafacan. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var selectedSimpson : Simpson?;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = selectedSimpson?.image;
        nameLabel.text = selectedSimpson?.name;
        descriptionLabel.text = selectedSimpson?.description;
    }
    

}
