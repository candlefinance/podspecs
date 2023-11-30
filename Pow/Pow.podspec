
Pod::Spec.new do |s|
  s.name         = "Pow"
  s.version      = "1.0.0"
  s.summary      = "Delightful SwiftUI effects for your app"
  s.description  = <<-DESC
                    Delightful SwiftUI effects for your app
                    DESC
  s.homepage     = "https://github.com/EmergeTools/Pow"
  s.license      = "MIT"
  s.author       = { "EmergeTools" => "info@emerge.tools" }
  s.source = { :git => "https://github.com/gtokman/Pow", :branch => "main" }
  s.platform     = :ios, "15.0"
  s.source_files = "Sources/**/*.swift"
  s.resouce_bundles = {
    'Pow' => ['Sources/Pow/Resources/**/*.m4a', 'Sources/Pow/Resources/**/*.xcassets']
  }
  s.swift_version = "5.5"
end
