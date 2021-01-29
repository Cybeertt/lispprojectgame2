# Projeto IA 2020/21 IPS ESTS

### **Docente**
Joaquim Filipe

### **Estudantes**
150221081 - Daniela Sineiro

200221149 - Rafael Palma

## **Manual Técnico**
Neste manual encontram-se explicações sobre o jogo, como o iniciar, a estrutura do projeto, todas as funções utilizadas explicadas e ilustradas com exemplos e observações, e exemplos descritivos de testes com o código fonte por partes ou no global.

## **Indice**
* [Abstrato](#doc-abstract)
* [Extrutura do Projeto](#doc-extrutura)
* [Documentação de Funções](#doc-func)
  * [Jogo](#f-jogo)
    * [Tab](#f-tab)
    * [Reserva](#f-reserva)
    * [Fila](#f-fila)
    * [Coluna](#f-coluna)
    * [Celula](#f-celula)
    * [Cria-Lista-Indice](#f-cria-lista-indice)
    * [Diagonal-Esquerda](#f-diagonal-esquerda)
    * [Diagonal-Direita](#f-diagonal-direita)
    * [Casa-Vaziap](#f-casa-vaziap)
    * [Remove-Peca](#f-remove-peca)
    * [Substituir-Posicao](#f-substituir-posicao)
    * [Colunas](#f-colunas)
    * [Diagnonais](#f-diagonais)
    * [Quatro-Fila-P](#f-quatro-fila-p)
    * [Max-A-P](#f-max-a-p)
    * [Sao-Iguaisp](#f-sao-iguaisp)
    * [Jogada](#f-jogada)
    * [Casas-Vazias](#f-casas-vazias)
    * [Coordenadas](#f-coordenadas)
    * [No-Solucaop](#f-no-solucaop)
    * [Heuristic](#f-heuristic)
  * [Procura](#f-procura)
    * [Cria-No](#f-p-cria-no)
    * [Tabuleiro-Conteudo](#f-p-tabuleiro-conteudo)
    * [Reserva-Conteudo](#f-p-reserva-conteudo)
    * [No-Estado](#f-p-no-estado)
    * [No-Pai](#f-p-no-pai)
    * [No-Profundidade](#f-p-no-profundidade)
    * [Novo-Sucessor](#f-p-no-sucessor)
    * [Sucessores-Quatro](#-f-p-sucessores-quatro)
    * [Operadores-Quatro](#f-p-operadores-quatro)
    * [Nivel-no](#f-p-nivel-no)
    * [Abertos-Bfs](#f-p-abertos-bfs)
    * [Abertos-Dfs](#f-p-abertos-dfs)
    * [No-Existep](#f-p-no-existep)
    * [Bfs](#f-p-bfs)
    * [Dfs](#f-p-dfs)
    * [Empty-Heap-P](#f-p-empty-heap-p)
    * [Make-Heap](#f-p-make-heap)
    * [Meld](#f-p-meld)
    * [Insert](#f-p-insert)
    * [Priority](#f-p-priority)
    * [Elem](#f-p-elem)
    * [child](#f-p-child)
    * [O-Sibling](#f-p-o-sibling)
    * [Siblings](#f-p-siblings)
    * [Children](#f-p-children)
    * [Pairwise-Link](#f-p-pairwise-link)
    * [Remove-First](#f-p-remove-first)
    * [A-Star](#f-p-a-star)
    * [Tamanho-Solucao](#f-p-tamanho-solucao)
    * [Penetrancia](#f-p-penetrancia)
  * [Projeto](#f-projeto)
    * [Base-Pathname](#proj-constante-base-pathname)
    * [Asset-Path](#f-proj-asset-path)
    * [Load Files](#proj-load-files)
    * [Startup](#f-proj-startup)
    * [Obter-Problemas](#f-proj-obter-problemas)
    * [Menu-Principal](#f-proj-menu-principal)
    * [Regras](#f-proj-regras)
    * [Tabuleiros](#f-proj-tabuleiros)
    * [Escrever-Estatistica](#f-proj-escrever-estatistica)
    * [Print-Board](#f-proj-print-board)
    * [Menu-Algoritmos](#f-proj-menu-algoritmos)
    * [Tempo](#f-proj-tempo)
    * [Ler-Profundidade](#f-proj-ler-profundidade)
* [Lista de Problemas](#lista-problemas)
  * [Problema A](#lp-a)
  * [Problema B](#lp-b)
  * [Problema C](#lp-c)
  * [Problema D](#lp-d)
  * [Problema E](#lp-e)
  * [Problema F](#lp-f)
* [Aplicação dos Algoritmos de Prócura](#aplica-algoritmos)
  * [Problema A](#aplica-algoritmos-problema-a)
    * [BFS](#aplica-algoritmos-problema-a-bfs)
    * [DFS](#aplica-algoritmos-problema-a-dfs)
    * [A*](#aplica-algoritmos-problema-a-a-star)
  * [Problema B](#aplica-algoritmos-problema-b)
    * [BFS](#aplica-algoritmos-problema-b-bfs)
    * [DFS](#aplica-algoritmos-problema-b-dfs)
    * [A*](#aplica-algoritmos-problema-b)
  * [Problema C](#aplica-algoritmos-problema-c)
    * [BFS](#aplica-algoritmos-problema-c-bfs)
    * [DFS](#aplica-algoritmos-problema-c-dfs)
    * [A*](#aplica-algoritmos-problema-c-a-star)
  * [Problema D](#aplica-algoritmos-problema-d)
    * [BFS](#aplica-algoritmos-problema-d-bfs)
    * [DFS](#aplica-algoritmos-problema-d-dfs)
    * [A*](#aplica-algoritmos-problema-d-a-star)
  * [Problema E](#aplica-algoritmos-problema-e)
    * [BFS](#aplica-algoritmos-problema-e-bfs)
    * [DFS](#aplica-algoritmos-problema-e-dfs)
    * [A*](#aplica-algoritmos-problema-e-a-star)
  * [Problema F](#aplica-algoritmos-problema-f)
    * [BFS](#aplica-algoritmos-problema-f-bfs)
    * [DFS](#aplica-algoritmos-problema-f-dfs)
    * [A*](#aplica-algoritmos-problema-f-a-star)
  * [Observações](##aplica-algoritmos-observacoes)
* [Conslusão](#conclusao)
* [Glossário](#glossario)


## <a name="doc-abstract">**Abstrato**</a>
Este projeto tem com o intuito de aplicar conhecimentos adquiridos no ambito da cadeira curricular IA e realizar uma análise entre os algoritmos de prócura para os diferentes estados do jogo Quatro.

Quatro, é um jogo que contém um tabuleiro 4x4 e 16 peças com quatro carateristicas. Cada carateristica de uma peça utiliza dois valores possíveis, tal como um sistema binário, permitindo fazer combinações de 16 peças. Por norma uma peça tem 14 peças com pelo menos uma carateristica em comum e 1 peça sem qualquer carateristica em comum.

Quatro, é um jogo sequêncial disputado por 2 competidores.
O jogo é realizado num tabuleiro 4x4 e 16 peças com 4 carateristicas.

A cada turno, a peça é sempre escolhida pelo adversário que tem como missão entregar a peça com menos atributos iguais às peças que atualmente se encontram no tabuleiro.

O Quatro finaliza quando um jogador consegue alinhar 4 peças com pelo menos uma carateristica em comum, seja na vertical, horizontal ou diagonal, independentemente da direção.

Nesta versão do manual, o Quatro não é jogado, mas é selecionado um estado do tabuleiro e criada uma previsão para resolver o jogo com quatro peças com pelo menos um atributo em comum, recorrendo aos algortimos de prócura BFS, DFS e A*, analisando os resultados da cada um e comparando entre si.

## <a name="doc-estrutura">**Estrutura do Projeto**</a>
O projeto encontra-se distribuído por 3 ficheiros principais: ***interact.lisp***, ***puzzle.lisp*** e ***algoritmo.lisp***.

O ficheiro ***interact.lisp*** contém o código fonte que inicializa o jogo.

O ficheiro ***jogo.lisp*** contém o código fonte utilizado para criar e modificar o jogo.

O ficheiro ***algoritmo.lisp*** contém todos os algoritmos de procura de estados para jogada computador no jogo.

Em conjunto com os 3 ficheiros acima indicados, também se encontram em anexo os ***manual de utilizador*** e ***log.dat***.

O ***manual de utilizador*** apenas contém uma breve explicação sobre o jogo e como o iniciar.

O ***log.dat*** contém em formato de lista em Common Lisp, uma série de tabuleiros com peças em situações diferentes do jogo. 

Este ficheiro guarda vários tabuleiros com peças pré-colocadas. Cada tabuleiro será selecionado para continuar o jogo no tabuleiro atual.

## <a name="doc-func">**Documentação de Funções**</a>

As seguintes funções utilizadas para desenvolver o projeto, contêm o seu corpo, breve descrição, parâmetros e exemplos de chamadas e de resultados esperados.

Excecionalmente, algumas funções contêm breves observações perante o resultado esperado, para melhor ilustrar o seu uso especifico.

### <a nome="f-jogo">**Jogo**</a>
As seguintes funções permitem definir o jogo do Problema do Quatro.

#### <a name="f-tab">Tab</a>
Retorna uma lista de 4 listas com 4 elementos.

O espaço do tabuleiro é representado por 0, quando a posição encontra-se vazia.

**Parametros**

*l - Lista*

```lisp
; funcao
(defun tabuleiro (problema)
  (car problema))
```

```lisp
; problema
(((0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0)) ((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA REDONDA BAIXA OCA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA ALTA OCA) (BRANCA QUADRADA BAIXA OCA) (PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA ALTA CHEIA) (PRETA REDONDA ALTA CHEIA) (BRANCA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA CHEIA) (BRANCA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA CHEIA) (BRANCA QUADRADA BAIXA CHEIA) (PRETA QUADRADA BAIXA CHEIA)))

; chamada
CL-USER> (tabuleiro problema)
((0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0))
```

### <a name="f-reserva">Reserva</a>
Retorna uma lista de 16 listas com 4 elementos.

Esta lista contém todas as peças utilizadas no jogo. Cada peça é uma lista com 4 carateristicas da peça.

**Parametros**

*l - Lista*

```lisp
; funcao
(defun reserva (problema)
  (cadr problema))
```

```lisp
; problema
(((0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0)) ((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA REDONDA BAIXA OCA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA ALTA OCA) (BRANCA QUADRADA BAIXA OCA) (PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA ALTA CHEIA) (PRETA REDONDA ALTA CHEIA) (BRANCA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA CHEIA) (BRANCA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA CHEIA) (BRANCA QUADRADA BAIXA CHEIA) (PRETA QUADRADA BAIXA CHEIA)))

; chamada
CL-USER> (reserva problema)
((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA REDONDA BAIXA OCA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA ALTA OCA) (BRANCA QUADRADA BAIXA OCA) (PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA ALTA CHEIA) (PRETA REDONDA ALTA CHEIA) (BRANCA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA CHEIA) (BRANCA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA CHEIA) (BRANCA QUADRADA BAIXA CHEIA) (PRETA QUADRADA BAIXA CHEIA))
```

#### <a nome="f-fila">Fila</a>
Retorna uma lista com elementos que se encontram numa fila.

**Parametros**

*l - Indice de fila*

*tabuleiro - Tabuleiro ou reserva*

```lisp
; funcao
(defun fila (l tabuleiro)
  (nth l tabuleiro)
)
```
Retorna a primeira peça da reserva com 16 peças.

```lisp
; reserva
((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA REDONDA BAIXA OCA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA ALTA OCA) (BRANCA QUADRADA BAIXA OCA) (PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA ALTA CHEIA) (PRETA REDONDA ALTA CHEIA) (BRANCA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA CHEIA) (BRANCA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA CHEIA) (BRANCA QUADRADA BAIXA CHEIA) (PRETA QUADRADA BAIXA CHEIA)))

; chamada
CL-USER> (fila 0 reserva))
(BRANCA REDONDA ALTA OCA)
````

Retorna a primeira fila do tabuleiro vazio.

```lisp
; tabuleiro
((0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0))

; chamada
CL-USER> (fila 0 tabuleiro)
(0 0 0 0)
```

#### <a nome="f-coluna">Coluna</a>
Retorna uma lista de elementos que se encontram numa coluna e limita-se a retornar 4 elementos.

Esta função limita-se a ser uma função redundante da função [celula](#f-celula) para aumentar legibilidade do código.

**Parametros**

*c - Indice de coluna*

*tab - Tabuleiro*

```lisp
; funcao
(defun coluna (c tabuleiro)
; e - Elemento do tabuleiro
  (mapcar #'(lambda (e) (nth c e)) tabuleiro)
)
```

Retorna a primeira coluna do tabuleiro vazio.

```lisp
; tabuleiro
((0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0))

;chamada
CL-USER (coluna 0 tabuleiro)
(0 0 0 0)

;; representação do resultado com coordenadas
;; ((0,0) (1,0) (2,0) (3,0))
```

#### <a nome="f-celula">Celula</a>
Retorna um elementos que se encontram numa fila ou coluna.

**Parametros**

*l - Indice de fila*

*c - Indice de coluna*

*tabuleiro - Tabuleiro*

```lisp
; funcao
(defun celula (l c tabuleiro)
  (nth l (nth c tabuleiro))
)
```

Retorna o valor da céluna na coordenada (0,0) do tabuleiro vazio.

```lisp
; tabuleiro

; chamada
CL-USER> (celula 0 0 tabuleiro)
0
```

#### <a nome="f-cria-lista-indice">Cria-Lista-Indice</a>
Retorna uma lista com todos os indices correspondentes do tamanho máximo da lista parameterizada.

Esta função auxilia na geração de coordenadas para as funções [diagonal-esquerda](#f-diagonal-esquerda) e [diagonal-direita](#f-diagonal-direita).

**Parâmetros**

*i - Tamanho da lista*

```lisp
; funcao
(defun cria-lista-indice (i)
  (cond 
   ((< i 1) nil)
   (t (cons (1- i) (cria-lista-indice (1- i)))))
)
```

Gera lista com indices de 4.

```lisp
; chamada
CL-USER> (cria-lista-indice 4)
(3 2 1 0)
```

Gera uma lista com indices de 0.

```lisp
; chamada
CL-USER> (cria-lista-indice 0)
NIL
```

#### <a nome="f-diagonal-esquerda">Diagonal-Esquerda</a>
Retorna a diagonal esquerda do tabuleiro.

As coordenadas da diagonal esquerda são o conjunto de pares coordenados {(0,0), (1,1), (2, 2), (3,3)}.

**Parâmetros**

*tabuleiro - Tabuleiro*

```lisp
; funcao
(defun diagonal-esquerda (tabuleiro)
  ; e - Elemento da lista
  (mapcar #'(lambda (e) (celula e e tabuleiro)) (reverse (cria-lista-indice (length tabuleiro))))
)
```

Retorna a diagonal esquerda (0,0) a (3,3) de um tabuleiro vazio.

```lisp
; tabuleiro
((0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0))

; chamada
(diagonal-esquerda tabuleiro)
((0 0 0 0) (0 0 0 0))
```

Retorna a diagonal esquerda (0,3) a (3,0) de um tabuleiro preenchido.

```lisp
; tabuleiro
(((BRANCA QUADRADA BAIXA CHEIA) 0 (PRETA REDONDA ALTA CHEIA) (PRETA QUADRADA BAIXA OCA)) (0 0 0 (BRANCA REDONDA BAIXA OCA)) ((BRANCA REDONDA ALTA CHEIA) 0 (PRETA REDONDA ALTA OCA) (BRANCA QUADRADA BAIXA OCA)) (0 (PRETA QUADRADA BAIXA CHEIA) 0 0))

; chamada
(diagonal-esquerda tabuleiro)
((BRANCA QUADRADA BAIXA CHEIA) 0 (PRETA REDONDA ALTA OCA) 0)
```

Retorna a diagonal esquerda (0,0) a (3,3) de um tabuleiro NIL.

```lisp
; chamada
(diagonal-esquerda NIL)
NIL
```

#### <a nome="f-diagonal-direita">Diagonal-Direita</a>
Retorna a diagonal direita do tabuleiro.

As coordenadas da diagonal são o conjunto de pares coordenados {(3,0), (2,1), (1, 2), (0,3)}.

**Parâmetros**

*tabuleiro - Tabuleiro*

```lisp
; funcao
(defun diagonal-direita (tabuleiro)
  ; i - indice
  (let ((i (1- (length tabuleiro))))
    ; e - Elemento da lista
    (mapcar #'(lambda (e) (celula e (- i e) tabuleiro)) (reverse (cria-lista-indice (length tabuleiro)))))
)
```

Retorna a diagonal direita (0,3) a (3,0) de um tabuleiro vazio.

```lisp
; tabuleiro
((0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0))

; chamada
(diagonal-direita tabuleiro)
((0 0 0 0) (0 0 0 0))
```

Retorna a diagonal direita (0,3) a (3,0) de um tabuleiro preenchido.

```lisp
; tabuleiro
(((BRANCA QUADRADA BAIXA CHEIA) 0 (PRETA REDONDA ALTA CHEIA) (PRETA QUADRADA BAIXA OCA)) (0 0 0 (BRANCA REDONDA BAIXA OCA)) ((BRANCA REDONDA ALTA CHEIA) 0 (PRETA REDONDA ALTA OCA) (BRANCA QUADRADA BAIXA OCA)) (0 (PRETA QUADRADA BAIXA CHEIA) 0 0))

; chamada
(diagonal-direita tabuleiro)
(0 0 0 (PRETA QUADRADA BAIXA OCA))
```

Retorna a diagonal direita (0,3) a (3,0) de um tabuleiro NIL.

```lisp
; chamada
(diagonal-direita NIL)
NIL
```

#### <a nome="f-casa-vaziap">Casa-Vaziap</a>
Verifica se uma coordenada do tabuleiro encontra-se vazia. Uma coordenada é considerada vazia se o seu valor for zero.

**Parâmetros**

*l - Coordenada da linha*

*c - Coordenada da coluna*

*tabuleiro - Tabuleiro*

```lisp
; funcao
(defun casa-vaziap (l c tabuleiro)
  (numberp (celula l c tabuleiro))
)
```
Verifica se o tabuleiro vazio encontra-se não tem peça nas coordenadas (0,0).

```lisp
; tabuleiro
((0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0))

; chamada
CL-USER> (casa-vaziap 0 0 tabuleiro)
T
```

Verifica se o tabuleiro preenchido encontra-se não tem peça nas coordenadas (1,3).

```lisp
; tabuleiro
(((BRANCA QUADRADA BAIXA CHEIA) 0 (PRETA REDONDA ALTA CHEIA) (PRETA QUADRADA BAIXA OCA)) (0 0 0 (BRANCA REDONDA BAIXA OCA)) ((BRANCA REDONDA ALTA CHEIA) 0 (PRETA REDONDA ALTA OCA) (BRANCA QUADRADA BAIXA OCA)) (0 (PRETA QUADRADA BAIXA CHEIA) 0 0))

; chamada
CL-USER> (casa-vaziap 1 3 tabuleiro)
NIL
```

Verifica se o tabuleiro preenchido encontra-se não tem peça nas coordenadas (0,3).

```lisp
; tabuleiro
(((BRANCA QUADRADA BAIXA CHEIA) 0 (PRETA REDONDA ALTA CHEIA) (PRETA QUADRADA BAIXA OCA)) (0 0 0 (BRANCA REDONDA BAIXA OCA)) ((BRANCA REDONDA ALTA CHEIA) 0 (PRETA REDONDA ALTA OCA) (BRANCA QUADRADA BAIXA OCA)) (0 (PRETA QUADRADA BAIXA CHEIA) 0 0))

; chamada
CL-USER> (casa-vaziap 0 3 tabuleiro)
T
```

#### <a nome="f-remove-peca">Remove-Peca</a>
Remove da lista uma peça igual ao da peça parametrizada. Caso existir a peça, é retornada a lista sem a peça, caso contrário não é efetuada qualquer alteração e retorna-se a lista parametrizada.

**Parâmetros**

*p - Peça*

*reserva - Reserva do Tabuleiro*

```lisp
; funcao
(defun remove-peca (p reserva)
  (let ((predp #'(lambda (p e) (equal p e))))
    (cond
     ((or (null reserva) (null p)) NIL)
     ((funcall predp p (car reserva)) (remove-peca p (cdr reserva)))
     (t (cons (car reserva) (remove-peca p (cdr reserva))))))
)
```

Remove peça (BRANCA QUADRADA ALTA CHEIA) da lista.

```lisp
; reserva
((BRANCA QUADRADA ALTA CHEIA) (BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA OCA) (BRANCA REDONDA ALTA OCA) (BRANCA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA OCA))

; chamada
CL-USER> (remove-peca '(BRANCA QUADRADA ALTA CHEIA) reserva)
((BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA OCA) (BRANCA REDONDA ALTA OCA) (BRANCA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA OCA))
```

Remove peça (BRANCA REDONDA BAIXA CHEIA) da lista.

```lisp
; reserva
((BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA OCA) (BRANCA REDONDA ALTA OCA) (BRANCA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA OCA))

; chamada
CL-USER> (remove-peca '(BRANCA REDONDA BAIXA CHEIA) reserva)
((BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA OCA) (BRANCA REDONDA ALTA OCA) (PRETA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA OCA))
```

Remove peça (BRANCA QUADRADA ALTA CHEIA) da lista. Esta peça não existe na lista.

```lisp
; reserva
((BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA OCA) (BRANCA REDONDA ALTA OCA) (BRANCA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA OCA))

; chamada
CL-USER> (remove-peca '(BRANCA QUADRADA ALTA CHEIA) reserva)
((BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA OCA) (BRANCA REDONDA ALTA OCA) (BRANCA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA OCA))
```

#### <a nome="f-substituir-peca">Substituir-Posicao</a>
Substitui o valor de uma coordenada da fila com uma peça. Caso a coordenada da fila encontra-se vazia (com o valor zero), retorna-se o tabuleiro com a peça na coordenada parametrizada. Caso contrário retorna NIL.

**Parâmetros**

*i - Coordenada da fila*

*p - Peça*

*fila-tabuleiro - Fila do tabuleiro*

```lisp
; funcao
(defun substituir-posicao (i p fila-tabuleiro)
  (cond
   ((or (null p) (null fila-tabuleiro)) NIL)
   (t (setf (nth i fila-tabuleiro) p))
  )
)
```

Substitui posição 0 da fila 0 do tabuleiro com a peça (BRANCA REDONDA ALTA OCA).

```lisp
; tabuleiro
((0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0))

; chamada
CL-USER> (substituir-posicao 0 '(BRANCA REDONDA ALTA OCA) tabuleiro)
(BRANCA REDONDA ALTA OCA)
```

Substitui posição 0 da fila 0 do tabuleiro NIL com a peça (BRANCA REDONDA ALTA OCA).

```lisp
; chamada
CL-USER> (substituir-posicao 0 '(BRANCA REDONDA ALTA OCA) NIL)
NIL
```

#### <a nome="f-colunas">Colunas</a>
Retorna as linhas do tabuleiro reposicionadas como colunas.

**Parâmetros**

*tabuleiro - Tabuleiro*

```lisp
; funcao
(defun colunas (tabuleiro)
  (list (coluna 0 tabuleiro)  (coluna 1 tabuleiro) (coluna 2 tabuleiro) (coluna 3 tabuleiro))
)
```
Retorna as colunas de um tabuleiro vazio.

```lisp
; tabuleiro
((0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0))

; chamada
CL-USER> (colunas tabuleiro)
((0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0))
```

Retorna as colunas de um tabuleiro preenchido.

```lisp
; tabuleiro
(((BRANCA QUADRADA BAIXA CHEIA) 0 (PRETA REDONDA ALTA CHEIA) (PRETA QUADRADA BAIXA OCA)) (0 0 0 (BRANCA REDONDA BAIXA OCA)) ((BRANCA REDONDA ALTA CHEIA) 0 (PRETA REDONDA ALTA OCA) (BRANCA QUADRADA BAIXA OCA)) (0 (PRETA QUADRADA BAIXA CHEIA) 0 0))

; chamada
CL-USER> (colunas tabuleiro)
(((BRANCA QUADRADA BAIXA CHEIA) 0 (BRANCA REDONDA ALTA CHEIA) 0) (0 0 0 (PRETA QUADRADA BAIXA CHEIA)) ((PRETA REDONDA ALTA CHEIA) 0 (PRETA REDONDA ALTA OCA) 0) ((PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA BAIXA OCA) (BRANCA QUADRADA BAIXA OCA) 0))
```

#### <a nome="f-diagonais">Diagnonais</a>
Retorna uma lista com todas as diagonais do tabuleiro.

**Parâmetros**

*tabuleiro - Tabuleiro*

```lisp
; funcao
(defun diagonais (tabuleiro)
  (list (diagonal-direita tabuleiro) (diagonal-esquerda tabuleiro))
)
```

Retorna as diagonais de um tabuleiro vazio.

```lisp
; tabuleiro
((0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0))

; chamada
CL-USER> (diagonais tabuleiro)
((0 0 0 0) (0 0 0 0))
```

Retorna as diagonais de um tabuleiro preenchido.

```lisp
; tabuleiro
(((BRANCA QUADRADA BAIXA CHEIA) 0 (PRETA REDONDA ALTA CHEIA) (PRETA QUADRADA BAIXA OCA)) (0 0 0 (BRANCA REDONDA BAIXA OCA)) ((BRANCA REDONDA ALTA CHEIA) 0 (PRETA REDONDA ALTA OCA) (BRANCA QUADRADA BAIXA OCA)) (0 (PRETA QUADRADA BAIXA CHEIA) 0 0))

; chamada
CL-USER> (diagonais tabuleiro)
((0 0 0 (PRETA QUADRADA BAIXA OCA)) ((BRANCA QUADRADA BAIXA CHEIA) 0 (PRETA REDONDA ALTA OCA) 0))
```

Retorna as diagonais de um tabuleiro cheio.

*Um tabuleiro só poderá estar cheio, se este for dado inicialmente.*

```lisp
; chamada
CL-USER> (diagonais tabuleiro)
(((PRETA REDONDA BAIXA CHEIA) (BRANCA QUADRADA ALTA CHEIA) (BRANCA REDONDA BAIXA CHEIA) (PRETA QUADRADA BAIXA OCA)) ((BRANCA QUADRADA BAIXA CHEIA) (BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA QUADRADA ALTA OCA)))
```

#### <a nome="f-quatro-fila-p">Quatro-Fila-P</a>
Verifica se no tabuleiro inteiro existem quatro peças com pelo menos um atributo em comum. Caso se verifique, retorna T, caso contrário retorna NIL.

**Parâmetros**

*tabuleiro - Tabuleiro*

```lisp
; funcao
(defun quatro-fila-p (tabuleiro)
  (cond
   ((null tabuleiro) nil)
   (t
    (let* ((filas (append tabuleiro (colunas tabuleiro) (diagonais tabuleiro)))
           (filas-cheias (remove-if-not #'(lambda (z) 
                                             (= 4 (list-length z)))
                                         (mapcar #'(lambda (x) 
                                                     (remove-if #'(lambda (y) (eq y 0)) x))
                                                 filas))))
      (cond
       ((null filas-cheias) nil)
       (t (reduce #'(lambda (&optional x y) (or x y)) (mapcar #'sao-iguaisp filas-cheias)))))))
)
```
Encontra 4 peças com pelo menos um atributo em comum num tabuleiro vazio.

```lisp
; tabuleiro
((0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0))

; chamada
CL-USER> (quatro-fila-p tabuleiro)
NIL
```

Encontra 4 peças com pelo menos um atributo em comum num tabuleiro com peças desalinhadas entre si.

```lisp
; tabuleiro
(((BRANCA REDONDA ALTA OCA) 0 0 0) (0 0 (PRETA REDONDA ALTA OCA) 0) (0 0 0 (BRANCA REDONDA BAIXA OCA)) (0 (PRETA REDONDA BAIXA OCA) 0 0))

; chamada
CL-USER> (quatro-fila-p tabuleiro)
NIL
```

Encontra 4 peças com pelo menos um atributo em comum num tabuleiro com peças alinhadas na diagonal.

```lisp
; tabuleiro
(((BRANCA REDONDA ALTA OCA) 0 0 0) (0 (PRETA REDONDA ALTA OCA) 0 0) (0 0 (BRANCA REDONDA BAIXA OCA) 0) (0 0 0 (PRETA REDONDA BAIXA OCA)))

; chamada
CL-USER> (quatro-fila-p tabuleiro)
T
```

Encontra 4 peças com pelo menos um atributo em comum num tabuleiro cheio.

*Um tabuleiro só poderá estar cheio, se este for dado inicialmente.*

```lisp
; chamada
CL-USER> (quatro-fila-p tabuleiro)
T
```

#### <a nome="f-max-a-p">Max-A-P</a>
Retorna a contagem máxima de peças com pelo menos um atributo em comum em todo o tabuleiro. O intervalo de contágem máxima varia entre o intervalo inteiro [0, 4].

Esta função é considerada um operador do jogo, por ser utilizada como meio de gerar um estado do problema.

**Parâmetros**

*tabuleiro - Tabuleiro*

```lisp
; funcao
(defun max-p-a (tabuleiro)
  (cond
   ((null tabuleiro) nil)
   (t
    (let* ((filas (append tabuleiro (colunas tabuleiro) (diagonais tabuleiro)))
           (filas-pecas (mapcar #'(lambda (x) 
                                     (remove-if #'(lambda (y) (eq y 0)) x))
                                 filas)))
      (cond
       ((null filas-pecas) 0)
       (t (reduce #'max (mapcar #'max (remove nil (mapcar #'(lambda (em-fila len) (and em-fila len))
                                (mapcar #'sao-iguaisp filas-pecas)
                                (mapcar #'length filas-pecas))))))))))
)
```
Numero máximo de peças com pelo menos 1 atributo em comum num tabuleiro vazio.

```lisp
; tabuleiro
((0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0))

; chamada
CL-USER> (max-p-a tabuleiro)
0
```

Numero máximo de peças com pelo menos 1 atributo em comum num tabuleiro preenchido com no máximo uma peça com o mesmo atributo.

```lisp
; tabuleiro
(((BRANCA QUADRADA BAIXA CHEIA) (PRETA REDONDA ALTA CHEIA) (PRETA QUADRADA BAIXA OCA)) ((BRANCA REDONDA BAIXA OCA)) ((BRANCA REDONDA ALTA CHEIA) (PRETA REDONDA ALTA OCA) (BRANCA QUADRADA BAIXA OCA)) ((PRETA QUADRADA BAIXA CHEIA)))

; chamada
CL-USER> (max-p-a tabuleiro)
1
```

Numero máximo de peças com pelo menos 1 atributo em comum num tabuleiro preenchido com no máximo quatro peças com o mesmo atributo.

```lisp
; tabuleiro
(((BRANCA QUADRADA BAIXA CHEIA) (PRETA REDONDA ALTA CHEIA) (PRETA QUADRADA BAIXA OCA)) ((BRANCA REDONDA BAIXA OCA)) ((BRANCA REDONDA ALTA CHEIA) (PRETA REDONDA ALTA OCA) (BRANCA QUADRADA BAIXA OCA)) ((BRANCA QUADRADA ALTA CHEIA) (PRETA QUADRADA BAIXA CHEIA)))

; chamada
CL-USER> (max-p-a tabuleiro)
4
```

#### <a nome="f-sao-iguaisp">Sao-Iguaisp</a>
Verifica se existe pelo menos um atributo em comum em todas as peças da fila. Caso encontre uma peça com atributo diferente retorna NIL. Caso contrário retorna T.

**Parametros**

*fila - Fila*

```lisp
; funcao
(defun sao-iguaisp (fila)
  (labels ((eq-list (x &rest y) 
             (cond 
              ((null y) T) 
              ((eq x (car y)) (apply #'eq-list x (cdr y)))
              (t nil))))
    (cond
     ((null fila) nil)
     (t (reduce #'(lambda (&optional a b) (or a b)) (apply #'mapcar #'eq-list fila)))))
)
```

Enconta atributos iguais com uma fila de  1 peça.

```lisp
; fila filtrada
((BRANCA REDONDA ALTA OCA))

; chamada
CL-USER> (sao-iguaisp fila)
T
```

Enconta atributos iguais com uma fila de  2 peças diferentes.

```lisp
; fila filtrada
((BRANCA REDONDA ALTA OCA) (PRETA QUADRADA BAIXA CHEIA))

; chamada
CL-USER> (sao-iguaisp fila)
NIL
```

Enconta atributos iguais com uma fila de 3 peças.

```lisp
; fila filtrada
((BRANCA REDONDA ALTA OCA) (PRETA QUADRADA BAIXA CHEIA) (BRANCA QUADRADA ALTA CHEIA))

; chamada
CL-USER> (sao-iguais fila)
NIL
```

#### <a nome="f-jogada">Jogada</a>
Efetua uma jogada em que remove a peça enviada por parâmetro da reserva do problema e insere-a na coordenada do tabuleiro.

**Parâmetros**

*l - Coordenada da linha*

*c - Coordenada da Coluna*

*p - Peça*

*problema - Problema*

```lisp
; funcao
(defun jogada (l c p problema)
  (cond
   ;((null (reserva problema)) nil)
   ((not (casa-vaziap l c (tabuleiro problema))) nil)
   (t 
    (let ((novo-tabuleiro (copy-tree (tabuleiro problema))))
      (substituir-posicao c p (fila l novo-tabuleiro))
      (list novo-tabuleiro (remove-peca p (reserva problema)))
    )
   ))
)
```

Insere na coordenada (0, 0) do tabuleiro a peça (BRANCA REDONDA ALTA OCA).

```lisp
; problema
(((0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0))
(branca redonda alta oca) (preta redonda alta oca) (branca redonda baixa oca) (preta redonda baixa oca) (branca quadrada alta oca) (preta quadrada alta oca) (branca quadrada baixa oca)(preta quadrada baixa oca) (branca redonda alta cheia) (preta redonda alta cheia) (branca redonda baixa cheia) (preta redonda baixa cheia) (branca quadrada alta cheia) (preta quadrada alta cheia) (branca quadrada baixa cheia) (preta quadrada baixa cheia))

; peca
(BRANCA REDONDA ALTA OCA)

; chamada
CL-USER> (jogada 0 0 peca problema)
((((BRANCA REDONDA ALTA OCA) 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0)) ((PRETA REDONDA ALTA OCA) (BRANCA REDONDA BAIXA OCA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA ALTA OCA) (BRANCA QUADRADA BAIXA OCA) (PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA ALTA CHEIA) (PRETA REDONDA ALTA CHEIA) (BRANCA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA CHEIA) (BRANCA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA CHEIA) (BRANCA QUADRADA BAIXA CHEIA) (PRETA QUADRADA BAIXA CHEIA)))
```

Insere na coordenada (0, 0) do tabuleiro a peça (PRETA QUADRADA BAIXA CHEIA).

*Esta função apenas tem delegada a função de substituir o valor da coordenada parameterizada pelo novo valor.*

```lisp
; problema
(((0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0))
(branca redonda alta oca) (preta redonda alta oca) (branca redonda baixa oca) (preta redonda baixa oca) (branca quadrada alta oca) (preta quadrada alta oca) (branca quadrada baixa oca)(preta quadrada baixa oca) (branca redonda alta cheia) (preta redonda alta cheia) (branca redonda baixa cheia) (preta redonda baixa cheia) (branca quadrada alta cheia) (preta quadrada alta cheia) (branca quadrada baixa cheia) (preta quadrada baixa cheia))

; peca
(PRETA QUADRADA BAIXA CHEIA)

; chamada
CL-USER> (jogada 0 0 peca problema)
((((PRETA QUADRADA BAIXA CHEIA) 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0)) ((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA REDONDA BAIXA OCA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA ALTA OCA) (BRANCA QUADRADA BAIXA OCA) (PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA ALTA CHEIA) (PRETA REDONDA ALTA CHEIA) (BRANCA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA CHEIA) (BRANCA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA CHEIA) (BRANCA QUADRADA BAIXA CHEIA)))
```

#### <a nome="f-casas-vazias">Casas-Vazias</a>
Retorna uma lista com todas as coordenadas vazias num tabuleiro.

**Parâmetros**

*tab - tabuleiro*

*l - Coordenada da linha (opcional)*

```lisp
; funcao
(defun casas-vazias (tab &optional (l 0))
  (cond 
   ((null tab) nil)
    (t (append (coordenadas (car tab) l) 
     (casas-vazias (cdr tab) (1+ l)))))) 
```

Tabuleiro vazio.

```lisp
; tabuleiro
((0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0))

; chamada
CL-USER> (casas-vazias tabuleiro)
((0 0) (0 1) (0 2) (0 3) (1 0) (1 1) (1 2) (1 3) (2 0) (2 1) (2 2) (2 3) (3 0) (3 1) (3 2) (3 3))

```

Tabuleiro com 8 casas vazias.

```lisp
; tabuleiro
(((BRANCA QUADRADA BAIXA CHEIA) 0 (PRETA REDONDA ALTA CHEIA) (PRETA QUADRADA BAIXA OCA)) (0 0 0 (BRANCA REDONDA BAIXA OCA)) ((BRANCA REDONDA ALTA CHEIA) 0 (PRETA REDONDA ALTA OCA) (BRANCA QUADRADA BAIXA OCA)) (0 (PRETA QUADRADA BAIXA CHEIA) 0 0))

;chamada
CL-USER> (casas-vazias tabuleiro)
((0 1) (1 0) (1 1) (1 2) (2 1) (3 0) (3 2) (3 3))

```
Tabuleiro com zero casas vazias. 

*Um tabuleiro só poderá estar cheio, se este for dado inicialmente.*

```lisp
; chamada
CL-USER> (casas-vazias tabuleiro)
NIL
```

#### <a nome="f-coordenadas">Coordenadas</a>
Retorna uma lista com as coordenadas da fila do tabuleiro que se encontram vazias. Opcionalmente, coloca-se a coordenada da coluna.

**Parâmetros**

*fila - Fila do tabuleiro*

*l - Coordenada da fila*

*c - Coordenada da coluna (opcional)*

```lisp
; funcao
(defun coordenadas (fila l &optional (c 0))
  (cond
   ((null fila) nil)
   ((eq (car fila) 0) 
    (cons (list l c) (coordenadas (cdr fila) l (1+ c))))
   (t (coordenadas (cdr fila) l (1+ c)))))
```

Fila com um espaço vazio e a coordenada 2.

```lisp
; fila
((branca quadrada baixa cheia) 0 (preta redonda alta cheia) (preta quadrada baixa oca))

; chamada
CL-USER> (coordenadas fila 2)
((0 1))
```

Fila com dois espaços vazios e a coordenada 0.

```lisp
; fila
((preta redonda alta cheia) (preta quadrada baixa oca) 0 0)

; chamada
CL-USER> (coordenadas fila 0)
((0 2) (0 3))
```

Fila com zero espaços vazios e a coordenada 3.

```lisp
; fila
((branca quadrada alta cheia)
(branca quadrada alta oca)
(branca quadrada baixa oca)
(branca quadrada baixa cheia))

; chamada
CL-USER> (coordenadas fila 3)
NIL
```
Fila com 4 espaços vazios e a coordenada 2.

```lisp
; fila
(0 0 0 0)

; chamada
CL-USER> (coordenadas fila 1)
((1 0) (1 1))
```

#### <a nome="f-no-solucaop">No-Solucaop</a>
Valida se o estado do nó encontra-se com 4 peças com pelo menos um atributo em comum, retornando T caso se verifique ser verdade, case contrário retorna NIL.

**Parâmetros**

*no - Nó*

```lisp
; funcao
(defun no-solucaop (no)
  (if (null no) nil (quatro-fila-p (tabuleiro-conteudo no))) 
)
```
Nó com o estado com 4 peças com pelo menos um atributo em comum.

```lisp
; no
((((preta quadrada alta oca) 
(preta quadrada baixa oca) 
(branca redonda baixa oca) 
(preta redonda alta oca))
 (0 0 0 0)
 (0 0 0 0)
 (0 0 0 0))
((branca quadrada alta cheia)
(branca quadrada alta oca)
(branca quadrada baixa oca)
(branca quadrada baixa cheia)
(preta quadrada alta cheia)
(preta quadrada baixa cheia)
(branca redonda alta cheia)
(branca redonda alta oca)
(branca redonda baixa cheia)
(preta redonda alta cheia)
(preta redonda baixa cheia)
(preta redonda baixa oca))) 0 NIL)

; chamada
CL-USER> (no-solucaop no)
T
```

Nó com o estado com 2 peças com pelo menos um atributo em comum.

```lisp
; no
(((0 (preta quadrada baixa oca) (branca redonda baixa oca) 0)
 (0 0 0 0)
 (0 0 0 0)
 (0 0 0 0))
((branca quadrada alta cheia)
(branca quadrada alta oca)
(branca quadrada baixa oca)
(branca quadrada baixa cheia)
(preta quadrada alta cheia)
(preta quadrada alta oca)
(preta quadrada baixa cheia)
(branca redonda alta cheia)
(branca redonda alta oca)
(branca redonda baixa cheia)
(preta redonda alta cheia)
(preta redonda alta oca)
(preta redonda baixa cheia)
(preta redonda baixa oca))) 0 NIL)

; chamada
CL-USER> (no-solucaop no)
NIL
```

Nó com o estado com nenhuma peça com pelo menos um atributo em comum.

```lisp
; no
(((0 (preta quadrada baixa oca) (branca redonda alta cheia) 0)
 (0 0 0 0)
 (0 0 0 0)
 (0 0 0 0))
((branca quadrada alta cheia)
(branca quadrada alta oca)
(branca quadrada baixa oca)
(branca quadrada baixa cheia)
(preta quadrada alta cheia)
(preta quadrada alta oca)
(preta quadrada baixa cheia)
(branca redonda alta oca)
(branca redonda baixa cheia)
(branca redonda baixa oca)
(preta redonda alta cheia)
(preta redonda alta oca)
(preta redonda baixa cheia)
(preta redonda baixa oca)))) 0 NIL)

; chamada
CL-USER> (no-solucaop no)
NIL
```

### <a nome="f-algoritmo">**Algoritmo**</a>

#### <a nome="f-p-cria-no">Cria-No</a>
Gera um nó constituído por estado (problema), profundidade e nó predecessor.

**Parâmetros**

*estado - Estado do problema*

*Profundidade - Número de profundidade (opcional)*

*pai - Nó predecessor (opcional)*

```lisp
; funcao
(defun cria-no (estado  &optional (g 0) (pai nil))
  (list estado g pai)
)
```

#### <a nome="f-p-tabuleiro-conteudo">Tabuleiro-Conteudo</a>
Retorna o tabuleiro que se encontra no estado do nó.

**Parâmetros**

*no - Nó*

```lisp
; funcao
(defun tabuleiro-conteudo (no)
(caar no)
)
```

#### <a nome="f-p-reserva-conteudo">Reserva-Conteudo</a>
Retorna a reserva de peças que se encontra no estado do nó.

**Parâmetros**

*no - Nó*

```lisp
; funcao
(defun reserva-conteudo (no)
(cdar no)
)
```

#### <a nome="f-p-no-estado">No-Estado</a>
Retorna o estado do nó.

**Parâmetros**

*no - Nó*

```lisp
; funcao
(defun no-estado (no)
  (car no)
)
```

#### <a nome="f-p-no-pai">No-Alpha</a>
Retorna o nó Alfa do nó.

**Parâmetros**

*no - Nó*

```lisp
; funcao
(defun no-alpha (no) (cadr no))
(defun no-beta (no) (caddr no))
```

#### <a nome="f-p-no-pai">No-Beta</a>
Retorna o nó Beta do nó.

**Parâmetros**

*no - Nó*

```lisp
; funcao
(defun no-beta (no) (caddr no))
```

#### <a nome="f-p-no-pai">No-Pai</a>
Retorna o nó predecessor do nó.

**Parâmetros**

*no - Nó*

```lisp
; funcao
(defun no-pai (no) (car (cddddr no)))
```

#### <a nome="f-p-no-profundidade">No-Profundidade-Alphabeta</a>
Retorna a profundidade do nó.

**Parâmetros**

*no - Nó*

```lisp
; funcao
(defun no-profundidade-alphabeta (no) (cadddr no))
```

#### <a nome="f-p-novo-sucessor">Novo-Sucessor</a>
Gera um novo nó sucessor, recebendo um nó por parâmetro.

**Parâmetros**

*no - Nó*

*x - Função que cria um novo nó*

```lisp
; funcao
(defun novo-sucessor (no x)
  (let ((novo-estado (funcall x (no-estado no))))
    (cond ((null novo-estado) nil)
	  (t (list novo-estado (1+ (no-profundidade no)) no))))
  )
```

#### <a nome="f-p-sucessores-quatro">Sucessores-Quatro</a>
Gera sucessores de um nó especificamente desenvolvido para o problema quatro.

**Parâmetros**

*no - Nó*

*operadoresf - Função com operadores*

*max-prof - Máxima profundidade (opcional)*

```lisp
; funcao
(defun sucessores-quatro (no operadoresf &optional (max-prof 0))
  (cond 
   ((null no) nil)
   ((>= (no-profundidade-alphabeta no) max-prof) nil)

   ((no-solucaop no) nil)
   (t 
    (let ((coordenadas (casas-vazias (tabuleiro-conteudo no))))
      (cond 
       ((null coordenadas) NIL)
       (t ;(funcall operadoresf (tabuleiro-conteudo no)))
        (remove nil
                  (mapcar #'(lambda (estado) (novo-sucessor no estado)) (funcall operadoresf (no-estado no))))))))))

```

#### <a nome="f-p-operadores-quatro">Operadores-Quatro</a>
Aplica a um estado todos os movimentos possíveis do jogo, designados por operadores.

**Parâmetros**

*estado-jogo - Estado do problema*

```lisp
; funcao
(defun operadores-quatro (estado-jogo)
  (let ((casas (casas-vazias (tabuleiro estado-jogo)))
        (pecas (reserva estado-jogo)))
    (apply #'append (mapcar #'(lambda (casa)
                (mapcar #'(lambda (peca)
                            (lambda (estado) (jogada (car casa) (cadr casa) peca estado)))
                            pecas))
            casas)))
)
```


### <a name="f-interact">Interact</a>

#### <a name="proj-constante-base-pathname">Base-Pathname</a>
Esta constante permite encontrar um ficheiro independentemente do tipo de sistema operativo de onde é executado.

```lisp
; constante
(defvar *base-pathname* (or *load-truename* *compile-file-truename*))
```

#### <a name="f-proj-asset-path">Asset-Path</a>
Determina o caminho de um ficheiro independentemente de um sistema operativo.

**Parâmetros**

*file - Caminho e nome do ficheiro*

```lisp
; funcao
(defun asset-path (file) (merge-pathnames file *base-pathname*))
```

#### <a name="proj-load-files">Load Files</a>
Carrega ficheiros necessários para o funcionamento do programa.

```lisp
; carrega ficheiros
(progn
  (load (asset-path "jogo.lisp"))
  (load (asset-path "algoritmo.lisp"))
)
```


#### <a name="f-proj-menu-principal">Menu-Principal</a>
Imprime na consola um menu de escolhas: Humano contra Computador, Computador contra Computador, Sair.

Cada escolha encontra-se associada a uma valor numérico que permite executar a ação escolhida. Caso selecionar uma opção inválida, será pedido novamente para inserir uma opção das disponíveis.

* Humano contra Computador: Chama a função [HvC](#f-proj-HvC).

* Computador contra Computador: Chama a função [CvC](#f-CvC).


* Sair: Sai do menú atual.


```lisp
; funcao
(defun menu-principal ()
  (loop
    (progn
      (format t "~%~%~%~%~%~%~%~%~%")
      (format t "~%             _______________________________________________________")
      (format t "~%          Â§                  JOGO DO PROBlEMA DO 4               Â§")
      (format t "~%          Â§                                                      Â§")
      (format t "~%          Â§                                                      Â§")
      (format t "~%          Â§                 1-Humano contra Computador           Â§")
      (format t "~%          Â§                 2-Computador contra Computador       Â§")
      (format t "~%          Â§                 3-Sair                               Â§")
      (format t "~%          Â§                                                      Â§")
      (format t "~%          Â§______________________________________________________Â§")
      (format t "~%~%~%          Opcao -> "))
    (cond ((not (let ((escolha (read)))
               (cond 
                ((and (numberp escolha) (< escolha 5) (> escolha 0)) (case escolha
                                                    (1 (progn (humcom (ler-limite) (primeiro-jogar))))
                                                    (2 (progn (comcom (ler-limite))))
                                                    (3 (progn (format t "~%~%~%          PROGRAMA TERMINADO") ))))
                ( T (progn  (format t "~%          ESCOLHA INVALIDA~%~%          Option -> ")
                            (setf escolha (read))))))) 
(return)))))

```

#### <a name="f-proj-regras">Regras</a>
Imprime na consola as regras do jogo do problema do quatro.

```lisp
; funcao
(defun regras ()
  "2-Menu regras com as regras do jogo"
  (format t "
________________________________________   REGRAS DO JOGO   ________________________________________
                                          (jogo do quarto)  
                                          
     1- Esta versão do jogo consiste num tabuleiro com 4 linhas e 4 colunas (4X4)   
     2- Em que cada casa possui uma pea com 4 atributos sem pecas repetidas                               
     3- O objectivo do jogo é obter 4 elementos com um atributo em comum.
        Cada jogador tem um cavalo da sua cor (branco ou preto).                                                
     4- O jogo termina quando existem 4 elementos com um atributo comum.           
                                                                                          
_________________________________________________________________________________________________
  ")
)
```

#### <a name="f-proj-tabuleiros">ESCOLHA O PRIMEIRO JOGADOR</a>
Imprime na consola um tabuleiro correspondente ao jogo e questiona qual o primeiro a jogar.

* Humano: O primeiro a jogar é o humano.

* Computador : O primeiro a jogar é o computador.


**Parâmetros**


```lisp
; funcao
(defun primeiro-jogar()
  (progn
   (progn
      (format t "~%~%~%~%~%~%~%~%~%")
      (format t "~%             _______________________________________________________")
      (format t "~%          Â§           ESCOLHA O PRIMEIRO JOGADOR                 Â§")
      (format t "~%          Â§                                                      Â§")
      (format t "~%          Â§                1-Humano                              Â§")
      (format t "~%          Â§                2-Computador                          Â§")
      (format t "~%          Â§                                                      Â§")
      (format t "~%          Â§______________________________________________________Â§")

      (format t "~%~%~%          Opcao -> ")
      )
   (let ((escolha (read)))
               (cond 
                ((eq escolha 1) 1)
                ((eq escolha 2) -1)))))
```

#### <a name="f-proj-escrever-estatistica">Escrever-Estatistica</a>
Escreve num ficheiro tabelas com as estatisticas entre os vários algoritmos para comparar o seu tempo de execução e avaliar o seu desempenho.

**Parâmetros**

*tab - Tabela atual*

*tempo - tempo atual de jogo*

```lisp
; funcao
(defun escreve-log (tab tempo)
 
         (with-open-file (file (asset-path "log.dat") :direction :output :if-exists :append :if-does-not-exist :create)
           (progn 
             (terpri)
                (format file "~%~t------------:JOGADA------------")
             (terpri)
                (format file "~%~t----:  Tempo do jogo: ~a Milisegundos" tempo)  
             (terpri)
             (terpri)
                (format file "~%~t----:  Tabuleiro Atual:")
             (terpri)
                (Imprimir tab file))))
```

#### <a name="f-proj-print-board">Print-Board</a>
Escrever uma tabela num ficheiro.

**Parâmetros**

*file-stream - Ficheiro aberto*

*t - Informação a ser adicionada ao ficheiro*

```lisp
; funcao
(defun Imprimir (tab &optional (file-stream t))
  "lista o tabuleiro"
  (not (null (mapcar #'(lambda(l) 
        (format file-stream "~%~t~t ~a" l)) tab))))
```




### <a name="#aplica-algoritmos-observacoes">Observações</a>
Os algortimos BFS e DFS por vezes não conseguem chegar a uma solução, por exigir um maior volume de memória que a disponibizada pelo LispWorks. O problema ocorre quando são gerados muitos sucessores, que com a necessecidade de executar multiplas operações, enchem a heap do ListWorks, sendo inequisível realizar todas as operações a tempo de não ocupar toda a heap, resultando em Stack Overflow.

Embora a ocupação total da heap possa ocurrer, existe uma outra situação que afeta o algoritmo DFS. O valor da profundidade pode impedir de encontrar uma solução, em que esta poderá estar níveis mais abaixo da máxima profundidade restrita.

Por norma o algoritmo A* consegue obter uma solução, mas como é um algoritmo que espande todos os seus nós em memória, e tal como os algoritmos BFS e DFS, pode gerar Stack Overflow pela utilização máxima da heap do LispWorks. A diferença parte da utilização da heuristica, que permite de certa forma inteligente avaliar os nós que podem permitir encontrar uma solução mais rápidamente.

## <a name="conclusao">**Conclusão**</a>
No percurso de desenvolvimento do presente projeto, verificá-mos que a recursividade é uma das carateristicas mais utilizadas quando se programa com a linguagem Common Lisp, que cria vastas oportunidades de gerar resultados com Stack Overflow mais rápidamente pela utilização máxima da heap, principalmente em LispWorks.

Um dos desafios prioritários é conseguir desenvolver um programa que não resulte em Stack Overflow quando se aplica os algoritmos de prócura BFS, DFS e A*, por serem algoritmos que têm cariz de gerar a árvore em memória. Embora existam diferenças entre os algortimos de prócura, na teoria, foi através da análise dos resultados das resoluções do nosso programa que conseguimos verificar essa diferença.

Os resultados variam de PC para PC e existiram casos em que num PC resultava no retorno da solução e noutro em Stack Overflow. Embora existiram sempre a consistência em certos resultados que sempre resultaram em Stack Overflow, por limitações na memória heap do LispWorks de acordo com os algortimos de prócura [observados](#aplica-algoritmos-observacoes) anteriormente.

Em unanimidade e perante os resultados obtidos, observá-mos que o algortimo A* é o que mais consegue retornar uma solução e raramente ocupa a memória heap por inteiro, embora seja um algoritmo que espanda a àrvore toda. Desta forma concluímos que o algoritmo A* realmente é mais eficiente que os algoritmos BFS e DFS, e o mais fiável para obter soluções.