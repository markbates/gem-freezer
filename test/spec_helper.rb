require 'rubygems'
gem 'rspec'
require 'spec'
require 'fileutils'

require File.join(File.dirname(__FILE__), '..', 'lib', 'gemfreezer')

WORKING_DIR = File.join(File.dirname(__FILE__), 'working_dir')

FileUtils.rm_rf(WORKING_DIR)
FileUtils.mkdir_p(WORKING_DIR)

TESTING_OPTIONS = begin
  options = OpenStruct.new
  options.directory = WORKING_DIR
  options.freeze_directory = File.join(options.directory, 'frozen_gems')
  options.gems_list = File.join(options.directory, 'gems.txt')
  options
end
