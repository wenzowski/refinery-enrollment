module Refinery
  module Enrollment
    class Engine < Rails::Engine
      include Refinery::Engine

      isolate_namespace Refinery::Enrollment

      initializer "register refinerycms_enrollment plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.pathname = root
          plugin.name = "refinerycms_enrollment"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.enrollment_admin_courses_path }
          plugin.menu_match = /refinery\/enrollment\/?(courses|sessions|students|guardians)?/
          plugin.activity = { :class_name => :'refinery/enrollment/course' }
        end
      end

      config.after_initialize do
        Refinery.register_engine(Refinery::Enrollment)
      end
    end
  end
end
