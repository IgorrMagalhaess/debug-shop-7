require 'rails_helper'

RSpec.describe "As a Visitor" do
  describe "After visiting a merchants show page and clicking on updating that merchant" do
    it 'I can see prepopulated info on that user in the edit form' do
      merchant_1 = Merchant.create(name: "Meghan" ,address: "123 something street" , city: "Hershey", state: "PA", zip: 17033 )


      visit "/merchants/#{merchant_1.id}"
      click_on "Update Merchant Info"

      expect(find_field('Name').value).to eq 'Meghan'
      expect(find_field('Address').value).to eq '123 something street'
      expect(find_field('City').value).to eq 'Hershey'
      expect(find_field('State').value).to eq 'PA'
      expect(find_field('Zip').value).to eq "17033"
    end

    it 'I can edit merchant info by filling in the form and clicking submit' do
      merchant_1 = Merchant.create(name: "Meghan" ,address: "123 something street" , city: "Hershey", state: "PA", zip: 17033 )
      visit "/merchants/#{merchant_1.id}"

      click_on "Update Merchant Info"

      fill_in 'name', with: "Meg"
      fill_in 'address', with: "1223 Perry St."
      fill_in 'city', with: "Denver"
      fill_in 'state', with: "CO"
      fill_in 'zip', with: 80204

      click_button "Update Merchant"

      expect(current_path).to eq("/merchants/#{merchant_1.id}")
      expect(page).to have_content("Meg")
      expect(page).to have_content("Address: 1223 Perry St.")
      expect(page).to have_content("City: Denver")
      expect(page).to have_content("State: CO")
      expect(page).to have_content("Zip: 80204")
    end
  end
end
