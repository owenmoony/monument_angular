json.array! @monument_groups do |group|
  json.(group,
    :id,
    :owner_id,
    :created_at,
    :name
  )
end
