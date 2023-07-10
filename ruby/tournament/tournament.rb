module Tournament
  STARTING_RECORD = {MP: 0, W: 0, D: 0, L: 0, P: 0}

  def self.tally(input)
    matches = input.split("\n")
    results = matches.reduce({}) do |in_prog, match|
      match_details = match.split(";")
      case match_details[2]
      when 'win'
        in_prog = record_win(match_details[0], in_prog)
        in_prog = record_loss(match_details[1], in_prog)
      when 'loss'
        in_prog = record_win(match_details[1], in_prog)
        in_prog = record_loss(match_details[0], in_prog)
      else
        in_prog = record_draw(match_details[0], in_prog)
        in_prog = record_draw(match_details[1], in_prog)
      end
    end

    results = sort_results(results)

    output = "%-31s|%3s |%3s |%3s |%3s |%3s\n" %
      ['Team', 'MP', 'W', 'D', 'L', 'P']

    results.each do |team, record|
      output += print_result(team, record)
    end

    output
  end

  private
  def self.record_win(team, season)
    season[team] = STARTING_RECORD.clone if !season[team]
    season[team][:MP] += 1
    season[team][:W] += 1
    season[team][:P] += 3
    season
  end

  def self.record_loss(team, season)
    season[team] = STARTING_RECORD.clone if !season[team]
    season[team][:MP] += 1
    season[team][:L] += 1
    season
  end

  def self.record_draw(team, season)
    season[team] = STARTING_RECORD.clone if !season[team]
    season[team][:MP] += 1
    season[team][:D] += 1
    season[team][:P] += 1
    season
  end

  def self.sort_results(results)
    sorted = results.sort_by{|team, record| [-record[:P], team]}
    sorted.to_h
  end

  def self.print_result(team, record)
    "%-31s|%3d |%3d |%3d |%3d |%3d\n" % 
      [team,
      record[:MP],
      record[:W],
      record[:D],
      record[:L],
      record[:P]]
  end
end
