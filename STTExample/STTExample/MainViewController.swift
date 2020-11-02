//
//  ViewController.swift
//  STTExample
//
//  Created by 김효성 on 2020/11/02.
//

import UIKit

final class MainViewController: UIViewController {

    var mainView: UIView?
    
    init(mainView: UIView) {
        super.init(nibName: nil, bundle: nil)
        self.mainView = mainView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension MainViewController {
    private func setupUI() {
        setupMainView()
    }
    
    private func setupMainView() {
        guard let mainView = mainView else { return }
        view.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        
        [mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
         mainView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
         mainView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
         mainView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)]
            .forEach { $0.isActive = true }
    }
}

