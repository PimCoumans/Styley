#
# Be sure to run `pod lib lint Styley.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "Styley"
  s.version          = "0.1.0"
  s.summary          = "Easy custom styling for NSAttributedStrings"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Instead of having to deal with substring and NSRanges, just tag some parts of you string with a number and provide a custom attributes dictionary for those numbers. Better description soon!
                       DESC

  s.homepage         = "https://github.com/PimCoumans/Styley"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Pim Coumans" => "pim@pixelrock.nl" }
  s.source           = { :git => "https://github.com/PimCoumans/Styley.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/pimcoumans'

  s.ios.deployment_target = '7.0'

  s.source_files = 'Styley/Classes/**/*'
  
  # s.resource_bundles = {
  #   'Styley' => ['Styley/Assets/*.png']
  # }

  s.public_header_files = 'Styley/Classes/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
