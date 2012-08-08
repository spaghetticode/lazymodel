module Lazymodel
  class Base
    include ActiveModel::AttributeMethods

    def self.has_attributes(*args)
      opts = args.extract_options!
      attr_accessor *args
      define_prefixed_or_affixed(:prefix, opts[:prefix])
      define_prefixed_or_affixed(:suffix, opts[:suffix])
      define_attribute_methods args
    end

    private

    def self.define_prefixed_or_affixed(type, values)
      Array.wrap(values).each do |value|
        send "attribute_method_#{type}", value
        method = type == :prefix ? "#{value}attribute" : "attribute#{value}"
        define_method method do |*args|
          raise "You must define the method #{method} on your own"
        end
      end
    end
  end
end
