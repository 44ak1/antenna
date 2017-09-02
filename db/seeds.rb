# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Site.create!(
  site_name:  "拡散なうなうなーう",
  url: "http://torendoimasyun.blog.jp/",
  domain: "torendoimasyun.blog.jp",
  rss_url: "http://torendoimasyun.blog.jp/index.rdf",
  mail: "makochibi154@yahoo.co.jp"
)
Archive.create!(
  site_id: Site.first.id,
  ymd: Date.today.strftime("%Y-%m-%d"),
  hour: Date.today.strftime("%h"),
  url: "http://torendoimasyun.blog.jp/archives/3343969.html",
  site_name: Site.first.site_name,
  title: "【火災情報】京都京都市南区西九条豊田町付近で火事",
  description: "【火災情報】京都京都市南区西九条豊田町付近で火事-matomame",
  thumbnail: "http://livedoor.blogimg.jp/makoantena1805/imgs/6/3/638f2f1f.jpg"
)
