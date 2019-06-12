class Citizen
  def initialize(first, last, age)
    @first = first
    @last = last
    @age = age
  end

  def can_vote?
    @age >= 18 #returns a boolean already
  end

  def full_name
    "#{@first.capitalize} #{@last.capitalize}"
  end
end

