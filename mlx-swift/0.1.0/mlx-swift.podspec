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

  s.exclude_files     = 'Source/Examples/**/*'
  s.public_header_files = 'Source/**/*.h'

  s.resources = ['cmake/**/*', 'tools/**/*', 'Plugins/**/*']

  s.default_subspecs = ['Cmlx', 'MLX', 'MLXFFT', 'MLXFast', 'MLXLinalg', 'MLXNN', 'MLXOptimizers', 'MLXRandom']

  # Settings for C and C++ sources
  s.pod_target_xcconfig = {
    'HEADER_SEARCH_PATHS' => '"$(SRCROOT)/Source/Cmlx/include $(SRCROOT)/Source/Cmlx/include/mlx-c $(SRCROOT)/Source/Cmlx/include/metal-cpp $(SRCROOT)/Source/Cmlx/include/json/single_include/nlohmann $(SRCROOT)/Source/Cmlx/include/gguf-tools $(SRCROOT)/Source/Cmlx/include/fmt/include"',
    'GCC_PREPROCESSOR_DEFINITIONS' => 'ACCELERATE_NEW_LAPACK=1 _METAL_=1 SWIFTPM_BUNDLE=\"mlx-swift_Cmlx\" METAL_PATH=\"default.metallib\"',
    'OTHER_LDFLAGS' => '-framework Foundation -framework Metal -framework Accelerate'
  }

  s.subspec 'Cmlx' do |cm|
    cm.source_files = 'Source/Cmlx/**/*.{swift,h,m,cpp}'
    cm.exclude_files = ['Source/Cmlx/mlx-c', 'Source/Cmlx/json', 'Source/Cmlx/gguf-tools/gguf-tools.c', 'Source/Cmlx/fmt/{test,doc,support,src/os.cc,src/fmt.cc}', 'Source/Cmlx/mlx/mlx/backend/**', 'Source/Cmlx/mlx/{ACKNOWLEDGMENTS.md,CMakeLists.txt,CODE_OF_CONDUCT.md,CONTRIBUTING.md,LICENSE,MANIFEST.in,README.md,benchmarks,cmake,docs,examples,mlx.pc.in,pyproject.toml,python,setup.py,tests}']
  end

  s.subspec 'MLX' do |mlx|
    mlx.source_files = 'Source/MLX/**/*.{swift}'
    mlx.dependency 'mlx-swift/Cmlx'
    mlx.dependency 'swift-numerics', '0.1.0'
  end

  s.subspec 'MLXRandom' do |rand|
    rand.source_files = 'Source/MLXRandom/**/*.{swift}'
    rand.dependency 'mlx-swift/MLX'
  end

  s.subspec 'MLXFast' do |fast|
    fast.source_files = 'Source/MLXFast/**/*.{swift}'
    fast.dependency 'mlx-swift/MLX'
    fast.dependency 'mlx-swift/Cmlx'
  end

  s.subspec 'MLXNN' do |nn|
    nn.source_files = 'Source/MLXNN/**/*.{swift}'
    nn.dependency 'mlx-swift/MLX'
    nn.dependency 'mlx-swift/MLXRandom'
    nn.dependency 'mlx-swift/MLXFast'
  end

  s.subspec 'MLXOptimizers' do |opt|
    opt.source_files = 'Source/MLXOptimizers/**/*.{swift}'
    opt.dependency 'mlx-swift/MLX'
    opt.dependency 'mlx-swift/MLXNN'
  end

  s.subspec 'MLXFFT' do |fft|
    fft.source_files = 'Source/MLXFFT/**/*.{swift}'
    fft.dependency 'mlx-swift/MLX'
  end

  s.subspec 'MLXLinalg' do |linalg|
    linalg.source_files = 'Source/MLXLinalg/**/*.{swift}'
    linalg.dependency 'mlx-swift/MLX'
  end
end
