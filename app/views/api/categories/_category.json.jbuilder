json.extract! category, :id, :name, :created_at, :updated_at
json.image url_for(category.image) if category.image.attached?
