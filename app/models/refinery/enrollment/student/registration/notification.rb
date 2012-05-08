module Refinery
  module Enrollment
    class Student
      class Registration
        module Notification
          class << self
            def recipients
              Refinery::Setting.find_or_set(:student_registration_notification_recipients, (Refinery::Role[:refinery].users.first.email rescue ''),
              {
                :scoping => 'enrollment',
                :restricted => false
              })
            end

            def recipients=(emails)
              new_value = {
                :value => emails,
                :scoping => 'enrollment',
                :restricted => false
              }
              Refinery::Setting.set(:student_registration_notification_recipients, new_value)
            end

            def subject
              Refinery::Setting.find_or_set(:student_registration_notification_subject, "New registration on your website", {
                :scoping => 'enrollment',
                :restricted => false
              })
            end

            def subject=(subject_line)
              new_value = {
                :value => subject_line,
                :scoping => 'enrollment',
                :restricted => false
              }
              Refinery::Setting.set(:student_registration_notification_subject, new_value)
            end
          end
        end
      end
    end
  end
end
