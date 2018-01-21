xml.instruct! :xml, :version => 1.0
xml.rss(version: '2.0') do
  xml.title "もぶアンテナ"
  xml.link "http://mobantenna.com/"
  xml.description "2chまとめアンテナ"
  xml.lastBuildDate Time.zone.now.to_s(:rfc822)

  @archives.each do |archive|
    xml.item do
      xml.title archive.title
      xml.description do
        xml.cdata! archive.description
      end
    end
  end
end
