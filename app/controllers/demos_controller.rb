class DemosController < ApplicationController

  def new
    @demo = Demo.new
    
  end
 def create
  @demo = Demo.create(demo_params)
  if @demo.save
    flash[:notice]="Created successfully"
  redirect_to demo_path(@demo)
else
  render 'new'
 end
end

def show
  @demo= Demo.find(params[:id])
end

def edit
  @demo= Demo.find(params[:id])
 
end

def update
  @demo= Demo.find(params[:id])
   if @demo.update(demo_params)
    flash[:notice]="Updated successfully"
    redirect_to demo_path(@demo)
  else
    render 'edit'
end
end
def index
  @demos = Demo.all
end

 private
 def demo_params
  params.require(:demo).permit(:name, :description)
end

end