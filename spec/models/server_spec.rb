require 'spec_helper'

describe Server do
  before(:each) do
    @server = Server.new
  end

  it "should validates presence of name, description and host_address" do
    server = Factory.build(:server, :name => "", :description => "", :host_address => "")

    server.should have(1).error_on(:name)
    server.should have(1).error_on(:description)
    server.should have(1).error_on(:host_address)
  end

  it "should require a unique name" do
    server = Factory.build(:server, :name => "foo" )
    server_with_duplicate_name = Factory.build(:server, :name => "foo" )

    server.save!

    server_with_duplicate_name.should_not be_valid
    server_with_duplicate_name.should have(1).error_on(:name)
  end

  it "should require a unique host_address" do
    server = Factory.build(:server, :host_address => "host1.example.com" )
    server_with_duplicate_host_address = Factory.build(:server, :host_address => "host1.example.com" )

    server.save!

    server_with_duplicate_host_address.should_not be_valid
    server_with_duplicate_host_address.should have(1).error_on(:host_address)
  end

  it "should shows a formatted 'hostname ( ip address )' for hostname" do
    server = Factory(:server)

    server.formatted_hostname.should == "#{server.host_address} (#{server.ip_address})"
  end

  it "should found a valid ip for host_address" do
    server = Factory.build(:server, :host_address => "localhost")

    server.save!

    server.ip_address.should == "127.0.0.1"
  end

  it "should require a valid hostname, fqdn in host_address that resolves to ip address" do
    valid_host_address=[
      "google.com",
      "aol.com",
      "example.com",
      "example.net",
      "postgresql.org"
    ]

    invalid_host_address=[
      "teste123_xpto.com",
      "www.coin.examl.com.noexist",
      "postrsl.nonorg"
    ]

    valid_host_address.each do |host|
      server_with_valid_host_address = Factory.build(:server, :host_address=> host)
      server_with_valid_host_address.should be_listening_on 80
    end

    invalid_host_address.each do |host|
      server_with_invalid_host_address = Factory.build(:server, :host_address=> host)
      server_with_invalid_host_address.should_not be_listening_on 80
    end
  end
end
