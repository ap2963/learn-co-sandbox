require 'pry'
require 'nokogiri'
require 'open-uri'

class Scraper
  attr_reader 
  
  def atlas_scraper
    @atlas = Nokogiri::HTML(open('https://www.tasteatlas.com/most-popular-dumplings-in-north-america'))
  
    @atlas.css("section.top-list-article__content").css("div.desktop-viewport").map do |e|
      data = {name: e.css("h2.h1"),
      country: e.css("div.region").css("a.ng-href"),
      blurb: e.css("div.description").css("div.read-more--hidden").css("p")
      }
    end
  end
    
end


s = Scraper.new
binding.pry

      