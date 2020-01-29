class PostsController < ApplicationController
    before_action :authenticate_user!

 

    def index
        @posts = Post.all
    end

    def show
       @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end
    def create
        post_params = params.require(:post).permit(:title,:header,:content)
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        @post.date = Date.current
        if @post.save
            redirect_to @post
        else
            render "new"
        end
    end
end
