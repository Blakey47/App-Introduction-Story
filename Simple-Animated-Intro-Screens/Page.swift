//
//  Page.swift
//  Simple-Animated-Intro-Screens
//
//  Created by Darragh Blake on 15/01/2020.
//  Copyright © 2020 Darragh Blake. All rights reserved.
//

import Foundation

struct Page {
    let title: String
    let message: String
    let animatedImage: String
    
    init(title: String, message: String, animatedImage: String) {
        self.title = title
        self.message = message
        self.animatedImage = animatedImage
    }
}
