
Pod::Spec.new do |s|

  s.name         = "RRRExtension"
  s.version      = "0.0.1"
  s.summary      = "个人使用的swift扩展汇集"


  s.description  = <<-DESC
                    个人使用的swift扩展汇集
                   DESC

  s.homepage     = "https://github.com/RRRenJ/RRRExtension"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "RRRenJ" => "https://github.com/RRRenJ" }


  s.source       = { :git => "https://github.com/RRRenJ/RRRExtension.git", :tag => s.version }

  s.public_header_files = "RRRMethod/RRRExtension.swift"

  s.source_files  = "RRRMethod/RRRMethod.swift"

  s.requires_arc = true

  s.frameworks   = 'UIKit', 'Foundation'

  s.platform     = :ios, "8.0"

  s.user_target_xcconfig = {'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'}

  s.xcconfig     = {'OTHER_LDFLAGS' => '-ObjC'}

  s.subspec 'RRRMethodConfige' do |ss|

  ss.source_files = 'RRRMethod/RRRMethodConfige/RRRMethodConfige.h'

  end


  s.subspec 'FactoryView' do |ss|

  ss.source_files = 'RRRMethod/FactoryView/*'

  end

  s.subspec 'FooterView' do |ss|

  ss.source_files = 'RRRMethod/FooterView/*'
  ss.dependency 'RRRMethod/FactoryView'
  ss.dependency 'RRRMethod/RRRMethodConfige'
  end

  s.subspec 'CountDownMethod' do |ss|

  ss.source_files = 'RRRMethod/CountDownMethod/*.{h,m}'


  end

  s.subspec 'CollcetionFlowLayout' do |ss|

  ss.source_files = 'RRRMethod/CollcetionFlowLayout/*.{h,m}'

  end

  s.subspec 'AVCompress' do |ss|

  ss.source_files = 'RRRMethod/AVCompress/*.{h,m}'


  end

  s.subspec 'VKMsgSend' do |ss|

  ss.source_files = 'RRRMethod/VKMsgSend/*.{h,m}'

  end

  s.subspec 'QRCode' do |ss|

  ss.source_files = 'RRRMethod/QRCode/*.{h,m}'

  end

  s.subspec 'RRRMBProgressHUD' do |ss|

  ss.source_files = 'RRRMethod/RRRMBProgressHUD/*.{h,m}'
  ss.resource     = 'RRRMethod/RRRMBProgressHUD/RRRMBProgressHUD.bundle'
  ss.dependency 'RRRMethod/RRRMethodConfige'
  ss.dependency 'MBProgressHUD'

  end
  s.subspec 'RRRLoadView' do |ss|

  ss.source_files = 'RRRMethod/RRRLoadView/*.{h,m}'
  ss.resource     = 'RRRMethod/RRRLoadView/RRRLoadView.bundle'
  ss.dependency 'RRRMethod/RRRMethodConfige'

  end

end
