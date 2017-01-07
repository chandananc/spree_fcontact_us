require 'spec_helper'
require 'generator_spec/test_case'
require 'generators/spree_fcontact_us/install/install_generator'

describe SpreeFcontactUs::Generators::InstallGenerator do

  include GeneratorSpec::TestCase
  destination File.expand_path("../../../../../dummy", __FILE__)

  before do
    run_generator
  end

  it "creates initializer file" do
    assert_file "config/initializers/spree_contact_us.rb"
  end

end