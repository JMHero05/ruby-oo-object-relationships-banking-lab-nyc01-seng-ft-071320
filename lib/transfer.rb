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
    if sender.status != "closed" && receiver.status != "closed"
      if sender.balance < amount
        self.status = "rejected"
        return "Transaction rejected. Please check your account balance."
      elsif self.status == "complete"
        puts "Transaction was already excuted"
      else
        receiver.deposit(amount)
        sender.balance -= amount
        self.status = "complete"
      end
    else
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.deposit(amount)
      receiver.balance -= amount
      self.status = "reversed"
    end
  end

end
