require "./spec_helper"

describe Verif::Rdv::Pref do
  it "shows Hello World!" do
    request = HTTP::Request.new("GET", "/")
    client_response = call_request_on_app(request)
    client_response.body.should contain("Hello, world!")
  end


  it "shows form" do
    request = HTTP::Request.new("GET", "/appointment_settings/new")
    client_response = call_request_on_app(request)
    client_response.body.should contain("appointment")
  end
end
