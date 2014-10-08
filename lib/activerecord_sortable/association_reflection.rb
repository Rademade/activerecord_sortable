# encoding: utf-8
module ActiveRecord
  module Reflection
    class AssociationReflection

      def sortable_field
        @options.fetch(:sortable_field, :position).to_sym
      end

      def sortable?
        @options.fetch(:sortable, false)
      end

    end
  end
end