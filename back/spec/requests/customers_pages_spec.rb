require 'rails_helper'

RSpec.describe "CustomersPages", type: :request, js: true do
 
 before(:each) do
 	@customer = FactoryGirl.create(:customer)
 end 
 
  subject {page}

  context 'see the list of all customers' do
  	before {
  		visit('/#/') 
  	}
  	 	
  	it {should have_content(@customer.name)}
  end

  context 'search for customer' do
  	before {
  		@other_customer = FactoryGirl.create(:customer, name: 'Michael')
  		visit('/#/')
  		find(:xpath, "//input[@type='search']").set('Se')
  	}  	
  	
  	it {should have_content(@customer.name) }
  	it {should_not have_content(@other_customer.name) }
  end

  context 'clicking on views order redirects to order' do
  	before {
  		visit('/#/')
  		find_link('View Order').click  		
  	}

  	it { should have_content(@customer.orders.first.product) }
  end

  context 'clicking on delete deletes customer' do
  	before {
  		visit('/#/')
  		find("#delete").click
  	}

  	it { should_not have_content(@customer.name)}
  end

  context 'Creating Customer' do
    it 'creates new customer' do
      visit('/#/')
      click_link('Add Customer')
      fill_in 'Name', with: 'Vladimir'
      fill_in 'City', with: 'Moscow'
      click_on 'Create Customer'

      expect(page).to have_content('Vladimir')
    end     
  end

  context 'Editing Customer' do
    it 'edits customer' do
      visit('/#/')
      click_link('Edit Customer')
      fill_in 'Name', with: 'Sabubu'
      fill_in 'City', with: 'Mumbala'
      click_on 'Save Changes'
      expect(page).to have_content('Sabubu')
    end
  end
end
