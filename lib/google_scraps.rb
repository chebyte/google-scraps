# GoogleScraps
module Feexus
  module GoogleScraps #:nodoc:


      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        def google_scraps
          include Feexus::GoogleScraps::InstanceMethods
          extend Feexus::GoogleScraps::SingletonMethods
        end
      end

      module SingletonMethods
      
          def google_search_scrap(key,limit)
             key = key.gsub(' ', '+')
             google_data = Scrubyt::Extractor.define do
               fetch("http://www.google.com/search?hl=es&q=#{key}%2F%22&btnG=Buscar+con+Google&lr=&sourceid=mozilla-search&start=0&start=0&ie=utf-8&oe=utf-8&client=mozilla&rls=org.mozilla:es-ES:unofficial")
               result "/body/div/div/ol/li/div" do
                 title '/a[1]' 
                 link '/a[1]' do
                   url 'href', :type => :attribute
                 end
                 desc '/table/tr/td/div'
               end
               next_page "Siguiente", :limit => limit
             end   
             return google_data.to_a
           end
       
      end

      module InstanceMethods
        
       
        
      end                        
  end
end

