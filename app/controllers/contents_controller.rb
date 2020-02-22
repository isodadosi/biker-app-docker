class ContentsController < ApplicationController

  def index
    @contents = Content.search(params[:search]).page(params[:page])
  end


  def new
    @content = Content.new(flash[:content])
  end


  def create
    content = Content.new(content_params)
    if content.save
       # gem geocoderの機能ざっくりと緯度経度から住所を求める
    results = Geocoder.search([content[:latitude],content[:longitude]])
    @prefecture = results.first.state
    content[:prefecture] = @prefecture
    @address = results.first.address
    @address_split = @address.split(",").reverse
    @address = @address_split.join(" ")
    content[:place] = @address
    content.save
    redirect_to content
    else
      redirect_to new_content_path, flash: {
        content: content,
        error_messages: content.errors.full_messages
      }
    end
    
    
  end

  def show
    @content = Content.find(params[:id])
    @comment = Comment.new(content_id: @content.id)
  end

  def destroy
    content = Content.find(params[:id])
    content.destroy

    redirect_to users_path
  end

  def edit
    @content = Content.find(params[:id])
  end

  def update
    content = Content.find(params[:id])
    content.update(content_params)

    redirect_to content
  end

  private

  def content_params
    params.require(:content).permit(:title, :name, :place, :body, :prefecture, :image , :latitude, :longitude, prefecture_ids: [])
  end

end
