require 'csv'

filename = 'invoice_numbers.csv'
filename2 = 'nuuly_invoices.csv'

hash = {}
@output = File.open('./output.csv', 'w+')

CSV.foreach(filename, headers: true, header_converters: :symbol) do |row|
  next if hash[row[:invoice_number]]
  hash[row[:invoice_number]] = true
end

CSV.foreach(filename2, headers: true, header_converters: :symbol) do |row|
  next unless hash[row[:invoice_number]]
  @output << row
end

@output.close