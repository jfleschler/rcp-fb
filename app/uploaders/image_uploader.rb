class ImageUploader < CarrierWave::Uploader::Base
	include CarrierWave::RMagick

  storage :grid_fs

  process :resize_to_fit => [800, 800]

	version :thumb do
    process :resize_to_fill => [50, 50]
  end

  version :preview do
    process :resize_to_fit => [120, 120]
  end

  def store_dir
      "#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def cache_dir
		"#{Rails.root}/tmp/uploads"
	end
end