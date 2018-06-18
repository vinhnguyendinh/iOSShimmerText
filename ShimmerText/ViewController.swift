//
//  ViewController.swift
//  ShimmerText
//
//  Created by Vinh Nguyen on 6/15/18.
//  Copyright © 2018 Vinh Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(white: 1, alpha: 0.2)
        
        let darkTextLabel = UILabel()
        darkTextLabel.text = "Shimmer"
        darkTextLabel.font = UIFont.systemFont(ofSize: 80)
        darkTextLabel.textColor = UIColor(white: 1, alpha: 0.2)
        darkTextLabel.textAlignment = .center
        darkTextLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 400)

        view.addSubview(darkTextLabel)
        
        let shinnyTextLabel = UILabel()
        shinnyTextLabel.text = "Shimmer"
        shinnyTextLabel.font = UIFont.systemFont(ofSize: 80)
        shinnyTextLabel.textColor = .white
        shinnyTextLabel.textAlignment = .center
        shinnyTextLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 400)
        
        view.addSubview(shinnyTextLabel)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.white.cgColor, UIColor.clear.cgColor]
        gradientLayer.locations = [0, 0.5, 1]
        gradientLayer.frame = shinnyTextLabel.frame
        
        let angle = 45 * CGFloat.pi / 180
        gradientLayer.transform = CATransform3DMakeRotation(angle, 0, 0, 1)
        
        let animation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.fromValue = -shinnyTextLabel.frame.width
        animation.toValue = shinnyTextLabel.frame.width
        animation.duration = 2
        animation.repeatCount = Float.infinity
        
        gradientLayer.add(animation, forKey: "animationShimmer")
        
        shinnyTextLabel.layer.mask = gradientLayer
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

