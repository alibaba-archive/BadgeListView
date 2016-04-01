//
//  TagBadgeView.swift
//  Teambition
//
//  Created by DangGu on 16/1/5.
//  Copyright © 2016年 Teambition. All rights reserved.
//

import UIKit

struct Tag {
    var color: String
    var name: String
}

let tagImagePrefix: String = "boardCell_tag_icon_"
class TagBadgeView: BadgeView {
    var tbTag: Tag! {
        didSet {
            self.text = tbTag.name
            self.image = UIImage(named: tagImagePrefix + tbTag.color)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupProperty()
    }
    
    func setupProperty() {
//        backgroundImage = UIImage(asset: .BoardCell_tag_background)
//        textColor = BoardCardCellConstant.BadgeListView.tagTextColor
//        if Device.isPhone {
//            imageWidth = 4.0
//            textFont = UIFont.systemFontOfSize(10.0)
//        } else {
//            imageWidth = 5.0
//            textFont = UIFont.systemFontOfSize(12.0)
//        }
    }
    
    func drawTagIcon() {
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
