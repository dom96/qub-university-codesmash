require 'rails_helper'

describe 'Exercise 1: Sales API - Basic Transactions' do

  describe '#index' do
    context 'without sales in the database' do
      before { get '/sales' }

      it { expect(response).to be_success }

      it 'should return an empty set of sales' do
        expect(json).to eql([])
      end
    end

    context 'with sales in the database' do
      let(:first_sale) {
        Sale.create!(
          'total' => 6.00,
          'items' => [
            { 'name' => 'soft drink', 'price' => 1.50 },
            { 'name' => 'burger', 'price' => 4.50 }
          ]
        )
      }

      let(:second_sale) {
        Sale.create!(
          'total' => 9.00,
          'items' => [
            { 'name' => 'milkshake', 'price' => 2.50 },
            { 'name' => 'burger', 'price' => 4.50 },
            { 'name' => 'chips', 'price' => 2.00 }
          ]
        )
      }

      let!(:expected_sales_array) {
        [
          {
            'id' => first_sale.id,
            'items' => [
              { 'name' => 'soft drink', 'price' => 1.50 },
              { 'name' => 'burger', 'price' => 4.50 }
            ],
            'total' => 6.00
          },
          {
            'id' => second_sale.id,
            'items' => [
              { 'name' => 'milkshake', 'price' => 2.50 },
              { 'name' => 'burger', 'price' => 4.50 },
              { 'name' => 'chips', 'price' => 2.00 }
            ],
            'total' => 9.00
          }
        ]
      }

      before { get '/sales' }

      it { expect(response).to be_success }

      it 'should return an array of sales' do
        expect(json).to eql(expected_sales_array)
      end
    end
  end

  describe '#show' do
    let(:sale) {
      Sale.create(
        'total' => 6.00,
        'items' => [
          { 'name' => 'soft drink', 'price' => 1.50 },
          { 'name' => 'burger', 'price' => 4.50 }
        ]
      )
    }

    let!(:expected_sales_object) {
      {
        'id' => sale.id,
        'total' => 6.00,
        'items' => [
          { 'name' => 'soft drink', 'price' => 1.50 },
          { 'name' => 'burger', 'price' => 4.50 }
        ]
      }
    }

    before { get "/sales/#{sale.id}" }

    it { expect(response).to be_success }

    it 'should return a sale object' do
      expect(json).to eql(expected_sales_object)
    end
  end

  describe '#create' do
    before do
      post '/sales', {
        sale: {
          'items' => [
            { 'name' => 'soft drink', 'price' => 1.50 },
            { 'name' => 'burger', 'price' => 4.50 }
          ]
        }
      }
    end

    it { expect(response).to be_success }

    it 'should save the sale to a database' do
      expect(Sale.last).not_to be_nil
    end

    it 'should return the new object id' do
      expect(json['id']).to eql(Sale.last.id)
    end

    it 'should return the total' do
      expect(json['total']).to eql(6.00)
    end
  end
end
