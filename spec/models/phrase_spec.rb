require 'rails_helper'
require 'spec_helper'

describe 'Phrase' do
  let(:phrase) { build(:phrase) }

  subject { phrase }

  context 'does has attributes' do
    it { should respond_to(:phrase) }
    it { should respond_to(:translation) }
    it { should respond_to(:category) }
  end

  context 'is valid?' do
    it { should be_valid }

    describe "when attribute is invalid" do

      it "fails validation with translation" do
        phrase.translation = nil
        expect(phrase).to have(1).error_on(:translation)
      end

      it "fails validation with phrase" do
        phrase.phrase = nil
        expect(phrase).to have(1).error_on(:phrase)
      end

      it "fails validation with user_id" do
        phrase.user_id = nil
        expect(phrase).to have(1).error_on(:user_id)
      end

    end

  end

end