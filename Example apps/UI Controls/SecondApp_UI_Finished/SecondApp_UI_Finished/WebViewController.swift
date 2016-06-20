//
//  WebViewController.swift
//  SecondApp_UI_Finished
//
//  Created by Neil Taylor on 20/06/2016.
//  Copyright © 2016 Chris Price. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var urlText: UITextField!
    
    @IBOutlet weak var webView: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func go(sender: AnyObject) {
        
        if let userUrl = urlText.text {
        
            if let nsUrl = NSURL(string: userUrl) {
               webView.loadRequest(NSURLRequest(URL: nsUrl))
            }
        }
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        print("started")
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        print("finished")
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        print("failed \(error)")
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return true
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
