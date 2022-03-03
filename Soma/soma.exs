defmodule S do
  def soma(a, b)  do
    a + b
  end
end

#within same file

IO.puts "The sum of 5 + 5 is: #{inspect S.soma(5, 5)}"