class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def show
    @micropost = Micropost.find(params[:id])
  end

  def method_name

  end

  def destroy
    @micropost.destroy
    flash[:success] = "Micropost deteled!!"
    redirect_to request.referrer || root_url
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:sucess] = "Micropost created"
      redirect_to @micropost
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

    def micropost_params
      params.require(:micropost).permit(:title, :content, :picture)
    end

    def correct_user
      @micropost =  current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
