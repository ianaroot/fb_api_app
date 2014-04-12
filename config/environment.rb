# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
FbApiApp::Application.initialize!



FB_CONFIG = YAML.load_file('fb.yaml')
OAUTH = Koala::Facebook::OAuth.new(FB_CONFIG["app_id"], FB_CONFIG["app_secret"]).get_app_access_token
FB = Koala::Facebook::API.new(OAUTH)
