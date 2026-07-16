defmodule Recursion do

    def counter(name, num)  when num == 0 do
        IO.puts(name)
    end



    

    def counter(name, num)  do
        IO.puts(name)
        counter(name,num-1)
    end




    
end