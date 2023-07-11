module SavingsAccount
  extend self

  def interest_rate(balance)
    smallAccount = 0 <= balance  && balance < 1000
    mediumAccount = 1000 <= balance && balance < 5000
    largeAccount = 5000 <= balance

    if smallAccount
      return 0.5
    elsif mediumAccount
      return 1.621
    elsif largeAccount
      return 2.475
    else # negative balance
      return 3.213
    end
  end

  def annual_balance_update(balance)
    rate = interest_rate(balance)
    balance * (1 + (rate / 100))
  end

  def years_before_desired_balance(current_balance, desired_balance)
    years = 0
    balance = current_balance

    until balance >= desired_balance
      years += 1
      balance = annual_balance_update(balance)
    end

    years
  end
end
