require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe "Gemfreezer" do

  it 'should rail if there is no gems.txt file' do
    lambda{GemFreezer.run(TESTING_OPTIONS)}.should raise_error(GemFreezer::Errors::UndefinedGemDependencies)
  end

end
