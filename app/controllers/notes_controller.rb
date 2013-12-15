class NotesController < ApplicationController
  before_action :is_authenticated?
  before_action :get_topic
  before_action :get_note, only: [ :show, :edit, :update, :destroy ]

  def index
    @notes = Note.all.entries
  end

  def show
  end

  def new
    @note = Note.new(topic: @topic)
  end

  def create
    @note = Note.new(note_params)
    @note.topic = @topic
    @note.user_name = current_user.name
    @note.user_id = current_user.id

    if @note.save
      redirect_to topic_note_url(@topic, @note), notice: "Note created."
    else
      flash.now[:error] = "Failed to create note: #{@note.errors}."
      render :new
    end
  end

  def edit
    redirect_to topic_note_url(@topic, @note),
      error: "Only the owner of a note may edit it." unless @note.user_id == current_user.id
  end

  def update
    redirect_to topic_note_url(@topic, @note),
      error: "Only the owner of a note may edit it." unless @note.user_id == current_user.id

    if @note.update(note_params)
      redirect_to topic_note_url(@topic, @note), notice: "Note updated."
    else
      flash.now[:error] = "Failed to update note: #{@note.errors}."
      render :edit
    end
  end

  def destroy
    title = @note.title
    if @note.destroy
      redirect_to :index, notice: "Deleted note &ldquo;#{title}.&rdquo;"
    else
      redirect_to :index, error: "Failed to delete note: #{@note.errors}."
    end
  end

  private

  def get_topic
    redirect_to root_url, error: "Must supply a topic." unless @topic = Topic.find_by(id: params[:topic_id])
  end

  def get_note
    redirect_to topic_notes_url(@topic) unless @note = Note.find_by(id: params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :content)
  end
end