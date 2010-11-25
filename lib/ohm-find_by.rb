module Ohm
  class Model
    def self.method_missing(method, *args, &block)
      method_name = method.to_s
      if method_name.match(/^find_by_/)
        index = method_name[8..-1].to_sym
        if self.indices.include?(index)
          self.find(index => args)
        else
          raise IndexNotFound, index
        end
      end
    end
  end
end

