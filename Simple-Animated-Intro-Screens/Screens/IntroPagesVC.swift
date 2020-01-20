//
//  ViewController.swift
//  Simple-Animated-Intro-Screens
//
//  Created by Darragh Blake on 14/01/2020.
//  Copyright © 2020 Darragh Blake. All rights reserved.
//

import UIKit
import Lottie

class IntroPagesVC: UIViewController {
    
    
    var padding: CGFloat = 20
    let cellId = "cellId"
    let loginCellId = "loginCellId"
    
    
    
    // MARK: Components
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .systemBackground
        cv.dataSource = self
        cv.delegate = self
        cv.isPagingEnabled = true
        return cv
    }()
    
    let pages: [Page] = {
        let firstPage = Page(title: "Welcome", message: "Join us on our simple journey of organising all of our daily tasks", animatedImage: "thinking")
        let secondPage = Page(title: "Get Stuff Done!", message: "A simple idea, yet having a massive impact!", animatedImage: "at-office")
        let thirdPage = Page(title: "Achieve Success!", message: "Close out those tasks for a better today, and an even better tomorrow!", animatedImage: "success")
        return [firstPage, secondPage, thirdPage]
    }()
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.pageIndicatorTintColor = .lightGray
        pc.currentPageIndicatorTintColor = .systemRed
        pc.numberOfPages = self.pages.count + 1
        return pc
    }()
    
    let skipButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Skip", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        return button
    }()
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        return button
    }()
    
    
    
    // MARK: ViewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configure()
    }
    
    
    
    // MARK: Functions
    
    private func registerCells() {
        collectionView.register(CVPageCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(LoginCell.self, forCellWithReuseIdentifier: loginCellId)
    }

    func configure() {
        registerCells()
        configureCollectionView()
        configurePageController()
        configureSkipButton()
        configureNextButton()
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
    
    func configurePageController() {
        view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding),
            pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            pageControl.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func configureSkipButton() {
        view.addSubview(skipButton)
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            skipButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            skipButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            skipButton.heightAnchor.constraint(equalToConstant: 50),
            skipButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureNextButton() {
        view.addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nextButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            nextButton.heightAnchor.constraint(equalToConstant: 50),
            nextButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let pageNumber = Int(targetContentOffset.pointee.x / view.frame.width)
        pageControl.currentPage = pageNumber
        
        if pageNumber == pages.count {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.pageControl.transform = CGAffineTransform(translationX: 0, y: 60)
                self.nextButton.transform = CGAffineTransform(translationX: 0, y: -80)
                self.skipButton.transform = CGAffineTransform(translationX: 0, y: -80)
            }, completion: nil)
        } else {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
                self.pageControl.transform = .identity
                self.nextButton.transform = .identity
                self.skipButton.transform = .identity
            }, completion: nil)
        }
    }

}

