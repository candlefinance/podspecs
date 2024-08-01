Pod::Spec.new do |s|
  s.name         = 'MLX'
  s.version      = '0.16.0'
  s.summary      = 'Machine Learning extensions for Swift.'
  s.description  = <<-DESC
                   MLX is a suite of machine learning utilities and extensions for Swift. 
                   It enhances and simplifies the development of machine learning applications.
                   DESC
  s.homepage     = 'https://github.com/ml-explore/mlx-swift'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Gary Tokman' => 'gary@candle.fi' }
  s.source       = { :git => 'https://github.com/ml-explore/mlx-swift.git', :branch => 'main', :submodules => true }
  s.platform     = :ios, '17.0'
  s.swift_version = '5.0'
  s.source_files = 'Sources/**/*.{swift}'
  s.exclude_files = 'Sources/Examples/**/*'
  s.resources = ['cmake/**/*', 'tools/**/*', 'Plugins/**/*']
end
