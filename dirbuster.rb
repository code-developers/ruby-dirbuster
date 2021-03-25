#dirbuster(ruby)
#!/usr/bin/env ruby

#requirements
require "net/http"
require "uri"

arr = []

def browse(website, startcount, times)
  count = 0
  while count < times
    equation = (count/times.to_f)*100
    percent = sprintf("%.1f", equation)
    startcount = startcount + 1
    line = IO.readlines("list.txt")[startcount]

    file = "results.txt"
    url = "#{website}/#{line}".chomp
    res = Net::HTTP.get_response(URI(url))
    code = res.code

    if code == "200":
      print "#{percent.to_f}% - \033[0;32m#{code} - #{website}#{line}\033[0m"
      open('results.txt', 'a') { |f|
      f.puts "#{code} - #{website}#{line}"
      }
    elsif code == "4040"
      print "#{percnet.to_f}"
    end
    end
  end
end
