# Photographer Model

unless ActiveRecord::Base.connection.table_exists?(:beers)
  ActiveRecord::Base.connection.create_table :beers do |t|
    t.text :name
    t.integer :style_id
    t.text :color
    t.integer :ibu
    t.float :abv
    t.text :review
    t.text :date
  end
end
