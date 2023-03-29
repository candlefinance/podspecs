Pod::Spec.new do |s|
    s.name             = 'NukeUI'
    s.version          = '12.1.0'
    s.summary          = 'A powerful image loading and caching system'
    s.description  = <<-DESC
    A powerful image loading and caching system which makes simple tasks like loading images into views extremely simple, while also supporting more advanced features for more demanding apps.
    DESC

    s.homepage         = 'https://github.com/kean/Nuke'
    s.license          = 'MIT'
    s.author           = 'Alexander Grebenyuk'
    s.social_media_url = 'https://twitter.com/a_grebenyuk'
    s.source           = { :git => 'https://github.com/kean/Nuke.git', :tag => s.version.to_s }

    s.swift_versions = ['5.1', '5.2', '5.3', '5.4', '5.5', '5.6']

    s.ios.deployment_target = '13.0'

    s.source_files  = 'Sources/NukeUI/**/*'

    s.dependency 'Nuke', '12.1.0'
end
