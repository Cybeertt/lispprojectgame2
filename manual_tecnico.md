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
    * [Tabuleiro](#f-tabuleiro)
    * [Reserva](#f-reserva)
    * [Fila](#f-fila)
    * [Coluna](#f-coluna)
    * [Celula](#f-celula)
    * [Cria-Lista-Indice](#f-cria-lista-indice)
    * [Diagonal-Esquerda](#f-diagonal-esquerda)
    * [Diagonal-Direita](#f-diagonal-direita)
    * [Casa-Vaziap](#f-casa-vaziap)
    * [Casas-Vazias](#f-casas-vazias)
    * [Coordenadas](#f-coordenadas)
    * [Remove-Peca](#f-remove-peca)
    * [Substituir-Posicao](#f-substituir-posicao)
    * [Colunas](#f-colunas)
    * [Diagnonais](#f-diagonais)
    * [Pretty-Print](f-pretty-print)
  * [Algoritmo](#f-algoritmo)
    * [Variaveis Auxiliares](#var-aux)
    * [Jogar-Quatro](#f-joga-quatro)
    * [Comcom](#f-comcom)
    * [Humcom](#f-humcom)
    * [Jogada](#f-jogada)
    * [Reiniciar](#f-reiniciar)
    * [Outro-Jogador](#f-outro-jogador)
    * [Cria-No-Alphabeta](#f-p-cria-no-alphabeta)
    * [Tabuleiro-Conteudo](#f-p-tabuleiro-conteudo)
    * [No-Estado](#f-p-no-estado)
    * [No-Pai](#f-p-no-pai)
    * [No-Estado](#f-p-no-estado)
    * [No-Alpha](#f-p-no-alpha)
    * [No-Beta](#f-p-no-beta)
    * [No-Profundidade.Alphabeta](#f-p-no-profundidade-alphabeta)
    * [Novo-Sucessor](#f-p-no-sucessor)
    * [Sucessores-Quatro](#-f-p-sucessores-quatro)
    * [Operadores-Quatro](#f-p-operadores-quatro)
    * [Quatro-Linha-P](#f-p-quatro-linha-p)
    * [Max-P-A](#f-p-max-p-a)
    * [Sao-Iguaisp](#f-sao-iguaisp)
    * [No-Solucaop](#f-no-solucaop)
    * [Avaliar-No](#f-avaliar-no)
    * [Alphabeta](#f-alphabeta)
    * [Print-Hash-Entry](#f-print-hash-entry)
  * [Interact](#f-interact)
    * [Base-Pathname](#proj-constante-base-pathname)
    * [Asset-Path](#f-proj-asset-path)
    * [Load Files](#proj-load-files)
    * [Menu-Principal](#f-proj-menu-principal)
    * [Primeiro-Jogar](proj-primeiro-jogar)
    * [Escrever-Logo](#f-proj-escrever-logo)
    * [Ler-Limite](#f-ler-limite)
    * [Exibir-Tab](#f-exibir-tab)
    * [Exibir-Comeco-Tab](#f-exibir-comeco-tab)
    * [Imprimir](#f-imprimir)
* [Conslusão](#conclusao)

## <a name="doc-abstract">**Abstrato**</a>
Este projeto tem com o intuito de aplicar conhecimentos adquiridos no ambito da cadeira curricular IA e realizar uma análise entre os algoritmos de prócura para os diferentes estados do jogo Quatro.

Quatro, é um jogo que contém um tabuleiro 4x4 e 16 peças com quatro carateristicas. Cada carateristica de uma peça utiliza dois valores possíveis, tal como um sistema binário, permitindo fazer combinações de 16 peças. Por norma, para uma peça existem 14 peças com pelo menos uma carateristica em comum e 1 peça sem qualquer carateristica em comum.

Quatro, é um jogo sequêncial disputado por 2 competidores.
O jogo é realizado num tabuleiro 4x4 e 16 peças com 4 carateristicas.

A cada turno, a peça é sempre escolhida pelo adversário que tem como missão entregar a peça com menos atributos iguais às peças que atualmente se encontram no tabuleiro.

O Quatro finaliza quando um jogador consegue alinhar 4 peças com pelo menos uma carateristica em comum, seja na vertical, horizontal ou diagonal, independentemente da direção.

Nesta versão do manual, o Quatro tem dois tipo de jogos: Humano versus Pc e PC versus PC, aplicando o algoritmo minimax com cortes alphabeta. Sempre que um jogo terminar, este é disponível na consola, permitindo saber qual dos jogadores ganhou.

## <a name="doc-estrutura">**Estrutura do Projeto**</a>
O projeto encontra-se distribuído por 3 ficheiros principais: ***interact.lisp***, ***puzzle.lisp*** e ***algoritmo.lisp***.

O ficheiro ***interact.lisp*** contém o código fonte que inicializa o jogo.

O ficheiro ***jogo.lisp*** contém o código fonte utilizado para criar e modificar o jogo.

O ficheiro ***algoritmo.lisp*** contém todos os algoritmos de procura de estados para jogada computador no jogo.

Em conjunto com os 3 ficheiros acima indicados, também se encontra-se em anexo o ***log.dat***.

O ***log.dat*** contém em formato de lista em Common Lisp, uma série de tabuleiros com peças em situações diferentes do jogo.

Este ficheiro guarda vários resultados estatisticos relacionados com cada jogo jogado

## <a name="doc-func">**Documentação de Funções**</a>

As seguintes funções utilizadas para desenvolver o projeto, contêm o seu corpo, breve descrição, parâmetros e exemplos de chamadas e de resultados esperados.

Excecionalmente, algumas funções contêm breves observações perante o resultado esperado, para melhor ilustrar o seu uso especifico.

### <a nome="f-jogo">**Jogo**</a>
As seguintes funções permitem definir o jogo do Problema do Quatro.

#### <a name="f-tabuleiro">Tabuleiro</a>
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
#### <a nome="f-casas-vazias">Casas-Vazias</a>
Retorna uma lista com todas as coordenadas vazias num tabuleiro.

**Parâmetros**

*tab - tabuleiro*

*l - Coordenada da linha (opcional)*

```lisp
; funcao
(defun casas-vazias (tab &optional (l 0))
  (labels (( coordenadas (fila l &optional (c 0))
             (cond
              ((null fila) nil)
              ((eq (car fila) 0) 
               (cons (list l c) (coordenadas (cdr fila) l (1+ c))))
              (t (coordenadas (cdr fila) l (1+ c))))))
             (cond 
              ((null tab) nil)
              (t (append (coordenadas (car tab) l) 
                         (casas-vazias (cdr tab) (1+ l)))))))
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

### <a nome="f-algoritmo">**Algoritmo**</a>

#### <a nome="var-aux">Variáveis Auxiliares</a>
Estas variáveis permitem guardar durante uma jogada, o estado atual do tabuleiro e o turno do jogador.

```lisp
(let (
  (*jogador 1)
  (*tabuleiro (tab))
  ; aqui encontram-se as funções para cada modo de jogo e.g. Humano versus PC ou PC versus PC
)
```

#### <a nome="f-jogar-quatro">Jogar-Quatro</a>
Controla o tempo de jogada admitido para o jogador PC.

**Parâmetros**

*tab - Estado do no*

*tempo - Tempo de jogada admitido*

```lisp
; funcao
(defun jogar-quatro (tab tempo profundidade)
(princ "jogar-quatro")
  (setf *cortes-alfa* 0)
  (setf *cortes-beta* 0)
  (setf *nos-analisados* 0)
  ;(let* (;(play-start-time (get-internal-real-time))
         ;(op (alphabeta tab profundidade *jogador))
         ;(tab-atual (tabuleiro (no-estado tab))))
 (alphabeta tab profundidade *jogador)
(princ *jogar*)
    (setf *tabuleiro (no-estado *jogar*))
    (escreve-log *tabuleiro *jogador (- (get-internal-real-time) tempo) *cortes-alfa* *cortes-beta* *nos-analisados* *nos-expandidos* *nos-cortados*)
    (no-estado *jogar*));)
```

#### <a nome="f-comcom">Comcom</a>
Reinicia um jogo no modo PC versus PC, admitindo um determinado limite tempo do jogo.

**Parâmetros**

*tempo - Tempo de jogada admitido*


```lisp
; funcao
(defun comcom (tempo profundidade)
  (reiniciar)
  (exibir-tab *tabuleiro)
  (loop while (not (null (quatro-linha-p *tabuleiro))) 
        do
        (setf *tabuleiro (jogar-quatro (cria-no-alphabeta *tabuleiro) tempo profundidade))
        (setf *jogador (outro-jogador *jogador))) (exibir-tab *tabuleiro) (startup))
```

#### <a nome="f-humcom">Humcom</a>
Reinicia um jogo no modo Humano versus PC, admitindo um determinado limite tempo do jogo.

**Parâmetros**

*tempo - Tempo de jogada admitido*

*j1 - Turno do jogador (opcional)*


```lisp
; funcao
(defun humcom (tempo profundidade &optional (j1 1))
  (reiniciar)
  (setf *jogador j1)
  (escreve-log *tabuleiro 0 (get-internal-real-time) *cortes-alfa* *cortes-beta* *nos-analisados* *nos-expandidos* *nos-cortados*)
  (loop while (not (null (quatro-linha-p *tabuleiro))) ;(not (null (reserva *tabuleiro))))
        do
        (cond
         ((no-solucaop (cria-no-alphabeta *tabuleiro)) (startup))
         ((= *jogador 1)
          (exibir-tab *tabuleiro)
(princ "---HUM---")
          (let* ((pecas (reserva (no-estado (cria-no-alphabeta *tabuleiro))))
                 (casas (casas-vazias (tabuleiro-conteudo (cria-no-alphabeta *tabuleiro)) 0))
                 (ler (ler-jogada casas pecas)))
            (cond
             ((and (null pecas) (null casas)) (exibir-tab *tabuleiro))
             
             (t (setf *tabuleiro (humano-quatro ler)) (escreve-log *tabuleiro *jogador (get-internal-real-time) *cortes-alfa* *cortes-beta* *nos-analisados* *nos-expandidos* *nos-cortados*)
                (terpri) (exibir-tab *tabuleiro)))
            ) )
         (t (princ "---COM---") (setf *tabuleiro (jogar-quatro (cria-no-alphabeta *tabuleiro) tempo profundidade))))
        (setf *jogador (outro-jogador *jogador))) (exibir-tab *tabuleiro) (startup))
```

#### <a nome="f-jogada">Jogada</a>
Movimenta uma peça para uma coordenada no tabuleiro.

**Parâmetros**

*l - Coordenada da linha*

*c - Coordenada da coluna*

*p - Peça*

*tabuleiro - Tabuleiro*

```lisp
; funcao
(defun jogada (l c p tab)
  (cond
   ((not (casa-vaziap l c (tabuleiro tab))) nil)
   (t 
    (let ((novo-tabuleiro (copy-tree  tab)))
      (substituir-posicao c p (fila l (tabuleiro novo-tabuleiro)))
      (list (tabuleiro novo-tabuleiro) (remove-peca p (reserva novo-tabuleiro)))))))
```

#### <a nome="f-reiniciar">Reiniciar</a>
Coloca todas as variaveis locais inicializadas em [variaveis auxiliares](#f-var-aux), com o valor por defeito.

**Parâmetros**

*Nenhum*

```lisp
(defun reiniciar ()
    (setf *tabuleiro (tab))
    (setf *jogador 1)
    (setf *cortes-alfa* 0)
    (setf *cortes-beta* 0)
    (setf *nos-analisados* 0)
    (setf *nos-cortados*   0 )
    (setf *nos-expandidos* 0 ))
```

#### <a nome="f-outro-jogador">Outro-Jogador</a>
Troca o valor simétrico do jogador. Por defeito o primeiro jogador corresponde ao valor 1 e o seu adversário ao seu valor simétrico.

**Parâmetros**

*j - Jogador*

```lisp
(defun outro-jogador (j)
  (* -1 j))
```

#### <a nome="f-p-cria-no-alphabeta">Cria-No-Alphabeta</a>
Gera um nó, utilizado no algoritmo minimax com cortes alphabeta, constituído por estado (problema), profundidade e nó predecessor.

**Parâmetros**

*estado - Estado do problema*

*Profundidade - Número de profundidade (opcional)*

*pai - Nó predecessor (opcional)*

*alfa - Valor de alfa (opcional)*

*beta - Valor de beta (opcional)*

```lisp
; funcao
(defun cria-no-alphabeta (estado &optional (profundidade 0) (pai NIL) (j1 *jogador) &aux (value (avaliar-no (list estado 0 j1 profundidade pai))))
  (list estado value j1 profundidade pai))
```

#### <a nome="f-p-tabuleiro-conteudo">Tabuleiro-Conteudo</a>
Retorna o tabuleiro que se encontra no estado do nó.

**Parâmetros**

*no - Nó*

```lisp
; funcao
(defun tabuleiro-conteudo (no)
  (caar no))
```

#### <a nome="f-p-no-pai">No-Pai</a>
Retorna o no predecessor do nó.

**Parâmetros**

*no - Nó*

```lisp
(defun no-pai (no)
  (car (cddddr no)))
```

#### <a nome="f-p-no-estado">No-Estado</a>
Retorna o estado do nó.

**Parâmetros**

*no - Nó*

```lisp
; funcao
(defun no-estado (no)
  (car no))
```

#### <a nome="f-p-no-alpha">No-Alpha</a>
Retorna o nó Alfa do nó.

**Parâmetros**

*no - Nó*

```lisp
; funcao
(defun no-alpha (no)
  (cadr no))
```

#### <a nome="f-p-no-beta">No-Beta</a>
Retorna o nó Beta do nó.

**Parâmetros**

*no - Nó*

```lisp
; funcao
(defun no-beta (no)
  (caddr no))
```

#### <a nome="f-p-no-profundidade-alphabeta">No-Profundidade-Alphabeta</a>
Retorna a profundidade do nó.

**Parâmetros**

*no - Nó*

```lisp
; funcao
(defun no-profundidade-alphabeta (no)
  (cadddr no))
```

#### <a nome="f-p-novo-sucessor">Novo-Sucessor</a>
Gera um novo nó sucessor, recebendo um nó por parâmetro.

**Parâmetros**

*no - Nó*

*x - Função que cria um novo nó*

```lisp
; funcao
(defun novo-sucessor (no estado jogador)
  (cria-no-alphabeta estado (1+ (no-profundidade-alphabeta no)) no jogador))

```

#### <a nome="f-p-sucessores-quatro">Sucessores-Quatro</a>
Gera sucessores de um nó especificamente desenvolvido para o problema quatro.

**Parâmetros**

*no - Nó*

*operadoresf - Função com operadores*

*max-prof - Máxima profundidade (opcional)*

```lisp
; funcao
(defun sucessores-quatro (no operadoresf &optional (max-prof 0) (jogador 0))
  (cond 
   ((null no) nil)
   ((>= (no-profundidade-alphabeta no) max-prof) nil)
   ((no-solucaop no) nil)
   (t (let ((coordenadas (casas-vazias (tabuleiro-conteudo no))))
        (cond 
         ((null coordenadas) NIL)
         (t (remove nil (mapcar #'(lambda (estado) (cond ((null estado) NIL) (t (novo-sucessor no estado jogador)))) (funcall operadoresf (no-estado no))))))))))

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
                (mapcar #'(lambda (peca) (jogada (car casa) (cadr casa) peca estado-jogo)) pecas)) casas))))
```

#### <a nome="f-p-quatro-linha-p">Quatro-Linha-P</a>
Verifica se o tabuleiro possui quatro peças com pelo menos um atributo em comum e retorna T, caso contrário, retorna NIL.

**Parâmetros**

*tabuleiro - Tabuleiro*

```lisp
; funcao
(defun quatro-linha-p (tabuleiro)
  (cond
   ((null tabuleiro) nil)
   (t
    (let* ((linhas (append tabuleiro (colunas tabuleiro) (diagonais tabuleiro)))
           (linhas-cheias (remove-if-not #'(lambda (z) 
                                             (= 4 (list-length z)))
                                         (mapcar #'(lambda (x) 
                                                     (remove-if #'(lambda (y) (eq y 0)) x))
                                                 linhas))))
      (cond
       ((null linhas-cheias) nil)
       (t (reduce #'(lambda (&optional x y) (or x y)) (mapcar #'sao-iguaisp linhas-cheias))))))))
```

#### <a nome="f-p-max-p-a">Max-p-a</a>
Verifica se o tabuleiro possui peças com pelo menos um atributo em comum e retorna uma lista com a contágem máxima de peças por linha, coluna e diagonais.

**Parâmetros**

*tabuleiro - Tabuleiro*

```lisp
; funcao
(defun max-p-a (tabuleiro)
  (cond
   ((null tabuleiro) nil)
   (t
    (let* ((linhas (append tabuleiro (colunas tabuleiro) (diagonais tabuleiro)))
           (linhas-pecas (remove-if #'(lambda (z) 
                                             (null z))
                                    (mapcar #'(lambda (x) 
                                                  (remove-if #'(lambda (y) (eq y 0)) x))
                                 linhas))))
      (cond
       ((null linhas-pecas) 0)
       (t (reduce #'max (mapcar #'max (remove nil (mapcar #'(lambda (em-linha len) (and em-linha len))
                                (mapcar #'sao-iguaisp linhas-pecas)
                                (mapcar #'length linhas-pecas)))))))))))
```

#### <a nome="f-sao-iguais">Sao-Iguaisp</a>
Verifica se as peças de uma linha são iguais, retornando T, caso contrário retorna NIL.

**Parâmetros**

*linha - Linha do tabuleiro*

```lisp
; funcao
(defun sao-iguaisp (linha)
  (labels ((eq-list (x &rest y) 
             (cond 
              ((null y) T) 
              ((eq x (car y)) (apply #'eq-list x (cdr y)))
              (t nil))))
    (cond
     ((null linha) nil)
     (t (reduce #'(lambda (&optional a b) (or a b)) (apply #'mapcar #'eq-list linha))))))
```

#### <a nome="f-no-solucaop">No-Solucaop</a>
Verifica se o no tem o estado solução, retornando T. Caso contrário retorna NIL.

**Parâmetros**

*no - Nó*

```lisp
; funcao
(defun no-solucaop (no)
  (if (null no) nil (quatro-linha-p (tabuleiro-conteudo no))))
```

#### <a nome="f-avaliar-no">Avaliar-No</a>
Verifica se o no tem o estado solução, retornando T. Caso contrário retorna NIL.

**Parâmetros**

*no - Nó*

```lisp
; funcao
(defun avaliar-no (no jogador)
  (labels ((contagem (lista pred predf)
             (cond
              ((atom (car lista)) (apply #'+ (mapcar #'(lambda (x) (funcall pred x)) lista)))
                (t (apply #'+ (mapcar #'(lambda (x) (funcall pred x))
                                     (mapcar #'(lambda (x) (apply #'+ (mapcar #'(lambda (y) (cond
                                                                                             ((eq y 0) 1)
                                                                                             ((funcall predf y) 10)
                                                                                             (t 0)
                                                                                             )) x))) lista)))))))           
    (let* ((posicoes (remove-if #'(lambda (x) (equal x '(0 0 0 0))) (append NIL (tabuleiro-conteudo no) (colunas (tabuleiro-conteudo no)) (diagonais (tabuleiro-conteudo no)))))
           (linhas-pecas (remove-if #'(lambda (z) 
                                        (null z))
                                    (mapcar #'(lambda (x) (remove-if #'(lambda (y) (eq y 0)) x)) posicoes)))
           (pecas (remove nil (mapcar #'(lambda (em-linha len) (cond 
                                                                ((and em-linha len) len)
                                                                (t 0))) (mapcar #'sao-iguaisp linhas-pecas)
                                      (mapcar #'length linhas-pecas)))))

       (* jogador (contagem pecas #'(lambda (x) (cond
                                      ((= x 4) 10000) ; linha com 4 pecas
                                      ((= x 3) 1000) ; linha com 3 pecas e 1 vazio
                                      ((= x 2) 10) ; linha com 2 pecas e 2 vazios
                                      ((= x 1) 1) ; linha com 1 peca e 3 vazios
                                      (t 0))) #'(lambda (y) (> y 0)))))))
```

#### <a nome="f-avaliar-no">Alphabeta</a>
Algoritmo Alphabeta. Retorna o valor que corresponde ao vencedor, consuante os parâtmetros inseridos.

Por vezes gera loop, quando a solução encontra-se numa profundidade abaixo da admitida por parâmetro.

**Parâmetros**

*no - Nó*

*profundidade - Profundidade máxima admissível*

*jogador - Jogador*

```lisp
; funcao
(defun ab (no profundidade jogador)
  (cond
   ((or (zerop profundidade) (null (sucessores-quatro no #'operadores-quatro profundidade)))
    (avaliar-no no jogador))
   ((> jogador 0)
    (let* ((value-max most-negative-double-float)
           (adversario (outro-jogador jogador))
           (descendentes (remove-if #'(lambda (x) (null x)) 
                                    (sucessores-quatro no #'operadores-quatro profundidade))) (alpha (no-alpha no)))    
      (dolist (d descendentes)
        (let* ((value-aux (max value-max (ab d (- profundidade 1) adversario)))
               (alpha-aux (max alpha value-aux)))
          (cond 
           ((no-solucaop d) (setf value-max value-aux) (setf alpha alpha-aux) (return))
           ((>= alpha-aux (no-beta no)) (return))
           (t (setf value-max value-aux) (setf alpha alpha-aux))))) value-max))
   (t (let* ((value-min most-positive-double-float)
             (adversario (outro-jogador jogador))
             (descendentes (remove-if #'(lambda (x) (null x)) (sucessores-quatro no #'operadores-quatro profundidade)))
             (beta (no-beta no)))
        (dolist (d descendentes)
          (let* ((value-aux (min value-min (ab d (- profundidade 1) adversario)))
                 (beta-aux (min beta value-aux)))
            (cond 
             ((no-solucaop d) (setf value-min value-aux) (setf beta beta-aux) (return))
             ((<= beta-aux (no-alpha no)) (return))
             (t (setf value-min value-aux) (setf beta beta-aux))))) value-min))))
```

#### <a nome="f-print-hash-entry">Print-Hash-Entry</a>
Imprime na consola, a chave com o valor associado, encontrado na hashtable.

**Parâmetros**

*key - Nome da chave*

*value - Valor*

```lisp
; funcao
(defun print-hash-entry (key value)
    (format t "The value associated with the key ~a is ~a~%" key value))
```

### <a name="f-interact">*Interact*</a>

#### <a name="proj-constante-base-pathname">Base-Pathname</a>
Esta constante permite encontrar um ficheiro independentemente do tipo de sistema operativo de onde é executado.

```lisp
; constante
(defvar *base-pathname* (or *load-truename* *compile-file-truename*))
```

#### <a name="f-proj-asset-path">Caminho</a>
Determina o caminho de um ficheiro independentemente de um sistema operativo.

**Parâmetros**

*file - Caminho e nome do ficheiro*

```lisp
; funcao
(defun caminho (file)
  (merge-pathnames file *base-pathname*))
```

#### <a name="proj-load-files">Load Files</a>
Carrega ficheiros necessários para o funcionamento do programa.

```lisp
; carrega ficheiros
(progn
  (load (caminho "jogo.lisp"))
  (load (caminho "algoritmo.lisp")))
```

#### <a name="f-proj-menu-principal">Menu-Principal</a>
Imprime na consola um menu de escolhas: Humano contra Computador, Computador contra Computador, Sair.

Cada escolha encontra-se associada a uma valor numérico que permite executar a ação escolhida. Caso selecionar uma opção inválida, será pedido novamente para inserir uma opção das disponíveis.

* Humano contra Computador: Chama a função [Humano versus PC](#f-proj-humcom).

* Computador contra Computador: Chama a função [PC versus PC](#f-comom).


* Sair: Sai do menú atual.

**Parâmetros**

*Nenum*

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

#### <a name="f-proj-primeiro-jogar">Primeiro Jogar</a>
Imprime na consola um tabuleiro correspondente ao jogo e questiona qual o primeiro a jogar.

* Humano: O primeiro a jogar é o humano.

* Computador : O primeiro a jogar é o computador.


**Parâmetros**

*Nenum*

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

#### <a name="f-proj-escreve-log">Escreve-Logo</a>
Escreve num ficheiro a jogada efetuada com o estado do tabuleiro e o seu tempo de execução.

**Parâmetros**

*tab - Tabela atual*

*tempo - tempo atual de jogo*

```lisp
; funcao
(defun escreve-log (tab tempo)
  "Writes the statistics file with the solution and it's statistic data, for breadth first and depth first algorithms"

 
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
                (Imprimir tab file)
             )))
```

#### <a name="f-ler-limite">Ler-Limite</a>
Lê da consola a profundidade admissível a ser aplicada ao algoritmo Alphabeta.

**Parâmetros**

*Nenhum*

```lisp
; funcao
(defun ler-limite ()
  (progn
    (progn
      (format t "   ~%------ESCREVA O TEMPO LIMITE DO COMPUTADOR (1000 >= TEMPO [ms] >= 5000)------")
      (terpri)
      )
    (read)))
```

#### <a name="f-exibir-tab">Exibir-Tab</a>
Imprime na consola o tabuleiro.

**Parâmetros**

*tab - Tabuleiro*

```lisp
; funcao
(defun exibir-tab (tab)
    (cond
        ((null tab) '())
        (t
            (write-line (write-to-string (mostra-tabuleiro (car tab))))
            (write-line (write-to-string (mostra-reserva (reserva tab)))))))
```

#### <a name="f-ler-jogada">Ler Jogada</a>
Imprime na consola as coordenadas e as peças disponíveis para efetuar uma jogada.

**Parâmetros**

*coord - Lista com coordenada linha e coordenada coluna*

*pecas - *

```lisp
; funcao
(defun ler-jogada (coord pecas)
  (format t "Coordenadas: ")
  (terpri)
  (format t "~a " (mostra-casas-vazias coord))
  (terpri)
  (terpri)
  (format t "Pecas: ")
  (terpri)
  (format t "~a " (mostra-reserva pecas))
  (terpri)
  (terpri)
  (format t "Escreva as coordenadas e o numero da posicao da peca: ")
  (terpri)
  (let ((x (read))
        (y (read))
        (csize (length coord))
        (size (length pecas)))
    (cond
      ((and (> y 0) (<= y size) (> x 0) (<= x csize)) (let ((p (nth (1- y) pecas))
                                                            (c (nth (1- x) coord)))
                                  (cond
                                   ((and (null (position c coord :test #'equal)) (null (position p pecas :test #'equal)))
                                    (format t "Jogada Invalida")
                                     (terpri)
                                     (ler-jogada coord pecas))
                                   (t (list (car c) (cadr c) p)))))
      (t (format t "Jogada Invalida") (terpri) (ler-jogada coord pecas)))))
```

#### <a name="f-exibir-comeco-tab">Exibir-Comeco-Tab</a>
Imprime na consola o tabuleiro inicial, a ser utilizada antes de cada jogo.

**Parâmetros**

*tab - Tabuleiro*

```lisp
; funcao
(defun exibir-comeco-tab (tab)
(terpri)
(terpri)
(format t "-----------------TABULEIRO INICIAL-----------------")
(terpri)
(terpri)
(exibir-tab tab)
(terpri)
(format t "-----------------TABULEIRO INICIAL-----------------")
(terpri)
(terpri))
```

#### <a name="f-imprimir">Imprimir</a>
Imprime na consola o tabuleiro.

**Parâmetros**

*tab - Tabuleiro*

*file-stream - Input da consola (opcional)*

```lisp
; funcao
(defun Imprimir (tab &optional (file-stream t))
  "lista o tabuleiro"
  (not (null (mapcar #'(lambda(l) 
        (format file-stream "~%~t~t ~a" l)) tab)))
  )
```

## <a name="conclusao">**Conclusão**</a>
O processo de criar um jogo estratégico, como dois adversários são similares em termos de funcionamento. As funções desenvolvidas, por maioria foram reutilizadas para os modos de jogo: Humano versos PC e PC versus PC, com algumas excessões.

No entanto, foi bastantes interessante aplicar esta metodologia em pártica, por ser não só uma mais valia, mas uma experiência, que permite demostrar a verdadeira Inteligência Artificial representada em jogos. Aceitamos que existem outros tipos de Inteligência Artificial mais desenvolvidos e aplicadas aos jogos atuais.

A utilização do algoritmo Aplhabeta permitio criar referência para futuros projetos e pôs em perspetiva sobre os outros algoritmos utilizados na fase do projeto anterior. Uma observação que se encontrou comum a todos os algoritmos foi o erro de stack overflow quando existem demasiados nós sucessores a serem gerados ou à profundidade não ser suficiente para obter o nó solução.

Perante este trabalho, podemos concluir que não é uma mais valia, só em termos académicos, como também é uma influência para qualquer tipo de software a ser desenvolvido.