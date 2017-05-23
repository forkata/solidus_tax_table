require 'csv'

module Spree
  class TaxTable
    ZIPCODE_INDEX = 0
    TAX_RATE_INDEX = 1

    class << self
      def tax_table
        @tax_table ||= parse_table_rows
      end

      private

      def parse_table_rows
        rows = load_tax_tables.map do |row|
          [
            row[ZIPCODE_INDEX].to_i,
            BigDecimal.new(row[TAX_RATE_INDEX])
          ]
        end
        Hash[rows]
      end

      def load_tax_tables
        Dir["#{Spree::TaxTableConfiguration.tax_tables_path}/*.csv"].flat_map do |filename|
          Rails.logger.info "[spree_tax_table] Loading #{filename}"
          rows = CSV.read(filename)
          rows.shift if Spree::TaxTableConfiguration.skip_header_rows
          rows
        end
      end
    end
  end
end
