module Lazymodel
  class Base
    include ActiveModel::AttributeMethods

    def self.has_attributes(*args)
      opts = args.extract_options!
      attr_accessor *args
      Array.wrap(opts[:prefix]).each do |prefix|
        attribute_method_prefix prefix
        define_method "#{prefix}attribute" do |*args|
          raise "You must define the method #{prefix}attribute on your own"
        end
      end
      Array.wrap(opts[:suffix]).each do |suffix|
        attribute_method_suffix suffix
        define_method "attribute#{suffix}" do |*args|
          raise "You must define the method attribute#{suffix} on your own"
        end
      end
      define_attribute_methods args
    end
  end
end
