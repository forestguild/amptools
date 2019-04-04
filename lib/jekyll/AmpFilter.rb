require 'nokogiri'
require 'fastimage'

module Jekyll
    module AmpFilter
        def amp_images(input, responsive = true, wi = nil, he = nil)
            doc = Nokogiri::HTML.fragment(input);
            doc.css('img:not([width])').each do |image|
                if wi && he
                    image['width']  = wi
                    image['height'] = he
                else
                    if image['src'].start_with?('http://', 'https://')
                        src = image['src']
                    else
                        src = File.join(Dir.pwd, image['src'])
                    end
                    size = FastImage.size(src)
                    image['width']  = size[0]
                    image['height'] = size[1]
                end
            end
            doc.css('img').each do |image|
                image.name = "amp-img"
                image['layout'] = "responsive" if responsive
            end
            doc.css('picture').each do |picture|
                amp_img = picture.css('amp-img')
                picture.add_next_sibling(amp_img) unless amp_img.empty?
                picture.remove
            end
            doc.css('amp-img').each do |amp_img|
                noscript = Nokogiri::XML::Node.new "noscript", doc
                noscript_img = amp_img.dup
                noscript_img.remove_attribute('layout')
                noscript_img.name = 'img'
                noscript.add_child(noscript_img)
                amp_img.add_child(noscript)
            end
            doc.to_s
        end
    end
end

Liquid::Template.register_filter(Jekyll::AmpFilter)
