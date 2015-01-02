require_relative 'bank'
require_relative 'developer'

all_developers = Array.new

all_developers << John_Doe
all_developers << Stephen_Kohlmann
all_developers << Dave_Doe
all_developers << Scott_Kohlmann
all_developers << Dave_Lyttle


public def declared_bankrupt

all_developers.each do |developer|
  puts developer
end
  # Who should be bankrupt? I need to iterate through each Developer. Taking that if bankrupt == true that the Developer is insolvent


end



declared_bankrupt


###### Tests to call is_insolvent method on Bank objects
puts "\n ###### Tests to call is_insolvent method on Bank objects ######"
puts Anglo.is_insolvent
puts NAMA.is_insolvent
puts Ulster.is_insolvent
#puts AIB.is_insolvent
#puts BOI.is_insolvent
#puts RBS.is_insolvent

###### Test to show make_solvent method call. Anglo and Nama attributes printed to screen before and after method call
puts "\n ###### Test to show make_solvent method call. Anglo and Nama attributes printed to screen before and after method call ######"

puts "\nAnglo before method"

puts Anglo.cash_deposits
puts Anglo.amount_of_loans #Loan before method
puts Anglo.losses #Cash deposit before method
puts "\nNAMA before method"

puts NAMA.cash_deposits
puts NAMA.amount_of_loans
puts NAMA.losses
puts "\n"

Anglo.make_solvent #Calling method
puts "\nAnglo after method"

puts Anglo.cash_deposits #Cash deposit after method
puts Anglo.amount_of_loans #Loan before method
puts Anglo.losses #Cash deposit before method
puts "\nNAMA after method"

puts NAMA.cash_deposits
puts NAMA.amount_of_loans
puts NAMA.losses


###### Test to show move_loans_to_nama method call. Anglo and Nama attributes printed to screen before and after method call
puts "\n ###### Test to show move_loans_to_nama method call. Anglo and Nama attributes printed to screen before and after method call ######"
#AIB.move_loans_to_nama
#BOI.move_loans_to_nama
#Ulster.move_loans_to_nama
#RBS.move_loans_to_nama

puts "\nAnglo before method"

puts Anglo.cash_deposits
puts Anglo.amount_of_loans #Loan before method
puts Anglo.losses #Cash deposit before method
puts "\nNAMA before method"

puts NAMA.cash_deposits
puts NAMA.amount_of_loans
puts NAMA.losses
puts "\n"

Anglo.move_loans_to_nama #Calling method
puts "\nAnglo after method"

puts Anglo.cash_deposits #Cash deposit after method
puts Anglo.amount_of_loans #Loan before method
puts Anglo.losses #Cash deposit before method
puts "\nNAMA after method"

puts NAMA.cash_deposits
puts NAMA.amount_of_loans
puts NAMA.losses


###### Tests calling the is_developer_solvent method from developer.rb ######
puts "\n ###### Tests calling the is_developer_solvent method from developer.rb ######"

John_Doe.is_developer_solvent
Stephen_Kohlmann.is_developer_solvent
Dave_Doe.is_developer_solvent
Scott_Kohlmann.is_developer_solvent
Dave_Lyttle.is_developer_solvent

###### Tests calling the owes_amount method from developer.rb ######
puts "\n ###### Tests calling the owes_amount method from developer.rb ######"

John_Doe.owes_amount
Stephen_Kohlmann.owes_amount
Dave_Doe.owes_amount
Scott_Kohlmann.owes_amount
Dave_Lyttle.owes_amount

###### Tests calling the owes_bank method from developer.rb ######
puts "\n ###### Tests calling the owes_bank method from developer.rb ######"

John_Doe.owes_bank
Stephen_Kohlmann.owes_bank
Dave_Doe.owes_bank
Scott_Kohlmann.owes_bank
Dave_Lyttle.owes_bank
puts "\n"

ObjectSpace.each_object(Developer) {|x| p x} #Prints all the created objects of the Developer Class
puts "\n"

ObjectSpace.each_object(Bank) {|x| p x} #Prints all the created objects of the Bank Class
puts "\n"
p Bank.all_instances #Prints all instances of the Bank array
p Developer.all_instances