class Guest < ActiveRecord::Base
  belongs_to :category
  has_many :phones, dependent: :destroy

  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true
  validates_associated :phones

  validates :name,
            presence: {
              message: 'É necessário preencher o campo Nome para criar um Participante.'
            },
            format: {
              with: /\A[a-zA-Z]+\z/,
              message: 'Apenas letras são permitidas no campo Nome.'
            },
            length: {
              maximum: 50,
              message: 'Não é permitido nomes com mais de 50 caracteres.'
            }

  validates :age,
            presence: {
              message: 'É necessário preencher o campo Idade para criar um Participante.'
            },
            numericality: {
              less_than_or_equal_to: 120,
              only_integer: true,
              message: 'Apenas números inteiros abaixo de 120 são permitidos no campo Idade.'
            }

  validates :gender,
            presence: {
              message: 'É necessário selecionar um Gênero para criar um Participante.'
            }

  validates :street,
            presence: {
              message: 'É necessário preencher o campo Rua para criar um Participante.'
            },
            format: {
              with: /[A-Za-z0-9 _]*[A-Za-z0-9][A-Za-z0-9 _]*/,
              message: 'Apenas letras e números são permitidas no campo Rua.'
            }

  validates :neighborhood,
            presence: {
              message: 'É necessário preencher o campo Bairro para criar um Participante.'
            },
            format: {
              with: /[A-Za-z0-9 _]*[A-Za-z0-9][A-Za-z0-9 _]*/,
              message: 'Apenas letras e números são permitidas no campo Bairro.'
            }

  validates :cep,
            presence: {
              message: 'É necessário preencher o campo CEP para criar um Participante.'
            },
            format: {
              with: /[0-9]-/,
              message: 'Apenas números são permitidos no campo CEP.'
            }

  validates :street_number,
            presence: {
              message: 'É necessário preencher o campo Número para criar um Participante.'
            },
            numericality: {
              only_integer: true,
              message: 'Apenas números inteiros são permitidos no campo Número.'
            }

  validates :state,
            presence: {
              message: 'É necessário selecionar um Estado para criar um Participante.'
            }
end
