require __DIR__.parent + 'associations'
require __DIR__ + 'relationship'

module DataMapper
  module Associations
    module ManyToMany
    
      def many_to_many(name, options = {})
        target = (options[:class_name] || DataMapper::Inflection.camelize(name))
        
        self.relationships[name] = Relationship.
          new(name, options[:repository_name] || self.repository.name, [DataMapper::Inflection.demodulize(self.name), nil], [target, nil])
        
 
      end
      
      class Instance
        def initialize() end

        def save
          raise NotImplementedError.new
        end
        
      end # class Instance
    
    end # module ManyToMany
  end # module Associations
end # module DataMapper
