

#Method to begin Voter Simulation 5000====================================

class Politicians
  attr_accessor :name, :party, :vote
  def initialize(name, party, vote = 1)
    @name = name
    @party = party
    @vote = vote
  end
end

class Sheeple
  attr_accessor :name, :affiliation
  def initialize(name, affiliation)
    @name = name
    @affiliation = affiliation
  end
end

$democrat_list = []
$republican_list = []
$voter_list = []

def error
  puts "That is not an option! Choose again!"
end

def vote
  $voter_list.each do |x|
    case x.affiliation
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
    else
      puts "bullhsit"
    end
  end
  results
end


def start
  puts <<-Germ
  Welcome to the Voter Simulator 5000 (BETA).
  What would you like to do?
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
  politician = gets.chomp
  puts "Please enter a party of new politician"
  puts "(D)emocrat or (R)epublican"
  party = gets.chomp.upcase #NEED DEFENSIVE PROGRAMMING
  case party
    when "D"
      politician = Politicians.new(politician, "Democrat")
      $democrat_list << politician
      create_another_politician
    when "R"
      politician = Politicians.new(politician, "Republican")
      $republican_list << politician
      create_another_politician
    else
      error
      create_politician
  end
end
#==========================================================================
#CREATE A VOTER METHOD=====================================================
def create_voter #NEED TO CREATE ARRAYS FOR POLICITCIANS
 puts "Please enter the voter's name."
 voter = gets.chomp
 puts "Please enter their political affiliation."
 puts "[T]ea Party, [C]onservative, [N]eutral, [L]iberal, or [S]ocialist."
 affiliation = gets.chomp.upcase #NEED DEFENSIVE PROGRAMMING

 case affiliation
 when "T"
     voter = Sheeple.new(voter, "Tea Party")
     $voter_list << voter
     create_another_voter
   when "C"
     voter = Sheeple.new(voter, "Conservative")
     $voter_list << voter
     create_another_voter
   when "N"
     voter = Sheeple.new(voter, "Neutral")
     $voter_list << voter
     create_another_voter
   when "L"
     voter = Sheeple.new(voter, "Liberal")
     $voter_list << voter
     create_another_voter
   when "S"
     voter = Sheeple.new(voter, "Socialist")
     $voter_list << voter
     create_another_voter
   else
     error
     create_voter
 end
 start
end


def list_all
  puts "Democratic Nominees:"
  $democrat_list.each do |x|
    puts " - #{x.name}: #{x.party}"
  end
  puts "Republican Nominees:"
  $republican_list.each do |x|
    puts " - #{x.name}: #{x.party}"
  end
  puts "Registered Voters:"
  $voter_list.each do |x|
    puts " - #{x.name}: #{x.affiliation}"
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
  #find
end
end


#CREATE ANOTHER POLITICIAN=========================================
def create_another_politician
  puts "Would you like to create another Politician or go back to"
  puts "the main menu? (P)olitician or (M)enu"
  answer = gets.chomp.upcase
  case answer
  when "P"
    create_politician
  when "V"
    create_voter
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
  when "P"
    create_politician
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
  $democrat_list.each do |x|
    puts " - #{x.name}: #{x.party}"
  end
  puts "Republican Nominees:"
  $republican_list.each do |x|
    puts " - #{x.name}: #{x.party}"
  end
  puts "Registered Voters:"
  $voter_list.each do |x|
    puts " - #{x.name}: #{x.affiliation}"
  end
  puts ""
  find
end

# def find
#   puts "Who would you like to update?"
#   input = gets.chomp
#   $democrat_list.each do |x|
#     if input == x.name
#       puts "What is the updated name?"
#       new_name = gets.chomp.downcase
#       x.name = new_name
#       p $democrat_list
#       start
#     else
#       puts "We couldn't find anyone by that name."
#     end
#   end
# end

def find
  puts "Who would you like to update?"

  @input = gets.chomp
  $democrat_list.each do |x|
  dem_search
  # if @input == x.name
  #   dem_search
  # elsif
  #   rep_search
  # elsif
  #   voter_search
  else
    puts "error"
  end
