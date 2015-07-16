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
