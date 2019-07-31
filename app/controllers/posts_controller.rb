class PostsController < ApplicationController
    def new
       @post = Post.new
        #byebug
        #@post = @artist.posts.build
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            @post.save
        @artist = Artist.find_by(id: post_params[:artist_id])
        @artist.posts << @post
        redirect_to artist_path(@artist)
        end
            
    end

    private

    def artist_params
        params.require(:artist_id)
    end

    def post_params
        params.require(:post).permit(:content, :media, :artist_id)
    end
end
