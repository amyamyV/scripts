#Script to open applications/webpages depending on what you want to do
#Use "system" to open things to can open multiple applications
#Clear screen and just focus on task

#run by "ruby taskScript.rb"
#specifically written for Amy's computer due to available programs
#If you also have Spotify, IntelliJ, and Atom (and same classes as me), you may try it out

#First, Hide ALL windows EXCEPT the terminal where script if running
system("osascript -e 'activate application \"Finder\"
tell application \"System Events\"
set visible of processes where name is not \"Terminal\" to false
end tell
tell application \"Finder\" to set collapsed of windows to true'")


puts ("Name: ")
name = gets.chomp
puts ("Hello #{name}! \n \n")
puts ("What is one thing you want to do right now?? \n \n")
puts ("I want to know. \n \n")
puts ("Just pick one. \n \n")

#pre-defined METHODS
#use to avoid str1.casecmp(str2) -> will be false b/c return 0 if equal
def strings_equal(str1, str2) #return true if equal
  str1.casecmp(str2) == 0
end

def askMusic (task) #only ask in parts where sound not included
        puts ("Do you want to listen to music while #{task}-ing? \n \n")
        yn_Music = gets.chomp
        if (strings_equal(yn_Music, "yes") or strings_equal(yn_Music, "yea") or strings_equal(yn_Music, "sure"))
            #system("open -a Spotify")
            system("open -a Spotify")

        elsif (strings_equal(yn_Music, "no"))
        #just launch task
            puts ("Okay. Cya later.")

        else
            #just launch task
        end #end yes or no
end #end def

def forClass()
    puts ("For what class? Type in the number: 420, 433, 393, 461, or 140\n \n")
    homework = gets.chomp
    askMusic(homework) #boolean, returns yes or no if want music
    if (strings_equal(homework, "420"))
        system("open -a 'IntelliJ IDEA CE'")
        system("open", "http://umd.instructure.com/courses/1246980/files/folder/project_writeups")
    elsif (strings_equal(homework, "433"))
        system("open -a 'IntelliJ IDEA CE'")
        system("open", "https://umd.instructure.com/courses/1246992")
    elsif (strings_equal(homework, "393") or strings_equal(homework, "English"))
        system("open -a Microsoft Word")
    elsif (strings_equal(homework, "140") or strings_equal(homework, "English"))
        system("open", "https://umd.instructure.com/courses/1247811")
    elsif (strings_equal(homework, "461") or strings_equal(homework, "English"))
        system("open", "https://umd.instructure.com/courses/1247821")
    else
        puts ("Retype class or put in real one \n \n")
    end #end if

end #end def




picking = false #while task is not certain or assigned

while (picking == false)
task = gets.chomp #user types what task they want to do

#task1: listening to music
if ((task.include? "music") || (task.include? "listen"))

    def music_listening_task ()
    puts ("You want to listen to Spotify or Youtube? \n \n")
    music = gets.chomp
        if (strings_equal(music, "Yes"))
            puts ("Then tell me which one please. \n \n")
            music_prog_which = gets.chomp
            if (strings_equal(music_prog_which, "Spotify"))
                system("open -a Spotify") #open applications
                #open("open -a Spotify")
                picking = true

            elsif (strings_equal(music_prog_which, "Youtube"))
                system("open", "http://youtube.com/")
                picking = true

            else
                puts ("Don't know that. Type either Spotify or Youtube \n \n")
            end


        elsif (strings_equal(music, "Spotify"))
            system("open -a Spotify")
            picking = true

        elsif (strings_equal(music, "Youtube"))
            system("open", "http://youtube.com/")
            picking = true

        elsif (strings_equal(music, "No"))
            puts ("Then add more music players in scripts or pick another activity \n \n")
        else
            puts ("ummmmm idk what that is. \n
                Use different words for the task please")
            #no option picked, keep looping
        end #if music option
    end #end for def music_listening_task

    music_listening_task()


#task2: watching stuff on internet
elsif (task.include? "watch") or (task.include? "chill") or (task.include? "youtube") or (task.include? "tv") or (task.include? "xfinity") or (task.include? "movie") or (task.include? "hulu")
    #list from most special/specific to least & common
    if (task.include? "youtube")
        system("open", "http://youtube.com/")
    elsif (task.include? "xfinity")
            system("open", "http://xfinity.com/stream/foryou")
    elsif (task.include? "watch") or (task.include? "movie") or strings_equal(task, "chill") or strings_equal(task, "tv")
        puts("What do you want to watch on? Hulu, xfinity, youtube, or other")
        whatToWatchOn = gets.chomp
        if (whatToWatchOn.include? "hulu")
            system("open", "http://hulu.com/")
        elsif (whatToWatchOn.include? "xfinity")
            system("open", "http://xfinity.com/stream/foryou")
        elsif (whatToWatchOn.include? "youtube")
            system("open", "http://xfinity.com/stream/foryou")
        else
            puts("Well, you can google that")
        end
    else
        system("open", "http://xfinity.com/stream/foryou")
    end #list of watching stuff
        picking = true #since open something anyway

elsif (task.include? "homework") or (task.include? "study") or (task.include? "work") or (task.include? "hw") or (task.include? "coding") or (task.include? "schoolwork") or (task.include? "cs") or (task.include? "projects") or (task.include? "code")
    if (task.include? "homework") or (task.include? "study") or (task.include? "hw") or (task.include? "work")or (task.include? "school")

        forClass()
        picking = true

    elsif (task.include? "code" or (task.include? "coding") or (task.include? "cs") or (task.include? "projects") or  (task.include? "study"))
        puts ("For class or personal? \n \n")
        hwOrPsnl = gets.chomp
            if (strings_equal(hwOrPsnl, "class") or strings_equal(hwOrPsnl, "school"))
                forClass()
                picking = true
            else
                puts("What do you want to work on? \n")
                puts("Android, scripts, websites, Leetcode, or other? \n \n")
                cs = gets.chomp
                askMusic(task)
                if (strings_equal(cs, "Android"))
                    system("open -a Android Studio")
                elsif (strings_equal(cs, "scripts"))
                    system("open -a Atom")
                elsif (strings_equal(cs, "websites"))
                    system("atom Projects/sites")
                elsif (strings_equal(cs, "Leetcode"))
                    system("open", "http://leetcode.com")
                elsif (strings_equal(cs, "other"))
                    system("open", "http://auyyon.com")
                else
                    system("open -a Atom")
                    system("open", "http://google.com")

                end #end if

            end #end if
            picking = true
    else
        system("open -a Atom")
        system("open", "http://google.com")
    end


#unknown task -> retype
else
    puts ("ummmmm idk what that is. Use different words please \n \n")

end #end for if tasks
end #end for while loop


Kernel.exit(false)
