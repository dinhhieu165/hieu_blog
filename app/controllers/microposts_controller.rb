class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def show
    @micropost = Micropost.find(params[:id])
  end

  def method_name

  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:sucess] = "Micropost created"
      redirect_to @micropost
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

    def micropost_params
      params.require(:micropost).permit(:title, :content)
    end
end
