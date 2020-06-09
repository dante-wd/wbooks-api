ActiveAdmin.register User do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params do
    permitted = %i[email first_name last_name locale]
    permitted
    #   permitted << :other if params[:action] == 'create' && current_user.admin?
    #   permitted
  end
  form do |f|
    f.inputs do
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :locale
    end
    f.actions
  end
end
