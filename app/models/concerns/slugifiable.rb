module Slugifiable
  module InstanceMethods
    def slugified_name
      self.name.split(" ").collect{|x| x.downcase}.join("-")
    end
  end
end