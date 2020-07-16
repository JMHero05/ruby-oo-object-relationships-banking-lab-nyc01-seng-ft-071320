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
    if @status != "complete" && sender.balance > amount
      receiver.deposit(amount)
      sender.balance -= amount
      @status = "complete"
    elsif @status == "complete"
    # elsif sender.status == "closed" || receiver.status == "closed"
      @status = "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer

  end

end
