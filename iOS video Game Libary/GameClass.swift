//
//  GameClass.swift
//  iOS video Game Libary
//
//  Created by Christian Lamb on 10/30/18.
//  Copyright © 2018 Christian Lamb. All rights reserved.
//

import UIKit

class game {
    
//USE  raw value in cell
    enum Genre : String {
    case rpg = "Role play game"
    case action =  "Action"
    case fps = "First person sho0ter"
    case arcade = "Arcade"
    case coolMath = "Cool Math"
    case puzzle = "Puzzle"
    case battleRoyal = "BattleRoyal"
}

    enum Rating : String {
    case kids = "K"
    case everyone = "E"
    case everyone10Plus = "E10"
    case teen = "T"
    case mature = "M"
    case adult = "A"
    
}

enum Availability {
    case checkedIn
    case checkedOut(dueDate: Date)
}
let title: String
let rating: Rating
let genre: Genre
let description : String
let available : Availability

init(title: String, genre: Genre, description: String, rating: Rating) {
    self.title = title
    self.available = .checkedIn
    self.description = description
    self.rating = rating
    self.genre = genre
    
   }
    
}
