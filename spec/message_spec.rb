require 'spec_helper'

describe Message do

  context 'initialize' do
    it 'initializes a message with a name and message' do
      message = Message.new(:name => "bobby", :message => "hi from bobby")
      message.should be_an_instance_of Message
    end
  end

  context 'readers' do
    it 'should read the name of the message' do
      message = Message.new(:name => "bobby", :message => "hi from bobby")
      message.name.should eq 'bobby'
    end
  

    it 'should read the message of the message' do
      message = Message.new(:name => "bobby", :message => "hi from bobby")
      message.message.should eq 'hi from bobby'
    end
  end
  context '.create' do
    it 'POSTs a message containing name and text to the troll room' do 
      attributes = {:name => 'barry', :message => 'my name is chuck'}
      stub = stub_request(:post, 'http://trollroom.herokuapp.com/messages').to_return(:status => 200, :body => {:message => attributes}.to_json)
      Message.create(attributes)
      stub.should have_been_requested
    end
  end

  context '.list' do
    it 'request GETs from the database' do
      stub = stub_request(:get, 'http://trollroom.herokuapp.com/messages').to_return(:status => 200)
      Message.list
      stub.should have_been_requested
    end
  end
end