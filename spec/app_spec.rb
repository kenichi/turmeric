require File.join(File.expand_path(File.dirname(__FILE__)), 'spec_helper')

describe 'the app' do

  it "responds to the index route" do
    get '/'
    last_response.should be_ok
  end

end
