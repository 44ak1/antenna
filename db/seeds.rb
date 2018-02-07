# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Site.create!(
  name: "映画狂の詩",
  url: "http://crazy-movie-freak.com/",
  domain: "crazy-movie-freak.com/",
  rss_url: "http://crazy-movie-freak.com/feed",
  email: "ana70912@yahoo.co.jp",
  category_code: "2ch",
)

=begin
10.times do |i|
  Archive.create!(
    site_id: Site.first.id,
    ymd: Date.today.strftime("%Y-%m-%d"),
    hour: Date.today.strftime("%h"),
    url: "http://torendoimasyun.blog.jp/archives/3343969.html?#{i}",
    site_name: Site.first.name,
    title: "【火災情報】削除する京都京都市南区西九条豊田町付近で火事てすと#{i}",
    description: "【火災情報】京都京都市南区西九条豊田町付近で火事-matomame#{i}<img src='https://images-fe.ssl-images-amazon.com/images/I/51OJyaiQs2L.jpg'>",
#    thumbnail: "http://livedoor.blogimg.jp/makoantena1805/imgs/6/3/638f2f1f.jpg",
    category_code: "2ch",
  )
end
=end