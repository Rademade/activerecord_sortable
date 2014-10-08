# encoding: utf-8
module ActiveRecord
  module Associations
    class HasManyAssociation

      alias_method :original_writer, :writer

      def writer(records)
        original_writer(records)
        sort_entities(records)
      end

      private

      def sort_entities(records)
        if reflection.sortable?
          if respond_to? :through_reflection
            sort_many_to_many_entities(records)
          else
            sort_one_to_many_entities(records)
          end
        end
      end

      def sort_many_to_many_entities(records)
        record_positions = struct_record_positions(records)
        owner.send(through_reflection.name).each do |intermediate_entity|
          new_position = record_positions[intermediate_entity.send(source_reflection.foreign_key)]
          intermediate_entity.send(:"#{reflection.sortable_field}=", new_position)
          intermediate_entity.save
        end
      end

      def sort_one_to_many_entities(records)
        records.each_with_index do |record, index|
          record.send(:"#{reflection.sortable_field}=", index + 1)
          record.save
        end
      end

      def struct_record_positions(records)
        record_positions = {}
        records.each_with_index do |record, index|
          record_positions[record.id] = index + 1
        end
        record_positions
      end

    end
  end
end