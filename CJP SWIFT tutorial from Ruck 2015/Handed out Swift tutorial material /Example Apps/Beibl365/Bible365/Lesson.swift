//
//  Lesson.swift
//  Bible365
//
//  Created by Chris Price on 04/04/2015.
//  Copyright (c) 2015 Chris Price. All rights reserved.
//

import Foundation

class Lesson: NSObject{
    
    var book: String
    var startC: Int
    var startV: Int
    var endC: Int
    var endV: Int
    
    init( book: String, startC: Int, endC: Int, startV: Int, endV: Int){
        self.book = book
        self.startC = startC
        self.endC = endC
        self.startV = startV
        self.endV = endV
    }
    
    func makeReading() -> String{
        //Special for Welsh version
        let book = self.welshlongBookName()
        if self.startC == self.endC {
            return "\(book) \(self.startC):\(self.startV) - \(self.endV)"
        } else {
            return "\(book) \(self.startC):\(self.startV) - \(self.endC):\(self.endV)"
        }
    }
    
    func unspacedReading() -> String{
        // This is for looking up in Beibl.net, short name and no spaces
        let book = self.welshShortBookName()
        return "\(book).\(self.startC)"
    }
    
    func fullReading() -> String{
        return makeReading()
    }
    
    func welshShortBookName() -> String{
        // Used to read from Beibl.net
        let shortBookName = [
            "Genesis": "Gen",
            "Exodus": "Exo",
            "Leviticus": "Lev",
            "Numbers": "Num",
            "Deuteronomy": "Deu",
            "Joshua": "Jos",
            "Judges": "Jdg",
            "Ruth": "Rut",
            "1 Samuel": "1Sa",
            "2 Samuel": "2Sa",
            "1 Kings": "1Ki",
            "2 Kings": "2Ki",
            "1 Chronicles": "1Ch",
            "2 Chronicles": "2Ch",
            "Ezra": "Ezr",
            "Nehemiah": "Neh",
            "Esther": "Est",
            "Job": "Job",
            "Psalm": "Psa",
            "Proverbs": "Prov",
            "Ecclesiastes": "Ecc",
            "Song of Songs": "Sng",
            "Isaiah": "Isa",
            "Jeremiah": "Jer",
            "Lamentations": "Lam",
            "Ezekiel": "Eze",
            "Daniel": "Dan",
            "Hosea": "Hos",
            "Joel": "Jol",
            "Amos": "Amo",
            "Obadiah": "Oba",
            "Jonah": "Jon",
            "Micah": "Mic",
            "Nahum": "Nam",
            "Habakkuk": "Hab",
            "Zephaniah": "Zep",
            "Haggai": "Hag",
            "Zechariah": "Zec",
            "Malachi": "Mal",
            "Matthew": "Matt",
            "Mark": "Mark",
            "Luke": "Luke",
            "John": "John",
            "Acts": "Acts",
            "Romans": "Rom",
            "1 Corinthians": "1Cor",
            "2 Corinthians": "2Cor",
            "Galatians": "Gel",
            "Ephesians": "Eph",
            "Philippians": "Phil",
            "Colossians": "Col",
            "1 Thessalonians": "1Thes",
            "2 Thessalonians": "2Thes",
            "1 Timothy": "1Tim",
            "2 Timothy": "2Tim",
            "Titus": "Titus",
            "Philemon": "Phm",
            "Hebrews": "Heb",
            "James": "Jas",
            "1 Peter": "1Pet",
            "2 Peter": "2Pet",
            "1 John": "1John",
            "2 John": "2John",
            "3 John": "3John",
            "Jude": "Jude",
            "Revelation": "Rev"]
        
        return shortBookName[self.book]!
        
    }

    func welshlongBookName() -> String{
        // Used to display - looked up from Welsh short name
        let longBookName = [
            "Gen": "Genesis",
            "Exo": "Exodus",
            "Lev": "Lefiticus",
            "Num": "Numeri",
            "Deu": "Deuteronomium",
            "Jos": "Josua",
            "Jdg": "Barnwyr",
            "Rut": "Ruth",
            "1Sa": "1 Samuel",
            "2Sa": "2 Samuel",
            "1Ki": "1 Brenhineodd",
            "2Ki": "2 Brenhineodd",
            "1Ch": "1 Cronicl",
            "2Ch": "2 Cronicl",
            "Ezr": "Esra",
            "Neh": "Nehemeia",
            "Est": "Esther",
            "Job": "Job",
            "Psa": "Salmau",
            "Prov": "Diarhebion",
            "Ecc": "Pregethwr",
            "Sng": "Caniad Solomon",
            "Isa": "Eseia",
            "Jer": "Jeremeia",
            "Lam": "Galarnad",
            "Eze": "Eseciel",
            "Dan": "Daniel",
            "Hos": "Hosea",
            "Jol": "Joel",
            "Amo": "Amos",
            "Oba": "Obadeia",
            "Jon": "Jona",
            "Mic": "Micha",
            "Nam": "Nahum",
            "Hab": "Habacuc",
            "Zep": "Seffaneia",
            "Hag": "Haggai",
            "Zec": "Sechareia",
            "Mal": "Malachi",
            "Matt": "Mathew",
            "Mark": "Marc",
            "Luke": "Luc",
            "John": "Ioan",
            "Acts": "Actau",
            "Rom": "Rhufeiniad",
            "1Cor": "1 Corinthiaid",
            "2Cor": "2 Corinthiaid",
            "Gel": "Galatiaid",
            "Eph": "Effesiaid",
            "Phil": "Philipiaid",
            "Col": "Colosiaid",
            "1Thes": "1 Thesaloniaid",
            "2Thes": "2 Thesaloniaid",
            "1Tim": "1 Timotheus",
            "2Tim": "2 Timotheus",
            "Titus": "Titus",
            "Phm": "Philemon",
            "Heb": "Hebreaid",
            "Jas": "Iago",
            "1Pet": "1 Pedr",
            "2Pet": "2 Pedr",
            "1John": "1 Ioan",
            "2John": "2 Ioan",
            "3John": "3 Ioan",
            "Jude": "Jwdas",
            "Rev": "Datguddiad"]
        
        return longBookName[ welshShortBookName()]!
    }
    
}
