require 'rails_helper'

RSpec.describe 'When a user visits a snacks show page', type: :feature do
  it 'I see snack, price , locations,average price of snacks in machines, count in machine.' do
    owner_1 = Owner.create(name: "Sam's Snacks")
    dons  = owner_1.machines.create(location: "Don's Mixed Drinks")
    owner_2 = Owner.create(name: "Billy's Snacks")
    billy  = owner_2.machines.create(location: "Billy Mixed Drinks")
    owner_3 = Owner.create(name: "Martins's Snacks")
    martin  = owner_3.machines.create(location: "Martin's margaritas")

    turkey_1 = dons.snacks.create(name: "Turkey", price: 10)
    snack_1 = dons.snacks.create(name: "soda bang", price: 10)
    snack_2 = dons.snacks.create(name: "1 hot dog", price: 10)

    turkey_2 = billy.snacks.create(name: "Turkey", price: 10)
    snack_3 = billy.snacks.create(name: "soda pop", price: 20)

    turkey_3 = martin.snacks.create(name: "Turkey", price: 10)
    snack_4 = martin.snacks.create(name: "1 dog", price: 20)
    snack_5 = martin.snacks.create(name: "soda snap", price: 20)
    snack_6 = martin.snacks.create(name: "1 hot wiener", price: 30)

    visit snack_path(turkey_1)

    expect(page).to have_content("Turkey")
    expect(page).to have_content("Price: $#{turkey_1.price}")
    expect(page).to have_content("#{dons.location}, Average Price: $10 Snack Count: 3")
    expect(page).to have_content("#{billy.location}, Average Price: $15 Snack Count: 2")
    expect(page).to have_content("#{martine.location}, Average Price: $20 Snack Count: 4")


  end

end
