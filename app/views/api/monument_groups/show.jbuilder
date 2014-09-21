json.(@monument_group, :id, :name)
json.monuments(@monument_group.monuments) do |item|
  json.(item, :id, :name, :description)
end