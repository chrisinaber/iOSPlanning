//
//  DBAccess.swift
//  Bible365
//
//  Created by Chris Price on 06/04/2015.
//  Copyright (c) 2015 Chris Price. All rights reserved.
//

import Foundation

private let _hiddenSharedInstance = DBAccess()


class DBAccess: NSObject{

    class var sharedInstance: DBAccess{
        return _hiddenSharedInstance;
    }
    
    let OT = 0
    let NT = 1
    let Psalm = 2

    var dayNumber: Int = 1  // Which day we are reading = first is day 1
    var versionShortName: String = "TNIV"
    var versionLongName: String = "Today's New International Version"
    var startDate: NSDate = NSDate()
    var todaysDate: NSDate = NSDate()
    var started: Bool = false
    var readList = [ "000" ]  // Extended with entry for each day
                              // this is day 1 with nothing read

    override init(){
        super.init()
        loadReadList()
        loadPosition()
    }
    
    func incrementDayNumber(){
        // When we change it, need to store new value
        if self.dayNumber < 365 {
            self.dayNumber = self.dayNumber + 1
            self.savePosition()
        }
    }
    
    func decrementDayNumber(){
        // When we change it, need to store new value
        if self.dayNumber > 1 {
            self.dayNumber = self.dayNumber - 1
            self.savePosition()
        }
    }
    
    func checkForUpgradeNeeded() -> Bool{
        let fileManager = NSFileManager.defaultManager()
        let oldDBPath =  pathToFileInDocuments("bibleDB.sqlite3")
        return fileManager.fileExistsAtPath(oldDBPath)
    }
    
    
    func loadReadList(){
        // Either load present position in bible, or if starting then set defaults
        let fileManager = NSFileManager.defaultManager()
        let readListPath =  pathToFileInDocuments("readList.list")
        if fileManager.fileExistsAtPath(readListPath) {
            let array: NSArray = NSArray(contentsOfFile: readListPath)!
            readList = array as! [String]
        } else {
            // already initialised with starting values - just need to save
            saveReadList()
        }
    }

    func saveReadList(){
        // Saves where we are in the bible to disk
        let readListNSArray: NSArray = readList
        let readListPath =  pathToFileInDocuments("readList.list")
        readListNSArray.writeToFile( readListPath, atomically: true)
    }

    func loadPosition(){
        // Either load present position in bible, or if starting then set defaults
        let fileManager = NSFileManager.defaultManager()
        let settingsPath =  pathToFileInDocuments("biblesettings.plist")
        if fileManager.fileExistsAtPath(settingsPath) {
            let array: NSArray = NSArray(contentsOfFile: settingsPath)!
            dayNumber = array[0] as! Int
            versionShortName = array[1] as! String
            versionLongName = array[2]  as! String
            startDate = array[3] as! NSDate
            todaysDate = array[4] as! NSDate
            
            // See whether need to update todaysDate and dayNumber
            while allReadingsDone(){
                self.dayNumber = self.dayNumber + 1;
                savePosition()
            }
        } else {
            // already initialised with starting values - just need to save
            savePosition()
        }
    }
    
    func savePosition(){
        // Saves where we are in the bible to disk
        let saveDetails: NSArray = [
            dayNumber,
            versionShortName,
            versionLongName,
            startDate,
            todaysDate
        ]
        let settingsPath =  pathToFileInDocuments("biblesettings.plist")
        saveDetails.writeToFile( settingsPath, atomically: true)
    }
    
    func allReadingsDone() -> Bool{
        if self.readList.count < self.dayNumber {return false}
        return self.readList[self.dayNumber-1] == "111"
    }
    
    func chooseVersion( shortVersion: String, longVersion: String ){
        self.versionShortName = shortVersion
        self.versionLongName = longVersion
        self.savePosition()
    }
    
    func splitReadList( readList: String ) -> [Character]{
        var readArray: [ Character ] = []
        for char in readList.characters {
            readArray.append( char )
        }
        return readArray
    }
    
    func singleReadingDone(lessonType: Int) -> Bool{
        var result = false
        if self.readList.count >= self.dayNumber {
            let todayString = self.readList[self.dayNumber-1]
            let readArray = self.splitReadList(todayString)
            if readArray[lessonType] == "1" {
                result = true
            }
         }
        return result
    }
    
    func markSingleReadingDone(lessonType: Int){
        while self.readList.count < self.dayNumber {
            self.readList.append( "000" )
        }
        let todayString = self.readList[self.dayNumber-1]
        var readArray = self.splitReadList(todayString)
        readArray[lessonType] = "1"
        var answer = ""
        for char in readArray {
            answer.append(char)
        }
        self.readList[self.dayNumber-1] = answer
        self.saveReadList()
    }

    func getTypedLessonForThisDay(lessonType: String) -> Lesson {
        var myLesson: Lesson = Lesson(book: "Matthew", startC: 1, endC: 1, startV: 1, endV: 15)
        // Turn the index into a patternId
        let query = "SELECT book, sChap, sVerse, eChap, eVerse FROM lessons WHERE day = " + dayNumber.description + " AND type = '" + lessonType + "';"
        if DBObjC.sharedInstance().statementPrepared(query){
            if DBObjC.sharedInstance().anotherRowInDB() {
                let book = DBObjC.sharedInstance().stringAtField(0)
                let startChap = DBObjC.sharedInstance().intAtField(1)
                let startVerse = DBObjC.sharedInstance().intAtField(2)
                let endChap = DBObjC.sharedInstance().intAtField(3)
                let endVerse = DBObjC.sharedInstance().intAtField(4)
    
                myLesson = Lesson(book: book, startC: startChap, endC: endChap, startV: startVerse, endV: endVerse)
            }

        }
    DBObjC.sharedInstance().sqlFinishStatement();
    return myLesson;
    }

    func returnTodaysLessons()-> [Lesson]{
        return [
            self.getTypedLessonForThisDay("OT"),
            self.getTypedLessonForThisDay("NT"),
            self.getTypedLessonForThisDay("Psalm"),
        ]
    }

    
    func pathToFileInDocuments( fileName: String ) -> String {
        // Returns the path to file fileName in the Document directory
        let dirPaths = NSSearchPathForDirectoriesInDomains( .DocumentDirectory, .UserDomainMask, true)
        let docsDir = dirPaths[0] as? String
        let filepathName = ((docsDir)! as NSString).stringByAppendingPathComponent( fileName )
        return filepathName
    }

}