Warbler::Config.new do |config|
  config.features = %w(runnable)
  config.webinf_files += FileList["config/weblogic.xml"]
  # config.webxml.rails.env =
  config.jar_name = "sinatra-faye-example"
end