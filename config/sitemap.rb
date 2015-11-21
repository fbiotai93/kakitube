# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://kakitube.com"

SitemapGenerator::Sitemap.create do

  add movies_path, :priority => 0.7, :changefreq => 'daily'
  add tv_series_path, :priority => 0.7, :changefreq => 'daily'
  add anime_series_path, :priority => 0.7, :changefreq => 'daily'
  add asian_drama_path, :priority => 0.7, :changefreq => 'daily'

  Post.find_each do |movie|
    add Rails.application.routes.url_helpers.genre_show_url(movie, sort: movie.genre.slug, only_path: true), :lastmod => movie.updated_at
  end

  Siri.find_each do |siri|
    add Rails.application.routes.url_helpers.siri_genre_show_url(siri, view: siri.siri_genre.slug, only_path: true), :lastmod => siri.updated_at
  end

  Anime.find_each do |anime|
    add Rails.application.routes.url_helpers.anime_genre_show_url(anime, anime_view: anime.anime_genre.slug, only_path: true), :lastmod => anime.updated_at
  end

  Asian.find_each do |asian|
    add Rails.application.routes.url_helpers.asian_genre_show_url(asian, asian_view: asian.asian_genre.slug, only_path: true), :lastmod => asian.updated_at
  end
end
