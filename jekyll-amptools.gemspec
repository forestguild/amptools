Gem::Specification.new do |s|
    s.name        = 'jekyll-amptools'
    s.version     = '1.0.0'
    s.date        = '2019-04-04'
    s.summary     = "AMP tools for jekyll, fork of juusaw/amp-jekyll"
    s.description = "AMP tools for jekyll, fork of  juusaw/amp-jekyll"
    s.authors     = ["Nikita Chernyi"]
    s.email       = 'github@rakshazi.me'
    s.files       = `git ls-files`.split($INPUT_RECORD_SEPARATOR).grep(%r!^lib/!)
    s.require_paths = %w(lib)
    s.homepage    = 'https://github.com/forestguild/amptools'
    s.license     = 'MIT'
    s.metadata = {
        "bug_tracker_uri"   => "https://github.com/forestguild/amptools",
        "changelog_uri"     => "https://github.com/forestguild/amptools/releases",
        "documentation_uri" => "https://github.com/forestguild/amptools/blob/master/README.md",
        "homepage_uri"      => "https://github.com/forestguild/amptools",
        "source_code_uri"   => "https://github.com/forestguild/amptools",
    }
    s.required_ruby_version = '>=2.0.0'
    s.add_runtime_dependency 'jekyll', '~> 3.8.5', '>=3.0.0'
    s.add_runtime_dependency 'nokogiri', '~> 1.10.1', '>=1.0.0'
    s.add_runtime_dependency 'fastimage', '~> 2.1.5', '>=2.0.0'
end
