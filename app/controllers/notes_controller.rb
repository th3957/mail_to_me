class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_note, :identify_owner,
    only: [:edit, :show, :update, :destroy]
  before_action :set_associated_travel, only: [:index, :create, :edit]

  def index
    @notes = @associated_travel.notes.
                                page(params[:page]).
                                per(10).
                                order('id DESC')

    @note = Note.new
  end

  def personal
    @notes = Note.where(travel_id: current_user.travels.ids).
                  page(params[:page]).
                  per(10).
                  order('id DESC')
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

  def edit; end

  def update
    if @note.update(note_params)
      redirect_to note_path(@note),
        notice: I18n.t('views.message.success_update')
    else
      render partial: 'notes/new_js'
    end
  end

  def destroy
    @note.destroy
    redirect_to notes_path,
      notice: I18n.t('views.message.success_delete')
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def identify_owner
    if @note.travel.user_id != current_user.id
      render file: Rails.root.join('public/404.html'),
             status: 404,
             layout: false,
             content_type: 'text/html'
    end
  end

  def keep_own_travel_id
    session[:travel_id] = @note.travel_id
  end

  def note_params
    params.require(:note).
           permit(:content,
                  :image,
                  :image_cache,
                  :remove_image,
                  :importance,
                  :travel_id)
  end
end
