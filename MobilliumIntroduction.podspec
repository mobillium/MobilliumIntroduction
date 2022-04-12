Pod::Spec.new do |s|
  s.name             = 'MobilliumIntroduction'
  s.version          = '1.0.0'
  s.summary          = 'MobilliumIntroduction is an introduction / onboarding library which can customize'

  s.homepage         = 'https://github.com/mobillium/MobilliumIntroduction'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ahmetimirze' => 'ahmetimirze@gmail.com', 'aliozancilga' => 'ali.ozan.cilga@gmail.com' }
  s.source           = { :git => 'https://github.com/mobillium/MobilliumIntroduction.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/mobillium'
  
  s.ios.deployment_target = '11.0'
  s.swift_version = "5.0"
  s.source_files = 'Sources/MobilliumIntroduction/Classes/**/*'
end
