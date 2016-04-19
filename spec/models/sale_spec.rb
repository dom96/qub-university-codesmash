require 'rails_helper'

describe Sale do
  context 'when validating total' do
    it 'fails validation with no total' do
      expect(Sale.new).to have(1).error_on(:total)
    end

    it 'passes validation with a total' do
      expect(Sale.new(total: '8.00')).to have(0).error_on(:total)
    end
  end

  context 'when validating items' do
    it 'fails validation with no items' do
      expect(Sale.new).to have(1).error_on(:items)
    end

    it 'fails validation with an empty array of items' do
      expect(Sale.new(items: [])).to have(1).error_on(:items)
    end

    it 'passes validation with at least one item' do
      sale  = Sale.new(items: { name: 'burger', amount: '6.00' })
      expect(sale).to have(0).error_on(:items)
    end
  end

  context 'when validating discounts' do
    it 'passes validation with no discount supplied' do
      expect(Sale.new).to have(0).error_on(:discounts)
    end
  end
end
