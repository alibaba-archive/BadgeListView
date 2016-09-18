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
    
    var badgeListView: BadgeListView = BadgeListView(frame: CGRect(x: 100, y: 100, width: 180, height: 200))

    override func viewDidLoad() {
        super.viewDidLoad()
        badgeListView.edgeInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        let badge: BadgeView = BadgeView(frame: CGRect.zero, maxWidth: 170)
        badge.imageTrailingSpacing = 0
        badge.titleTrailingSpacing = 10
        badge.image = UIImage(named: "dueDate_icon")
        badge.backgroundImage = UIImage(named: "dueDate_background")
        badge.text = "16 Oct"
        badge.textColor = UIColor.white
        badge.sizeToFit()
        
        let bbadge: BadgeView = BadgeView(frame: CGRect.zero)
        bbadge.image = UIImage(named: "tag_icon")
        bbadge.backgroundImage = UIImage(named: "tag_background")
        bbadge.text = "交互设计"
        bbadge.textColor = UIColor.gray
        bbadge.imageWidth = 5.0
        bbadge.sizeToFit()
        
        let tag1 = Tag(name: "交互设计11111111111111111111111111111111111111111", color: "green")
        let tag2 = Tag(name: "iOS", color: "red")
        let tag3 = Tag(name: "Design", color: "yellow")
        let tag4 = Tag(name: "Design", color: "gray")
        let tag5 = Tag(name: "Design", color: "purple")
        let tag6 = Tag(name: "Design", color: "red")
        
        let tag1Badge: TagBadgeView = TagBadgeView(frame: CGRect.zero)
        tag1Badge.heyTag = tag1
        tag1Badge.sizeToFit()
        
        let tag2Badge: TagBadgeView = TagBadgeView(frame: CGRect.zero)
        tag2Badge.heyTag = tag2
        tag2Badge.sizeToFit()
        
        let tag3Badge: TagBadgeView = TagBadgeView(frame: CGRect.zero)
        tag3Badge.heyTag = tag3
        tag3Badge.sizeToFit()
        
        let tag4Badge: TagBadgeView = TagBadgeView(frame: CGRect.zero)
        tag4Badge.heyTag = tag4
        tag4Badge.sizeToFit()
        
        let tag5Badge: TagBadgeView = TagBadgeView(frame: CGRect.zero)
        tag5Badge.heyTag = tag5
        tag5Badge.sizeToFit()
        
        let tag6Badge: TagBadgeView = TagBadgeView(frame: CGRect.zero)
        tag6Badge.heyTag = tag6
        tag6Badge.sizeToFit()
        
        let cbadge: BadgeView = BadgeView(frame: CGRect.zero)
        cbadge.image = UIImage(named: "subtask_icon")
        cbadge.imageWidth = 12.0
        cbadge.text = "2/15"
        cbadge.textColor = UIColor.gray
        cbadge.sizeToFit()
        
        view.addSubview(badgeListView)
        badgeListView.addBadge(badge)
        badgeListView.addBadge(cbadge)
        badgeListView.addBadge(tag1Badge)
        badgeListView.addBadge(tag2Badge)
        badgeListView.addBadge(tag3Badge)
        badgeListView.addBadge(tag4Badge)
        badgeListView.addBadge(tag5Badge)
        badgeListView.addBadge(tag6Badge)
        badgeListView.layer.borderWidth = 1.0
        badgeListView.layer.borderColor = UIColor.gray.cgColor
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

