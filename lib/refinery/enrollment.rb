require 'refinerycms-core'
require 'refinerycms-settings'
require 'filters_spam'
require 'rails_autolink'
require 'money'

module Refinery
  autoload :EnrollmentGenerator, 'generators/refinery/enrollment_generator'

  module Enrollment
    require 'refinery/enrollment/engine'
    require 'refinery/enrollment/configuration'

    autoload :Version, 'refinery/enrollment/version'
    autoload :Tab, 'refinery/enrollment/tabs'

    class << self
      attr_writer :root
      attr_writer :tabs

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def tabs
        @tabs ||= []
      end

      def version
        ::Refinery::Enrollment::Version.to_s
      end

      def factory_paths
        @factory_paths ||= [ root.join("spec/factories").to_s ]
      end
    end
  end
end
