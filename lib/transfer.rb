require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if (status == "pending" && sender.balance > amount) && valid?
      receiver.deposit(amount)
      sender.balance -= amount
      @status = "complete"
    else 
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if status == "complete"
      sender.deposit(amount)
      receiver.balance -= amount
      @status = "reversed"
    end
  end

end