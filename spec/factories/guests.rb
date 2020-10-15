FactoryBot.define do
  factory :guest do
    name { 'Matheus Viana Nunes Lamboia' }
    age { 22 }
    gender { 'Masculino' }
    category_id { 1 }
    street { 'Rua Gasparino Lunardi' }
    neighborhood { 'KM 18' }
    cep { '06110-260' }
    street_number { 1000 }
    state { 'São Paulo' }
  end
end
