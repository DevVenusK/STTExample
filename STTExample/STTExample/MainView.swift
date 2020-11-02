//
//  mainView.swift
//  STTExample
//
//  Created by 김효성 on 2020/11/02.
//

import UIKit

final class MainView: UIView {
    
    private let textView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        return textView
    }()
    
    private let STTButton: UIButton = {
        let button = UIButton()
        button.setTitle("Start", for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
}

extension MainView {
    private func setupUI() {
        setupTextView()
        setupSTTButton()
    }
    
    private func setupTextView() {
        addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        [textView.centerXAnchor.constraint(equalTo: centerXAnchor),
         textView.centerYAnchor.constraint(equalTo: centerYAnchor),
         textView.widthAnchor.constraint(equalToConstant: 300),
         textView.heightAnchor.constraint(equalToConstant: 300)]
            .forEach { $0.isActive = true }
    }
    
    private func setupSTTButton() {
        addSubview(STTButton)
        STTButton.translatesAutoresizingMaskIntoConstraints = false
        
        [STTButton.centerXAnchor.constraint(equalTo: centerXAnchor),
         STTButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
         STTButton.widthAnchor.constraint(equalToConstant: 120),
         STTButton.heightAnchor.constraint(equalToConstant: 40)]
            .forEach { $0.isActive = true }
    }
}
