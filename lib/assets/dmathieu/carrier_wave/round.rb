unless defined? Magick 
    begin
        require 'rmagick'
    rescue LoadError
        require 'RMagick'
    rescue LoadError
        puts "WARNING: Failed to require rmagick, image processing may fail!"
    end
end

module Dmathieu
    module CarrierWave
        module Round

            module ClassMethods
                def rounded_corner(radius = 10)
                    process :rounded_corner => [radius]
                end
            end

            ##
            # Makes the image's corners round
            #
            #
            # === Parameters
            #
            # [radius (#to_s)] the corner radius
            #
            # === Yields
            #
            # [Magick::Image] additional manipulations to perform
            #
            def rounded_corner(radius = 10)
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
    end
end