# Extract Google Search Carrousel data sample

Goal is to extract a list of Van Gogh paintings from the attached Google search results page.

![Van Gogh paintings](https://github.com/serpapi/code-challenge/blob/master/files/van-gogh-paintings.png?raw=true "Van Gogh paintings")

## Instructions

Parse directly the HTML result page ([html file]) in this repository. No extra HTTP requests should be needed for anything.

[relevant test]: https://github.com/serpapi/test-knowledge-graph-desktop/blob/master/spec/knowledge_graph_claude_monet_paintings_spec.rb
[sample json]: https://raw.githubusercontent.com/serpapi/code-challenge/master/files/van-gogh-paintings.json
[html file]: https://raw.githubusercontent.com/serpapi/code-challenge/master/files/van-gogh-paintings.html
[expected array]: https://raw.githubusercontent.com/serpapi/code-challenge/master/files/expected-array.json


## Solution

This is a simple Ruby application parsing HTML file containing google carousel and extracting its items.

### Running the application
In the app root directory run:
1. `bundle install`
2. `bundle exec ruby ./lib/extract_google_carousel.rb 'files/van-gogh-paintings.html'`

### Running tests
In the app root directory run:
* `bundle exec rspec`

### Implementation notes
There were several challenges I needed to consider when working on this task.

##### Dynamic DOM structure for specific google search results
When looking for Google search results with similar carousel element, DOM structures slightly differed for each result. For example, item name and extensions were nested on different levels, or item name was split in 1 or 2 div elements, etc (see RSpec tests for details). Therefore when searching for specific carousel item elements I've used a combination of Xpath relative paths with selecting specific element types instead of using absolute paths and absolute class names or element ids.

##### Image thumbnails
There was a requirement not to use extra HTTP requests when parsing the HTML file. All thumbnail images (in provided paintings file sample and as well in all other sample results I've searched for) needed additional HTTP requests in order to obtain their actual Base64 data. Therefore image links which are referring to `src` attribute of the `<img>` element are not containing full thumbnail binary data in the results. For hypothetical v2 of this application prior to the actual parsing process, I would interpret the javascript part of the HTML file. For this I would use some existing tools like `Watir` ruby gem which uses for example ChromeDriver to be able to return the HTML document after the javascript interpretation.

##### Tests
In Rspec tests I am deliberately not comparing actual string values (titles, links, etc) as I assume these could change in time (its order, etc) when replacing the fixture files with more recent Google search results.
