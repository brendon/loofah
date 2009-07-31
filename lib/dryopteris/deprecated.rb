module Dryopteris
  class << self
    def strip_tags(string_or_io)
      Dryopteris.document(string_or_io).sanitize!(:prune).text
    end
    
    def whitewash(string_or_io)
      Dryopteris.fragment(string_or_io).sanitize!(:whitewash).to_s
    end

    def whitewash_document(string_or_io)
      Dryopteris.document(string_or_io).sanitize!(:whitewash).to_s
    end

    def sanitize(string_or_io)
      Dryopteris.fragment(string_or_io).sanitize!(:escape).to_xml
    end
    
    def sanitize_document(string_or_io)
      Dryopteris.document(string_or_io).sanitize!(:escape).to_xml
    end
  end
end