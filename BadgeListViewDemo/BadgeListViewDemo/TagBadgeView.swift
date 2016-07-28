//
//  TagBadgeView.swift
//  BadgeListViewDemo
//
//  Created by DangGu on 16/3/31.
//  Copyright © 2016年 StormXX. All rights reserved.
//

import UIKit
import BadgeListView

class TagBadgeView: BadgeView {
    var heyTag: Tag! {
        didSet {
            self.text = heyTag.name
            self.image = imageFromTagColor(heyTag.color)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.maxWidth = 170.0
        setupProperty()
    }
    
    func setupProperty() {
        imageWidth = 5.0
        imageTrailingSpacing = 0
        textFont = UIFont.systemFontOfSize(12.0)
        textColor = UIColor(red: 166/255.0, green: 166/255.0, blue: 166/255.0, alpha: 1.0)
//        backgroundImage = UIImage(named: "tag_background")
    }
    
    override func sizeToFit() {
        super.sizeToFit()
        setTagBackgroundImage()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TagBadgeView {
    private func setTagBackgroundImage() {
        let color = UIColor(red: 242/255.0, green: 242/255.0, blue: 242/255.0, alpha: 1.0)
        let rect = CGRect(origin: CGPoint.zero, size: bounds.size)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        let bezierPath = UIBezierPath(roundedRect: rect, cornerRadius: rect.size.height/2)
        CGContextSetFillColorWithColor(context, color.CGColor)
        bezierPath.fill()
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        backgroundImage = image
    }
    
    private func imageFromTagColor(colorString: String) -> UIImage {
        switch colorString {
        case "red" :
            return UIImage(named: "tag_icon")!
        case "yellow" :
            return UIImage(named: "tag_icon")!
        case "green" :
            return UIImage(named: "tag_icon")!
        case "blue" :
            return UIImage(named: "tag_icon")!
        case "purple" :
            return UIImage(named: "tag_icon")!
        default :
            return UIImage(named: "tag_icon")!
        }
    }
}

class Tag {
    var name: String
    var color: String
    
    init(name: String, color: String) {
        self.name = name
        self.color = color
    }
}
