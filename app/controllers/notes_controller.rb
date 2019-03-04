class NotesController < ApplicationController
  
  before action :find_note only: [:show, :update, :edit, :destroy]

  def show
  end
  
  def index
    @notes = Notes.all
    render partial: 'form'
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    
    if @note.save
      redirect_to notes_path
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
    params.require(:note).permis(:name)
  end

  def find_note
    @note = Note.find(params[:id])
  end

end
