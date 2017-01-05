# encoding: utf-8
# frozen_string_literal: true
module ActiveRecord
  module Associations
    module Builder
      class Association #:nodoc:

        class << self

          SORTABLE_OPTIONS = [:sortable, :sortable_field].freeze

          alias original_valid_options valid_options

          def valid_options(*args)
            original_valid_options(*args) + SORTABLE_OPTIONS
          end

        end

      end
    end
  end
end
