ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    columns do
      column do
        panel "Recent stores" do
          ul do
            Store.last(20).reverse.each do |store|
              li link_to(store.name, admin_store_path(store))
            end
          end
        end
      end

      column do
        panel "Recent users" do
          ul do
            User.last(20).reverse.each do |user|
              li link_to(user.email, admin_store_path(user))
            end
          end
        end
      end
    end
  end # content
end
