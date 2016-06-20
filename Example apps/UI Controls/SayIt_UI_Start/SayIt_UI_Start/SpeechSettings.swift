//
//  Settings.swift
//  SayIt_UI_Start
//
//  Created by Neil Taylor on 20/06/2016.
//  Copyright © 2016 Aberystwyth University. All rights reserved.
//

import Foundation

class SpeechSettings {

    // Lots of choices here, specified in AVSpeechSynthesisVoice.speechVoices
    var voice = "en-US"
    
    // This is in the range of AVSpeechUtteranceMinimumSpeechRate and AVSpeechUtteranceMaximumSpeechRate
    var rate: Float = 1.0
    
    // This in the range of 0.0 (silent) to 1.0 (full volume)
    var volume: Float = 1.0
    
}