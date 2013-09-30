require 'spec_helper'

describe User do
  it 'should save a password digest using BCrypt' do
    expect(BCrypt::Password).to receive(:create).with('password').and_return('password_digest')    
    user = User.new
    user.password = 'password'
    expect(user.password_digest).to eq 'password_digest'
  end

  it 'should authenticate login credentials' do
    user = User.create(name: 'Name',
                       email: 'Email',
                       password: 'Password',
                       password_confirmation: 'Password',
                       username: 'username')
    expect(User.authenticate('Email', 'Password')).to eq user
  end
end