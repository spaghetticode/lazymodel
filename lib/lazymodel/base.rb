module Lazymodel
  class Base
    extend ActiveModel::Naming
    include ActiveModel::Conversion
    include ActiveModel::Validations
    include ActiveModel::Translations
    include ActiveModel::AttributeMethods

    class << self
      def has_attributes(*args)
        opts = args.extract_options!
        # define attributes and prefixed/suffixed methods
        attr_accessor *args
        define_prefix_or_affix_method :prefix, opts[:prefix]
        define_prefix_or_affix_method :suffix, opts[:suffix]
        define_attribute_methods args
        # _attributes stores at class level the
        # the attribute names
        class_attribute :_attributes
        self._attributes = args
      end

      private

      def define_prefix_or_affix_method(type, values)
        Array.wrap(values).each do |value|
          send "attribute_method_#{type}", value
          method = type == :prefix ? "#{value}attribute" : "attribute#{value}"
          define_method method do |*args|
            raise "You must define the method #{method} on your own"
          end
        end
      end
    end

    # don't override this method without calling super!
    def initialize(attributes={})
      attributes.each do |attribute, value|
        send("#{attribute}=", value) if value.present?
      end
    end

    def attributes
      _attributes.inject(HashWithIndifferentAccess.new) do |hash, attribute|
        hash.update attribute => send(attribute)
      end
    end

    def to_model
      self
    end

    # override at need
    def persisted?
      false
    end
  end
end
