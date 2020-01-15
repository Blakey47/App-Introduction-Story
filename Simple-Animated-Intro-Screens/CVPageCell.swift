//
//  PageCellCollectionViewCell.swift
//  Simple-Animated-Intro-Screens
//
//  Created by Darragh Blake on 15/01/2020.
//  Copyright © 2020 Darragh Blake. All rights reserved.
//

import UIKit
import Lottie

class CVPageCell: UICollectionViewCell {
    
    var animatedView = AnimationView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureAnimatedView(nameOfAnimation: "thinking")
    }
    
    init(nameOfAnimation: String) {
        super.init(frame: .zero)
        configureAnimatedView(nameOfAnimation: nameOfAnimation)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureAnimatedView(nameOfAnimation: String) {
        animatedView = AnimationView(name: nameOfAnimation)
        addSubview(animatedView)
        animatedView.loopMode = .loop
        animatedView.contentMode = .scaleAspectFit
        animatedView.play()
        animatedView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            animatedView.topAnchor.constraint(equalTo: topAnchor, constant: 200),
            animatedView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            animatedView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            animatedView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
}
