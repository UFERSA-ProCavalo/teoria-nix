# recursive.nix
{ }:

let
  # Função zero (Z): sempre retorna 0, independente da entrada
  zeroFunction = _: 0;

  # Função sucessora (S): dado um número x, retorna x + 1
  successor = x: x + 1;

  # Projeção P1: recebe dois argumentos e retorna o primeiro
  projectionFirst = a: b: a;

  # Projeção P2: recebe dois argumentos e retorna o segundo
  projectionSecond = a: b: b;

  # Função soma recursiva primitiva
  #
  # Definida por recursão primitiva:
  # sum(0) = 0                 -- caso base
  # sum(n) = n + sum(n - 1)    -- passo recursivo
  sum = let
    recursiveSum = n:
      if n == 0 then
        0                         # caso base: soma até zero é zero
      else
        n + recursiveSum (n - 1); # soma atual + soma dos números anteriores
  in
    recursiveSum;

in
{
  inherit zeroFunction successor projectionFirst projectionSecond sum;
}
