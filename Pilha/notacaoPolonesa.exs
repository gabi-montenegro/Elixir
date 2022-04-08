defmodule Pilha do
        defstruct pilha: []
        def novaPilha, do: %Pilha{}
        def push(%Pilha{pilha: pilha}, elemento) do 
                %Pilha{ pilha: [elemento | pilha]}
        end        
        def pop(%Pilha{pilha: [topo | resto]}), do: {topo, %Pilha{pilha: resto}}
        def topo(p) do
            case p do
                [] -> "Pilha vazia"
                 _ -> hd(p)
            end
        end
        def tamanho(%Pilha{pilha: pilha}), do: length(pilha)       
end

defmodule NP do
    import Pilha
    import Integer
    
    def avalia(termo) do
        pilhaTermo = Pilha.novaPilha
        tam = length(termo) - 1
        for i <- 0..tam do
            case Enum.at(termo, i) do
                "+" -> soma(pilhaTermo)
                "-" -> sub(pilhaTermo)
                "/" -> div(pilhaTermo)
                "*" -> mult(pilhaTermo)
                _ -> converte(Enum.at(termo, i), pilhaTermo)
            end
        end
        IO.puts pilhaTermo
    end
    def converte(num, pilhaTermo) do 
        {elem, _} = Integer.parse(num)
        pilhaTermo |> Pilha.push(elem)
    end
    def soma(pilhaTermo) do
        n1= Pilha.topo(pilhaTermo.pilha)
        {^n1, pilhaTermo} = Pilha.pop(pilhaTermo) #pattern matching
        n2= Pilha.topo(pilhaTermo.pilha)
        {^n2, pilhaTermo} = Pilha.pop(pilhaTermo) #pattern matching
        numSoma = n1 + n2 
        pilhaTermo |> Pilha.push(numSoma)
    end

    def sub(pilhaTermo) do
        n1= Pilha.topo(pilhaTermo.pilha)
        {^n1, pilhaTermo} = Pilha.pop(pilhaTermo) #pattern matching
        n2= Pilha.topo(pilhaTermo.pilha)
        {^n2, pilhaTermo} = Pilha.pop(pilhaTermo) #pattern matching
        numSub = n1 - n2 
        pilhaTermo |> Pilha.push(numSub)
    end

    def div(pilhaTermo) do
        n1= Pilha.topo(pilhaTermo.pilha)
        {^n1, pilhaTermo} = Pilha.pop(pilhaTermo) #pattern matching
        n2= Pilha.topo(pilhaTermo.pilha)
        {^n2, pilhaTermo} = Pilha.pop(pilhaTermo) #pattern matching
        numDiv = n1 / n2 
        pilhaTermo |> Pilha.push(numDiv)
    end

    def mult(pilhaTermo) do
        n1= Pilha.topo(pilhaTermo.pilha)
        {^n1, pilhaTermo} = Pilha.pop(pilhaTermo) #pattern matching
        n2= Pilha.topo(pilhaTermo.pilha)
        {^n2, pilhaTermo} = Pilha.pop(pilhaTermo) #pattern matching
        numMult = n1 * n2 
        pilhaTermo |> Pilha.push(numMult)
    end
    
    
end


#termo 3 * (7 * (4 - 1)- 5) + 1
#notação polonesa: 3 7 4 1 - * 5 - * 1 +
termo = ["3", "7", "4", "1", "-", "*", "5", "-", "*", "1", "+"]
NP.avalia(termo)