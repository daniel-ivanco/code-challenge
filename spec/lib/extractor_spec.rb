require_relative '../spec_helper'

describe GoogleCarousel::Extractor do
  context 'when carousel item image and extensions are 2 levels deep' do
    let(:extracted_carousel_items) do
      GoogleCarousel::Extractor
        .new(google_document_path: File.dirname(__FILE__) + '/../fixtures/shakespeare_books.htm')
        .call
    end

    let(:first_extracted_carousel_item) do
      extracted_carousel_items.first
    end

    it 'extracts carousel items' do
      expect(extracted_carousel_items).to be_a(Array)
      expect(extracted_carousel_items).to_not be_empty
    end

    it 'extracts carousel item name, image and google link' do
      expect(first_extracted_carousel_item[:name]).to be_a(String)
      expect(first_extracted_carousel_item[:name]).to_not be_empty
      expect(first_extracted_carousel_item[:link]).to be_a(String)
      expect(first_extracted_carousel_item[:link]).to_not be_empty
      expect(first_extracted_carousel_item[:image]).to be_a(String)
      expect(first_extracted_carousel_item[:image]).to_not be_empty
    end

    it 'extracts carousel item extensions' do
      expect(first_extracted_carousel_item[:extensions]).to be_a(Array)
      expect(first_extracted_carousel_item[:extensions]).to_not be_empty
    end
  end

  context 'when carousel item image is 1 level deep and item name is split into 2 divs' do
    let(:extracted_carousel_items) do
      GoogleCarousel::Extractor
        .new(google_document_path: File.dirname(__FILE__) + '/../fixtures/top_10_horror_movies.html')
        .call
    end

    let(:first_extracted_carousel_item) do
      extracted_carousel_items.first
    end

    it 'extracts carousel items' do
      expect(extracted_carousel_items).to be_a(Array)
      expect(extracted_carousel_items).to_not be_empty
    end

    it 'extracts carousel item name, image and google link' do
      expect(first_extracted_carousel_item[:name]).to be_a(String)
      expect(first_extracted_carousel_item[:name]).to_not be_empty
      expect(first_extracted_carousel_item[:link]).to be_a(String)
      expect(first_extracted_carousel_item[:link]).to_not be_empty
      expect(first_extracted_carousel_item[:image]).to be_a(String)
      expect(first_extracted_carousel_item[:image]).to_not be_empty
    end

    it 'extracts carousel item extensions' do
      expect(first_extracted_carousel_item[:extensions]).to be_a(Array)
      expect(first_extracted_carousel_item[:extensions]).to_not be_empty
    end
  end

  context 'when carousel item image is 1 level deep, whole item name is in 1 div and extensions are in a separate 1 level deep div' do
    let(:extracted_carousel_items) do
      GoogleCarousel::Extractor
        .new(google_document_path: File.dirname(__FILE__) + '/../fixtures/highest_mountains.htm')
        .call
    end

    let(:first_extracted_carousel_item) do
      extracted_carousel_items.first
    end

    it 'extracts carousel items' do
      expect(extracted_carousel_items).to be_a(Array)
      expect(extracted_carousel_items).to_not be_empty
    end

    it 'extracts carousel item name, image and google link' do
      expect(first_extracted_carousel_item[:name]).to be_a(String)
      expect(first_extracted_carousel_item[:name]).to_not be_empty
      expect(first_extracted_carousel_item[:link]).to be_a(String)
      expect(first_extracted_carousel_item[:link]).to_not be_empty
      expect(first_extracted_carousel_item[:image]).to be_a(String)
      expect(first_extracted_carousel_item[:image]).to_not be_empty
    end

    it 'extracts carousel item extensions' do
      expect(first_extracted_carousel_item[:extensions]).to be_a(Array)
      expect(first_extracted_carousel_item[:extensions]).to_not be_empty
    end
  end
end
