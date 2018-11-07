//
//  LibaryViewController.swift
//  iOS video Game Libary
//
//  Created by Christian Lamb on 10/30/18.
//  Copyright © 2018 Christian Lamb. All rights reserved.
//
import UIKit
import DZNEmptyDataSet

class LibaryViewController: UIViewController {
    
   
        
        @IBOutlet weak var tableView: UITableView!
        
        let library = Library.sharedInstance
        
        override func  viewDidLoad() {
            super.viewDidLoad()
            //Populating the games array
            library.game1.append(game(title: "Fortnight", genre: .battleRoyal, description: "A game for 12 year olds.", rating: .everyone) )
            library.game1.append(game(title: "CS-Go", genre: .action, description: "Team based shooter", rating: .teen) )
            
            self.tableView.emptyDataSetSource = self as! DZNEmptyDataSetSource;
            self.tableView.emptyDataSetDelegate = self as! DZNEmptyDataSetDelegate;
            
           
            tableView.tableFooterView = UIView()
            
            tableView.reloadData()
        }
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            tableView.reloadData()
        }
    }

    
    extension LibaryViewController:  UITableViewDelegate, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return library.game1.count
        }
        

        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! LibraryCell11
            
            let game = Library().game1[indexPath.row]
            cell.setup(game: game)
            
            return cell
        }
        
      /*  func checkOut(at indexPath: IndexPath) {
            let game = self.library.game1[indexPath.row]
            
            let calendar = Calendar(identifier: .gregorian)
            let dueDate = calendar.date(byAdding: .day, value: 7, to: Date())!
            
             game.available = .checkedOut(dueDate: dueDate)
            (UITableView.cellForRow(at: indexPath) as! LibraryCell11).setup(game: game)
        }
        
        func checkIn(at indexPath: IndexPath) {
            let game = self.library.game1[indexPath.row]
            game.available = .checkedIn
            (UITableView.cellForRow(at: indexPath) as! LibraryCell11).setup(game: game)
            
        }*/
        
        func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
            
            //Deleting Games
            let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _, indexPath in
                Library.sharedInstance.game1.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
                tableView.reloadData()
            }
            
            let game = Library().game1[indexPath.row]
            //Check in and out games
            switch game.available {
            case .checkedIn:
                let checkOutAction = UITableViewRowAction(style: .normal, title: "Check Out") { _, indexPath in
                    
                    //self.checkOut(at: indexPath)
                    
                }
                
                return [deleteAction, checkOutAction]
                
            case .checkedOut:
                let checkInAction = UITableViewRowAction(style: .normal, title: "Check In") { _, indexPath in
                    //self.checkIn(at: indexPath)
                }
                
                return [deleteAction, checkInAction]
                
            }
        }
    }
    
    
    extension LibaryViewController: DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
        
        func title(forEmptyDataSet scrollView: UIScrollView?) -> NSAttributedString? {
            let text = "You have no games!"
            
            let attributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18.0), NSAttributedString.Key.foregroundColor: UIColor(red:0.74, green:0.93, blue:0.42, alpha:1.0)]
            
            return NSAttributedString(string: text, attributes: attributes)
        }
        
        func description(forEmptyDataSet scrollView: UIScrollView?) -> NSAttributedString? {
            let text = "You need to add games to your library."
            
            let paragraph = NSMutableParagraphStyle()
            paragraph.lineBreakMode = .byWordWrapping
            paragraph.alignment = .center
            
            let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14.0), NSAttributedString.Key.foregroundColor: UIColor.lightGray, NSAttributedString.Key.paragraphStyle: paragraph]
            
            return NSAttributedString(string: text, attributes: attributes)
        }
        
        func buttonTitle(forEmptyDataSet scrollView: UIScrollView?, for state: UIControl.State) -> NSAttributedString? {
            let attributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17.0)]
            
            return NSAttributedString(string: "Add Game", attributes: attributes)
        }
        
        func backgroundColor(forEmptyDataSet scrollView: UIScrollView?) -> UIColor? {
            return UIColor(red:0.36, green:0.37, blue:0.61, alpha:1.0)
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    

    


