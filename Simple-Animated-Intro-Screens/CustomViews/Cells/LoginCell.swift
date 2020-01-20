//
//  LoginCell.swift
//  Simple-Animated-Intro-Screens
//
//  Created by Darragh Blake on 19/01/2020.
//  Copyright © 2020 Darragh Blake. All rights reserved.
//

import UIKit
import Lottie


class LoginCell: UICollectionViewCell {
    
    var animatedView = AnimationView()
    let firstNameTF = UITextField()
    let lastNameTF = UITextField()
    let getStartedButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        configureAnimationView()
        configureFirstNameTextField()
        configureLastNameTextField()
        configureGetStartedButton()
    }
    
    func configureAnimationView() {
        animatedView = AnimationView(name: "profile")
        addSubview(animatedView)
        animatedView.loopMode = .loop
        animatedView.contentMode = .scaleAspectFit
        animatedView.play()
        animatedView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            animatedView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            animatedView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            animatedView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            animatedView.heightAnchor.constraint(equalToConstant: 500)
        ])
    }
    
    func configureFirstNameTextField() {
        addSubview(firstNameTF)
        firstNameTF.placeholder = "Enter First Name"
        firstNameTF.layer.borderColor = UIColor.lightGray.cgColor
        firstNameTF.layer.borderWidth = 2
        firstNameTF.layer.cornerRadius = 5
        firstNameTF.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            firstNameTF.topAnchor.constraint(equalTo: animatedView.bottomAnchor, constant: 20),
            firstNameTF.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            firstNameTF.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            firstNameTF.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func configureLastNameTextField() {
        addSubview(lastNameTF)
        lastNameTF.placeholder = "Enter Last Name"
        lastNameTF.layer.borderColor = UIColor.lightGray.cgColor
        lastNameTF.layer.borderWidth = 2
        lastNameTF.layer.cornerRadius = 5
        lastNameTF.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            lastNameTF.topAnchor.constraint(equalTo: firstNameTF.bottomAnchor, constant: 16),
            lastNameTF.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            lastNameTF.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            lastNameTF.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func configureGetStartedButton() {
        addSubview(getStartedButton)
        getStartedButton.backgroundColor = .systemRed
        getStartedButton.setTitle("Get Started", for: .normal)
        getStartedButton.setTitleColor(.white, for: .normal)
        getStartedButton.layer.cornerRadius = 15
        getStartedButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            getStartedButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            getStartedButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            getStartedButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            getStartedButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
