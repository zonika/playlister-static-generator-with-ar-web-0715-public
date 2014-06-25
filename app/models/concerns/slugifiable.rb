module Slugifiable
  module InstanceMethods
    def to_slug
      self.name.split(" ").collect{|x| x.downcase}.join("-")
    end
  end
end