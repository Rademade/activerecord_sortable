# encoding: utf-8
module ActiveRecord
  module Associations
    class CollectionProxy

      alias_method :original_load_target, :load_target

      def load_target
        if proxy_association.reflection.sortable? and order_values.empty?
          sortable_table_name = (proxy_association.try(:through_reflection) || proxy_association.reflection).table_name
          order("#{sortable_table_name}.#{proxy_association.reflection.sortable_field} ASC").to_a
        else
          original_load_target
        end
      end

    end
  end
end