//
//  PlayingCard.swift
//  Paranoia
//
//  Created by Emily Mearns on 5/25/18.
//  Copyright © 2018 em. All rights reserved.
//

import UIKit

final class PlayingCard: UIView {
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.borderWidth = 3.0
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.cornerRadius = 12.0
        return view
    }()
    
    private lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 24.0)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(contentView)
        contentView.addSubview(questionLabel)
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            questionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            questionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            questionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            questionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureQuestion(_ question: String) {
        questionLabel.text = question
    }
}
