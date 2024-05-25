module Tournament
  def self.tally(input)
    results = parse_input(input).sort do |a, b|
      a_points = a[1][:P].to_i
      b_points = b[1][:P].to_i

      if a_points == b_points
        a[0] <=> b[0]
      else
        b_points <=> a_points
      end
    end
    header + format_results(results)
  end

  def self.header
    team_header = format("%-31s", "Team")
    summary_header = "| MP |  W |  D |  L |  P\n"
    team_header + summary_header
  end

  def self.parse_input(input)
    summary = {}
    default = { MP: 0, W: 0, D: 0, L: 0, P: 0 }

    input.split("\n").each_with_object(summary) do |result, in_prog|
      team_one, team_two, outcome = result.split(';')
      in_prog[team_one] = default.dup unless in_prog[team_one]
      in_prog[team_two] = default.dup unless in_prog[team_two]
      in_prog[team_one][:MP] += 1
      in_prog[team_two][:MP] += 1

      case outcome
      when "win"
        in_prog[team_one][:W] += 1
        in_prog[team_one][:P] += 3
        in_prog[team_two][:L] += 1
      when "loss"
        in_prog[team_two][:W] += 1
        in_prog[team_two][:P] += 3
        in_prog[team_one][:L] += 1
      when "draw"
        in_prog[team_one][:D] += 1
        in_prog[team_two][:D] += 1
        in_prog[team_one][:P] += 1
        in_prog[team_two][:P] += 1
      end
    end
  end

  def self.format_results(results)
    results.map do |team, result_summary|
      format "%-30s |%3s |%3s |%3s |%3s |%3s\n",
             team,
             result_summary[:MP],
             result_summary[:W],
             result_summary[:D],
             result_summary[:L],
             result_summary[:P]
    end.join("")
  end
end
