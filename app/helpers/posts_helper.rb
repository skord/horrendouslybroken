module PostsHelper
  def post_link(post)
    if post.url.present?
      link_to post.name, post.url
    else
      link_to post.name, post_path(post)
    end
  end
end
