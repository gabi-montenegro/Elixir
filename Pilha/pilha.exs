
defmodule Pilha do
        
        defstruct pilha: []
        def novaPilha, do: %Pilha{}
        def push(%Pilha{pilha: pilha}, elemento) do 
                %Pilha{ pilha: [elemento | pilha]}
        end        
        def pop(%Pilha{pilha: [topo | resto]}), do: {topo, %Pilha{pilha: resto}}
        def pop(%Pilha{pilha: []}), do: "Pilha vazia"
        def topo(p) do
            case p do
                [] -> "Pilha vazia"
                 _ -> hd(p)
            end
        end
        def tamanho(%Pilha{pilha: pilha}), do: length(pilha)
        def inverteElementos(%Pilha{pilha: []}), do: "Pilha vazia"
        def inverteElementos(p = %Pilha{pilha: pilha}), do: Enum.reverse(p.pilha)
        
    
end

pilhaOriginal = Pilha.novaPilha |> Pilha.push(2) |> Pilha.push(3) |> Pilha.push(4)
IO.puts "#{inspect pilhaOriginal.pilha}"


#IO.puts "#{inspect Pilha.topo(pilhaOriginal.pilha)}"
top = Pilha.topo(pilhaOriginal.pilha)
{^top, pilhaOriginal} = Pilha.pop(pilhaOriginal) #pattern matching
IO.puts "#{inspect pilhaOriginal.pilha}"
IO.puts "#{inspect Pilha.tamanho(pilhaOriginal)}"
IO.puts "#{inspect Pilha.inverteElementos(pilhaOriginal)}"

pilha2 = Pilha.novaPilha
IO.puts "#{inspect Pilha.inverteElementos(pilha2)}"



