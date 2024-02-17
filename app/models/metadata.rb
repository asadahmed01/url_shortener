require "open-uri"

class Metadata
  attr_reader :doc

  def self.retrieve_from(url)
    new(URI.open(url))
  rescue StandardError
    new(nil)
  end

  def initialize(html=nil)
    @doc = Nokogiri::HTML(html)
  end

  def attributes
    {
      title: title,
      description: description,
      image: image
    }
  end

  def title

  end

  def description

  end

  def image

  end
end
