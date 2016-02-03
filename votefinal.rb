
#POLITICIANS CLASS========================================================
class Politicians
  attr_accessor :name, :party, :vote
  def initialize(name, party, vote = 1)
    @name = name
    @party = party
    @vote = vote
  end
end
#VOTER CLASS========================================================
class Sheeple
  attr_accessor :name, :affiliation
  def initialize(name, affiliation)
    @name = name
    @affiliation = affiliation
  end
end

#ARRAYS========================================================
@politicians = []
@voter_list = []
@new_politicians = []
@voting_array = []
#ERROR METHOD========================================================
def error
  puts "\nThat is not an option! Choose again!"
end

#VOTE METHOD========================================================
def vote
  if @politicians.count < 2
    puts "You must create at least 2 Politicians to run the Simulator."
    puts "Please create a Politician."
    start
  elsif @voter_list.count < 1
    puts "You must create at least 1 Voter to run the Simulator."
    puts "Please create 1 Voter."
    start
  else
  @voter_list.each do |x|
    case x[1]
    when "Liberal"
      liberal
    when "Conservative"
      conservative
    when "Tea Party"
      teaparty
    when "Socialist"
      socialist
    when "Neutral"
      neutral
    end
  end
end
  results
end

#Method to begin Voter Simulation 5000====================================
def start
  puts <<-Beg


