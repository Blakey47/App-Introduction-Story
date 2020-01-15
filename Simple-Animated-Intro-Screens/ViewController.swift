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
    let animatedView = AnimationView(name: "thinking")
    var padding: CGFloat = 20
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .red
        cv.dataSource = self
        cv.delegate = self
        cv.isPagingEnabled = true
        return cv
    }()
    
    let cellId = "cellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configure()
        collectionView.register(CVPageCell.self, forCellWithReuseIdentifier: cellId)
    }
    

    func configure() {
        configureCollectionView()
    }
    
    func configureCollectionView() {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        
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


extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
}

