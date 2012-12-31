# Force ActiveRecord to store the actual class for single table inheritance polymorphic associations
ActiveRecord::Base.store_base_sti_class = false