module ApplicationHelper

  # generates a slug from the name using 'to_slug' extension unless a slug is already specified
  def generate_slug_from_name
    self.slug = self.name.to_slug if slug.empty?
  end

  # generates a slug from the title using 'to_slug' extension unless a slug is already specified
  def generate_slug_from_title
    self.slug = self.title.to_slug if slug.empty?
  end

end
