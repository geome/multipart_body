module MultipartBody
  module Encoding

    def self.handler(handler)
       self.const_get(handler.to_s.capitalize)
    end

    module Base64
      require 'base64'

      def self.encode(content)
        ::Base64.encode64(content)
      end
    end
  end
end
