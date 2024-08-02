Pod::Spec.new do |s|
  s.name              = 'mlx-swift'
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

  s.source_files      = 'Sources/**/*.{swift,h,m,cpp}'
  s.exclude_files     = 'Sources/Examples/**/*'
  s.public_header_files = 'Sources/**/*.h'

  s.dependency 'swift-numerics', '0.1.0'
  s.resources = ['cmake/**/*', 'tools/**/*', 'Plugins/**/*']

  s.default_subspecs = 'Cmlx', 'MLX', 'MLXFFT', 'MLXFast', 'MLXLinalg', 'MLXNN', 'MLXOptimizers', 'MLXRandom'

  # Settings for C and C++ sources
  s.pod_target_xcconfig = {
    'HEADER_SEARCH_PATHS' => '"$(SRCROOT)/Sources/Cmlx/include $(SRCROOT)/Sources/Cmlx/include/mlx-c $(SRCROOT)/Sources/Cmlx/include/metal-cpp $(SRCROOT)/Sources/Cmlx/include/json/single_include/nlohmann $(SRCROOT)/Sources/Cmlx/include/gguf-tools $(SRCROOT)/Sources/Cmlx/include/fmt/include"',
    'GCC_PREPROCESSOR_DEFINITIONS' => 'ACCELERATE_NEW_LAPACK=1 _METAL_=1 SWIFTPM_BUNDLE=\"mlx-swift_Cmlx\" METAL_PATH=\"default.metallib\"',
    'OTHER_LDFLAGS' => '-framework Foundation -framework Metal -framework Accelerate'
  }

  s.subspec 'Cmlx' do |cm|
    cm.source_files = 'Sources/Cmlx/**/*.{swift,h,m,cpp}'
    cm.exclude_files = ['Sources/Cmlx/mlx-c', 'Sources/Cmlx/json', 'Sources/Cmlx/gguf-tools/gguf-tools.c', 'Sources/Cmlx/fmt/{test,doc,support,src/os.cc,src/fmt.cc}', 'Sources/Cmlx/mlx/mlx/backend/**', 'Sources/Cmlx/mlx/{ACKNOWLEDGMENTS.md,CMakeLists.txt,CODE_OF_CONDUCT.md,CONTRIBUTING.md,LICENSE,MANIFEST.in,README.md,benchmarks,cmake,docs,examples,mlx.pc.in,pyproject.toml,python,setup.py,tests}']
  end

  s.subspec 'MLX' do |mlx|
    mlx.source_files = 'Sources/MLX/**/*.{swift}'
    mlx.dependency 'mlx-swift/Cmlx'
    mlx.dependency 'swift-numerics', '0.1.0'
  end

  s.subspec 'MLXRandom' do |rand|
    rand.source_files = 'Sources/MLXRandom/**/*.{swift}'
    rand.dependency 'mlx-swift/MLX'
  end

  s.subspec 'MLXFast' do |fast|
    fast.source_files = 'Sources/MLXFast/**/*.{swift}'
    fast.dependency 'mlx-swift/MLX'
    fast.dependency 'mlx-swift/Cmlx'
  end

  s.subspec 'MLXNN' do |nn|
    nn.source_files = 'Sources/MLXNN/**/*.{swift}'
    nn.dependency 'mlx-swift/MLX'
    nn.dependency 'mlx-swift/MLXRandom'
    nn.dependency 'mlx-swift/MLXFast'
  end

  s.subspec 'MLXOptimizers' do |opt|
    opt.source_files = 'Sources/MLXOptimizers/**/*.{swift}'
    opt.dependency 'mlx-swift/MLX'
    opt.dependency 'mlx-swift/MLXNN'
  end

  s.subspec 'MLXFFT' do |fft|
    fft.source_files = 'Sources/MLXFFT/**/*.{swift}'
    fft.dependency 'mlx-swift/MLX'
  end

  s.subspec 'MLXLinalg' do |linalg|
    linalg.source_files = 'Sources/MLXLinalg/**/*.{swift}'
    linalg.dependency 'mlx-swift/MLX'
  end
end
