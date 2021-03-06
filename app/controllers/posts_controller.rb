class PostsController < ApplicationController
    
    def index
        @posts = Post.all
    end
        
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

    def destroy
        @post = Post.find_by(id: params[:id])
        artist = @post.artist
        @post.destroy
        redirect_to artist_path(artist)
    end

    private

    def artist_params
        params.require(:artist_id)
    end

    def post_params
        params.require(:post).permit(:content, :media, :artist_id)
    end
end
