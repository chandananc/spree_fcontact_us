require 'spec_helper'

describe Spree::FcontactUs::FcontactsController do
  before(:each) do
    SpreeFcontactUs.mailer_to = 'test@example.com'
    @fcontact_attributes = { :email => "Valid@Email.com", :message => "Test" }
  end

  context "if conversion code preference is empty" do
    before do
      Spree::FcontactUs::Config.fcontact_tracking_message = ''
    end

    it "should redirect to root path with no fcontact tracking flash message" do
      spree_post :create, :fcontact_us_fcontact => @fcontact_attributes
      flash[:notice].should_not be_nil
      flash[:fcontact_tracking].should be_nil
      response.should redirect_to(spree.root_path)
    end
  end

  context "if conversion code preference is not empty" do
    before(:each) do
      Spree::FcontactUs::Config.fcontact_tracking_message = 'something'
    end

    it "should redirect to root path with both notice and conversion flash messages" do
      spree_post :create, :fcontact_us_fcontact => @fcontact_attributes
      flash[:notice].should_not be_nil
      flash[:fcontact_tracking].should == 'something'
      response.should redirect_to(spree.root_path)
    end
  end

  context "prevent malicious posts" do
    it "should not error when fcontact_us_fcontact is not present" do
      lambda do
      spree_post :create, {"utf8"=>"a", "g=fcontact_us_fcontact"=>{"nam"=>""}, "xtfcontact_us_fcontact"=>{"emai"=>""}, "ilfcontact_us_fcontact"=>{"messag"=>"ea_n"}, "l_comm"=>"itSend Messa"}
      end.should_not raise_error
    end
  end
end