class AuthorsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
      authors = Author.all 
      render json: authors
      # , serializer: AuthorSerializer
      # , include: ['posts.title', 'profile','posts.post_tags']
  end

  def posts
    author= Author.find(params[:id])
    render json: author, serializer: AuthorPostsSerializer
  end

  def show
    author = Author.find(params[:id])
    render json: author
    # , include: ['posts.title', 'profile','posts.post_tags']
  end


  private

  def render_not_found_response
    render json: { error: "Author not found" }, status: :not_found
  end

end
