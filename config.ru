# setup access to package managers
require 'rubygems'
require 'bundler'

# Require all the gems in the Gemfile
Bundler.require
require 'uri'

# hax for getting Jammit to think it's loading into Rails.
configure do
  ::RAILS_ENV = "development"
  Jammit.load_configuration( File.expand_path( './config/assets.yml' ) )
end

# A minimalist Sinatra app for the purpose
# of testing cross domain data access.
# 
# Also, easy access for changing files 
class ViewerHost < Sinatra::Base
  register Padrino::Helpers
  register Jammit
  set :views, ["test_pages"]

  # display a default document
  # and when ?resource=someurl is supplied, load that url.
  get "/" do
    resource = params[:resource] ? params[:resource] : 'http://www.documentcloud.org/documents/714377-lindlof-taylor-ch-7.js'
    resource.sub!(/(html|json)$/, "js")
    render_viewer(resource, {"sidebar" => (params[:sidebar] == "false" ? false : true)})
  end
  
  get "/embed" do
    erb :"viewer-embed-debug"
  end
  
  def render_viewer(resource, opts={})
    # Set Jammit to always run in development mode
    Jammit.set_package_assets(false)

    options = { 'container' => '#document-viewer' }.merge(opts)
    template = opts["template"] || :"viewer-debug"
    erb template, :locals => { "resource" => resource, "options" => options.to_json }
  end

end

run ViewerHost