||   / /                                      //   ) )                       ____     ___      ___      ___
||  / /  ___    __  ___  ___      __         ((        ( )  _   __         //       //   ) ) //   ) ) //   ) )
|| / / //   ) )  / /   //___) ) //  ) )        \\     / / // ) )  ) )     //__     //   / / //   / / //   / /
||/ / //   / /  / /   //       //                ) ) / / // / /  / /          ) ) //   / / //   / / //   / /
|  / ((___/ /  / /   ((____   //          ((___ / / / / // / /  / /     ((___/ / ((___/ / ((___/ / ((___/ /



                               |* * * * * * * * * * OOOOOOOOOOOOOOOOOOOOOOOOO|
                               | * * * * * * * * *  :::::::::::::::::::::::::|
                               |* * * * * * * * * * OOOOOOOOOOOOOOOOOOOOOOOOO|
                               | * * * * * * * * *  :::::::::::::::::::::::::|
                               |* * * * * * * * * * OOOOOOOOOOOOOOOOOOOOOOOOO|
                               | * * * * * * * * *  ::::::::::::::::::::;::::|
                               |* * * * * * * * * * OOOOOOOOOOOOOOOOOOOOOOOOO|
                               |:::::::::::::::::::::::::::::::::::::::::::::|
                               |OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO|
                               |:::::::::::::::::::::::::::::::::::::::::::::|
                               |OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO|
                               |:::::::::::::::::::::::::::::::::::::::::::::|
                               |OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO|


    Beg
  puts <<-Germ
  \nWelcome to the Voter Simulator 5000 (BETA).
  \nWhat would you like to do?
  (C)reate
  (L)ist
  (U)pdate
  (V)ote
  Germ
  answer = gets.chomp.upcase
  case answer
  when "C"  #NEED TO ADD DEFENSIVE PROGRAMMING
    create  #LOOK AT BATMAN TO SEE HOW TO REFACTOR MORE
  when "L"
    list_all
  when "U"
    update
  when "V"
    vote
  else
    error #leads to error message method
  end
end

#CREATE ==========================================================
def create
  puts <<-Germ
  What would you like to create?
  (P)olitician or (V)oter
  Germ
  choice = gets.chomp.upcase
  case choice
  when "P"
    create_politician #LEADS TO POLICITCIAN METHOD
  when "V"
    create_voter #LEADS TO VOTER METHOD
  else
    error #LEADS TO ERROR MESSAGE METHOD
    create
  end
end
#==========================================================================
#METHOD TO CREATE A POLITICIAN/VOTER
def create_politician #NEED TO CREATE ARRAYS FOR POLICITCIANS
  puts "Please enter the first and last name of the new politician"
  @politician = gets.chomp
  politician_affiliation
end

#POLITICIAN PARTY===================================================
def politician_affiliation
  puts "Please enter a party of the new politician"
  puts "(D)emocrat or (R)epublican"
  party = gets.chomp.upcase #NEED DEFENSIVE PROGRAMMING
  case party
    when "D"
      crook = Politicians.new(@politician, "Democrat")
      @politicians << [crook.name, crook.party, crook.vote]
      create_another_politician
    when "R"
      crook = Politicians.new(@politician, "Republican")
      @politicians << [crook.name, crook.party, crook.vote]
      create_another_politician
    else
      error
      politician_affiliation
  end
end
#==========================================================================
#CREATE A VOTER METHOD=====================================================
def create_voter #NEED TO CREATE ARRAYS FOR POLICITCIANS
 puts "Please enter the voter's name."
 @voter = gets.chomp.capitalize
 voter_affiliation
end
#VOTER AFFILIATION==================================================
def voter_affiliation
 puts "Please enter their political affiliation."
 puts "[T]ea Party, [C]onservative, [N]eutral, [L]iberal, or [S]ocialist."
 affiliation = gets.chomp.upcase #NEED DEFENSIVE PROGRAMMING
 case affiliation
 when "T"
     voter = Sheeple.new(@voter, "Tea Party")
     @voter_list << [voter.name, voter.affiliation]
     create_another_voter
   when "C"
     voter = Sheeple.new(@voter, "Conservative")
     @voter_list << [voter.name, voter.affiliation]
     create_another_voter
   when "N"
     voter = Sheeple.new(@voter, "Neutral")
     @voter_list << [voter.name, voter.affiliation]
     create_another_voter
   when "L"
     voter = Sheeple.new(@voter, "Liberal")
     @voter_list << [voter.name, voter.affiliation]
     create_another_voter
   when "S"
     voter = Sheeple.new(@voter, "Socialist")
     @voter_list << [voter.name, voter.affiliation]
     create_another_voter
   else
     error
     voter_affiliation
 end
 start
end
#=========================================================================
#LIST CANDIDATES/VOTERS===================================================
def list_all
  puts "\nDemocratic Nominees:"
  @politicians.each do |x|
    case x[1]
    when "Democrat"
      puts "Senator: #{x[0]}"
    end
    end
    puts "\nRepublican Nominees:"
    @politicians.each do |x|
    case x[1]
    when "Republican"
      puts "Congressman: #{x[0]}"
    end
  end
  puts "\nRegistered Voters:"
  @voter_list.each do |x|
    puts "#{x[0]}: #{x[1]}"
  end
  puts "Would you like to (U)pdate or go to the (M)enu?"
  l = gets.chomp.upcase
  case l
  when "U"
    update
  when "M"
    start
  else
    error
    list_all
  end
end
#==================================================================
#CREATE ANOTHER POLITICIAN=========================================
def create_another_politician
  puts "Would you like to create another Politician or go back to"
  puts "the main menu? (P)olitician or (M)enu"
  answer = gets.chomp.upcase
  case answer
  when "P"
    create_politician
  when "M"
    start
  else
    error
    create_another_politician
  end
end
#===================================================================
#CREATE ANOTHER VOTER===============================================
def create_another_voter
  puts "Would you like to create another Voter or go back to"
  puts "the main menu? (V)oter or (M)enu"
  answer = gets.chomp.upcase
  case answer
  when "V"
    create_voter
  when "M"
    start
  else
    error
    create_another_voter
  end
end
#UPDATE ============================================================
def update
  puts "Below are the Politicians and Voters you have created:"
  puts "\nDemocratic Nominees:"
  @politicians.each do |x|
    case x[1]
    when "Democrat"
      puts "Senator: #{x[0]}"
    end
    end
    puts "\nRepublican Nominees:"
    @politicians.each do |x|
    case x[1]
    when "Republican"
      puts "Congressman: #{x[0]}"
    end
  end
  puts "\nRegistered Voters:"
  @voter_list.each do |x|
    puts "#{x[0]}: #{x[1]}"
  end
  puts "\nWould you like to update a (P)olitican or (V)oter or go to the (M)enu"
  answer = gets.chomp.upcase
  case answer
  when "P"
    update_politician
  when "V"
    update_voter
  when "M"
    start
  else
    error
    update
  end
end
#UPDATE POLITICIAN==================================================
def update_politician
  puts "Who would you like to update?"
  @input = gets.chomp
  @politicians.each do |x|
  if x.include? @input
    puts "Please enter the Politicians new name"
    new_name = gets.chomp.capitalize
    x[0] = new_name
    update_politician_party
  end
end
  error
  update_politician
end

#UPDATE VOTER==================================================
def update_voter
  puts "Who would you like to update?"
  @input = gets.chomp
  @voter_list.each do |a|
  if x.include? @input
      puts "Please enter the Voters new name"
      new_name = gets.chomp.capitalize
      a[0] = new_name
      update_voter_affiliation
    end
  end
  error
  update_voter
end
#VOTER AFFILIATION==================================================
  def update_voter_affiliation
    @voter_list.each do |a|
      puts "Would you like to update their Affiliation?"
      b = gets.chomp.upcase
      case b
      when "Y"
        puts "What is the voter's new affiliation?"
        puts "(T)ea Party, (C)onservative, (N)eutral, (L)iberal, (S)ocialist"
        new_affiliation = gets.chomp.upcase
        if new_affiliation == "T"
          new_affiliation = "Tea Party"
          a[1] = new_affiliation
          start
        elsif new_affiliation == "C"
          new_affiliation = "Conservative"
          a[1] = new_affiliation
          start
        elsif new_affiliation == "N"
          new_affiliation = "Neutral"
          a[1] = new_affiliation
          start
        elsif new_affiliation == "L"
          new_affiliation = "Liberal"
          a[1] = new_affiliation
          start
        elsif new_affiliation == "S"
          new_affiliation = "Socialist"
          a[1] = new_affiliation
          start
        else
          update_voter_affiliation
        end
      when "N"
        start
      else
        error
        update_voter_affiliation
      end
    end
  end
#POLITICIAN PARTY==================================================
  def update_politician_party
    @politicians.each do |x|
    puts "Would you like to update their party? (Y)es or (N)o?"
    a = gets.chomp.upcase
    case a
    when "Y"
      puts "What is the candidate's new party? (R)epublican or (D)emocrat."
      new_party = gets.chomp.capitalize
      if new_party == "R"
        new_party = "Republican"
        x[1] = new_party
        start
      elsif new_party == "D"
        new_party = "Democrat"
        x[1] = new_party
        start
      else
        error
        update_politician_party
      end
    when "N"
      start
    else
      error
      update_politician_party
    end
  end
end
#====================================================================
# class Vote=========================================================
# Tea Party==========================================================
  def teaparty
      rep = (1..90).to_a
      rep = rep.shuffle.sample
      dem = (1..10).to_a
      dem = dem.shuffle.sample
      if dem > rep
        dem_won
      else
        rep_won
      end
end
# Conservative==========================================================
  def conservative
      rep = (1..75).to_a
      rep = rep.shuffle.sample
      dem = (1..25).to_a
      dem = dem.shuffle.sample
      if dem > rep
        dem_won
      else
        rep_won
      end
  end
 # Neutral==========================================================
  def neutral
      rep = (1..50).to_a
      rep = rep.shuffle.sample
      dem = (1..50).to_a
      dem = dem.shuffle.sample
      if dem > rep
        dem_won
      else
        rep_won
      end
  end
# Socialist==========================================================
  def socialist
      rep = (1..10).to_a
      rep = rep.shuffle.sample
      dem = (1..90).to_a
      dem = dem.shuffle.sample
      if dem > rep
        dem_won
      else
        rep_won
      end
  end
  # Liberal==========================================================
  def liberal
      rep = (1..25).to_a
      rep = rep.shuffle.sample
      dem = (1..75).to_a
      dem = dem.shuffle.sample
      if dem > rep
        # puts "The winner is Democrat #{dem}. Loser is Republican #{rep}"
        dem_won
      else
        rep_won
        # puts "The winner is Repulican #{rep}. Loser is Democrat #{dem}"
      end
  end

  # DEM WON==========================================================
  def dem_won
    @politicians.each do |name, party, votes|
      name_votes = { name: name, party: party, vote: votes }
      @voting_array << name_votes
      @sample1 = @voting_array.sample
      if @sample1.has_value?("Democrat")
        @sample1[:vote] += 1
      end
    end
  end
  #REP WON===========================================================
  def rep_won
    @politicians.each do |name, party, votes|
      name_votes = { name: name, party: party, vote: votes }
      @voting_array << name_votes
      @sample1 = @voting_array.sample
      if @sample1.has_value?("Republican")
        @sample1[:vote] += 1
      end
    end
  end


#VOTE RESULTS==================================================
 def results
winner_vote_count = 0
winner_name = 0
@voting_array.each do |x|

   y = x[:vote]
   z = x[:name]
   if y > winner_vote_count
     winner_vote_count = y
     winner_name = z
   end
end
puts "the winner is #{winner_name} with #{winner_vote_count} votes"
exit
end



  start
