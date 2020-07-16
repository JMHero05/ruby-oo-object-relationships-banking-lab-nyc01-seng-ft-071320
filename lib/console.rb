require_relative './bank_account'
require_relative './transfer'
require 'pry'

avi = BankAccount.new("Avi")
amanda = BankAccount.new("Amanda")
terrance = BankAccount.new("Terrance")
transfer = Transfer.new(amanda, avi, 50)
bad_transfer = Transfer.new(amanda, avi, 4000)
closed_account_transfer = Transfer.new(amanda, terrance, 50)


binding.pry