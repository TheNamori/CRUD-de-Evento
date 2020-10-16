require 'rails_helper'

RSpec.describe Guest, type: :model do
  before(:all) do
    @category = create(:category)
  end

  after(:all) do
    @category.destroy
  end

  it 'should be able to create a guest' do
    guest = create(:guest, category_id: @category.id)

    expect(guest.name).to eq('Matheus Viana Nunes Lamboia')
    expect(guest.age).to eq(22)
    expect(guest.gender).to eq('Masculino')
    expect(guest.category.name).to eq(@category.name)
    expect(guest.street).to eq('Rua Gasparino Lunardi')
    expect(guest.neighborhood).to eq('KM 18')
    expect(guest.cep).to eq('06110-260')
    expect(guest.street_number).to eq(1000)
    expect(guest.state).to eq('São Paulo')
    expect(guest.phones.each(&:phone)).to be_empty
    expect { guest.destroy }.to change(Guest, :count).by(-1)
  end

  it 'should be able to create a guest with phone' do
    guest = create(:guest, category_id: @category.id)
    phone = create(:phone, guest_id: guest.id)

    expect(guest.name).to eq('Matheus Viana Nunes Lamboia')
    expect(guest.age).to eq(22)
    expect(guest.gender).to eq('Masculino')
    expect(guest.category.name).to eq(@category.name)
    expect(guest.street).to eq('Rua Gasparino Lunardi')
    expect(guest.neighborhood).to eq('KM 18')
    expect(guest.cep).to eq('06110-260')
    expect(guest.street_number).to eq(1000)
    expect(guest.state).to eq('São Paulo')
    expect(guest.phones.first.phone).to eq(phone.phone)
    expect { phone.destroy }.to change(Phone, :count).by(-1)
    expect { guest.destroy }.to change(Guest, :count).by(-1)
  end
end
