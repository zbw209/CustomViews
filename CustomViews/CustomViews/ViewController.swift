//
//  ViewController.swift
//  CustomViews
//
//  Created by 周必稳 on 2017/5/25.
//  Copyright © 2017年 zbw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var textField2: UITextField!
    
    var lastPoint = CGPoint.zero

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    func loadPieView() {
        let piev = PiechartView.pieChartView(withFrame: self.view.bounds)
        view.addSubview(piev!)
        piev?.showAnimation()
    }
    
    func panGestureAction(panGesture : UIPanGestureRecognizer) {
    
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        
        
        print(textField.text!)
        var transform = CATransform3DIdentity

        transform.m34 = CGFloat(Float(-1.0 / Float(textField2.text!)!))
        transform = CATransform3DRotate(transform, CGFloat(M_PI_4 * Double(textField.text!)!), 0, 1, 0)
        
        imageView.layer.transform = transform
        print(imageView.layer)
        
    }
}



//        let center = CGPoint(x: imageView.center.x, y: imageView.frame.origin.y)
//
//        imageView.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
//
//        imageView.layer.position = center
//
//        print(imageView.layer.position)

//        let animate = CABasicAnimation.init(keyPath: "transform.rotation.z")
//        animate.repeatCount = MAXFLOAT
//        animate.fromValue = -M_PI_4 //CGAffineTransform(rotationAngle: -(CGFloat)(M_PI_2))
//        animate.toValue = M_PI_4 //CGAffineTransform(rotationAngle: (CGFloat)(M_PI_2))
//
//        animate.duration = 1.0
//        animate.autoreverses = true
//        animate.isRemovedOnCompletion = false
//        imageView.layer.add(animate, forKey: "")

