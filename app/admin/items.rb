ActiveAdmin.register Item do
  permit_params :title, :description, :price, :image, :category_id

  index do
    selectable_column
    id_column
    column :title
    column :description
    column :price
    column :category do |item|
      link_to(item.category.name, admin_category_path(item.category))
    end
    column 'Image' do |item|
      image_tag(item.image.url(:thumb))
    end
    column :created_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :price
      f.input :category_id, label: 'Category', as: :select, collection: Category.all.map { |category| [category.name, category.id] }
      f.input :image, as: :file, :hint => image_tag(f.object.image.url(:thumb))
    end
    f.actions
  end

  show do
    attributes_table do
      row :title
      row :description
      row :price
      row :category do |item|
        link_to(item.category.name, admin_category_path(item.category))
      end
      row :image do |item|
        image_tag item.image.url(:medium)
      end
      row :created_at
      row :updated_at
    end
  end
end
