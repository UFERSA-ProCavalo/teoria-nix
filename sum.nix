{ }:

let
  # Zero: função constante que retorna 0
  zero = _: 0;

  # Sucessor: incrementa o número em 1
  successor = n: n + 1;

  # Projeção P1: retorna o primeiro argumento (para 2 argumentos)
  projection1 = a: b: a;

  # Projeção P2: retorna o segundo argumento (para 2 argumentos)
  projection2 = a: b: b;

  # Predecessor: define o predecessor usando recursão primitiva
  predecessor = n:
    if n == 0 then 0 else n - 1;

  # Função de soma recursiva usando recursão primitiva
  sum = n: y:
    if n == 0 then y else successor (sum (predecessor n) y);

in
{
  zero = zero;
  successor = successor;
  projection1 = projection1;
  projection2 = projection2;
  predecessor = predecessor;
  sum = sum;
}
