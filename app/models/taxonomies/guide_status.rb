class GuideStatus < Taxonomy
  def self.find_by_name(name)
    guide_status_name = GuideStatusName.find_by_name(name)
    guide_status = guide_status_name ? guide_status_name.guide_status : nil
  end
end
