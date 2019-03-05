class NotesController < ApplicationController
  
  before_action :find_note, only: [:show, :update, :edit, :destroy]

  def show
  end
  
  def index
    @notes = Note.all
    
  end

  def new
    @note = Note.new
    render partial: 'form'
  end

  def create
    @note = Note.new(note_params)
    
    if @note.save
      redirect_to note_path(@note)
    else
      render :new
    end
  end

  def edit
      render partial: 'form'
  end

  def update
    if @note.update(note_params)
      redirect to @note
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to note_path
  end

  private
  def note_params
    params.require(:note).permit(:body)
  end

  def find_note
    
    @note = Note.find(params[:id])
  end

end
