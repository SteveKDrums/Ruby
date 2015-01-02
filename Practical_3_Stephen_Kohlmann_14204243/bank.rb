class Bank
  @@bank_array = Array.new
  attr_accessor :no_of_employees, :cash_deposits, :amount_of_loans, :losses, :in_nama, :solvent

  def self.all_instances
    @@bank_array
  end

  def initialize (employees, cash, loan_book, loss, in_Nama, solvent_)
    @no_of_employees = employees
    @cash_deposits = cash
    @amount_of_loans = loan_book
    @losses = loss
    @in_nama = in_Nama
    @solvent = solvent_
    @@bank_array << self
  end

  def move_loans_to_nama
    quantity_of_loans = @amount_of_loans / 3 # The banks loan divided by 3 to be transferred to NAMA's amount_of_loans
    transfer_30_percent_to_bank = quantity_of_loans * 0.30 # Working out 30% of loan transfer from NAMA back to Bank

    #For NAMA
    NAMA.amount_of_loans += quantity_of_loans # Updates NAMA's amount_of_loans figure by adding the current loan amount to the quantity_of_loans (Banks loans / 3)
    NAMA.cash_deposits -= transfer_30_percent_to_bank # Updates NAMAS cash deposits after 30% transfer to bank
    NAMA.losses += transfer_30_percent_to_bank # Updates NAMA's losses. I'm taking that the 30% that NAMA pays back to the bank is a loss to NAMA.
    puts ('NAMA has taken on board €' + NAMA.amount_of_loans.to_s + ' in transferred loans')

    #For each Bank of the Method call
    @cash_deposits += transfer_30_percent_to_bank # Updating the cash deposits by adding the 30% figure
    @amount_of_loans -= quantity_of_loans
    @losses -= transfer_30_percent_to_bank

  end

  def is_insolvent
    new_basil_rule = (@cash_deposits * 6) - @losses #Storing the result of Multiplying cash_deposits by 6 and subtracting @losses in a variable called new_basil_rule
    if (@amount_of_loans <= new_basil_rule) # Subtracting the amount_of_loans from the stored result in the variable new_basil_rule. Updating the boolean values depending on the result
    then
      puts 'Is the bank Solvent', @solvent = true
      puts 'Is the bank in NAMA?', @in_nama = false
    else
      puts 'Is the bank Solvent', @solvent = false
      puts 'Is the bank in NAMA?', @in_nama = true
    end

  end

  def make_solvent
    quantity_of_loan_to_make_solvent = @amount_of_loans * 0.80 # 80% of the banks loan to be transferred to NAMA's amount_of_loans
    transfer_30_percent_to_bank = quantity_of_loan_to_make_solvent * 0.30 # Working out 30% of loan transfer from NAMA to give back to the Bank

    #For NAMA
    NAMA.amount_of_loans += quantity_of_loan_to_make_solvent # Updates NAMA's amount_of_loans figure by adding the current loan amount to the quantity_of_loans (Banks loans / 3)
    NAMA.cash_deposits -= transfer_30_percent_to_bank # Updates NAMAS cash deposits after 30% transfer to bank
    NAMA.losses += transfer_30_percent_to_bank # Updates NAMA's losses. I'm taking that the 30% that NAMA pays back to the bank is a loss to NAMA.
    puts ('NAMA has taken on board €' + NAMA.amount_of_loans.to_s + ' in transferred loans to make the bank solvent')

    #For each Bank of the Method call
    @cash_deposits += transfer_30_percent_to_bank # Updating the cash_deposits by adding the 30% figure
    @amount_of_loans -= quantity_of_loan_to_make_solvent # Updating the amount_of_loans
    @losses -= transfer_30_percent_to_bank # Updating the banks losses. I'm taking that the transfer from NAMA to the Bank will decrease it's losses.


  end
end

AIB = Bank.new(100, 100000000, 50000000, 30000000, false, true)
Anglo = Bank.new(200, 200000000, 900000000, 900000000, true, false)
BOI = Bank.new(200, 200000000, 900000000, 900000000, true, false)
RBS = Bank.new(200, 200000000, 900000000, 900000000, true, false)
Ulster = Bank.new(100, 100000000, 50000000, 30000000, false, true)
NAMA = Bank.new(1000, 100000000000, 0, 0, false, true)

