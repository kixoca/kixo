module ApplicationHelper

  # generates a slug from the name using 'to_slug' extension unless a slug is already specified
  def generate_slug_from_name
    self.slug = self.name.to_slug if slug.empty?
  end

end
