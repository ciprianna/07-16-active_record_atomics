# Database Setup File

# photographers table
unless ActiveRecord::Base.connection.table_exists?(:photographers)
  ActiveRecord::Base.connection.create_table :photographers do |table|
    table.text :name
    table.text :location
  end
end

# photos table
unless ActiveRecord::Base.connection.table_exists?(:photos)
  ActiveRecord::Base.connection.create_table :photos do |table|
    table.text :title
    table.text :location
    table.integer :photographer_id
  end
end

# albums table
unless ActiveRecord::Base.connection.table_exists?(:albums)
  ActiveRecord::Base.connection.create_table :albums do |table|
    table.text :title
  end
end

# albums_photos table
unless ActiveRecord::Base.connection.table_exists?(:albums_photos)
  ActiveRecord::Base.connection.create_table :albums_photos do |table|
    table.integer :photo_id
    table.integer :album_id
  end
end
