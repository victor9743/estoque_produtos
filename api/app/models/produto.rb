class Produto < ApplicationRecord
    validates :nome, presence: {message: "Campo nome obrigatório"}, uniqueness: {message: "nome do campo da existente"}
    validates :descricao, presence: {message: "Campo descrição obrigatório"}
    validates :preco, presence: {message: "Campo preço obrigatório"}, numericality: { greater_than_or_equal_to: 0, only_integer: true, message: "O campo quantidade deve ser maior que zero" }
    validates :quantidade, presence: {message: "Campo quantidade obrigatório"}, numericality: { greater_than_or_equal_to: 0, only_integer: true, message: "O campo quantidade deve ser maior que zero" }
end
