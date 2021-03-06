class Api::PicturesToGalleriesController < ApplicationController
  def create
    @pictures_to_gallery = PicturesToGallery.new(pictures_to_gallery_params)
    if @pictures_to_gallery.save
      render :show
    else
      render json: @pictures_to_gallery.errors.full_messages, status: 422
    end
  end

  def index
    @pictures_to_galleries = PicturesToGallery.all
    render :index
  end

  private

  def pictures_to_gallery_params
    params.require(:pictures_to_gallery).permit(:picture_id, :gallery_id)
  end
end
