# ------------------------------------------------------------------------------
# Display all photos
# ------------------------------------------------------------------------------
get "/all_photos" do
  erb :"/photos/all_photos"
end

# ------------------------------------------------------------------------------
# Add a new photo
# ------------------------------------------------------------------------------
# Step 1 - Display a form to the user
get "/add_photo" do
  erb :"photos/add_photo"
end

# Step 2 - Save the information
get "/save_new_photo" do
  @new_photo = Photo.create({"title" => params["photos"]["title"], "location" => params["photos"]["location"], "photographer_id" => params["photos"]["photographer_id"]})

  if @new_photo.errors.length > 0
    @error = true
    erb :"photos/add_photo"
  else
    erb :"photos/success"
  end
end
