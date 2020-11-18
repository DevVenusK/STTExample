//
//  SpeechRecognizer.swift
//  STTExample
//
//  Created by 김효성 on 2020/11/18.
//

import Speech

final class SpeechRecognizer: SFSpeechRecognizer {
    
    var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    var recognitionTsk: SFSpeechRecognitionTask?
    var audioEngine: AVAudioEngine = AVAudioEngine()
    
    override init?(locale: Locale) {
        super.init(locale: locale)
    }
}
