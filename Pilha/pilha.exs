
defmodule Pilha do
    import IO
        defstruct pilha: []
        def novaPilha, do: %Pilha{}
        def push(pilha, elemento) do
            %Pilha{pilha: [elemento | pilha]}
        end
        
        def pop(%Pilha{pilha: []}), do: raise("Stack is empty!")
        def pop(%Pilha{pilha: [top | rest]}) do
            {top, %Pilha{pilha: rest}}
        end
        
        def depth(%Pilha{pilha: pilha}), do: length(pilha)
        def exibe(%Pilha{pilha: pilha}), do: puts "#{pilha}"
    
end




#Pilha.novaPilha |> Pilha.push(1) |> Pilha.push(2) |> Pilha.exibe()

