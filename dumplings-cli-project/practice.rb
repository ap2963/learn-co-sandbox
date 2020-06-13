require 'pry'
require 'nokogiri'
require 'open-uri'
    
class Scraper  
attr_accessor :scrape  
  def initialize
    
  end
      
  def scrape  
    @wikitable = Nokogiri::HTML(open('https://meta.wikimedia.org/wiki/List_of_countries_by_regional_classification'))
   
    @wikitable.css('tr').css('td').collect do |country_region|
      @country_region_hash = {
        :country => country_region[0],
        :region => country_region
      }
       binding.pry
    end
    @country_region_hash
  end
 binding.pry
s = Scraper.new 
end


