# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe User do

  before(:each) do
  	@attr = { :name => "Example User", :email => "user@example.com" }
  end

  it "should create a new instance given attributes" do
  	User.create!(@attr)
  end

  it "should require a name" do
  	anon_user = User.new(@attr.merge(:name => ""))
  	anon_user.should_not be_valid
  end

  it "should reject names that are too long" do
  	long_name = "a" * 51
  	long_name_user =User.new(@attr.merge(:name => long_name))
  	long_name_user.should_not be_valid
  end

  it "should require an email address" do
  	user_no_email = User.new(@attr.merge(:email => ""))
  	user_no_email.should_not be_valid
  end

  it "should reject duplicate email addresses" do
  	# Put a user with a given email addreaa into the database
  	User.create!(@attr)
  	user_with_duplicate_email = User.new(@attr)
  	user_with_duplicate_email.should_not be_valid
  end
end
