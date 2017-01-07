require 'spec_helper'

describe Spree::FcontactUs::Fcontact do

  it_should_behave_like 'ActiveModel'

  describe "building" do
    it "methods" do
      params = {:email => "test@example.com", :message => "message"}
      params.default = "foo"
      fcontact = described_class.new(params)
      fcontact.subject.should_not == "foo"
    end

    it "should scrub attributes" do
      lambda {
        described_class.new(:email => "test@example.com", :message => "foo", :destroy => true)
      }.should_not raise_error
    end

    it "should not allow bypass of validation" do
      v = described_class.new(:email => "test@example.com", :message => "foo", "validation_context" => "update")
      v.validation_context.should_not == "update"
    end
  end

  describe "Validations" do

    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:message)}
    it {should_not validate_presence_of(:name)}
    it {should_not validate_presence_of(:subject)}

    context 'with name and subject settings' do

      after do
        SpreeFcontactUs.require_name = false
        SpreeFcontactUs.require_subject = false
      end

      before do
        SpreeFcontactUs.require_name = true
        SpreeFcontactUs.require_subject =true
      end

      it {should validate_presence_of(:name)}
      it {should validate_presence_of(:subject)}

    end

  end

  describe 'Methods' do

    describe '#read_attribute_for_validation' do
      it 'should return attributes set during initialization' do
        fcontact = Spree::FcontactUs::Fcontact.new(:email => "Valid@Email.com", :message => "Test")
        fcontact.read_attribute_for_validation(:email).should eql("Valid@Email.com")
        fcontact.read_attribute_for_validation(:message).should eql("Test")
      end
    end

    describe '#save' do

      it 'should return false if records invalid' do
        fcontact = Spree::FcontactUs::Fcontact.new(:email => "Valid@Email.com", :message => "")
        fcontact.save.should eql(false)
      end

      it 'should send email and return true if records valid' do
        mail = Mail.new(:from=>"Valid@Email.com", :to => "test@test.com")
        mail.stub(:deliver).and_return(true)
        contact = Spree::FcontactUs::Fcontact.new(:email => "Valid@Email.com", :message => "Test")
        Spree::FcontactUs::FcontactMailer.should_receive(:contact_email).with(contact).and_return(mail)
        fcontact.save.should eql(true)
      end

    end

    describe '#to_key' do
      it { subject.should respond_to(:to_key) }
    end

  end

end