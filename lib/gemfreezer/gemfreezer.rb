require 'rubygems/installer'
module GemFreezer
  
  def self.run(options)
    @dependencies = []
    options.gems_list.each do |gem_info|
      gem = Gem::Dependency.new(gem_info[0], gem_info[1])
      self.dependencies(gem)
    end
    @dependencies.uniq!
    @dependencies.each do |spec|
      gem_name = "#{spec.name}-#{spec.version}"
      src = File.join(Gem.dir, 'cache', "#{gem_name}.gem")
      FileUtils.mkdir_p(options.freeze_directory)
      Gem::Installer.new(src).unpack(File.join(options.freeze_directory, gem_name))
    end
  end
  
  def self.dependencies(gem)
    matched = Gem.source_index.search(gem)
    fail "gem '#{gem}' not installed" if matched.empty?
    spec = matched.last
    @dependencies << spec
    spec.dependencies.each do |g|
      self.dependencies(g)
    end
  end
  
end

if $0 == __FILE__
  require 'options'
  GemFreezer.run(GemFreezer::Options.new(:freeze_directory => '/Users/markbates/gemfreezer/gems', :gems_list => [['mack-more']]))
end
