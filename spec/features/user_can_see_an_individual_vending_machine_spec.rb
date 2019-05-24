require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  it "see snacks associated with that vending machine along with their price " do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack_1 = dons.snacks.create(name: "Turkey", price: 1)
    snack_2 = dons.snacks.create(name: "soda bang", price: 2)
    snack_3 = dons.snacks.create(name: "1 hot wiener", price: 3)

    visit machine_path(dons)

    expect(page).to have_content("#{snack_1.name}:$#{snack_1.price}")
    expect(page).to have_content("#{snack_2.name}:$#{snack_2.price}")
    expect(page).to have_content("#{snack_3.name}:$#{snack_3.price}")

  end
  it "can see average price of all snacks " do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack_1 = dons.snacks.create(name: "Turkey", price: 5)
    snack_2 = dons.snacks.create(name: "soda bang", price: 10)
    snack_3 = dons.snacks.create(name: "1 hot wiener", price: 15)

    visit machine_path(dons)
    average_price = (snack_1.price + snack_2.price + snack_3.price) / 3
    expect(page).to have_content("Average Price: $#{average_price}")

  end
end
