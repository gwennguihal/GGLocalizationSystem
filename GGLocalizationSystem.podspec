#
# Be sure to run `pod lib lint GGLocalizationSystem.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "GGLocalizationSystem"
  s.version          = "1.0"
  s.summary          = "Localization manager to change language of iOS app on runtime."
  s.homepage         = "https://github.com/myrddinus/GGLocalizationSystem"
  s.license          = 'MIT'
  s.author           = { "GWENN GUIHAL" => "gwenn.guihal@gmail.com" }
  s.source           = { :git => "https://github.com/myrddinus/GGLocalizationSystem.git", :tag => 1.0 }
  s.social_media_url = 'https://twitter.com/_myrddin_'

  s.platform     = :ios, '6.0'
  s.requires_arc = true

  s.source_files = 'LocalizationSystem'

  # s.public_header_files = 'Pod/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
