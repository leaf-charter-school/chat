require "spec_helper"

feature "user adds grocery list item and quantity" do
  scenario "item added with quantity when filled form submitted" do
    visit "grocery-list"

    fill_in "Name", with: "Chocolate Cake"
    fill_in "Quantity", with: "3"
    click_on "Add"

    expect(page).to have_content("Chocolate Cake - Quantity: 3")
  end

  scenario "grocery item is not added when quantity is not specified and error message appears" do
    visit "/grocery-list"

    fill_in "Name", with: "Yogurt"
    click_on "Add"

    expect(page).to have_content("error - you must submit a grocery and a quantity")
  end
end
