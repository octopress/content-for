begin
  require 'octopress-ink'

  Octopress::Ink.add_plugin({
    name:        'Content For',
    assets_path: File.join(File.expand_path(File.dirname(__FILE__)), '../../assets' ),
    description: "Add content_for and yield tags to Jekyll with conditional rendering and in-line filters."
  })
rescue LoadError
end

