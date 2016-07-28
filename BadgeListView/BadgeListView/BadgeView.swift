//
//  BagdeView.swift
//  BadgeListView
//
//  Created by DangGu on 15/12/22.
//  Copyright © 2015年 StormXX. All rights reserved.
//

import UIKit

public class BadgeView: UIView {
    
    public var imageWidth: CGFloat = 10.0
    
    public var titleLeadingSpacing: CGFloat = 5
    public var titleTrailingSpacing: CGFloat = 5
    public var titleTopSpacing: CGFloat = 2
    public var titleBottomSpacing: CGFloat = 2
    public var imageLeadingSpacing: CGFloat = 5
    public var imageTrailingSpacing: CGFloat = 5
    public var maxWidth: CGFloat = 0
    
    public var textFont: UIFont = UIFont.systemFontOfSize(12.0) {
        didSet {
            titleLabel.font = textFont
        }
    }
    
    public var textColor: UIColor = UIColor.blackColor() {
        didSet {
            titleLabel.textColor = textColor
        }
    }
    
    public var text: String? {
        didSet {
            titleLabel.text = text
        }
    }
    
    public var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    
    public var backgroundImage: UIImage? {
        didSet {
            backgroundImageView.image = backgroundImage
        }
    }
    
    private lazy var imageView: UIImageView = {
        let imageView: UIImageView = UIImageView(frame: CGRectZero)
        imageView.contentMode = .ScaleAspectFit
        return imageView
    }()
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView: UIImageView = UIImageView(frame: self.bounds)
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label: UILabel = UILabel(frame: CGRectZero)
        label.textAlignment = .Left
        label.font = self.textFont
        label.numberOfLines = 1
        return label
    }()

    convenience public init(frame: CGRect, maxWidth: CGFloat) {
        self.init(frame: frame)
        self.maxWidth = maxWidth
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
    
    private func commonInit() {
        self.backgroundColor = UIColor.clearColor()
        addSubview(backgroundImageView)
        addSubview(imageView)
        addSubview(titleLabel)
        self.frame.size = intrinsicContentSize()
    }

    override public func intrinsicContentSize() -> CGSize {
        var size = titleLabel.text?.sizeWithAttributes([NSFontAttributeName: textFont]) ?? CGSize.zero
        size = CGSize(width: round(size.width), height: round(size.height))
        
        if !CGSizeEqualToSize(size, CGSize.zero) {
            size.width += titleLeadingSpacing + titleTrailingSpacing
        } else {
            let height = round("t".sizeWithAttributes([NSFontAttributeName: textFont]).height)
            size.height += height
        }
        size.height += titleTopSpacing + titleBottomSpacing
        if let _ = image {
            size.width += imageLeadingSpacing + imageWidth + imageTrailingSpacing
        }
        if size.width > maxWidth && maxWidth != 0 {
            size.width = maxWidth
        }
        return size
    }
    
    func resizeTitleLabel() {
        var titleLabelMaxWidth = maxWidth
        if let _ = image {
            titleLabel.frame = CGRect(x: imageLeadingSpacing + imageWidth + imageTrailingSpacing + titleLeadingSpacing, y: titleTopSpacing, width: 0, height: 0)
            titleLabelMaxWidth -= imageLeadingSpacing + imageWidth + imageTrailingSpacing + titleLeadingSpacing
        } else {
            titleLabel.frame = CGRect(x: titleLeadingSpacing, y: titleTopSpacing, width: 0, height: 0)
        }
        titleLabel.sizeToFit()
        if titleLabel.width > titleLabelMaxWidth && maxWidth != 0 {
            titleLabel.frame.size.width = titleLabelMaxWidth
        }
    }
    
    func resizeBackgroundImageView() {
        backgroundImageView.frame = self.bounds
    }
    
    func resizeImageView() {
        let y: CGFloat = titleLabel.text != nil ? (titleLabel.center.y - imageWidth/2) : (self.height/2 - imageWidth/2)
        if let _ = image {
            imageView.frame = CGRect(x: imageLeadingSpacing, y: y, width: imageWidth, height: imageWidth)
        } else {
            imageView.frame = CGRect(x: imageLeadingSpacing, y: y, width: 0, height: 0)
        }
    }
    
    public override func sizeToFit() {
        super.sizeToFit()
        self.frame.size = intrinsicContentSize()
        resizeTitleLabel()
        resizeImageView()
        resizeBackgroundImageView()
    }
}
