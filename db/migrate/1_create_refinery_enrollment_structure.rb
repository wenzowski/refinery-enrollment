class CreateRefineryEnrollmentStructure < ActiveRecord::Migration
  def change

    create_table Refinery::Enrollment::Course.table_name do |t|
      t.string  :name, :null => false
      t.timestamps
    end
    add_index Refinery::Enrollment::Course.table_name, :id

    create_table Refinery::Enrollment::Course::Prerequisite.table_name do |t|
      t.string  :type, :null => false
      t.string  :method, :null => false
      t.string  :matcher, :null => false
      t.integer :course_id, :null => false
      t.timestamps
    end
    add_index Refinery::Enrollment::Course::Prerequisite.table_name, :id
    add_index Refinery::Enrollment::Course::Prerequisite.table_name, :course_id



    create_table Refinery::Enrollment::Session.table_name do |t|
      t.date :begins_on, :null => false
      t.date :ends_on, :null => false
      t.date :registration_begins_on, :null => false
      t.date :registration_ends_on, :null => false
      t.timestamps
    end
    add_index Refinery::Enrollment::Session.table_name, :id

    create_table Refinery::Enrollment::Session::OfferedCourse.table_name do |t|
      t.integer :course_id, :null => false
      t.integer :session_id, :null => false
      t.timestamps
    end
    add_index Refinery::Enrollment::Session::OfferedCourse.table_name, :id
    add_index Refinery::Enrollment::Session::OfferedCourse.table_name, :course_id
    add_index Refinery::Enrollment::Session::OfferedCourse.table_name, :session_id



    create_table Refinery::Enrollment::Guardian.table_name do |t|
      t.string  :name, :null => false
      t.timestamps
    end
    add_index Refinery::Enrollment::Guardian.table_name, :id



    create_table Refinery::Enrollment::Student.table_name do |t|
      t.string  :name, :null => false
      t.timestamps
    end
    add_index Refinery::Enrollment::Student.table_name, :id

    create_table Refinery::Enrollment::Student::GuardianRelationship.table_name do |t|
      t.integer :student_id, :null => false
      t.integer :guardian_id, :null => false
      t.timestamps
    end
    add_index Refinery::Enrollment::Student::GuardianRelationship.table_name, :id
    add_index Refinery::Enrollment::Student::GuardianRelationship.table_name, :student_id,
      :name => 'index_refinery_enrollment_guardian_relationships_on_student_id'
    add_index Refinery::Enrollment::Student::GuardianRelationship.table_name, :guardian_id,
      :name => 'index_refinery_enrollment_guardian_relationships_on_guardian_id'

    create_table Refinery::Enrollment::Student::Registration.table_name do |t|
      t.integer :offered_course_id, :null => false
      t.integer :student_id, :null => false
      t.timestamps
    end
    add_index Refinery::Enrollment::Student::Registration.table_name, :id
    add_index Refinery::Enrollment::Student::Registration.table_name, :offered_course_id,
      :name => 'index_refinery_enrollment_registrations_on_offered_course_id'
    add_index Refinery::Enrollment::Student::Registration.table_name, :student_id,
      :name => 'index_refinery_enrollment_registrations_on_offered_student_id'



    create_table Refinery::Enrollment::Fee.table_name do |t|
      t.integer :cents, :default => 0, :null => false
      t.string  :currency, :null => false
      t.integer :billable_id, :null => false
      t.string  :billable_type, :null => false, :limit => 20
      t.timestamps
    end
    add_index Refinery::Enrollment::Fee.table_name, :id
    add_index Refinery::Enrollment::Fee.table_name, [:billable_id, :billable_type], :unique => true



    create_table Refinery::Enrollment::User.table_name do |t|
      t.integer :user_id, :null => false
      t.integer :authenticatable_id, :null => false
      t.string  :authenticatable_type, :null => false, :limit => 20
      t.timestamps
    end
    add_index Refinery::Enrollment::User.table_name, :id
    add_index Refinery::Enrollment::User.table_name, :user_id
    add_index Refinery::Enrollment::User.table_name, [:authenticatable_id, :authenticatable_type], :unique => true, :name => 'index_refinery_enrollment_users_on_authenticatable_id_and_type'

  end
end
