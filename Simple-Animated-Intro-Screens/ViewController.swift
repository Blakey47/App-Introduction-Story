//
//  ViewController.swift
//  Simple-Animated-Intro-Screens
//
//  Created by Darragh Blake on 14/01/2020.
//  Copyright © 2020 Darragh Blake. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    let firstSlideLabel = SlideLabelButton(text: "Welcome")
    let animatedView = AnimationView(name: "welcome")
    var padding: CGFloat = 20
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .systemRed
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configure()
    }

    func configure() {
        view.addSubview(collectionView)
//        configureFirstSlideLabel()
//        configureFirstAnimatedView()
    }
    
//    func configureFirstSlideLabel() {
//        view.addSubview(firstSlideLabel)
//
//        NSLayoutConstraint.activate([
//            firstSlideLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
//            firstSlideLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
//            firstSlideLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
//            firstSlideLabel.heightAnchor.constraint(equalToConstant: 200)
//        ])
//    }
//
//    func configureFirstAnimatedView() {
//        view.addSubview(animatedView)
//        animatedView.contentMode = .scaleAspectFit
//        animatedView.translatesAutoresizingMaskIntoConstraints = false
//        animatedView.loopMode = .loop
//        animatedView.play()
//
//        NSLayoutConstraint.activate([
//            animatedView.topAnchor.constraint(equalTo: firstSlideLabel.bottomAnchor, constant: padding),
//            animatedView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
//            animatedView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
//            animatedView.heightAnchor.constraint(equalToConstant: 400)
//        ])
//    }

}

