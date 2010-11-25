module Ohm
  class Model
    FIND_BY_METHOD = /^find_by_/

    def self.method_missing(method, *args, &block)
      if method.to_s =~ FIND_BY_METHOD
        index = method.to_s[8..-1].to_sym
        raise(IndexNotFound, index) unless self.indices.include?(index)
        self.find(index => args)
      else
        super
      end
    end

    def self.respond_to?(method)
      return true if method =~ FIND_BY_METHOD
      super
    end

  end
end

