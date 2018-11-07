//
//  LibraryCell.swift
//  iOS video Game Libary
//
//  Created by Christian Lamb on 11/1/18.
//  Copyright © 2018 Christian Lamb. All rights reserved.
//

import UIKit

class LibraryCell11: UITableViewCell {
    //IBOuytlets
    @IBOutlet weak var tittleLabel: UILabel!
    
    @IBOutlet weak var genreLabel: UILabel!
    
    @IBOutlet weak var dueDateLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var availabilityView: UIView!
    
    

    
    
    
    
    //functions
    func setup(game : game) {
        tittleLabel.text = game.title
        
        genreLabel.text = game.genre.rawValue
        
        ratingLabel.text = game.rating.rawValue
        
        switch game.available {
        case .checkedIn:
            //hidedueDate
            dueDateLabel.isHidden = true
            //Set view to green
            availabilityView.backgroundColor = .green 
        default:
            return
        }
        
        
    }
    
    
    
}
