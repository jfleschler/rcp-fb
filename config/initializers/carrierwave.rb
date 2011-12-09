CarrierWave.configure do |config|
  config.storage = :grid_fs

  # Same as your MongoHQ database conenction parameters
  config.grid_fs_connection = ENV['MONGOLAB_URI']
	config.root = File.join( Rails.root, "tmp" )
  # Storage access url
  #config.grid_fs_access_url = "/grid"
end