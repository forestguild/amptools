require_relative 'AmpFilter.rb'

module Jekyll
    class AmpPage < Jekyll::Page
        include Jekyll::AmpFilter
        def initialize(site, base, dir, post)
            body = (Liquid::Template.parse post.content).render site.site_payload
            self.data = post.data.clone
            self.data['layout'] = 'amp'
            @site = site
            @base = base
            @dir = dir
            @url = dir
            @name = 'index.html'
            self.process(@name)
            self.content = amp_images(amp_iframes(body))
            self.data['body'] = amp_images(amp_iframes(body))
            self.data['canonical_url'] = post.url
        end
    end
    class AmpGenerator < Generator
        priority :low
        def generate(site)
            pages = Array.new
            site.pages.each do |post|
                next if post['layout'] != 'wiki'
                pages << AmpPage.new(site, site.source, File.join('amp', post['url']), post)
            end
            site.pages += pages
        end
    end
end
