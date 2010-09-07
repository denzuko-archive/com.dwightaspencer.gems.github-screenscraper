$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module Denzuko	#:nodoc:
  module Github
    class ScreenScrap
      attr_accessor :username, :url, :xpath

      module VERSION
        MAJOR = 1
        MINOR = 0
        TINY = 0

        STRING = [MAJOR, MINOR, TINY].join('.')
      end 
   
      def initialize(username)
	@username = username
        @url      = "http://github.com/#{@username}"
	@xpath    = "/html/body//ul[@class='repositories']"
        self.search
      end

      def search
	doc = getDocument
	doc.search @xpath
      end

      #
      #Honoring the contract with Comparable…
      #
      def <=>(other)
	self.username <=> other.username
      end

      protected
      def fetch(limit = 10)
	raise ArgumentError, 'HTTP redirect too deep' if limit == 0

	response = Net::HTTP.get_response URI.parse(@url)
	case response
	  when Net::HTTPSuccess     then response
	  when Net::HTTPRedirection then fetch(response['location'], limit - 1)
	  else response.error!
	end
      end

      def getDocument
	html = fetch().body
	Hpricot.XML html
      end
    end
  end
end
