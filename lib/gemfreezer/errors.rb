module GemFreezer
  module Errors
    
    class UndefinedGemDependencies < StandardError
      
      def initialize(options)
        super("No gems.txt file could be found at: '#{options.gems_list_file}'")
      end
      
    end # UndefinedGemDependencies
    
  end # Errors
end # GemFreezer
