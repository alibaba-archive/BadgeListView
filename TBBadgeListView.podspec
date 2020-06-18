Pod::Spec.new do |spec|

  spec.name         = "TBBadgeListView"
  spec.version      = "2.4.0"
  spec.summary      = "TBBadgeListView is a custom badge list view."

  spec.homepage     = "https://github.com/teambition/BadgeListView"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "bruce" => "liangming.zlm@alibaba-inc.com" }
  spec.platform     = :ios, "8.0"
  spec.source       = { :git => "https://github.com/teambition/BadgeListView.git", :tag => "#{spec.version}" }
  spec.swift_version = "5.0"

  spec.source_files  = "BadgeListView/BadgeListView/*.swift"
  spec.frameworks   = "Foundation", "UIKit"

end
