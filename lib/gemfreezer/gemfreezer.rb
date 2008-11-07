require 'ostruct'
class GemFreezer
  
  def self.run(options)
    raise GemFreezer::Errors::UndefinedGemDependencies.new(options) unless File.exists?(options.gems_list)
  end
  
end
