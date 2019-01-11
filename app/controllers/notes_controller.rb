class NotesController < ApplicationController
  before_action :set_note, only: [:edit, :show, :update, :destroy]
  before_action :set_associated_travel, only: [:index, :create, :show]

  def index
    @notes = @associated_travel.notes
  end

  def new
    @note = Note.new
  end

  def create
    @note = @associated_travel.notes.build(note_params)
    if @note.save
      redirect_to notes_path, notice: 'Successfully created.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @note.update(note_params)
      redirect_to note_path(@note), notice: 'Successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to notes_path, notice: 'Successfully deleted.'
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:content,
                                 :image,
                                 :importance,
                                 :travel_id
                                 )
  end
end
