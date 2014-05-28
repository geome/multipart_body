module MultipartBody

  def self.from_hash(parts_hash)
    Payload.new(parts_hash)
  end

  class Payload
    attr_accessor :parts, :boundary

    def initialize(parts = nil, boundary = nil)
      @parts = []
      @boundary = boundary || "----multipart-boundary-#{rand(1000000)}"

      if parts.is_a? Hash
        @parts = parts.map {|name, body| Part.new(:name => name, :body => body) }
      elsif parts.is_a?(Array) && parts.first.is_a?(Part)
        @parts = parts
      end

      self
    end

    def to_s
      output = "--#{@boundary}\r\n"
      output << @parts.join("\r\n--#{@boundary}\r\n")
      output << "\r\n--#{@boundary}--"
    end
  end
end
