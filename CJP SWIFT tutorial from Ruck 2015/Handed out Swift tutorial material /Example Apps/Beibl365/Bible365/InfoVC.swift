//
//  InfoVC.swift
//  Bible365
//
//  Created by Chris Price on 20/04/2015.
//  Copyright (c) 2015 Chris Price. All rights reserved.
//

import UIKit


class InfoVC: UIViewController {

    @IBOutlet weak var infoView: UIWebView!
    
    func loadPageFromBundle( fileName: String ){
    //    let defaultDBPath = NSBundle.mainBundle().resourcePath(
        //] resourcePath] stringByAppendingPathComponent: @"bibleDB.sqlite3"];
        let myURL = NSBundle.mainBundle().URLForResource( "info", withExtension: "html")
        let myReq = NSURLRequest(URL: myURL! )
        self.infoView.loadRequest( myReq );

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //       println("passage is \(self.passage)")
        self.title = "Info"
        self.loadPageFromBundle("info")
/*
        let loadString =  "http://mobile.biblegateway.com/passage/?search=\(unspacedPassage)&version=\(version)"
            //       println( "loadstring is \(loadString)")
            let myURL = NSURL( string: loadString)
            //MAKE SAFE BELOW ?????
            let myReq = NSURLRequest(URL: myURL! )
            
            self.bibleView.loadRequest( myReq );
*/        //
    }
}

/*
- (void) loadPage: (NSString *) fileName{
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSURLRequest *request = [[NSURLRequest alloc]
        initWithURL: [NSURL fileURLWithPath:
        [NSBundle pathForResource: fileName ofType: @"html"
        inDirectory: path]]];
    
    [self.infoWebView loadRequest: request];
    
}

    [self loadPage: @"info"];
    }
    
    - (void)viewDidUnload
        {
            [self setInfoWebView:nil];
            [super viewDidUnload];
            // Release any retained subviews of the main view.
            // e.g. self.myOutlet = nil;
}*/
