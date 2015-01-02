class Developer
  @@developer_array = Array.new
  attr_accessor :name, :net_worth, :loans, :banks_loaned_from, :bankrupt

  def self.all_instances
    @@developer_array
  end

  def initialize (name, worth, loan, banks_owed, bankrupt)
    @name = name
    @net_worth = worth
    @loans = loan
    @banks_loaned_from = banks_owed
    @bankrupt = bankrupt
    @@developer_array << self

  end

  def is_developer_solvent
    if (@net_worth >= @loans) #Taking that the developer is insolvent if his/her net_worth is less than their loans
    then
      puts "\nThe developer is bankrupt ", @bankrupt = false
    else
      puts "\nThe developer is bankrupt ", @bankrupt = true
    end
  end

  def owes_amount #Prints the name and loan amount on the object the method is called on
    name = @name
    loan = @loans
    #owes_these_banks = @banks_loaned_from

    puts "\n#{name} owes #{loan}"
  end

  def owes_bank #Calls the owes_amount method to and adds the information for which banks the developer owes to
    owes_to = @banks_loaned_from

    print owes_amount, "to #{owes_to}\n"

  end

end


John_Doe = Developer.new('John Doe', 10000000, 20000000, 'AIB, Anglo', true)
Stephen_Kohlmann = Developer.new('Stephen Kohlmann', 50000000, 10000000, 'BOI, RBS', false)
Dave_Doe = Developer.new('Dave Doe', 10000000, 20000000, 'Ulster', true)
Scott_Kohlmann = Developer.new('Scott Kohlmann', 50000000, 10000000, 'BOI, RBS', false)
Dave_Lyttle = Developer.new('Dave Lyttle', 10000000, 20000000, 'Ulster', true)

