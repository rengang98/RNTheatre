require 'tplay_decorator'
class Back::TplaysController < Back::BaseController

  def index
@tplay=Tplay.page(params[:page]||1).per_page(params[:per_page] || 5).order(id: "desc")
  end

  def new
@tplay=Tplay.new
    @top_categories= Category.roots

  end

  def create
    @tplay=Tplay.new(params.require(:tplay).permit!)
    @top_categories= Category.roots
    if @tplay.save
      flash[:notice] = "Successful saved"
      redirect_to back_tplays_path
    else
      flash[:notice] = "Save failed"
      render action: :new
    end
    # create an instance/object of a BasicCar
    myTplay = BasicTplay.new
    # add the extra features to the new car
    if params[:tplay][:selling].to_s.length > 0 then
      myTplay = SellingDecorator.new(myTplay)
    end

    ## populate the cost and the description details
    @tplay.selling = myTplay.details

  end

  def edit
@tplay = Tplay.find(params[:id])
@top_categories= Category.roots

    render action: :new
  end

  def update


@tplay = Tplay.find(params[:id])
@tplay.attributes = params.require(:tplay).permit!
@top_categories= Category.roots
myTplay1 = BasicTplay.new
if params[:tplay][:selling].to_s.length > 0 then
  myTplay1 = SellingDecorator.new(myTplay1)
end
@tplay.selling = myTplay1.details
    if @tplay.save
      flash[:notice] = "Successful edited"
      redirect_to back_tplays_path
    else
      flash[:notice] = "Edit failed"
      render action: :new
    end



  end

  def destroy
    @tplay = Tplay.find(params[:id])
    if @tplay.destroy
      flash[:notice] = "Successful deleted"
      redirect_to back_tplays_path
    else
      flash[:notice] = "delete failed"
      render action: :new
    end
  end
end