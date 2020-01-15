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
    let primaryLabel = UILabel()
    let secondaryLabel = UILabel()
    let labelView = UIView()
    
    var page: Page? {
        didSet {
            guard let page = page else { return }
            
            configureAnimatedView(nameOfAnimation: page.animatedImage)
            primaryLabel.text = page.title
            secondaryLabel.text = page.message
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLabelView()
        configurePrimaryLabel()
        configureSecondaryLabel()
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
            animatedView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            animatedView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            animatedView.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
    
    func configureLabelView() {
        addSubview(labelView)
        labelView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            labelView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            labelView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            labelView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            labelView.heightAnchor.constraint(equalToConstant: 260)
        ])
    }
    
    func configurePrimaryLabel() {
        labelView.addSubview(primaryLabel)
        primaryLabel.text = "Welcome"
        primaryLabel.textAlignment = .center
        primaryLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        primaryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            primaryLabel.topAnchor.constraint(equalTo: labelView.topAnchor, constant: 40),
            primaryLabel.leadingAnchor.constraint(equalTo: labelView.leadingAnchor, constant: 20),
            primaryLabel.trailingAnchor.constraint(equalTo: labelView.trailingAnchor, constant: -20),
            primaryLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func configureSecondaryLabel() {
        labelView.addSubview(secondaryLabel)
        secondaryLabel.text = "This is far longer text that simply takes up a lot more of the screen than what is expected"
        secondaryLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        secondaryLabel.textAlignment = .center
        secondaryLabel.numberOfLines = 2
        secondaryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            secondaryLabel.topAnchor.constraint(equalTo: primaryLabel.bottomAnchor, constant: 20),
            secondaryLabel.leadingAnchor.constraint(equalTo: labelView.leadingAnchor, constant: 20),
            secondaryLabel.trailingAnchor.constraint(equalTo: labelView.trailingAnchor, constant: -20),
            secondaryLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
