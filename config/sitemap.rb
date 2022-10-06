# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://as-web.website/"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  Defaults: :changefreq => 'weekly',
            :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
    add articles_path, :changefreq => 'daily'
  #
  # Add all articles:
  #
    Article.find_each do |article|
      add article_path(article), :lastmod => article.updated_at
    end
end