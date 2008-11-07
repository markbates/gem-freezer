[:gemfreezer, :errors].each do |f|
  require File.join(File.dirname(__FILE__), 'gemfreezer', f.to_s)
end