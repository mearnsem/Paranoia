//
//  PlayingCardViewController.swift
//  Paranoia
//
//  Created by Emily Mearns on 5/25/18.
//  Copyright © 2018 em. All rights reserved.
//

import UIKit

final class PlayingCardViewController: UIViewController {
    
    private let playingCard = PlayingCard()
    private let questions = Questions()
    private let shareSwitch = ShareViewSwitch()
    
    private lazy var spinButton: UIButton = {
        let button = Branding.buildBlackButton()
        button.setTitle("Spin", for: .normal)
        button.addTarget(self, action: #selector(performCoinFlip), for: [.touchUpInside])
        return button
    }()
    
    private lazy var nextButton: UIButton = {
        let button = Branding.buildBlackButton()
        button.setTitle("Next Card", for: .normal)
        button.addTarget(self, action: #selector(generateRandomQuestion), for: [.touchUpInside])
        return button
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        
        setUpViews()
        configureConstraints()
        generateRandomQuestion()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews() {
        view.backgroundColor = Branding.hotPinkColor
        
        view.addSubview(playingCard)
        view.addSubview(spinButton)
        view.addSubview(nextButton)
        view.addSubview(shareSwitch)
        
        playingCard.translatesAutoresizingMaskIntoConstraints = false
        spinButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        shareSwitch.translatesAutoresizingMaskIntoConstraints = false
        
        shareSwitch.alpha = 0
        shareSwitch.clipsToBounds = true
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            playingCard.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            playingCard.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playingCard.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.625),
            playingCard.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.70),
            
            spinButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinButton.topAnchor.constraint(equalTo: playingCard.bottomAnchor, constant: 30),
            spinButton.widthAnchor.constraint(equalToConstant: 150),
            
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.topAnchor.constraint(equalTo: spinButton.bottomAnchor, constant: 20),
            nextButton.widthAnchor.constraint(equalTo: spinButton.widthAnchor),
            
            shareSwitch.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            shareSwitch.centerYAnchor.constraint(equalTo: playingCard.centerYAnchor),
        ])
    }
    
    @objc private func performCoinFlip() {
        
        spinButton.isEnabled = false
        spinButton.backgroundColor = Branding.disableButtonColor
        
        let share = Bool.random()
        shareSwitch.animateBackground(share: share)
        
        UIView.animate(withDuration: 1.0, delay: 0.0, animations: {
            self.shareSwitch.alpha = 1.0
        }, completion: { _ in
            UIView.animate(withDuration: 1.0, delay: 4.5, animations: {
                self.shareSwitch.alpha = 0.0
            }, completion: { _ in
                self.nextButton.isEnabled = true
                self.nextButton.backgroundColor = Branding.activeButtonColor
            })
        })

        print(share)
        if share == false {
            animateCardFadeOut()
        }
    }
    
    @objc private func generateRandomQuestion() {
        shareSwitch.resetBackgroundColors()
        
        let randomIndex = Int(arc4random_uniform(UInt32(questions.all.count)))
        playingCard.configureQuestion(questions.all[randomIndex])
        
        if playingCard.alpha == 0 {
            animateCardFadeIn()
        }
        
        nextButton.isEnabled = false
        nextButton.backgroundColor = Branding.disableButtonColor
        
        spinButton.isEnabled = true
        spinButton.backgroundColor = Branding.activeButtonColor
    }
    
    // Animations
    
    private func animateCardFadeOut() {
        UIView.animate(withDuration: 0.5, delay: 5.5, animations: {
            self.playingCard.alpha = 0
        })
    }
    
    private func animateCardFadeIn() {
        UIView.animate(withDuration: 0.5, animations: {
            self.playingCard.alpha = 1.0
        })
    }
}
