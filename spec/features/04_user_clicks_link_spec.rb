require "spec_helper"

feature "user clicks on grocery-item" do
  scenario "item re-directs to a page that has the grocery item and quantity" do
    visit "grocery-list"

    fill_in "Name", with: "Chocolate Cake"
    fill_in "Quantity", with: "3"
    click_on "Add"

    click_link "Chocolate Cake - Quantity: 3"

    expect(page).to have_content("Chocolate Cake - Quantity: 3")
  end
end
