require 'spec_helper'

describe User do
  before :each do
    @attr = {
      :first_name => "Jack",
      :last_name => "Lee",
      :created_at => 2.days.ago,
      :updated_at => 10.hours.ago,
      :email => "jack@example.com",
      :password => "hashhash",
      :current_sign_in_at => 10.minutes.ago,
      :last_sign_in_at => 1.days.ago,
    }
  end

  it "should create a new instance given valid attributes" do
    u = User.new(@attr)
    u.password = @attr[:password]
    u.created_at = @attr[:created_at]
    u.last_sign_in_at = @attr[:last_sign_in_at]
    u.created_at = @attr[:created_at]
    u.updated_at = @attr[:updated_at]
    u.save!
  end

  it "should require an email address" do
    c = User.new(@attr.merge(:email => ""))
    c.password = @attr[:password]
    c.should_not be_valid
    assert_not_nil c.errors[:email]
  end

  it "should accept valid email addresses" do
    addresses = %w[user@foo.com THE_USER3@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      valid_email_user.password = @attr[:password]
      valid_email_user.should be_valid
    end
  end

  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com THE_USER3_at_foo.org first.last@foo.]
    addresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      invalid_email_user.password = @attr[:password]
      invalid_email_user.should_not be_valid
    end
  end

  it "should reject duplicate email addresses" do
    u = User.new(@attr)
    u.password = @attr[:password]
    u.save!
    user_with_dup_email = User.new(@attr)
    user_with_dup_email.password = @attr[:password]
    user_with_dup_email.should_not be_valid
    assert_not_nil user_with_dup_email.errors[:email]
  end

  it "should reject email addresses identical up to case" do
    u = User.new(@attr)
    u.password = @attr[:password]
    u.save!
    upcase_email = @attr[:email].upcase
    user_with_dup_email = User.new(@attr.merge(:email => upcase_email))
    user_with_dup_email.password = @attr[:password]
    user_with_dup_email.should_not be_valid
  end

  it "should save email addresses in lowercase form" do
    u = User.new(@attr.merge(:email => @attr[:email].upcase))
    u.password = @attr[:password]
    u.save!
    u.email.should == @attr[:email]
  end
end
