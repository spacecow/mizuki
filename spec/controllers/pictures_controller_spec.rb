require File.dirname(__FILE__) + '/../spec_helper'

def controller_actions(controller)
  Rails.application.routes.routes.inject({}) do |hash, route|
    hash[route.requirements[:action]] = route.verb.downcase if route.requirements[:controller] == controller && !route.verb.nil?
    hash
  end
end

describe PicturesController do
  pictures_controller_actions = controller_actions("pictures")

  before(:each) do
    @gallery = Factory(:gallery)
    @picture = Factory(:picture, :gallery_id => @gallery.id)
  end

  describe "a user is not logged in" do
    pictures_controller_actions.each do |action,req|
      if %w(show).include?(action) 
        it "should reach the #{action} page" do
          send("#{req}", "#{action}", :id => @picture.id, :gallery_id => @gallery.id)
          response.redirect_url.should_not eq(login_url)
        end
      else
        it "should not reach the #{action} page" do
          send("#{req}", "#{action}", :id => @picture.id, :gallery_id => @gallery.id)
          response.redirect_url.should eq(login_url)
        end
      end
    end
  end

  describe "a member is logged in" do
    before(:each) do
      session[:user_id] = Factory(:user, :roles_mask=>8).id
    end
    
    pictures_controller_actions.each do |action,req|
      if %w(show).include?(action)
        it "should reach the #{action} page" do
          send("#{req}", "#{action}", :id => @picture.id, :gallery_id => @gallery.id)
          response.redirect_url.should_not eq(welcome_url)
        end
      else
        it "should not reach the #{action} page" do
          send("#{req}", "#{action}", :id => @picture.id, :gallery_id => @gallery.id)
          response.redirect_url.should eq(welcome_url)
        end
      end
    end    
  end

  describe "a mini-admin is logged in" do
    before(:each) do
      session[:user_id] = Factory(:user, :roles_mask=>4).id
    end
    
    pictures_controller_actions.each do |action,req|
      if %w(show).include?(action)
        it "should reach the #{action} page" do
          send("#{req}", "#{action}", :id => @picture.id, :gallery_id => @gallery.id)
          response.redirect_url.should_not eq(welcome_url)
        end
      else
        it "should not reach the #{action} page" do
          send("#{req}", "#{action}", :id => @picture.id, :gallery_id => @gallery.id)
          response.redirect_url.should eq(welcome_url)
        end
      end
    end    
  end  

  describe "an admin is logged in" do
    before(:each) do
      session[:user_id] = Factory(:user, :roles_mask=>2).id
    end
    
    pictures_controller_actions.each do |action,req|
      if %w(show new create edit update destroy).include?(action)
        it "should reach the #{action} page" do
          send("#{req}", "#{action}", :id => @picture.id, :gallery_id => @gallery.id)
          response.redirect_url.should_not eq(welcome_url)
        end
      else
        it "should not reach the #{action} page" do
          send("#{req}", "#{action}", :id => @picture.id, :gallery_id => @gallery.id)
          response.redirect_url.should eq(welcome_url)
        end
      end    
    end
  end

  describe "a god has come down to Earth" do
    before(:each) do
      session[:user_id] = Factory(:user, :roles_mask=>1).id
    end
    
    pictures_controller_actions.each do |action,req|
      it "should reach the #{action} page" do
        send("#{req}", "#{action}", :id => @picture.id, :gallery_id => @gallery.id)
        response.redirect_url.should_not eq(welcome_url)
      end
    end    
  end  
end
