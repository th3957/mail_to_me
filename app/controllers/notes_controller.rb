class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_note, only: [:edit, :show, :update, :destroy]
  before_action :set_associated_travel, only: [:index, :create, :edit]

  def index
    @notes = @associated_travel.notes.page(params[:page]).per(10).order('id DESC')
    @note = Note.new
  end

  def personal
    @notes = Note.where(travel_id: current_user.travels.ids).page(params[:page]).per(10).order('id DESC')
  end

  def create
    @note = @associated_travel.notes.build(note_params)
    if @note.save
      render partial: 'notes/index_js'
    else
      render partial: 'notes/new_js'
    end
  end

  def show
    keep_own_travel_id
    set_associated_travel
  end

  def edit
  end

  def update
    respond_to do |f|
      if @note.update(note_params)
        f.html { redirect_to note_path(@note), notice: 'Successfully updated.' }
      else
        f.js { render partial: 'notes/new_js' }
      end
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

  def keep_own_travel_id
    session[:travel_id] = @note.travel_id
  end

  def note_params
    params.require(:note).permit(:content,
                                 :image,
                                 :importance,
                                 :travel_id,
                                 :remove_image
                                 )
  end
end
