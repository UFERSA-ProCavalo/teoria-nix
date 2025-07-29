# inc.nix
{ pkgs ? import <nixpkgs> {} }:

{
  # Primeira função de exemplo
  y = x: x + 1;
  
  # Função soma recursiva
  sum = let
    sum = n: if n == 0 then 0 else n + sum (n - 1);
  in
    sum;
}
