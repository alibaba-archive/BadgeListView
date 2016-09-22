//
//  BagdeView.swift
//  BadgeListView
//
//  Created by DangGu on 15/12/22.
//  Copyright © 2015年 StormXX. All rights reserved.
//

import UIKit

open class BadgeView: UIView {
    
    open var imageWidth: CGFloat = 10.0
    
    open var titleLeadingSpacing: CGFloat = 5
    open var titleTrailingSpacing: CGFloat = 5
    open var titleTopSpacing: CGFloat = 2
    open var titleBottomSpacing: CGFloat = 2
    open var imageLeadingSpacing: CGFloat = 5
    open var imageTrailingSpacing: CGFloat = 5
    open var maxWidth: CGFloat = 0
    
    open var textFont: UIFont = UIFont.systemFont(ofSize: 12.0) {
        didSet {
            titleLabel.font = textFont
        }
    }
    
    open var textColor: UIColor = UIColor.black {
        didSet {
            titleLabel.textColor = textColor
        }
    }
    
    open var text: String? {
        didSet {
            titleLabel.text = text
        }
    }
    
    open var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    
    open var backgroundImage: UIImage? {
        didSet {
            backgroundImageView.image = backgroundImage
        }
    }
    
    fileprivate lazy var imageView: UIImageView = {
        let imageView: UIImageView = UIImageView(frame: CGRect.zero)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    fileprivate lazy var backgroundImageView: UIImageView = {
        let imageView: UIImageView = UIImageView(frame: self.bounds)
        return imageView
    }()
    
    fileprivate lazy var titleLabel: UILabel = {
        let label: UILabel = UILabel(frame: CGRect.zero)
        label.textAlignment = .left
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
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
    
    fileprivate func commonInit() {
        self.backgroundColor = UIColor.clear
        addSubview(backgroundImageView)
        addSubview(imageView)
        addSubview(titleLabel)
        self.frame.size = intrinsicContentSize
    }

    override open var intrinsicContentSize : CGSize {
        var size = titleLabel.text?.size(attributes: [NSFontAttributeName: textFont]) ?? CGSize.zero
        size = CGSize(width: round(size.width), height: round(size.height))
        
        if !size.equalTo(CGSize.zero) {
            size.width += titleLeadingSpacing + titleTrailingSpacing
        } else {
            let height = round("t".size(attributes: [NSFontAttributeName: textFont]).height)
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
    
    open override func sizeToFit() {
        super.sizeToFit()
        self.frame.size = intrinsicContentSize
        resizeTitleLabel()
        resizeImageView()
        resizeBackgroundImageView()
    }
}
