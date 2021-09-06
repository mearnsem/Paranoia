//
//  Branding.swift
//  Paranoia
//
//  Created by Emily Mearns on 6/18/18.
//  Copyright © 2018 em. All rights reserved.
//

import UIKit

struct Branding {
    
    static let hotPinkColor: UIColor = UIColor(red: 1.0, green: 0.0, blue: 0.522, alpha: 1.0)
    
    static let activeButtonColor: UIColor = .black
    static let disableButtonColor: UIColor = .gray
    
    static func buildBlackButton() -> UIButton {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.black, for: .disabled)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = .black
        button.layer.cornerRadius = 4.0
        return button
    }
}
