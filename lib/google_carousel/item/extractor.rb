
module GoogleCarousel
  module Item
    class Extractor
      require './lib/google_carousel/item/extensions_extractor'

      GOOGLE_BASE_URL = 'https://www.google.com'.freeze

      def initialize(carousel_item)
        @carousel_item = carousel_item
      end

      def call
        extracted_carousel_item
      end

      private

      attr_reader :carousel_item

      def extracted_carousel_item
        @normalised_carousel_item ||=
          {
            name: extracted_name,
            extensions: extracted_extensions,
            link: "#{GOOGLE_BASE_URL}#{extracted_search_link}",
            image: extracted_image,
          }
      end

      def extracted_name
        @extracted_name =
          carousel_item.attributes["aria-label"]&.text
      end

      def extracted_search_link
        extracted_search_link =
          carousel_item.attributes["href"]&.value
      end

      def extracted_extensions
        @extracted_extensions =
          ExtensionsExtractor.new(carousel_item).call
      end

      def extracted_image
        @extracted_image =
          carousel_item.xpath('.//img/@src').first&.value
      end
    end
  end
end
