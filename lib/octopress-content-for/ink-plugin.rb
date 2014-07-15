begin
  require 'octopress-ink'

  Octopress::Ink.add_plugin({
    name:        'Include Tag',
    assets_path: File.join(File.expand_path(File.dirname(__FILE__)), '../../assets' ),
    description: "Test some plugins y'all"
  })
rescue LoadError
end

