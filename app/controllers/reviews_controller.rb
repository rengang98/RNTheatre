class ReviewsController < ApplicationController
  def new
    @tplay = Tplay.find params[:tplay_id]
    @review = Review.new
  end

  def create
    @tplay = Tplay.find params[:tplay_id]
    @review = Review.new params.require(:review).permit(:rating, :comment)

    @review.tplay_id= @tplay.id

    @review.user_id = current_user.id
    if @review.save
      flash[:notice]="Review successful!"
      redirect_to tplay_path(@tplay)
    else
      flash[:notice]="Review failed..."
      render 'new'

    end
  end

  def edit
     @tplay = Tplay.find params[:tplay_id]
     @review = Review.find(params[:id])

  end

  def update
    @tplay = Tplay.find params[:tplay_id]
    @review = Review.find(params[:id])
    if @review.update(params.require(:review).permit(:rating, :comment))
      flash[:notice]="Update successful!"
      redirect_to tplay_path(@tplay)
    else
      render 'edit'
    end
  end

  def destroy
    @tplay = Tplay.find params[:tplay_id]
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice]="The review has been deleted!"
    redirect_to tplay_path(@tplay)
  end


end
