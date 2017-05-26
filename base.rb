require 'octokit'

class Base
  # attr_accessor :un, :pw

  # un = username
  # pw = password

  def initialize
    @client = Octokit::Client.new(:access_token => '3ef7914169f90ed5f12852f6274f7b305615f77b')
    @count = 1

    print "Username you want to search?\t"
    @username = ARGV[0] || gets.chomp.to_s
    @user = @client.user(@username)


    puts "#{@username} email is:\t\t#{@user.email}"


    @client.repos(@username).each do |f|
      puts "repo # #{@count}: #{f[:name]}"
      @count += 1
    end


    @client.repositories(@username).each do |r|
      puts r[:description]
    end

    @client.organization_repositories('ubbytech')

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

  def findRubyRepos # find all ruby repositories
    @client.search_repositories('ruby')
  end
end


start = Base.new
start.findRubyRepos
