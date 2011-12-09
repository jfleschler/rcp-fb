class ImageUploader < CarrierWave::Uploader::Base
	include CarrierWave::RMagick
  
  storage :grid_fs

	version :thumb do
    process :resize_to_limit => [200, 200]
  end

  def cache_dir
		"#{Rails.root}/tmp/uploads"
	end
end