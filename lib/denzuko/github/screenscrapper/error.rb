module Denzuko
  module Github
    module Scrapper
      ERROR_UNSUPPORTED_VERSION = "This release of Github Scrapper does not support version %s"

      #
      # Error classes
      #
    
      class Error < StandardError; end
      class ParseError < Error; end
      class TypeError < StandardError; end
    end
  end
end
