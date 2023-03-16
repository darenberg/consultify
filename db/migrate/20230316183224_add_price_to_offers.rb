class AddPriceToOffers < ActiveRecord::Migration[7.0]
  def change
    add_column :offers, :price, :decimal
  end
end
