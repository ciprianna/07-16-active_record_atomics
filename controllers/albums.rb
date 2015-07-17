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

# ------------------------------------------------------------------------------
# Add photos to an existing album
# ------------------------------------------------------------------------------
# Step 1 - Display photos as a form
get "/add_photos_to_album" do
  erb :"albums/add_photos_to_album"
end

# Step 2 - Save selected photos for the album
get "/save_photos_for_album" do
  @album_to_add = Album.find(params["albums"]["id"])

  photo_list = params["photos"]["id"]

  photo_list.each do |photo|
    to_add = Photo.find(photo)
    @album_to_add.photos << to_add
  end

  erb :"index"
end

# ------------------------------------------------------------------------------
# Delete an album
# ------------------------------------------------------------------------------
# Step 1 - Display a form
get "/delete_album" do
  erb :"albums/delete_album"
end

# Step 2 - Delete the selected album
get "/delete_selected_album" do
  @album_to_delete = Album.find(params["album"]["id"])
  if params["album"]["confirm_delete"] == "yes"
    @album_to_delete.destroy
    erb :"albums/deleted"
  else
    erb :"index"
  end
end