end
    # puts "What would you like to update? [N]ame or [P]arty?"
end

def dem_search
    $democrat_list.each do |x|
    if @input == x.name
      puts "What would you like to update? [N]ame or [P]arty?"
      choice = gets.chomp.capitalize
        case choice
        when "N"
          puts "What is the updated name?"
          new_name = gets.chomp.capitalize
          x.name = new_name
        when "P"
          puts "What is the candidate's new party? (R)epublican or (D)emocrat."
          new_party = gets.chomp.capitalize
          if new_party == "R"
          new_party = "Republican"
          x.party = new_party
          elsif new_party == "D"
          new_party = "Democrat"
          x.party = new_party
          end
        else
          error
          dem_search
        end
       start
    else
      rep_search
    end
  end
end

def rep_search
    $republican_list.each do |x|
    if @input == x.name
      puts "What would you like to update?[N]ame or [P]arty?"
      choice = gets.chomp.upcase
        case choice
        when "N"
          puts "What is the updated name?"
          new_name = gets.chomp.upcase
          x.name = new_name
        when "P"
          puts "What is the candidate's new party? (R)epublican or (D)emocrat."
          new_party = gets.chomp.upcase
            if new_party == "R"
            new_party = "Republican"
            x.party = new_party
            elsif new_party == "D"
            new_party = "Democrat"
            x.party = new_party
            end
        # when "A"
        #   puts "What is the voter's new affiliation?"
        #   new_affiliation = gets.chomp.upcase
        #   x.affiliation = new_affiliation
        else
          error
          rep_search
        end
      start
    else
      voter_search
    end
  end
end

def voter_search
    $voter_list.each do |x|
    if @input == x.name
      puts "What would you like to update?[N]ame or [A]ffiliation?"
      choice = gets.chomp.upcase
        case choice
        when "N"
          puts "What is the updated name?"
          new_name = gets.chomp.upcase
          x.name = new_name
        # when "p"
        #   puts "What is the candidate's new party? (R)epublican or (D)emocrat."
        #   new_party = gets.chomp.upcase
        #   x.party = new_party
        when "A"
          puts "What is the voter's new affiliation?"
          puts "(T)ea Party, (C)onservative, (N)eutral, (L)iberal, (S)ocialist"
          new_affiliation = gets.chomp.upcase
          if new_affiliation == "T"
          new_affiliation = "Tea Party"
          x.party = new_affiliation
        elsif new_affiliation == "C"
          new_affiliation = "Conservative"
          x.party = new_party
          x.affiliation = new_affiliation
        elsif new_affiliation == "N"
          new_affiliation = "Neutral"
          x.party = new_party
          x.affiliation = new_affiliation
        elsif new_affiliation == "L"
          new_affiliation = "Liberal"
          x.party = new_party
          x.affiliation = new_affiliation
        elsif new_affiliation == "S"
          new_affiliation = "Socialist"
          x.party = new_party
          x.affiliation = new_affiliation
        end
        else
          error
          voter_search
        end
      start
    else
      puts "We couldn't find that name, pleasehangupand try again later."
    end
  end
end
#====================================================================




# class Vote=========================================================
# Tea Party==========================================================
# ​class Votesim
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
#   # Conservative==========================================================
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
#   # Neutral==========================================================
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
#   # Socialist==========================================================
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
  sample = $democrat_list.sample
  sample.vote +=1
end

def rep_won
  sample = $republican_list.sample
  sample.vote +=1
end

def results
  y = 0
  $democrat_list.each do |x|
    if x.vote > y
      y = x.vote
      @z = x.name
      @t = x.vote
      @a = x.party
    end
  end
  if @a == "Democrat"
    @a = "Democratic"
  else
    @a = "Republican"
  end
    puts " - #{@z} has won from the #{@a} party with #{@t} votes"
end


  start
  #liberal
# end
#
# v = Vote.new
# p v.teaparty​
#Example of shuffle sample==========================
# a = 1
# until a > 10
# rep = (0..10).to_a
# rep = rep.shuffle.sample
#   puts rep
#   a += 1
# end
#=================================================
