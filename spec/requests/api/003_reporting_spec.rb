require 'rails_helper'

describe 'Exercise 3: Reporting API - Presenting all Sales Data' do

  let!(:sale_one) do
    Sale.create!(
        total: 6.00,
        items: [
          { 'name' => 'soft drink', 'price' => 1.50 },
          { 'name' => 'burger', 'price' => 4.50 }
        ]
      )
  end

  let!(:sale_two) do
    Sale.create!(
      total: 6.50,
      items: [
        { 'name' => 'burger', 'price' => 4.50 },
        { 'name' => 'chips', 'price' => 2.00 }
      ]
    )
  end

  let!(:sale_three) do
    Sale.create!(
      total: 3.50,
      items: [
        { 'name' => 'burger', 'price' => 4.50, 'discount' => { 'reason' => 'student discount', 'amount' => 1.00 } }
      ]
    )
  end

  let!(:sale_four) do
    Sale.create!(
      total: 11.50,
      items: [
        { 'name' => 'soft drink', 'price' => 1.50 },
        { 'name' => 'burger', 'price' => 4.50, 'discount' => { 'reason' => 'meal deal', 'amount' => 1.00 } },
        { 'name' => 'chips', 'price' => 2.00, 'discount' => { 'reason' => 'meal deal', 'amount' => 0.50 } },
        { 'name' => 'soft drink', 'price' => 1.50 },
        { 'name' => 'burger', 'price' => 4.50, 'discount' => { 'reason' => 'student discount', 'amount' => 1.00 } }
      ]
    )
  end

  describe '#total_sales' do
    before { get "/reports/total_sales" }

    it { expect(response).to be_success }

    it 'returns an object with the correct number_of_sales' do
      expect(json['number_of_sales']).to eql(4)
    end

    it 'returns an object with the correct sales total' do
      expect(json['total']).to eql(27.50)
    end
  end

  describe '#sales_per_item' do
    before { get "/reports/sales_per_item" }

    it { expect(response).to be_success }

    it "returns an object with a key for each item" do
      expect(json.keys.sort).to eql(['soft drink', 'chips', 'burger'].sort)
    end

    it 'returns only the expected data keys for each item' do
      all_data_keys = json.values.flat_map { |data| data.keys }.uniq.sort
      expect(all_data_keys).to eql(['number_of_sales', 'total'])
    end

    it 'returns the correct number_of_sales for soft drinks' do
      expect(json['soft drink']['number_of_sales']).to eql(3)
    end

    it 'returns the correct total sales value for soft drinks' do
      expect(json['soft drink']['total']).to eql(4.50)
    end

    it 'returns the correct number_of_sales for chips' do
      expect(json['chips']['number_of_sales']).to eql(2)
    end

    it 'returns the correct total sales value for chips' do
      expect(json['chips']['total']).to eql(3.50)
    end

    it 'returns the correct number_of_sales for burgers' do
      expect(json['burger']['number_of_sales']).to eql(5)
    end

    it 'returns the correct total sales value for burgers' do
      expect(json['burger']['total']).to eql(19.50)
    end
  end
end
