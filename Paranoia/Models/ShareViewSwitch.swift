//
//  ShareViewSwitch.swift
//  Paranoia
//
//  Created by Emily Mearns on 7/29/18.
//  Copyright © 2018 em. All rights reserved.
//

import UIKit

final class ShareViewSwitch: UIView {
    
    private let contentView: UIView = UIView()
    private let shareView: UIView = Constants.createView(title: "Share!")
    private let dontShareView: UIView = Constants.createView(title: "Don't\nShare!")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .white
        
        addSubview(contentView)
        contentView.addSubview(shareView)
        contentView.addSubview(dontShareView)
        
        translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        shareView.translatesAutoresizingMaskIntoConstraints = false
        dontShareView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            shareView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 3),
            shareView.topAnchor.constraint(equalTo: topAnchor, constant: 3),
            shareView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3),
            shareView.heightAnchor.constraint(equalToConstant: 100),
            shareView.widthAnchor.constraint(equalToConstant: 100),
            
            dontShareView.leadingAnchor.constraint(equalTo: shareView.trailingAnchor, constant: 3),
            dontShareView.topAnchor.constraint(equalTo: shareView.topAnchor),
            dontShareView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -3),
            dontShareView.bottomAnchor.constraint(equalTo: shareView.bottomAnchor),
            dontShareView.heightAnchor.constraint(equalToConstant: 100),
            dontShareView.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animateBackground(share: Bool) {
        switch share {
        case true:
            animationLandsOnShare()
        case false:
            animationLandsOnDontShare()
        }
    }
    
    func resetBackgroundColors() {
        shareView.backgroundColor = Branding.hotPinkColor
        dontShareView.backgroundColor = Branding.hotPinkColor
    }
    
    private func animationLandsOnDontShare() {
        UIView.animate(withDuration: 0.2, delay: 0.0, options: [.repeat, .autoreverse], animations: {
            UIView.setAnimationRepeatCount(8)
            self.shareView.backgroundColor = .black
        }, completion: nil)
        
        UIView.animate(withDuration: 0.2, delay: 0.2, options: [.repeat, .autoreverse], animations: {
            UIView.setAnimationRepeatCount(8)
            self.dontShareView.backgroundColor = .black
        }, completion: { _ in
            self.dontShareView.backgroundColor = Branding.hotPinkColor
        })
    }
    
    private func animationLandsOnShare() {
        UIView.animate(withDuration: 0.2, delay: 0.0, options: [.repeat, .autoreverse], animations: {
            UIView.setAnimationRepeatCount(8)
            self.dontShareView.backgroundColor = .black
        }, completion: nil)
        
        UIView.animate(withDuration: 0.2, delay: 0.2, options: [.repeat, .autoreverse], animations: {
            UIView.setAnimationRepeatCount(8)
            self.shareView.backgroundColor = .black
        }, completion: { _ in
            self.shareView.backgroundColor = Branding.hotPinkColor
        })
    }
}

private extension ShareViewSwitch {
    
    struct Constants {
        static func createView(title: String) -> UIView {
            let view = UIView()
            view.backgroundColor = Branding.hotPinkColor
            view.layer.cornerRadius = 4.0
            
            let label = UILabel()
            label.text = title
            label.textColor = .white
            label.font = UIFont.boldSystemFont(ofSize: 18)
            label.numberOfLines = 0
            label.textAlignment = .center
            
            view.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            
            return view
        }
    }
}
