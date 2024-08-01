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
  s.default_subspecs = 'Cmlx', 'MLX', 'MLXFFT', 'MLXFast', 'MLXLinalg', 'MLXNN', 'MLXOptimizers', 'MLXRandom', 'Tools'

  s.subspec 'Cmlx' do |cm|
    cm.source_files = 'Sources/Cmlx/**/*.{swift,h,m,cpp}'
  end

  s.subspec 'MLX' do |mlx|
    mlx.source_files = 'Sources/MLX/**/*.{swift}'
  end

  s.subspec 'MLXFFT' do |ff|
    ff.source_files = 'Sources/MLXFFT/**/*.{swift}'
  end

  s.subspec 'MLXFast' do |fast|
    fast.source_files = 'Sources/MLXFast/**/*.{swift}'
  end

  s.subspec 'MLXLinalg' do |linalg|
    linalg.source_files = 'Sources/MLXLinalg/**/*.{swift}'
  end

  s.subspec 'MLXNN' do |nn|
    nn.source_files = 'Sources/MLXNN/**/*.{swift}'
  end

  s.subspec 'MLXOptimizers' do |opt|
    opt.source_files = 'Sources/MLXOptimizers/**/*.{swift}'
  end

  s.subspec 'MLXRandom' do |rnd|
    rnd.source_files = 'Sources/MLXRandom/**/*.{swift}'
  end

  s.subspec 'Tools' do |tools|
    tools.source_files = 'Sources/Tools/**/*.{swift}'
  end

end
