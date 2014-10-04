# encoding: utf-8
module ActiveRecord
  module Associations
    module Builder
      class Association

        alias_method :original_valid_options, :valid_options

        def valid_options
          original_valid_options + [:sortable, :sortable_field]
        end

      end
    end
  end
end