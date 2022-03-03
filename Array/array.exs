require Integer
defmodule Func do   
    

    def duplica(l) do
        Enum.map(l, fn x -> x*2 end)
        
    end

    def impar(l) do 
        Enum.filter(l, fn x -> Integer.is_odd(x) == :true end)
    end
end


l = [1,2,3,4]
IO.puts("Lista [1,2,3,4] duplicada: #{inspect Func.duplica(l)}")
IO.puts("Números ímpares da lista [1,2,3,4]: #{inspect Func.impar(l)}")


