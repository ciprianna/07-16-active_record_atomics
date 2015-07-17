# ------------------------------------------------------------------------------
# Display an album's photos
# ------------------------------------------------------------------------------
get "/album/:id" do
  @album = Album.find(params["id"])
  erb :"albums/album_photos"
end

# ------------------------------------------------------------------------------
# Display a photo's info
# ------------------------------------------------------------------------------
get "/album/photo/:id" do
  @photo = Photo.find(params["id"])
  @photographer = Photographer.find(@photo.photographer_id)
  erb :"photos/photo_information"
end

# ------------------------------------------------------------------------------
# Create an album
# ------------------------------------------------------------------------------
# Step 1 - Display an empty form
get "/add_album" do
  erb :"albums/add_album"
end

# Step 2 - Save new album
get "/save_new_album" do
  @new_album = Album.create({"title" => params["albums"]["title"]})

  if !@new_album.errors.empty?
    @error = true
    erb :"albums/add_album"
  else
    @new_photo
    erb :"albums/success"
  end
end
