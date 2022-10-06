require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = "http://localhost:3000"
SitemapGenerator::Sitemap.create do
  add '/', changefreq: 'weekly', priority: 0.9
  add '/about', changefreq: 'weekly', priority: 0.5

  User.all.each do |user|
    add user_path(user), lastmod: spot.updated_at
  end
end