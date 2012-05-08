module Refinery
  module Enrollment
    module Admin
      class SettingsController < ::Refinery::AdminController

        def notification_recipients
          @recipients = Refinery::Enrollment::Student::Registration::Notification.recipients

          if request.post?
            Refinery::Enrollment::Student::Registration::Notification.recipients = params[:recipients]
            flash[:notice] = t('updated', :scope => 'refinery.enrollment.admin.settings.notification_recipients',
                               :recipients => Refinery::Enrollment::Student::Registration::Notification.recipients)
            unless request.xhr? or from_dialog?
              redirect_back_or_default(refinery.enrollment_admin_courses_path)
            else
              render :text => "<script type='text/javascript'>parent.window.location = '#{refinery.enrollment_admin_courses_path}';</script>",
                     :layout => false
            end
          end
        end

      end
    end
  end
end