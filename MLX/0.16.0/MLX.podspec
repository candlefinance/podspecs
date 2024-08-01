Pod::Spec.new do |s|
  s.name         = 'MLX'
  s.version      = '0.16.0'
  s.summary      = 'A short description of MLX.'
  s.description  = <<-DESC
                   A longer description of MLX.
                   DESC
  s.homepage     = 'https://example.com/MLX'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Author' => 'author@example.com' }
  s.source       = { :git => 'https://example.com/MLX.git', :tag => s.version.to_s }
  s.ios.deployment_target = '10.0'
  s.source_files = 'Sources/**/*.{swift,h,m,cpp}'

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