require 'nokogiri'
require 'open-uri'

class NewsController < ApplicationController
  def index
    # Parse the URI and retrieve it to a temporary file
    doc = Nokogiri::HTML(open('http://www.telegraph.co.uk/books'))
    @articles = {}
    @image_urls = []

    doc.css('div.list-of-entities__item-link').each do |link|
      article_url = "http://www.telegraph.co.uk#{ link.at_css('h3 a')['href'] }"
      article_doc = Nokogiri::HTML(open(article_url))

      title = article_doc.css('h1.headline__heading').text
      text = article_doc.css('div.article-body-text div.component-content').text
      @image_urls << "http://www.telegraph.co.uk#{ article_doc.at_css('.lead-asset-image')['src'] }" if article_doc.at_css('.lead-asset-image')

      @articles[title] = text
    end


  end
end
