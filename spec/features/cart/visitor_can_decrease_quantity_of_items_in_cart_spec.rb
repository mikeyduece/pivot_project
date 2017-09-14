require "rails_helper"

feature "When a visitor adds an item to their cart and visits their cart" do

  scenario "and they can decrease the quantity of an item in their cart" do
    item1 = create(:item)
    item2 = create(:item)

    visit item_path(item1)

    click_on "Add to Cart"
    click_on "Add to Cart"

    click_on "Cart"

    expect(page).to have_content("2")
    expect(page).to have_content(100.0)

    click_on "delete"

    expect(page).to have_content("Successfully removed #{item1.name}")
    expect(current_path).to eq(cart_path)
    expect(page).to have_content("1")
    expect(page).to have_content(50.0)
  end
end
