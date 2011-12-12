class ImageUploader < CarrierWave::Uploader::Base
	include CarrierWave::RMagick
  include CarrierWave::Round

  storage :grid_fs

	version :thumb do
    process :resize_to_fill => [50, 50]
    process :rounded_corner
  end

  def store_dir
      "#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def cache_dir
		"#{Rails.root}/tmp/uploads"
	end
end