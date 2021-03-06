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

  if !@new_photo.errors.empty?
    @error = true
    erb :"photos/add_photo"
  else
    @new_photo
    erb :"photos/add_to_album"
  end
end

# Step 3 - Add photo to albums
get "/save_photo_to_albums" do
  album_list = params["albums"]["album_id"]
  @new_photo = Photo.find(params["photos"]["id"])

  album_list.each do |id|
    album = Album.find(id)
    @new_photo.albums << album
  end

  erb :"photos/success"
end
