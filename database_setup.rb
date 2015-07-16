# Database Setup File

unless ActiveRecord::Base.connection.table_exists?(:photographers)
  ActiveRecord::Base.connection.create_table :photographers do |table|
    table.text :name
    table.text :location
  end
end
