class ImageUploader < CarrierWave::Uploader::Base
	include CarrierWave::RMagick
  
  storage :grid_fs

	version :thumb do
    process :resize_to_fill => [50, 50]
    process :rounded_corner => [25]
  end

  def store_dir
      "#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def cache_dir
		"#{Rails.root}/tmp/uploads"
	end

  def rounded_corner(radius = 25)
    manipulate! do |img|
        masq = ::Magick::Image.new(img.columns, img.rows).matte_floodfill(1, 1)
            ::Magick::Draw.new.
            fill('transparent').
            stroke('black').
            stroke_width(1).
            roundrectangle(0, 0, img.columns - 1, img.rows - 1, radius, radius).
            draw(masq)

        img.composite!(masq, 0, 0, Magick::LightenCompositeOp)
        img = yield(img) if block_given?
        img
    end
  end
end