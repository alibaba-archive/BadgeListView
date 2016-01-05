//
//  ViewController.swift
//  BadgeListViewDemo
//
//  Created by DangGu on 15/12/22.
//  Copyright © 2015年 StormXX. All rights reserved.
//

import UIKit
import BadgeListView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let badge: BadgeView = BadgeView(frame: CGRectZero)
        badge.image = UIImage(named: "dueDate_icon")
        badge.backgroundImage = UIImage(named: "dueDate_background")
        badge.text = "16 Oct"
        badge.textColor = UIColor.whiteColor()
        badge.sizeToFit()
        
        let bbadge: BadgeView = BadgeView(frame: CGRectZero)
        bbadge.image = UIImage(named: "tag_icon")
        bbadge.backgroundImage = UIImage(named: "tag_background")
        bbadge.text = "交互设计"
        bbadge.textColor = UIColor.grayColor()
        bbadge.imageWidth = 5.0
        bbadge.sizeToFit()
        
        let cbadge: BadgeView = BadgeView(frame: CGRectZero)
        cbadge.image = UIImage(named: "subtask_icon")
        cbadge.imageWidth = 12.0
        cbadge.text = "2/3"
        cbadge.textColor = UIColor.grayColor()
        cbadge.sizeToFit()
        
        let frame = CGRect(x: 100, y: 100, width: 180, height: 30)
        let badgeListView: BadgeListView = BadgeListView(frame: frame)
        view.addSubview(badgeListView)
        badgeListView.addBadge(badge)
        badgeListView.addBadge(bbadge)
        badgeListView.addBadge(cbadge)
        badgeListView.layer.borderWidth = 1.0
        badgeListView.layer.borderColor = UIColor.grayColor().CGColor
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

