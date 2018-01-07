json.array! @stores do |store|
  json.extract! store, :id,
                       :name,
                       :category,
                       :description,
                       :address,
                       :postcode,
                       :opening_hours,
                       :crypto,
                       :contact,
                       :website
end
