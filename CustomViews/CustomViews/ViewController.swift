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



