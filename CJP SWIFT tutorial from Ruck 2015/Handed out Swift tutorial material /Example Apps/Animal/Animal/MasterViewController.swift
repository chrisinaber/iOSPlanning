//
//  MasterViewController.swift
//  Animal
//
//  Created by Chris Price on 22/06/2015.
//  Copyright (c) 2015 Chris Price. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    
    var categories = ["Dogs", "Cats", "Rabbits" ]
    
    var categoryItems = [ [ "Collie", "Labrador", "Dalmation", "Doberman", "Afghan"],
        [ "Siamese", "Manx", "Napolean"],
        [ "Belgian blue", "Dutch", "Chinchilla"]]
    
    // MARK: - Segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let detailVC = segue.destinationViewController as! DetailViewController
                detailVC.valueForLabel = "I like " + categories[indexPath.section]
                                    + ", and my favourite is the "
                                    + categoryItems[indexPath.section][indexPath.row]
            }
        }
    }
    
    // MARK: - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return categories.count
    }
      
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryItems[section].count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categories[section]
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("AnimalCell", forIndexPath: indexPath) 
        cell.textLabel!.text = categoryItems[indexPath.section][indexPath.row]

        
   //     cell.textLabel!.text = categories[indexPath.section]
   //     cell.detailTextLabel!.text = categoryItems[indexPath.section][indexPath.row]
        
        switch indexPath.section {
        case 0: cell.backgroundColor = UIColor.yellowColor()
        case 1: cell.backgroundColor = UIColor.purpleColor()
        default: cell.backgroundColor = UIColor.greenColor()
        }
        return cell
    }
    
}