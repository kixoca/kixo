module Paranoia
  def delete
    update_attribute_or_column(:deleted_at, Time.now) if !deleted? && persisted?
  end
end