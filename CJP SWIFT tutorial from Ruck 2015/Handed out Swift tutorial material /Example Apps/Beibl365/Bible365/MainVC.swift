 //
//  MainVC.swift
//  Bible365
//
//  Created by Chris Price on 04/04/2015.
//  Copyright (c) 2015 Chris Price. All rights reserved.
//

import UIKit

class MainVC: UITableViewController {

    let OT = 0
    let NT = 1
    let Psalm = 2
    

    var showReadingVC: ShowReadingVC? = nil
    var todaysLessons = DBAccess.sharedInstance.returnTodaysLessons()
    var passageFontSize: CGFloat = 20
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.showReadings()
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            passageFontSize = 40
        }    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showReading" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = (segue.destinationViewController) as! ShowReadingVC
                var index = OT
                switch indexPath.row {
                case 1: index = OT
                case 3: index = NT
                case 5: index = Psalm
                default: index = OT
                }
                controller.passage = todaysLessons[index]
                DBAccess.sharedInstance.markSingleReadingDone(index)
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9      // A header and a reading for each section (=6), then a line then the controls, and finally a summary row
 
    }
    
    override func tableView(tableView: UITableView,
        heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
            let screenRect = UIScreen.mainScreen().bounds;
            let screenHeight = screenRect.size.height;
            var height: CGFloat
            switch indexPath.row {
            case 1, 3, 5, 7:
                height = (screenHeight - (3.0*44.0+70.0))/4.0
            case 6:
                height = 10.0
            default: height = 44.0
            }
            return height
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell;
        switch indexPath.row {
        case 6:
            // Line above control buttons
           cell = tableView.dequeueReusableCellWithIdentifier("LineCell", forIndexPath: indexPath) 
        case 7:
           // Control buttons
            cell = tableView.dequeueReusableCellWithIdentifier("ControlCell", forIndexPath: indexPath) 

        case 1,3,5:
            // Passages to be read
            let passageCell = tableView.dequeueReusableCellWithIdentifier("PassageCell") as! PassageCell
            passageCell.accessoryType = .DisclosureIndicator
            var myLesson: Lesson = todaysLessons[OT]
            if indexPath.row == 1 {

                if DBAccess.sharedInstance.singleReadingDone(OT) {passageCell.accessoryType = .Checkmark}
            }
            else if indexPath.row == 3 {
                myLesson = todaysLessons[NT]
                if DBAccess.sharedInstance.singleReadingDone(NT) {passageCell.accessoryType = .Checkmark}
                
            }
            else if indexPath.row == 5 {
               myLesson = todaysLessons[Psalm]
                if DBAccess.sharedInstance.singleReadingDone(Psalm) {passageCell.accessoryType = .Checkmark}
            }
            passageCell.passage.text = myLesson.makeReading()
            // Adjust text to screensize
            passageCell.passage.font = passageCell.passage.font.fontWithSize( passageFontSize )
            
            cell = passageCell as UITableViewCell
        case 0,2,4:
            // Section header
            let headerCell = tableView.dequeueReusableCellWithIdentifier("HeaderCell")
                as! HeaderCell
            if indexPath.row == 0 {headerCell.headerText.text = "Hen Destament"}
            else if indexPath.row == 2 {headerCell.headerText.text = "Testament Newydd"}
            else if indexPath.row == 4 {headerCell.headerText.text = "Salmau"}
            cell = headerCell as UITableViewCell
        default:
            // Padding at bottom
            cell = tableView.dequeueReusableCellWithIdentifier("BlankCell", forIndexPath: indexPath) 
        }        
        return cell
    }
 
    
    @IBAction func doNext(sender: UIButton) {
        DBAccess.sharedInstance.incrementDayNumber()
        self.showReadings()
    }
    
    @IBAction func doLast(sender: AnyObject) {
        DBAccess.sharedInstance.decrementDayNumber()
        self.showReadings()
    }
    
    @IBAction func doNextUnread(sender: UIButton) {
        while DBAccess.sharedInstance.allReadingsDone(){
            DBAccess.sharedInstance.incrementDayNumber()
        }
        self.showReadings()
    }
    
    func showReadings() {
       let today = DBAccess.sharedInstance.dayNumber
       self.title = "Beibl365 - Dydd " + today.description
       //Get today's records
       todaysLessons = DBAccess.sharedInstance.returnTodaysLessons()
       self.tableView.reloadData()
    }
    
}
    

