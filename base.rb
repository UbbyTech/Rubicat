require 'octokit'
require 'netrc'

class Base
  # attr_accessor :un, :pw

  # un = username
  # pw = password

  def initialize
    @client = Octokit::Client.new(:access_token =>
    '0fbd1b3377212d79931c0c294300c2a48584d08f')
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

   @client.languages('UbbyTech/flexxy').each do |sum|
     puts sum

   end

  end
end


start = Base.new
