require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
    it { should have_many(:snacks).through(:machine_snacks) }
  end

  describe 'instance method' do
    it '.average_price' do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      snack_1 = dons.snacks.create(name: "Turkey", price: 5)
      snack_2 = dons.snacks.create(name: "soda bang", price: 10)
      snack_3 = dons.snacks.create(name: "1 hot wiener", price: 15)

      expect(dons.average_price).to eq(10)
    end
  end
end
