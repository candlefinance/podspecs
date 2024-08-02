Pod::Spec.new do |s|
  s.name              = 'MLXNN'
  s.version           = '0.1.0'
  s.summary           = 'Machine Learning extensions for Swift with Metal backend.'
  s.description       = <<-DESC
                        mlx-swift provides a comprehensive set of machine learning utilities and extensions for Swift, leveraging Metal for backend processing. It includes multiple modules for various aspects of machine learning applications.
                        DESC
  s.homepage          = 'https://github.com/ml-explore/mlx-swift'
  s.license           = { :type => 'MIT', :file => 'LICENSE' }
  s.author            = { 'gary' => 'gary@candle.fi' }
  s.source            = { :git => 'https://github.com/ml-explore/mlx-swift.git', :branch => 'main', submodules: true }
  s.platforms         = { :ios => '16.0', :macos => '13.3' }
  s.swift_version     = '5.9'
  s.requires_arc      = true

  s.source_files = 'Source/MLXNN/**/*.{swift}'
  s.exclude_files = 'Source/MLXFastNN/**/*.md'
end
