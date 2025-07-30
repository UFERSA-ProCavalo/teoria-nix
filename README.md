# 🧪 Projeto Nix – Algoritmos Funcionais 

Este repositório contém uma série de algoritmos implementados na linguagem **Nix**, com foco em **funções recursivas** e **processamento de linguagens formais**. O projeto demonstra o uso da linguagem Nix como ferramenta de modelagem matemática e computação pura.

---

## 🖥️ Como rodar no Windows (via WSL)

### 🔧 1. Ative a Virtualização na BIOS
- Acesse a BIOS do seu computador
- Habilite a opção **Virtualization Technology (VT-x/AMD-V)**

### 🧱 2. Instale o WSL (Subsistema do Windows para Linux)
Abra o PowerShell como administrador e execute:

```powershell
wsl --install
```

> Isso instalará o WSL 2 e o Ubuntu por padrão. Você pode reiniciar e configurar sua conta Linux.

Se quiser instalar outra distro, veja: https://aka.ms/wslstore

---

### 🐧 3. Instale o Nix no terminal Linux (Ubuntu, Debian, etc)

Execute no terminal do WSL:

```bash
sh <(curl -L https://nixos.org/nix/install)
```

---

### 🧪 4. Dentro do diretório do projeto, use o `nix repl` para testar os arquivos

Execute:

```bash
nix repl
```

Dentro do REPL, para importar um arquivo `.nix`:

```nix
(import ./doubleBalance.nix)
```

Para rodar um teste específico (ex: `test5`):

```nix
(import ./doubleBalance.nix).test5
```

---

## 📂 Estrutura dos Arquivos

### `doubleBalance.nix`
- Algoritmo que processa strings para verificar se pertencem à linguagem Turing-decidível:
  - **L = { w | w = aⁿbⁿ }**
- Verifica se a string contém apenas `n` letras 'a' seguidas por `n` letras 'b'.

---

### `main.nix`
- Exemplo de função recursiva pura que implementa uma **soma de 0 até n** usando estrutura funcional em Nix.

---

### `recursive.nix`
- Implementa **definições formais** de funções recursivas primitivas em estilo funcional.
- Inclui: função `zero`, `succ` (sucessor), `pred` (antecessor) e `add` (soma recursiva).

---

### `sum.nix`
- Mesmas funções do `recursive.nix`, mas com uma **sintaxe mais matemática** e direta.
- Ideal para compreender como estruturas matemáticas podem ser expressas em Nix.

---

### `package.json`
- Define **metadados e dependências** do projeto.
- Não utilizado diretamente pelo Nix, mas pode ser útil para organização em ambientes mistos (Node/Nix).

---

## 🧠 Requisitos

- WSL2 + Distro Linux (Ubuntu recomendado)
- Nix (via `sh <(curl ...)`)
- Terminal com acesso a WSL

---

## 🚀 Exemplos de uso no REPL

```nix
(import ./main.nix).sum 5
# → 15

(import ./doubleBalance.nix).test6
# → true

(import ./sum.nix).sum 4
# → 10
```

---

## 📘 Referências úteis

- [Nix Pills (tutorial oficial)](https://nixos.org/guides/nix-pills/)
- [Nix REPL cheatsheet](https://nixos.org/manual/nix/stable/repl/)
- [WSL + Nix](https://nixos.org/manual/nix/stable/installation/#installation-on-non-nixos)

---

## 📄 Autoria

[@Matixinha](https://github.com/Matixinha)
[@YanBalbino](https://github.com/YanBalbino)
