//
//  HowToPlayViewController.swift
//  Paranoia
//
//  Created by Emily Mearns on 5/23/18.
//  Copyright © 2018 em. All rights reserved.
//

import UIKit

final class HowToPlayViewController: UIViewController {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "How to Play"
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 24.0)
        label.textColor = .black
        return label
    }()
    
    private lazy var number1Label: UILabel = Constants.stepLabel(text: "1.")
    private lazy var number2Label: UILabel = Constants.stepLabel(text: "2.")
    private lazy var number3Label: UILabel = Constants.stepLabel(text: "3.")
    private lazy var number4Label: UILabel = Constants.stepLabel(text: "4.")
    
    private lazy var step1Label: UILabel = Constants.stepLabel(text: Constants.step1)
    private lazy var step2Label: UILabel = Constants.stepLabel(text: Constants.step2)
    private lazy var step3Label: UILabel = Constants.stepLabel(text: Constants.step3)
    private lazy var step4Label: UILabel = Constants.stepLabel(text: Constants.step4)
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        
        view.backgroundColor = Branding.hotPinkColor
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews() {
        view.addSubview(titleLabel)
        view.addSubview(number1Label)
        view.addSubview(number2Label)
        view.addSubview(number3Label)
        view.addSubview(number4Label)
        view.addSubview(step1Label)
        view.addSubview(step2Label)
        view.addSubview(step3Label)
        view.addSubview(step4Label)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        number1Label.translatesAutoresizingMaskIntoConstraints = false
        number2Label.translatesAutoresizingMaskIntoConstraints = false
        number3Label.translatesAutoresizingMaskIntoConstraints = false
        number4Label.translatesAutoresizingMaskIntoConstraints = false
        step1Label.translatesAutoresizingMaskIntoConstraints = false
        step2Label.translatesAutoresizingMaskIntoConstraints = false
        step3Label.translatesAutoresizingMaskIntoConstraints = false
        step4Label.translatesAutoresizingMaskIntoConstraints = false
        
        configureTitleLabelConstraints()
    }
    
    private func configureTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            number1Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            number1Label.topAnchor.constraint(equalTo: step1Label.topAnchor),
            number1Label.widthAnchor.constraint(equalToConstant: 20),
            
            step1Label.leadingAnchor.constraint(equalTo: number1Label.trailingAnchor, constant: 6),
            step1Label.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            step1Label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            number2Label.leadingAnchor.constraint(equalTo: number1Label.leadingAnchor),
            number2Label.topAnchor.constraint(equalTo: step2Label.topAnchor),
            
            step2Label.leadingAnchor.constraint(equalTo: step1Label.leadingAnchor),
            step2Label.topAnchor.constraint(equalTo: step1Label.bottomAnchor, constant: 12),
            step2Label.trailingAnchor.constraint(equalTo: step1Label.trailingAnchor),
            
            number3Label.leadingAnchor.constraint(equalTo: number2Label.leadingAnchor),
            number3Label.topAnchor.constraint(equalTo: step3Label.topAnchor),
            
            step3Label.leadingAnchor.constraint(equalTo: step2Label.leadingAnchor),
            step3Label.topAnchor.constraint(equalTo: step2Label.bottomAnchor, constant: 12),
            step3Label.trailingAnchor.constraint(equalTo: step2Label.trailingAnchor),
            
            number4Label.leadingAnchor.constraint(equalTo: number3Label.leadingAnchor),
            number4Label.topAnchor.constraint(equalTo: step4Label.topAnchor),
            
            step4Label.leadingAnchor.constraint(equalTo: step3Label.leadingAnchor),
            step4Label.topAnchor.constraint(equalTo: step3Label.bottomAnchor, constant: 12),
            step4Label.trailingAnchor.constraint(equalTo: step3Label.trailingAnchor),
        ])
    }
}

extension HowToPlayViewController {
    struct Constants {
        static func stepLabel(text: String) -> UILabel {
            let label = UILabel()
            label.font = UIFont(name: "HelveticaNeue", size: 18.0)
            label.text = text
            label.textColor = .black
            label.numberOfLines = 0
            return label
        }
        
        static var step1 = "Sit in a circle. The person with the phone whispers the question into the person’s ear to their left."
        static var step2 = "The person receiving the question must answer out loud using the name(s) of people in the room."
        static var step3 = "Press the Spin button. If it lands on “Yes”, the person who answered must say the question out loud. If it lands on “No”, the question will disappear and shouldn’t be revealed."
        static var step4 = "Pass the phone to the person on your left. The person hits the Next button and starts the next round."
    }
}
