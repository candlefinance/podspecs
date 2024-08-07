Pod::Spec.new do |s|
  s.name         = 'swift-numerics'
  s.version      = '0.1.0'
  s.summary      = 'Machine Learning extensions for Swift.'
  s.description  = <<-DESC
                   A longer description of numerics.
                   DESC
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Author' => 'author@example.com' }
  s.source       = { :git => 'https://github.com/apple/swift-numerics.git', :branch => 'main' }
  s.ios.deployment_target = '16.0'
  s.source_files = 'Sources/**/*.{swift,h,m,cpp}'

  s.subspec '_NumericsShims' do |shims|
    shims.source_files = 'Sources/_NumericsShims/**/*.{swift,h,m,cpp,c}'
    shims.exclude_files = 'Sources/_NumericsShims/Tests/**/*'
    shims.public_header_files = 'Sources/_NumericsShims/**/*.h'
  end
end