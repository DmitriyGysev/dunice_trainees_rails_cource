require 'rails_helper'
require 'spec_helper'

describe 'User' do
  let(:user) { build(:user) }

  subject { user }

  context 'does has attributes' do
    it { should respond_to(:email) }
    it { should respond_to(:username) }
  end

  context 'is valid?' do
    it { should be_valid }

    describe "when attribute is invalid" do

      it "fails validation with username" do
        user.username = nil
        expect(user).to have(1).error_on(:username)
      end

      it "fails validation with email" do
        user.email = 'ololo'
        expect(user).to have(1).error_on(:email)
      end
    end

  end

end