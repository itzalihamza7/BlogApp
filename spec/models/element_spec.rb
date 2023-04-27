# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Element, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:post) }
    it { is_expected.to have_one_attached(:image) }
    it { is_expected.to have_rich_text(:content) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:element_type) }
    it { is_expected.to validate_inclusion_of(:element_type).in_array(%w[paragraph image]) }
  end

  describe 'Scope' do
    let(:element_para) { create(:element, element_type: 'paragraph') }
    let(:element_image) { create(:element, element_type: 'image') }

    context 'with paragraph' do
      it 'returns the true if paragraphs' do
        paragraph = element_para.paragraph?
        expect(paragraph).to eq(true)
      end

      it 'returns the false if images' do
        paragraph = element_para.image?
        expect(paragraph).to eq(false)
      end
    end

    context 'with image' do
      it 'returns the images' do
        image = element_image.image?
        expect(image).to eq(true)
      end

      it 'returns the false if paragraphs' do
        image = element_image.paragraph?
        expect(image).to eq(false)
      end
    end
  end
end
