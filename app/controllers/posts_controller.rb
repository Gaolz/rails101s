class PostsController < ApplicationController

	before_action :authenticate_user!
	before_action :find_group
	before_action :member_required, only: [:new, :create]

	def new
		@post = @group.posts.new
	end

	def edit
		@post = current_user.posts.find(params[:id])
	end

	def create
		@post = @group.posts.build(post_params)
		@post.author = current_user

		respond_to do |format|
			if @post.save
				# redirect_to group_path(@group), notice: "新增文章成功！"
				format.html {}
				format.js
			else
				format.html { render :new }
				format.js
			end
		end
	end

	def update
		@post = current_user.posts.find(params[:id])

		if @post.update(post_params)
			redirect_to group_path(@group), notice: "文章修改成功！"
		else
			render :edit
		end
	end

	def destroy
		@post = current_user.posts.find(params[:id])

		@post.destroy
		redirect_to group_path(@group), alert: "文章已删除！"
	end

	private

		def post_params
			params.require(:post).permit(:content)
		end

		def find_group
			@group = Group.find(params[:group_id])
		end

		def member_required
			return if current_user.is_member_of?(@group)
			flash[:warning] = "你不是这个讨论版的成员，不能发文喔！"
			redirect_to group_path(@group)
		end
end
