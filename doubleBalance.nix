# Arquivo: doubleBalance.nix

# Algoritmo para processar uma linguagem turing decidível de duplo balanceamento L = { w | w => (a^n b^n)}.
# Avalia se, para uma dada string de entrada, há uma sequência de 'a's seguida por uma sequência de 'b's 
# em que 'a's e 'b's têm a mesma quantidade.

# ACEITE: quantidade de 'a's == quantidade de 'b's (incluindo 0)
# REJEITE: quantidade de 'a's != quantidade de 'b's || ordem incorreta || caracteres indesejados

let
  lib = import <nixpkgs/lib>;  

  # Entrada: uma string str
  # Saída: true se str ∈ L (ou seja, está na forma aⁿbⁿ), false caso contrário.
  isABBalanced = str: 
    let
      chars = lib.stringToCharacters str; # Transforma a string em uma lista de caracteres

      # Função recursiva: conta quantos 'a's consecutivos existem no início da lista
      countPrefixAs = list:
        if list == [] then 0                              # Caso base: lista vazia → 0
        else if lib.head list == "a" then                 # Se o primeiro elemento é 'a'
          1 + countPrefixAs (lib.tail list)               # Conta 1 e continua recursiv. com o resto da lista
        else 0;                                           # Se não for 'a', para de contar

      # Função recursiva: conta quantos 'b's aparecem *depois* dos 'a's
      countSuffixBs = list:
        if list == [] then 0                              # Lista vazia → 0
        else if lib.head list == "a" then 0               # Encontrou 'a' depois dos 'a's iniciais → rejeita
        else if lib.head list == "b" then                 # Se for 'b', conta 1 e continua
          1 + countSuffixBs (lib.tail list)
        else 0;                                           # Qualquer outro caractere → ignora/termina contagem

      # prefixAs: número de 'a's consecutivos no início da string
      prefixAs = countPrefixAs chars;

      # suffixBs: número de 'b's consecutivos depois dos 'a's
      suffixBs = countSuffixBs (lib.drop prefixAs chars);

      # totalLength: número total de caracteres da string
      totalLength = lib.length chars;
    in
      # A string é válida se:
      # 1. A quantidade de 'a's e 'b's equivalem ao comprimento total da string
      # 2. A quantidade de 'a's e 'b's é igual
      (prefixAs + suffixBs == totalLength) && (prefixAs == suffixBs);

in

# Testes para a função isABBalanced com diferentes strings
{
  test1 = isABBalanced "aabbghgdhsfskhlkf";   # false — contém letras além de 'a' e 'b'
  test2 = isABBalanced "a2abb3";              # false — contém números
  test3 = isABBalanced "aaabb";               # false — número de 'a's ≠ número de 'b's
  test4 = isABBalanced "bbaa";                # false — 'b's aparecem antes dos 'a's
  test5 = isABBalanced "aaabbb";              # true  — válido: 3 'a's seguidos por 3 'b's
  test6 = isABBalanced "aaaaaabbbbbb";        # true  — válido: 6 'a's e 6 'b's
  test7 = isABBalanced "ab";                  # true  — válido: 1 'a', 1 'b'
  test8 = isABBalanced "";                    # true  — string vazia é aceita (n = 0)
}