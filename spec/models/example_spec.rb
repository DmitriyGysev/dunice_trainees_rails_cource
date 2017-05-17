require 'rails_helper'
require 'spec_helper'

describe 'Example' do
  let(:example) { build(:example) }

  subject { example }

  context 'does has attributes' do
    it { should respond_to(:example) }
    it { should respond_to(:phrase_id) }
    it { should respond_to(:user_id) }
  end

  context 'is valid?' do
    it { should be_valid }

    describe "when attribute is invalid" do

      it "fails validation with example" do
        example.example = nil
        expect(example).to have(1).error_on(:example)
      end

      it "fails validation with phrase id" do
        example.phrase_id = nil
        expect(example).to have(1).error_on(:phrase_id)
      end

      it "fails validation with user_id" do
        example.user_id = nil
        expect(example).to have(1).error_on(:user_id)
      end

    end

  end

end