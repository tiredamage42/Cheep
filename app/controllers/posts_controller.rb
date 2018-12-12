class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  before_action :set_post, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :set_new_post, only: [:index, :create]


  
  
  def upvote
    if current_user.voted_up_on? @post
      @post.unliked_by current_user
    else
      if current_user.voted_down_on? @post
        @post.undisliked_by current_user
      end
      @post.liked_by current_user
    end
    redirect_to posts_path
  end
  
  def downvote
    if current_user.voted_down_on? @post
      @post.undisliked_by current_user
    else
      if current_user.voted_up_on? @post
        @post.unliked_by current_user
      end
      @post.disliked_by current_user
    end
    redirect_to posts_path
  end



  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.search(params[:search])
    
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = current_user.posts.build
    #@post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @user = current_user
    
    respond_to do |format|
      if @post.save

        #if post is created mail poster
        #when subscribed only
        #PostMailer.post_created(@user).deliver

        format.html { redirect_to posts_url, notice: 'Post was successfully created.' }
        
        #format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to posts_url, notice: 'Post was successfully updated.' }
        #format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_new_post
      #@post = current_user.posts.new(post_params)
      @post = current_user.posts.build(post_params)
    
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:body, :user_id)
    end
end
