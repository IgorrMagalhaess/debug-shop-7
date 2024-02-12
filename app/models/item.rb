class Item < ApplicationRecord
  belongs_to :merchant

  def active_inactive? 
    active_inactive ? "Active" : "Inactive"
  end
end
