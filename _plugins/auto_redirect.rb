Jekyll::Hooks.register :posts, :pre_render do |post|
  if post.data['permalink']
    default_permalink = Jekyll::URL.new({
      template: post.site.permalink_style,
      placeholders: post.url_placeholders
    }).to_s

    if default_permalink != post.url
      post.data['redirect_from'] = [default_permalink]
    end
  end
end