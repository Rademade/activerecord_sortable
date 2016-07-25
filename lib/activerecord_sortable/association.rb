# encoding: utf-8
module ActiveRecord
  module Associations
    module Builder
      class Association #:nodoc:
        SORTABLE_OPTIONS = [:sortable, :sortable_field].freeze

        def self.valid_options(_)
          VALID_OPTIONS +
            SORTABLE_OPTIONS +
            Association.extensions.flat_map(&:valid_options)
        end
      end
    end
  end
end
