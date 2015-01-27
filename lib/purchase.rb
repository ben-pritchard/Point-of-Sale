class Purchase < ActiveRecord::Base
  scope(:flagged, -> do
    where({:flagged => true})
  end)

  has_many(:products)
end
