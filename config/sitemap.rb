# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://eurohouse.zp.ua"

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
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end

  Category.find_each do |category|
    add category_path(category), :changefreq => 'daily', :priority => 0.8, :lastmod => category.updated_at
    category.twocategories.each do |twocategory|
      add showtwocategory_path(category, twocategory), :changefreq => 'daily', :priority => 0.8, :lastmod => twocategory.updated_at
    end
  end

  products = Product.where(visible: 1)
  products.find_each do |product|
    add product_path(product.slug), :changefreq => 'daily', :lastmod => product.updated_at
  end
end
