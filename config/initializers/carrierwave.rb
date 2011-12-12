CarrierWave.configure do |config|
  #config.grid_fs_connection = ENV['MONGOLAB_URI']
  #config.storage = :grid_fs

  #config.grid_fs_access_url = "/tmp"

  c.grid_fs_connection = Mongoid.database
  c.storage = :grid_fs
  c.root = File.join( Rails.root, "tmp" )
end