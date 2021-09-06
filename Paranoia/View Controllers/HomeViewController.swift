//
//  HomeViewController.swift
//  Paranoia
//
//  Created by Emily Mearns on 5/23/18.
//  Copyright © 2018 em. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private lazy var logo: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "paranoia_icon")
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = Branding.hotPinkColor
        return imageView
    }()
    
    private lazy var playButton: UIButton = {
        let button = Branding.buildBlackButton()
        button.setTitle("Play", for: .normal)
        button.addTarget(self, action: #selector(playButtonTapped), for: [.touchUpInside])
        return button
    }()
    
    private lazy var howToPlayButton: UIButton = {
        let button = Branding.buildBlackButton()
        button.setTitle("How to Play", for: .normal)
        button.addTarget(self, action: #selector(howToPlayButtonTapped), for: [.touchUpInside])
        return button
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        
        view.backgroundColor = Branding.hotPinkColor
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func playButtonTapped() {
        let playVC = PlayingCardViewController()
        navigationController?.pushViewController(playVC, animated: false)
    }
    
    @objc private func howToPlayButtonTapped() {
        let howToPlayVC = HowToPlayViewController()
        navigationController?.pushViewController(howToPlayVC, animated: false)
    }
    
    private func setUpViews() {
        view.addSubview(logo)
        view.addSubview(playButton)
        view.addSubview(howToPlayButton)

        logo.translatesAutoresizingMaskIntoConstraints = false
        playButton.translatesAutoresizingMaskIntoConstraints = false
        howToPlayButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logo.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80),
            logo.widthAnchor.constraint(equalTo: view.widthAnchor),
            logo.heightAnchor.constraint(equalTo: logo.widthAnchor),
            
            playButton.centerXAnchor.constraint(equalTo: logo.centerXAnchor),
            playButton.topAnchor.constraint(equalTo: logo.bottomAnchor),
            playButton.widthAnchor.constraint(equalToConstant: 150),
            
            howToPlayButton.centerXAnchor.constraint(equalTo: playButton.centerXAnchor),
            howToPlayButton.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 20),
            howToPlayButton.widthAnchor.constraint(equalTo: playButton.widthAnchor),
        ])
    }
}
