require 'active_record'

ActiveRecord::Base.establish_connection(
    :adapter => 'sqlite3',
    :database  => 'memory')


class Library_Users < ActiveRecord::Base
    has_many :library_books
end

class Library_Books < ActiveRecord::Base
    belongs_to :library_users
end


if Library_Users.table_exists? || Library_Books.table_exists?
  puts 'table already exists'
  else  ActiveRecord::Schema.define do
          create_table :library_users do |table|
            table.column :name, :string
            table.column :age, :integer
            table.column :books_borrowed, :string
        end
          create_table :library_books do |table|
            table.column :borrower, :string
            table.column :title, :string
            table.column :borrowed_when, :string
            table.column :due_back, :string
    end
  end
end

user = Library_Users.create(:name => 'Stephen', :age => 30, :books_borrowed => '3')
user = Library_Books.create(:borrower => 'Stephen', :title => 'Exploring Ruby', :borrowed_when => '11/4/14', :due_back => '12/5/14')
user = Library_Books.create(:borrower => 'Stephen', :title => 'Exploring Java', :borrowed_when => '15/5/14', :due_back => '20/6/14')
user = Library_Books.create(:borrower => 'Stephen', :title => 'Exploring C#', :borrowed_when => '17/9/14', :due_back => '1/10/14')

user = Library_Users.create(:name => 'Scott', :age => 26, :books_borrowed => '2')
user = Library_Books.create(:borrower => 'Scott', :title => 'Jazz Guitar', :borrowed_when => '11/4/14', :due_back => '12/5/14')
user = Library_Books.create(:borrower => 'Scott', :title => 'Jazz Theory', :borrowed_when => '15/5/14', :due_back => '20/6/14')


p Library_Users.all
p Library_Books.all
p Library_Books.first
p Library_Books.last
p Library_Users.where("name = 'Stephen'")
p Library_Users.where("name = 'Scott' AND age = 26")
p Library_Books.where("title = 'Jazz Guitar'")
p Library_Books.json_creatable? #Will return false
# p Library_Users.find(3) #.find is throwing an error, something to do with gems on my machine so I've commented it out.

