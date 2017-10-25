WARBLER_CONFIG = {"public.root"=>"/", "rack.env"=>"production"}
if $servlet_context.nil?
  ENV['GEM_HOME'] = File.expand_path(File.join('..', '..', '/WEB-INF/gems'), __FILE__)
  ENV['BUNDLE_GEMFILE'] ||= File.expand_path(File.join('..', '..', 'WEB-INF/Gemfile'), __FILE__)
else
  ENV['GEM_HOME'] = $servlet_context.getRealPath('/WEB-INF/gems')
  ENV['GEM_PATH'] = nil
  ENV['BUNDLE_GEMFILE'] ||= $servlet_context.getRealPath('/WEB-INF/Gemfile')
end
ENV['RACK_ENV'] ||= 'production'

$LOAD_PATH.unshift $servlet_context.getRealPath('/WEB-INF') if $servlet_context
ENV['BUNDLE_WITHOUT'] = 'development:test:assets'

module Bundler
  module Patch
    def clean_load_path
      # nothing to be done for embedded JRuby
    end
  end
  module SharedHelpers
    def included(bundler)
      bundler.send :include, Patch
    end
  end
end

require 'bundler/shared_helpers'
