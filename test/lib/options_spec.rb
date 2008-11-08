require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe GemFreezer::Options do

  it 'should rail if there is no gems.txt file and no gems list' do
    lambda{GemFreezer::Options.new}.should raise_error(GemFreezer::Errors::UndefinedGemDependencies)
  end
  
  it 'should build a gem list from a gems.txt file, if no gems list is given'
  
  it 'should use a gems_list attribute if given and ignore the gems.txt file'
  
  it 'should specify the latest version of the gem if none is given.'

end
