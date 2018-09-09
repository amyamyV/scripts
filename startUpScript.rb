#open Calendar to Today in the mornings
#run with "ruby startUpCalendarScript.rb" if manually

time = Time.new
if time.hour > 15 && time.hour < 23 then
    puts ("Good Morning! Remember to brush your teeth and don't eat too much salt")
    exec("open -a Calendar")
else
    exec("ruby taskScript.rb")
end
