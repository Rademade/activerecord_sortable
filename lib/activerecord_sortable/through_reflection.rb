# encoding: utf-8
module ActiveRecord
  module Reflection
    class ThroughReflection

      def sortable_field
        @delegate_reflection.options.fetch(:sortable_field, :position).to_sym
      end

      def sortable?
        @delegate_reflection.options.fetch(:sortable, false)
      end

    end
  end
end