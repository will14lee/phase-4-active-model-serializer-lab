class AuthorPostsSerializer < ActiveModel::Serializer
  attributes :title, :short_content
  has_many :tags
  def title
    object.title
  end
  def short_content
    "#{self.object.content[0...40]}..."
  end
end
