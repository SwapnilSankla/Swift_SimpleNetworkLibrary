#
# Be sure to run `pod lib lint Swift_SimpleNetworkLibrary.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Swift_SimpleNetworkLibrary'
  s.version          = '0.5.0'
  s.summary          = 'A simple and lightweight network library.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A simple and lightweight network library. The intent is also demonstrate how easy it is to build a network layer based on URLSession. Mostly on projects we use libraries like Alamofire but never explore how things actually work under the hood.
                       DESC

  s.homepage         = 'https://github.com/SwapnilSankla/Swift_SimpleNetworkLibrary'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Swapnil Sankla' => 'swapnil.sankla@gmail.com' }
  s.source           = { :git => 'https://github.com/SwapnilSankla/Swift_SimpleNetworkLibrary.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/swapnil_sankla'

  s.ios.deployment_target = '10.0'

  s.source_files = 'Swift_SimpleNetworkLibrary/Classes/**/*'
  s.swift_version = '3.2'
  
  # s.resource_bundles = {
  #   'Swift_SimpleNetworkLibrary' => ['Swift_SimpleNetworkLibrary/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
end
