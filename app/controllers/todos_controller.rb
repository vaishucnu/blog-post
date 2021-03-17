class TodosController < ApplicationController
    before_action :find_item, only: [:show, :edit, :update, :destroy]
    def index
        @todos = Todo.all.order("created_at DESC")
    end

    def show
        
    end

    def new
        @todo = Todo.new
    end
    def create
        @todo = Todo.new(todo_params)
        if @todo.save
            render 'index'
        else
            render 'new'
        end
    end
    def edit
        @todo = Todo.find(params[:id])
    end
    def update
        @todo = Todo.find(params[:id])
        if @todo.update(todo_params)
            redirect_to todo_path(@todo)
        else 
            render 'edit'
        end
    end
    def destroy
        @todo.destroy
        render 'index'
    end

    private 
    def todo_params
        params.require(:todo).permit(:title, :description)
    end
    def find_item
        @todo = Todo.find(params[:id])
    end




end
