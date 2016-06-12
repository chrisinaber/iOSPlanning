//
//  ShowReadingVC.swift
//  Bible365
//
//  Created by Chris Price on 04/04/2015.
//  Copyright (c) 2015 Chris Price. All rights reserved.
//

import UIKit

class ShowReadingVC: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var bibleView: UIWebView!
    
    var passage: Lesson = Lesson( book: "Genesis", startC: 1, endC: 1, startV: 1, endV: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.bibleView.delegate = self;
        self.title = self.passage.makeReading()
        let chosenPassage = self.passage.unspacedReading()
        let loadString =  "http://www.beibl.net//symudol/beiblsymudol?&viewid=BNET:\(chosenPassage)"
        let myURL = NSURL( string: loadString)
            //MAKE SAFE BELOW ?????
        let myReq = NSURLRequest(URL: myURL! )
            
        self.bibleView.loadRequest( myReq );
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.bibleView.delegate = self
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.bibleView.stopLoading()
        self.bibleView.delegate = nil
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
 
    }
    
    
    // Web handlers
    func webViewDidStartLoad(webView: UIWebView){
       // starting the load, show the activity indicator in the status bar
       UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(webView: UIWebView)
    {
    // finished loading, hide the activity indicator in the status bar
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
 
        // report the error inside the webview
        let errorString = "<html><center><font size=+3 color='red'>An error occurred:<br>\(error!.localizedDescription)</font></center></html>"
        self.bibleView.loadHTMLString(errorString, baseURL: nil)
    }
    
    
}