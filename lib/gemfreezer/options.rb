require 'fileutils'
module GemFreezer
  class Options
    
    attr_accessor :directory
    attr_accessor :freeze_directory
    attr_accessor :gems_list_file
    attr_accessor :gems_list
    attr_accessor :options
    
    def initialize(options = {})
      self.directory = options[:directory] ||= FileUtils.pwd
      self.freeze_directory = options[:freeze_directory] ||= File.join(self.directory, 'gems')
      self.gems_list_file = options[:gems_list_file] ||= File.join(self.directory, 'gems.txt')
      self.gems_list = options[:gems_list] || []
      if self.gems_list.empty?
        build_gems_list
      end
      self.options = options
    end
    
    private
    def build_gems_list
      raise GemFreezer::Errors::UndefinedGemDependencies.new(self) unless File.exists?(self.gems_list_file)
      gems = File.read(self.gems_list_file)
      gems.each do |line|
        cols = line.split(',')
        name = cols[0].strip
        version = cols[1] ? cols[1].strip : nil
        self.gems_list << [name, version]
      end
    end
    
  end # Options
end # GemFreezer