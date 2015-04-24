module ApplicationHelper
	def body_class
	"#{controller_name} #{action_name}"
	end

  def current_page(path)
    "active" if current_page?(path)
  end

	def avatar_url(user)
	  gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
  	"https://gravatar.com/avatar/#{gravatar_id}.png?s=35"
	end

  def avatar_medium_url(user)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "https://gravatar.com/avatar/#{gravatar_id}.png?s=90"
  end

	def avatar_big_url(user)
	  gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
  	"https://gravatar.com/avatar/#{gravatar_id}.png?s=200"
	end

	def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end
end
