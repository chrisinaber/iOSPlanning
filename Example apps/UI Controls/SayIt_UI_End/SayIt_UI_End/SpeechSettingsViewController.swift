//
//  SpeechSettingsViewController.swift
//  SayIt_UI_End
//
//  Created by Neil Taylor on 20/06/2016.
//  Copyright © 2016 Aberystwyth University. All rights reserved.
//

import UIKit

import AVFoundation

class SpeechSettingsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var rateSlider: UISlider!
    
    @IBOutlet weak var volumeSlider: UISlider!
    
    @IBOutlet weak var voiceSegment: UISegmentedControl!

    @IBOutlet weak var voicePicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.voicePicker.dataSource = self
        self.voicePicker.delegate = self
        
        self.initialiseValues()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func returnToMainScreen(sender: AnyObject) {
        self.settings?.rate = self.rateSlider.value
        self.settings?.volume = self.volumeSlider.value
        
        
        //self.settings?.voice =
        //    self.voiceSegment.titleForSegmentAtIndex(self.voiceSegment.selectedSegmentIndex)!
        
        let selectedIndex = self.voicePicker.selectedRowInComponent(0)
        self.settings?.voice = AVSpeechSynthesisVoice.speechVoices()[selectedIndex].language
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // initialiseVoiceForUIPicker(speechSettings.voice)
    // let selectedIndex = self.voicePicker.selectedRowInComponent(0)
    // self.settings?.voice = AVSpeechSynthesisVoice.speechVoices()[selectedIndex].language

    
    var settings: SpeechSettings? {
        didSet {
           self.initialiseValues()
        }
    }
    
    func initialiseValues() {
        
        // the following line checks if we have any settings
        if let speechSettings = self.settings {
            
            // the following line checks if the UI is setup
            if self.rateSlider != nil {
                
                self.rateSlider.minimumValue = AVSpeechUtteranceMinimumSpeechRate
                self.rateSlider.maximumValue = AVSpeechUtteranceMaximumSpeechRate
                self.rateSlider.value = speechSettings.rate
                
                self.volumeSlider.value = speechSettings.volume
                
                //initialiseVoiceForUISegmentedControl(speechSettings.voice)
                
                initialiseVoiceForUIPicker(speechSettings.voice)
            }
        }
    }
    
    func initialiseVoiceForUISegmentedControl(voice: String) {
        if voice == "en-US" {
            self.voiceSegment.selectedSegmentIndex = 0
        }
        else {
            self.voiceSegment.selectedSegmentIndex = 1
        }
    }
    
    func initialiseVoiceForUIPicker(voice: String) {
        
        for index in 0..<AVSpeechSynthesisVoice.speechVoices().count {
            if AVSpeechSynthesisVoice.speechVoices()[index].language == voice {
                voicePicker.selectRow(index, inComponent: 0, animated: true)
            }
        }
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return AVSpeechSynthesisVoice.speechVoices()[row].language
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         return AVSpeechSynthesisVoice.speechVoices().count
    }
    

}
