require 'spec_helper'

module Refinery
  module Enrollment
    describe Session do
      it { should have_db_column(:id) }
      it { should have_db_column(:begins_on) }
      it { should have_db_column(:ends_on) }
      it { should have_db_column(:registration_begins_on) }
      it { should have_db_column(:registration_ends_on) }

      it { should have_db_index(:id) }

      it { should have_many(:offered_courses) }
      it { should have_many(:courses).through(:offered_courses) }
      it { should have_many(:registrations).through(:offered_courses) }
      it { should have_many(:fees) }

      it { should validate_presence_of(:begins_on) }
      it { should validate_presence_of(:ends_on) }
      it { should validate_presence_of(:registration_begins_on) }
      it { should validate_presence_of(:registration_ends_on) }

      it 'validates that it ends after it begins' do
        Factory.build(:session,
                      :begins_on  => 1.day.from_now,
                      :ends_on    => 2.days.from_now).should be_valid
        Factory.build(:session,
                      :begins_on  => 2.days.from_now,
                      :ends_on    => 1.day.from_now).should_not be_valid
      end

      it 'validates that registration ends after it begins' do
        Factory.build(:session,
                      :registration_begins_on => 2.days.ago,
                      :registration_ends_on   => 1.day.ago).should be_valid
        Factory.build(:session,
                      :registration_begins_on => 1.day.ago,
                      :registration_ends_on   => 2.days.ago).should_not be_valid
      end

      it 'validates that registration ends before the session does' do
        Factory.build(:session,
                      :registration_ends_on => 1.day.ago,
                      :ends_on              => 2.days.from_now).should be_valid
        Factory.build(:session,
                      :registration_ends_on => 2.days.from_now,
                      :ends_on              => 1.day.ago).should_not be_valid
      end

      context '.available' do
        it 'should return the next session with courses offered' do
          Factory(:session_complete)
          Refinery::Enrollment::Session.count.should == 1
          Refinery::Enrollment::Session.available.should == []
          Factory(:session_started_but_not_over)
          Refinery::Enrollment::Session.count.should == 2
          Refinery::Enrollment::Session.available.should == []
          open = Factory(:session_open_but_not_started)
          Refinery::Enrollment::Session.count.should == 3
          Refinery::Enrollment::Session.available.map{|r| r.id}.should == [open.id]
          not_open = Factory(:session_not_open_yet)
          Refinery::Enrollment::Session.count.should == 4
          Refinery::Enrollment::Session.available.map{|r| r.id}.should == [open.id, not_open.id]
        end
      end

      context '.next_available' do
        it 'should return the next session with courses offered' do
          open = Factory(:session_open_but_not_started)
          Refinery::Enrollment::Session.count.should == 1
          Refinery::Enrollment::Session.next_available.map{|r| r.id}.should == [open.id]
          not_open = Factory(:session_not_open_yet)
          Refinery::Enrollment::Session.count.should == 2
          Refinery::Enrollment::Session.next_available.map{|r| r.id}.should == [open.id]
        end
      end

      let(:session_not_open_yet) { Factory.build(:session_not_open_yet) }
      let(:session_open_but_not_started) { Factory.build(:session_open_but_not_started) }
      let(:session_started_but_not_over) { Factory.build(:session_started_but_not_over) }
      let(:session_complete) { Factory.build(:session_complete) }

      context '#started?' do
        it 'should return false if the session has not started' do
          session_not_open_yet.started?.should be_false
          session_open_but_not_started.started?.should be_false
        end
        it 'should return true if session has started but is not over' do
          session_started_but_not_over.started?.should be_true
        end
        it 'should return true if session is complete' do
          session_complete.started?.should be_true
        end
      end

      context '#ended?' do
        it 'should return false if session has not started' do
          session_not_open_yet.ended?.should be_false
          session_open_but_not_started.ended?.should be_false
        end
        it 'should return false if session has started but is not over' do
          session_started_but_not_over.ended?.should be_false
        end
        it 'should return true if session has ended' do
          session_complete.ended?.should be_true
        end
      end

      context '#registerable?' do
        it 'should return false if registration has not started' do
          session_not_open_yet.registerable?.should be_false
        end
        it 'should return true if registration has started but is not over' do
          session_open_but_not_started.registerable?.should be_true
        end
        it 'should return false if registration has ended' do
          session_started_but_not_over.registerable?.should be_false
          session_complete.registerable?.should be_false
        end
      end

      context '#registration_status' do
        it 'should explain that registration has not started' do
          session_not_open_yet.registration_status.should include('registration will open on')
        end
        it 'should explain that registration has started but is not over' do
          session_open_but_not_started.registration_status.should include('registration is open')
        end
        it 'should explain that registration has ended' do
          session_started_but_not_over.registration_status.should include('registration closed')
          session_complete.registration_status.should include('registration closed')
        end
      end
    end
  end
end
