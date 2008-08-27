module Tabnav
  class Tab
    attr_reader :name, :link, :highlights, :title, :condition
    
    def initialize &block
      @highlights = []
      @condition = "true"
      instance_eval(&block);
    end
    
    def named name
      check_string name
      @name = name
    end  
    
    def titled title
      check_string title
      @title = title
    end
      
    def links_to options={}
      check_hash options
      @link=options
      highlights_on options #my link will be highlighted too
    end
      
    def highlights_on options={}
      check_hash options
      @highlights << options
    end
    
    def show_if condition_string
      @condition = condition_string
    end
    
    # takes in input a Hash (usually params)
    def highlighted? options={}
      result = false
      
      @highlights.each do |h| # for every highlight
        highlighted = true
        h.each_key do |key|   # for each key
          highlighted &= h[key].to_s==options[key].to_s   
        end 
        result |= highlighted
      end
      return result
    end
    
    private 
    
    def check_string param
      raise "param should be a String" if not param.kind_of? String
    end
    
    def check_hash param
      raise "param should be a Hash" if not param.kind_of? Hash
    end
    
        
  end
end