class PostsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

 
      # def index
      #   if params[:search] == nil
      #     @posts= Post.all
      #     @posts = @posts.page(params[:page]).per(3)
      #   elsif params[:search] == ''
      #     @posts= Post.all
      #     @posts = @posts.page(params[:page]).per(3)
      #   else
      #     @posts = Post.where("name LIKE ? ",'%' + params[:search] + '%', "%#{search}%")
      #               @posts = @posts.page(params[:page]).per(3)

      #   end
      # end

      def index
        if params[:search].present?
          search = params[:search]
          @posts = Post.where("station LIKE ? OR name LIKE ?", "%#{search}%", "%#{search}%")
          @posts = @posts.page(params[:page]).per(3)
        else
          @posts = Post.all
          @posts = @posts.page(params[:page]).per(3)
        end
      end

      def new
        @post = Post.new
      end

      def create
        post = Post.new(posts_params)
        post.user_id = current_user.id
        if post.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end

      def show
        @post = Post.find(params[:id])
        @comments = @post.comments
        @comment = Comment.new
    end
    
    def edit
      @post = Post.find(params[:id])
    end

    def update
      post = Post.find(params[:id])
      if post.update(posts_params)
        redirect_to :action => "show", :id => post.id
      else
        redirect_to :action => "new"
      end
    end

    def destroy
      post = Post.find(params[:id])
      post.destroy
      redirect_to action: :index
    end

      private
      def posts_params
        params.require(:post).permit(:name, :station, :battery, :wifi, :people, :image, :overall, :lat, :lng)
      end
end
