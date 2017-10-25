Warbler::Config.new do |config|
  config.features = %w(runnable)
  config.webinf_files += FileList["config/weblogic.xml"]
  config.webxml.rack.env = "development"
  config.jar_name = "sinatra-faye-example"

  config.dirs = %w(config views)
end