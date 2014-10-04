# encoding: utf-8
module ActiveRecord
  class AssociationRelation

    alias_method :original_to_a, :to_a

    def to_a
      if proxy_association.reflection.sortable? and order_values.empty?
        sortable_table_name = (proxy_association.try(:through_reflection) || proxy_association.reflection).table_name
        order("#{sortable_table_name}.#{proxy_association.reflection.sortable_field} ASC").to_a
      else
        original_to_a
      end
    end

  end
end