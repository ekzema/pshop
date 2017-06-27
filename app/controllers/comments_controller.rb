class CommentsController < ApplicationController
  before_action :authenticate_rootadmin!, except: [:create]
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  layout 'adminpanel'
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    params[:comment][:name] = current_user.name
    params[:comment][:phone] = current_user.phone
    params[:comment][:email] = current_user.email
    @comment = Comment.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.js
      else
        format.js
      end
    end

  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to adminpanel_comments_path, notice: 'Комментарий успешно обновлён' }
        format.json { render :show, status: :ok, location: adminpanel_comments_path }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    if @comment.destroy
      render text: 'ok'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:product_id, :name, :email, :phone, :body, :moderation)
    end
end
