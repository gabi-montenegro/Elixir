
defmodule Pilha do
        import IO
        #defstruct pilha: []
        #def novaPilha, do: %Pilha{}
        def push(elemento, pilha), do: pilha = [elemento | pilha]        
        #def pop(pilha: []), do: raise("Stack is empty!")
        def pop(pilha: [top | rest]) do
            {top, pilha: rest}
        end
        
        def tamanho(pilha: pilha), do: length(pilha)
        def exibe(pilha: pilha), do: puts pilha
    
end

pilhaOriginal = []
Pilha.push(2, pilhaOriginal) |> Pilha.tamanho(pilhaOriginal)


#Pilha.novaPilha |> Pilha.push(1) |> Pilha.push(2) |> Pilha.exibe()

