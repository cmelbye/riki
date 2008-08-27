require 'singleton'

module Tabnav 
  class Base 
    include Singleton
    attr_accessor :tabs 
    
    def self.add_tab &block
      raise "you should provide a block" if !block_given? 
        instance.tabs ||= []
        instance.tabs << Tabnav::Tab.new(&block)
    end 
    
    private 
    
    def initialize
      @tabs = []
    end
  end
end