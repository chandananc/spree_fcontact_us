require 'spec_helper'

describe SpreeFcontactUs do

  after do
    # Reset to defaults.
    SpreeFcontactUs.mailer_from     = nil
    SpreeFcontactUs.mailer_to       = 'contact@please-change-me.com'
    SpreeFcontactUs.require_name    = false
    SpreeFcontactUs.require_subject = false
  end

  it "should be valid" do
    SpreeFcontactUs.should be_a(Module)
  end

  describe 'setup block' do
    it 'should yield self' do
      SpreeFcontactUs.setup do |config|
        SpreeFcontactUs.should eql(config)
      end
    end
  end

  describe 'mailer_from' do
    it 'should be configurable' do
      SpreeFcontactUs.mailer_from = "contact@please-change-me.com"
      SpreeFcontactUs.mailer_from.should eql("contact@please-change-me.com")
    end
  end

  describe 'mailer_to' do
    it 'should be configurable' do
      SpreeFcontactUs.mailer_to = "contact@changed-me.com"
      SpreeFcontactUs.mailer_to.should eql("contact@changed-me.com")
    end
  end

  describe 'require_name' do
    it 'should be configurable' do
      SpreeFcontactUs.require_name = true
      SpreeFcontactUs.require_name.should eql(true)
    end
  end

  describe 'require_subject' do
    it 'should be configurable' do
      SpreeFcontactUs.require_subject = true
      SpreeFcontactUs.require_subject.should eql(true)
    end
  end

end