require 'rails_helper'

describe 'Exercise 2: Sales API - Discounted Transactions' do

  describe '#create' do
    context 'with a discounted item' do
      before do
        post '/sales', {
          'sale' => {
            'items' => [
              {
                'name' => 'burger',
                'price' => 4.50,
                'discount' => { 'reason' => 'student discount', 'amount' => 1.00 }
              }
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
        expect(json['total']).to eql(3.50)
      end
    end

    context 'with a mix of discounted and non-discounted items' do
      before do
        post '/sales', {
          'sale' => {
            'items' => [
              {
                'name' => 'burger',
                'price' => 4.50,
                'discount' => { 'reason' => 'student discount', 'amount' => 1.00 }
              },
              {
                'name' => 'milkshake',
                'price' => 2.50
              },
              {
                'name' => 'chips',
                'price' => 2.00
              }
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
        expect(json['total']).to eql(8.00)
      end
    end
  end

end
