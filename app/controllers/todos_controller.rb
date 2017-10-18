class TodosController < ApplicationController
  before_action :set_todo, :only => [:edit, :options, :update, :destroy]

  def index
    @todos = Todo.all
    @todo = Todo.new
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.datetime_create ||= DateTime.current
    if @todo.save
      redirect_to todos_url
    else
      render :action => :new
    end
  end

  def edit
  end

  def options
  end

  def update
    if @todo.update_attributes(todo_params)
      redirect_to todos_url
    else
      render :action => :edit
    end
  end

  def destroy
    @todo.destroy
    redirect_to todos_url
  end

  private

  def todo_params
    params.require(:todo).permit(:description, :datetime_create, :priority, :done)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end
end
