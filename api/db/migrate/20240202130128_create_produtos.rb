class CreateProdutos < ActiveRecord::Migration[6.1]
  def change
    create_table :produtos do |t|
      t.string :nome
      t.string :descricao
      t.integer :preco
      t.integer :quantidade

      t.timestamps
    end
  end
end
