require 'spec_helper'

describe PagesController do
  render_views

RSpec::Matchers.define :be_valid do
  match do |actual|
    actual.valid?
  end

  failure_message_for_should do |actual|
    "expected that #{actual} would be valid (errors: #{actual.errors})"
  end

  failure_message_for_should_not do |actual|
    "expected that #{actual} would not be valid"
  end

  description do
    "be valid"
  end
end

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
    it "should have the right title" do
      get 'home'
      response.should have_selector("title",
                      :content => "Ruby on Rails Tutorial Sample App | Home")
    end
  end

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end
    it "should have the right title" do
      get 'home'
      response.should have_selector("title",
                      :content => "Ruby on Rails Tutorial Sample App | Contact")
      end
  end

  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end
    it "should have the right title" do
      get 'home'
      response.should have_selector("title",
                      :content => "Ruby on Rails Tutorial Sample App | About")
    end
  end

end
