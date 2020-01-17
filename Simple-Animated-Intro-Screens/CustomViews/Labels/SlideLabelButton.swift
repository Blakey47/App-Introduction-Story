//
//  SlideLabelButton.swift
//  Simple-Animated-Intro-Screens
//
//  Created by Darragh Blake on 14/01/2020.
//  Copyright © 2020 Darragh Blake. All rights reserved.
//

import UIKit

class SlideLabelButton: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(text: String) {
        super.init(frame: .zero)
        self.text = text
        configure()
    }
    
    func configure() {
        numberOfLines = 3
        translatesAutoresizingMaskIntoConstraints = false
        textAlignment = .center
    }
    
}
