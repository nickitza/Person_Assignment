class PeopleController < ApplicationController
  def index
    @people = Person.order(:last_name)
  end

  def show
    @person = Person.find(params[:id])
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])
    if @person.update(person_params)
      redirect_to people_path
    else
      render :edit
    end
  end

  def new
    @person = Person.new()
  end

  def create
    # @page = Page.new(params.require(:page).permit(:title, :author, :body))
    @person = Person.new(person_params)
    if @person.save
      redirect_to people_path
    else
      render :new
    end
  end

  def destroy
    @person = Person.find(params[:id]).destroy
    redirect_to people_path
  end

  private
  def person_params
    params.require(:person).permit(:first_name, :last_name, :age, :eye_color, :hair_color, :gender, :alive)
  end

end
