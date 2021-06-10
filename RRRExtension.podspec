
Pod::Spec.new do |s|

  s.name         = "RRRExtension"
  s.version      = "1.0.1"
  s.summary      = "个人使用的swift扩展汇集"
  s.description  = <<-DESC
                    个人使用的swift扩展汇集
                   DESC
  s.homepage     = "https://github.com/RRRenJ/RRRExtension"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "RRRenJ" => "https://github.com/RRRenJ" }
  s.source       = { :git => "https://github.com/RRRenJ/RRRExtension.git", :tag => s.version }


  s.source_files  = "RRRExtension/*.swift"
  s.frameworks   = 'UIKit', 'Foundation'
  s.swift_version = '5.0'
  s.ios.deployment_target = '9.0'


end
