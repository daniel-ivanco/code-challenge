
module GoogleCarousel
  module Item
    class ExtensionsExtractor
      def initialize(carousel_item)
        @carousel_item = carousel_item
      end

      def call
        return [] unless primary_title
        secondary_titles
      end

      private

      attr_reader :carousel_item

      def secondary_titles
        @secondary_titles =
        all_titles
          .select{ |element| element.attributes['class'].value != primary_title_styling }
          .map(&:text)
      end

      def all_titles
        @all_titles = primary_title.xpath('parent::*/div')
      end

      def primary_title_styling
        @primary_title_styling = primary_title.attributes['class'].value
      end

      def primary_title
        @primary_title ||= carousel_item.xpath('.//div [not (div)] [not (g-img)] [not (img)] [text() or node()]').first
      end
    end
  end
end
