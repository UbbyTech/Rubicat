require 'octokit'

class Base
  # attr_accessor :un, :pw

  # un = username
  # pw = password

  def initialize
    @cliewnt = Octokit::Client.new(:access_token => '3ef7914169f90ed5f12852f6274f7b305615f77b')
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
  end

  def orgName
    @client.organization('UbbyTech')
  end
end


start = Base.new
