Pod::Spec.new do |s|
  s.name             = 'StravaSwift'
  s.version          = '0.7.1'
  s.summary          = 'A Swift library for the Strava API v3'
  s.description      = <<-DESC
A Swift library for the Strava API v3. For complete details visit the Strava developer site.
                       DESC
  s.homepage         = 'https://github.com/adeniszczyc/StravaSwift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Matthew Clarkson' => 'mpclarkson@gmail.com' }
  s.source           = { :git => 'https://github.com/adeniszczyc/StravaSwift', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/matt_pc'
  s.ios.deployment_target = '9.0'
  s.source_files = 'StravaSwift/**/*'
  s.dependency 'Alamofire', '~> 4'
  s.dependency 'SwiftyJSON', '~> 3'
end
