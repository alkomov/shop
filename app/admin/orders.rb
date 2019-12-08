ActiveAdmin.register Order do
  index do
    selectable_column
    id_column
    column :phone
    column :email
    column :name
    column :items_count do |order|
      order.item_ids.split(',').count
    end
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :phone
      row :email
      row :name
      row :items do |order|
        order.items_formatted.map do |item|
          "#{link_to(item[:item].title, admin_item_path(item[:item]))} - #{item[:count]} шт."
        end.join('</br>').html_safe
      end
      row :created_at
      row :updated_at
    end
  end
end