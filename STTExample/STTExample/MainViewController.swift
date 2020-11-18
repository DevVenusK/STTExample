//
//  ViewController.swift
//  STTExample
//
//  Created by 김효성 on 2020/11/02.
//

import UIKit
import Speech

final class MainViewController: UIViewController {

    var mainView: UIView?
    var speechRecognizer: SFSpeechRecognizer?
    
    init(mainView: UIView, speechRecognizer: SFSpeechRecognizer) {
        super.init(nibName: nil, bundle: nil)
        self.mainView = mainView
        self.speechRecognizer = speechRecognizer
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        speechRecognizer?.delegate = self
        setupUI()
    }
}

extension MainViewController {
    private func setupUI() {
        setupMainView()
    }
    
    private func setupMainView() {
        guard let mainView = mainView as? MainView else { return }
        view.addSubview(mainView)
        
        mainView.delegate = self
        mainView.translatesAutoresizingMaskIntoConstraints = false
        
        [mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
         mainView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
         mainView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
         mainView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)]
            .forEach { $0.isActive = true }
    }
}

extension MainViewController {
    private func startRecording() {
        guard let speechRecognizer = speechRecognizer as? SpeechRecognizer else { return }

        if speechRecognizer.recognitionTsk != nil {
            speechRecognizer.recognitionTsk?.cancel()
            speechRecognizer.recognitionTsk = nil
            
            let audioSession = AVAudioSession.sharedInstance()
            do {
                try audioSession.setCategory(.record)
                try audioSession.setMode(.measurement)
                try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
            } catch {
                print("Error")
            }
            
            speechRecognizer.recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
            
             let inputNode = speechRecognizer.audioEngine.inputNode
            
            guard let recognitionRequest = speechRecognizer.recognitionRequest else { print("error"); return }
            recognitionRequest.shouldReportPartialResults = true
            
            speechRecognizer.recognitionTsk = speechRecognizer.recognitionTask(with: recognitionRequest, resultHandler: { (result, error) in
                
                var isFinal = false
                if result != nil {
                    print(result?.bestTranscription.formattedString)
                    isFinal = result!.isFinal
                }
                
                if error != nil || isFinal {
                    speechRecognizer.audioEngine.stop()
                    inputNode.removeTap(onBus: 0)
                    
                    speechRecognizer.recognitionRequest = nil
                    speechRecognizer.recognitionTsk = nil
                }
                
                let recordingFormat = inputNode.outputFormat(forBus: 0)
                
                inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, when) in
                    
                    recognitionRequest.append(buffer)
                }
                
                speechRecognizer.audioEngine.prepare()
                
                do {
                    try speechRecognizer.audioEngine.start()
                } catch {
                    print("error")
                }
            })
        }
    }
}

extension MainViewController: MainViewAction {
    func didTapButton(_ sender: UIButton) {
        guard let speechRecognizer = speechRecognizer as? SpeechRecognizer else { print("error"); return }
        if speechRecognizer.audioEngine.isRunning {
            
            speechRecognizer.audioEngine.stop()
            speechRecognizer.recognitionRequest?.endAudio()
            
            print(speechRecognizer.audioEngine.isRunning)
        } else {
            print("start")
            startRecording()
        }
    }
}

extension MainViewController: SFSpeechRecognizerDelegate {
    
}
