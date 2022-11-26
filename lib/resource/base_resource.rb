# frozen_string_literal: true

module Resource
  # Abstract resource
  class BaseResource
    def initialize(**attributes)
      attributes.each_pair do |key, value|
        send("#{key}=", value)
      end
    end

    class << self
      def attributes(attrs)
        @attributes = attrs

        attrs.each do |attribute|
          attr_accessor(attribute)
        end
      end
    end

    def attributes
      self.class.instance_variable_get(:@attributes)
    end

    def to_s
      attrs = attributes.map do |attribute|
        "#{attribute}: #{send(attribute).inspect}"
      end
      "#<#{self.class.name} #{attrs.join(', ')}>"
    end
  end
end
