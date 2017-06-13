//
//  CarouselView.swift
//  CustomViews
//
//  Created by 周必稳 on 2017/5/25.
//  Copyright © 2017年 zbw. All rights reserved.
//

import UIKit

class CarouselView: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubViews() {
    
        let view1 = UIView()
        let view2 = UIView()
        let view3 = UIView()
        
    }
    
}


//MARK:- 外部调用函数
extension CarouselView {
    
}

fileprivate class CustomImageView : UIView {
    
    var image : UIImage?
    var transform3D : CATransform3D?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubViews() {
        let imageV = UIImageView(frame: self.frame)
        self.addSubview(imageV)
    }
}





