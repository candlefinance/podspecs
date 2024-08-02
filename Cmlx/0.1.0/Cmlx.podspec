Pod::Spec.new do |s|
  s.name              = 'Cmlx'
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

  s.source_files = 'Source/Cmlx/**/*.{swift,h,m,cpp}'
  s.exclude_files = ['Source/Cmlx/mlx-c', 'Source/Cmlx/json', 'Source/Cmlx/gguf-tools/gguf-tools.c', 'Source/Cmlx/fmt/{test,doc,support,src/os.cc,src/fmt.cc}', 'Source/Cmlx/mlx/mlx/backend/**', 'Source/Cmlx/mlx/{ACKNOWLEDGMENTS.md,CMakeLists.txt,CODE_OF_CONDUCT.md,CONTRIBUTING.md,LICENSE,MANIFEST.in,README.md,benchmarks,cmake,docs,examples,mlx.pc.in,pyproject.toml,python,setup.py,tests}']
  s.resources = 'Plugins/PrepareMetalShaders'

  s.pod_target_xcconfig = {
    'HEADER_SEARCH_PATHS' => '"$(SRCROOT)/Source/Cmlx/include $(SRCROOT)/Source/Cmlx/include/mlx-c $(SRCROOT)/Source/Cmlx/include/metal-cpp $(SRCROOT)/Source/Cmlx/include/json/single_include/nlohmann $(SRCROOT)/Source/Cmlx/include/gguf-tools $(SRCROOT)/Source/Cmlx/include/fmt/include"',
    'GCC_PREPROCESSOR_DEFINITIONS' => 'ACCELERATE_NEW_LAPACK=1 _METAL_=1 SWIFTPM_BUNDLE=\"mlx-swift_Cmlx\" METAL_PATH=\"default.metallib\"',
    'OTHER_LDFLAGS' => '-framework Foundation -framework Metal -framework Accelerate'
  }
end
