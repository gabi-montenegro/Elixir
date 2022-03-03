defmodule Func do
    def remove_espacos(str) do 
        String.replace(str, " ", "")
    end 
end 

str = "hello world !"
IO.puts("String sem espaços: #{Func.remove_espacos(str)}")