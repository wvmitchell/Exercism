# This is a custom exception that you can use in your code
class NotMovieClubMemberError < RuntimeError
end

class Moviegoer
  def initialize(age, member: false)
    @age = age
    @member = member
  end

  def ticket_price = @age > 59 ? 10 : 15

  def watch_scary_movie? = @age > 17

  def claim_free_popcorn!
    raise NotMovieClubMemberError, 'No 🍿!' unless @member

    '🍿'
  end
end
