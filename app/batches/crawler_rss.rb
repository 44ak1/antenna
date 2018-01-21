class CrawlerRss < BatchBase
  def run
    Site.crawlable.each do |site|
      site.fetch_archives! rescue puts 'Wow'
    end
  end
end
