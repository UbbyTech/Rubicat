require 'octokit'

class Base
  # attr_accessor :un, :pw

  # un = username
  # pw = password

  def initialize
    @client = Octokit::Client.new(:access_token => '<access_token_here>') # replace your access token
    @count = 1

    print "What's the username you want to search?\t"
    @username = ARGV[0] || gets.chomp.to_s
    @user = @client.user(@username)


    puts "#{@username} email is:\t\t#{@user.email}"


    @client.repos(@username).each do |f|
      puts "repo # #{@count}: #{f[:name]}\nDescription: #{f[:description]}\n\n"

      @count += 1
    end



  end


  def memberVal  # validates users organization membership
    print "What organization do you belong to:\t"
    @yourOrg = gets.chomp.to_s

    if (@client.organization_member?(@yourOrg, @username) == true)
      puts "Your are a member of this organization"
    else
      puts "Sorry you do not belong to this membership"
    end
  end

  def viewCollabs # viewing all collaborators for specific repo
    print "choose a repo to view collaborators (note: must be public repo)\t"
    @repoName = gets.chomp.to_s

    print "Do you wish wish to view all collaborators for this repository?\t"
    @answer = gets.chomp.to_s

    if(@answer == "y")
      puts @client.collaborators(@repoName)
    elsif(@answer == "n")
      exit
    end
  end



end


start = Base.new
