defmodule Modulo do #RESPOSTA: (nome=Modulo, propriedade=implementação, tempo=compilação)
    def abrev2(dia) do #RESPOSTA: (nome=abrev2(dia), propriedade=verificação do argumento dia da função, tempo=execução)
        cond do 
          dia == "Segunda" -> "Seg" #RESPOSTA: (nome=dia, propriedade=atribuição de valor, tempo: execução) 
          dia == "Terça" -> "Ter"#RESPOSTA: (nome='->', propriedade=semântica, tempo=execução) 
          dia == "Quarta" -> "Qua"
          dia == "Quinta" -> "Qui"
          dia == "Sexta" -> "Sex"
          true -> "Dia inválido" 
            
        end #RESPOSTA: (nome=end, propriedade=especificação, tempo=design) 
    end
end