require_relative 'AmpFilter.rb'

module Jekyll
    class AmpPage < Jekyll::Page
        include Jekyll::AmpFilter
        def initialize(site, base, dir, post)
            self.data = post.data.clone
            self.content = self.getContent(post, site)
            self.data['layout'] = 'amp'
            @site = site
            @base = base
            @dir = dir
            @url = dir
            @name = 'index.html'
            self.process(@name)
            self.data['body'] = self.content
            self.data['canonical_url'] = post.url
        end

        def getContent(page, site)
            raw = (Liquid::Template.parse page.content, :error_mode => :warn).render site.site_payload, :strict_variables => false, :strict_filters => false
            #Note about gsub: some jekyll versions ignore error_mode and strict_* options, so we need to remove that messages manually :(
            html = Kramdown::Document.new(raw).to_html.gsub('Liquid error: internal','')

            amp_images(amp_iframes(html))
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
