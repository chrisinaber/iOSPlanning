//
//  SpeechDelegate.swift
//  SayIt
//
//  Created by Neil Taylor on 16/06/2016.
//  Copyright © 2016 Aberystwyth University. All rights reserved.
//
import AVFoundation

/**
 * Converts an NSRange struct (Objective-C type) into a 
 * Range for the Index on a String (written as Range<String.Index>).
 * 
 * The following String extension is taken from 
 * http://stackoverflow.com/questions/25138339/nsrange-to-rangestring-index
 * 
 * NSRange contains two items of information: location and length. The location is
 * start of the range. Adding the length to the location will give the end of the 
 * range. This is mapped onto the underlying UTF16 mapping of characters in the
 */
extension String {
    func rangeFromNSRange(nsRange : NSRange) -> Range<String.Index>? {
        let from16 = utf16.startIndex.advancedBy(nsRange.location, limit: utf16.endIndex)
        let to16 = from16.advancedBy(nsRange.length, limit: utf16.endIndex)
        if let from = String.Index(from16, within: self),
            let to = String.Index(to16, within: self) {
            return from ..< to
        }
        return nil
    }
}

class SpeechDelegate: NSObject, AVSpeechSynthesizerDelegate {
    
    var speechController: SpeechViewController?
    
    func speechSynthesizer(synthesizer: AVSpeechSynthesizer, didStartSpeechUtterance utterance: AVSpeechUtterance) {
        speechController?.showStatus("Starting...")
    }
    
    func speechSynthesizer(synthesizer: AVSpeechSynthesizer, didFinishSpeechUtterance utterance: AVSpeechUtterance) {
        speechController?.showStatus("finished saying \"\(utterance.speechString)\"")
    }
    
    func speechSynthesizer(synthesizer: AVSpeechSynthesizer,
                           willSpeakRangeOfSpeechString characterRange: NSRange,
                                                             utterance: AVSpeechUtterance) {
        if let theRange = utterance.speechString.rangeFromNSRange(characterRange) {
           speechController?.showStatus("Speaking: \(utterance.speechString.substringWithRange(theRange))")
        }
    }
    
}