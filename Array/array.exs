
defmodule Func do   
    import Integer    

    def duplica(l) do
        Enum.map(l, &(&1 * 2)) #parametro * 2
        
    end

    def impar(l) do 
        Enum.filter(l, fn x -> is_odd(x) == :true end)
    end
end


l = [1,2,3,4]
IO.puts("Lista [1,2,3,4] duplicada: #{inspect Func.duplica(l)}")
IO.puts("Números ímpares da lista [1,2,3,4]: #{inspect Func.impar(l)}")


