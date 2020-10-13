class Category < ActiveRecord::Base
  has_many :guests

  validates :name,
            presence: {
              message: 'É necessário selecionar uma Categoria para criar um Participante.'
            }
end
