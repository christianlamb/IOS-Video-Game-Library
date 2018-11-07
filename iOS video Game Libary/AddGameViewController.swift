//
//  AddGameViewController.swift
//  iOS video Game Libary
//
//  Created by Christian Lamb on 10/31/18.
//  Copyright © 2018 Christian Lamb. All rights reserved.
//

import UIKit

class AddGameViewController: UIViewController {
   //Var's
    
    let segments: [(title: String, rating: game.Rating)] =
        [("K", .kids),
         ("E", .everyone),
         ("E 10+", .everyone10Plus),
         ("T", .teen),
         ("M", .mature),
         ("AD", .adult)
        ]
    let genres:[(title: String, genre: game.Genre)] =
    [("Action", game.Genre.action),
     ("RPG", game.Genre.rpg),
     ("FPS", game.Genre.fps),
     ("Arcade", game.Genre.arcade),
     ("Cool Math", game.Genre.coolMath),
     ("Puzzle", game.Genre.puzzle ),
     ]
    
    
    
    //IBOutlets
    @IBOutlet weak var tittleTextField: UITextField!
    @IBOutlet weak var detailsTextView: UITextView!
    
    @IBOutlet weak var ratingSegmentedControle: UISegmentedControl!
    
    @IBOutlet weak var genrePickerView: UIPickerView!
    
    
    //IBAction Functions
    @IBAction func saveNewGameButtonTaped(_ sender: Any) {
        tryingToSave()
    }
    
    
    
    
    
    //Functions
    
    func tryingToSave() {
        
        //Title
        guard
            tittleTextField.text != nil else {return}
        
        //Details
        guard detailsTextView.text != nil else {return}
        
        
        //Rating
        let rating = segments[ratingSegmentedControle.selectedSegmentIndex].rating
        
        //Genre
        let genre = genrePickerView.dataSource
        
        
    }
        
    
    
    
    
    
    
   //Veiwdidload
  override func viewDidLoad() {
        super.viewDidLoad()
    self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    
    ratingSegmentedControle.removeAllSegments()
    
    for (index, segment) in segments.enumerated() {
        ratingSegmentedControle.insertSegment(withTitle: segment.title, at: index, animated: false)
   
    
        
        
        

        // Do any additional setup after loading the view.
    }
}
    

    

}

//extensions
extension AddGameViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genres.count
           }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genres[row].title
    }
}

 
