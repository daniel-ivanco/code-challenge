
module GoogleCarousel
  class Extractor
    require 'nokogiri'
    require './lib/google_carousel/item/extractor'

    def initialize(google_document_path:, encoding: "UTF-8")
      @google_document = File.open(google_document_path) { |f| Nokogiri::HTML(f, nil, encoding) }
    end

    def call
      extracted_carousel_items
    end

    private

    attr_reader :google_document

    def carousel_items
      @carousel_items ||=
        google_document.css('g-scrolling-carousel').first.css('div > a')
    end

    def extracted_carousel_items
      carousel_items.map do |carousel_item|
        Item::Extractor.new(carousel_item).call
      end
    end
  end
end
