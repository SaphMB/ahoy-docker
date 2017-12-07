require File.join(File.dirname(__FILE__), '..', 'ahoy.rb')

describe "Ahoy ahoy" do
  it "should allow access to to the home page" do
    get '/'
    expect(last_response).to be_ok
  end

  it "should read 'Ahoy ahoy! ⚓️'" do
    get '/'
    expect(last_response.body).to eq('Ahoy ahoy! ⚓️')
  end
end