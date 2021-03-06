class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all
    render('lessons/index.html.erb')
  end

  def new
    @sections = Section.all
    @lesson = Lesson.new
    render('lessons/new.html.erb')
  end

  def create
    @sections = Section.all
    @lesson = Lesson.new(params[:lesson])
    if @lesson.save
      redirect_to("/sections/#{@lesson.section.id}/lessons/#{@lesson.id}")
    else
      render('lessons/new.html.erb')
    end
  end

  def show
    @section = Section.find(params[:section_id])
    @lesson = Lesson.find(params[:id])
    render('lessons/show.html.erb')
  end

  def edit
    @sections = Section.all
    @lesson = Lesson.find(params[:id])
    render('lessons/edit.html.erb')
  end

  def update
    @lesson = Lesson.find(params[:id])
    @lesson.update(params[:lesson])
    redirect_to("/sections/#{@lesson.section.id}/lessons/#{@lesson.id}")
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    redirect_to('/sections')
  end

end
