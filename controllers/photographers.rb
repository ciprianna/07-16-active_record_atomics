# ------------------------------------------------------------------------------
# View All photographers
# ------------------------------------------------------------------------------
get "/photographers" do
  erb :"photographers/photographers"
end

# ------------------------------------------------------------------------------
# Add a new photographer
# ------------------------------------------------------------------------------
# Step 1 - Display form
get "/add_photographer" do
  erb :"photographers/add_photographer"
end

# Step 2 - Save form info and add photographer to database
get "/save_new_photographer" do
  @new_photographer = Photographer.create({"name" => params["photographers"]["name"], "location" => params["photographers"]["location"]})

  if !@new_photographer.errors.empty?
    @error = true
    erb :"photographers/add_photographer"
  else
    @new_photo
    erb :"photographers/success"
  end
end
