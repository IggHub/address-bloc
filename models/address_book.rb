require_relative 'entry'
require "csv"

class AddressBook
  attr_accessor :entries


  def initialize
    @entries = []
  end

  def add_entry(name, phone_number, email)
    index = 0
    @entries.each do |entry| #does 'entry' refer to entry.rb?

      if name < entry.name
        break
      end
      index += 1
    end

    @entries.insert(index,Entry.new(name, phone_number, email))
  end

  def import_from_csv(file_name)
     csv_text = File.read(file_name)
     csv = CSV.parse(csv_text, headers: true, skip_blanks: true)
 # #8
     csv.each do |row|
       row_hash = row.to_hash
       add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
     end
   end

   def binary_search(name)
     lower = 0
     upper = @entries.length - 1

     while lower <= upper

       mid = (lower + upper) / 2
       mid_name = @entries[mid].name

       if name == mid_name
         return @entries[mid]
       elsif name < mid_name
         upper = mid - 1
       elsif name > mid_name
         lower = mid + 1
       end
     end
     return nil #what does this display? If name==mid_name, doesn't that make return nil unnecessary?
   end

   def iterative_search(name)
     arr_count = @entries.length - 1
     counter = 0
     iterative_name = @entries[counter].name

     while counter <= arr_count
       if iterative_name == name
         return iterative_name
         #break
       end
       counter += 1
     end
     return nil
   end

end

#Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
