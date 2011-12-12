CarrierWave.configure do |config|
  config.grid_fs_connection = ENV['MONGOLAB_URI']
  config.storage = :grid_fs

  config.grid_fs_access_url = "/tmp"
end