require 'csv'

module Spree
  class TaxTable
    class << self
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
