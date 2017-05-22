require 'octokit'
require 'netrc'

class Base
  # attr_accessor :un, :pw

  # un = username
  # pw = password

  def initialize
    @client = Octokit::Client.new(:netrc => true)
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
end


start = Base.new
