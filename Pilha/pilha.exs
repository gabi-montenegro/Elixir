
defmodule Pilha do
        
        defstruct pilha: []
        def novaPilha, do: %Pilha{}
        def push(%Pilha{pilha: pilha}, elemento) do 
                %Pilha{ pilha: [elemento | pilha]}
        end        
        def pop(%Pilha{pilha: [topo | resto]}), do: {topo, %Pilha{pilha: resto}}
        def pop(pilha = %Pilha{pilha: []}), do: {nil, pilha}
        
        def tamanho(%Pilha{pilha: pilha}), do: length(pilha)
        
    
end

pilhaOriginal = Pilha.novaPilha
pilhaOriginal = pilhaOriginal |> Pilha.push(2) |> Pilha.push(3) |> Pilha.push(4)
IO.puts "#{inspect pilhaOriginal}"
{4, pilhaOriginal} = Pilha.pop(pilhaOriginal) #pattern matching
IO.puts "#{inspect pilhaOriginal}"
IO.puts "#{inspect Pilha.tamanho(pilhaOriginal)}"





