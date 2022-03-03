defmodule S do
  def soma(a, b)  do
    a + b
  end
end

#within same file

IO.puts "A soma de 5 + 5 é: #{inspect S.soma(5, 5)}"