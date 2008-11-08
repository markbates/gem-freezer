require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe "GemFreezer" do

  before(:each) do
    @working_directory = File.join(File.dirname(__FILE__), '..', 'working_dir')
    FileUtils.rm_rf(@working_directory)
    FileUtils.mkdir_p(@working_directory)
    @options = GemFreezer::Options.new(:working_directory => @working_directory, :gems_list => [['rake', '0.8.3']])
  end
  
  after(:each) do
    FileUtils.rm_rf(@working_directory)
    @options = nil
  end
  
  it 'should copy over the gem to the specified directory.'
  
  it 'should copy over the latest version of the gem, if no version is specified'
  
  describe 'dependencies' do
    
    it 'should copy over the dependencies of the gem, if specified.'
    
    it 'should copy over the latest version of the dependencies of the gem, if no version is specified'
    
  end

end
