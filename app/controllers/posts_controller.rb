class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
		@categories = Category.all
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to post_path(@post)
		else
			render :new
		end
	end

	def edit
		@post = Post.find(params[:id])

		@post.update(post_params)

		if @post.save
			redirect_to post_path(@post)
		else
			render :edit
		end
	end

	def update
		post = Post.find(params[:id])
		post.update(params.require(:post))
		redirect_to post_path(post)
	end
end
