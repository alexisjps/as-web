# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://as-web.website"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
    # add lorum_path, :priority => 0.7, :changefreq => 'daily'
    # add emojis_path, :priority => 0.7, :changefreq => 'daily'

  # Add all articles:
  #
    Lorum.find_each do |lorum|
      add lorum_path(lorum), :lastmod => lorum.updated_at
    end
end
