require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe GemFreezer::Options do

  it 'should rail if there is no gems.txt file and no gems list' do
    lambda{GemFreezer::Options.new}.should raise_error(GemFreezer::Errors::UndefinedGemDependencies)
  end
  
  it 'should build a gem list from a gems.txt file, if no gems list is given' do
    options = GemFreezer::Options.new(:gems_list_file => File.join(File.dirname(__FILE__), '..', 'gems.txt'))
    options.gems_list.should == [['rake', nil], ['english', '0.2.0']]
  end
  
  it 'should use a gems_list attribute if given and ignore the gems.txt file' do
    options = GemFreezer::Options.new(:gems_list_file => File.join(File.dirname(__FILE__), '..', 'gems.txt'), :gems_list => [['mack', '0.8.1']])
    options.gems_list.should == [['mack', '0.8.1']]
  end

end
