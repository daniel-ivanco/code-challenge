require './lib/google_carousel/extractor'

if ARGV.length < 1
  puts 'Too few arguments'
  exit
end

puts GoogleCarousel::Extractor.new(google_document_path: ARGV[0]).call
