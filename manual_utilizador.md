# Projeto IA 2020/21 IPS ESTS

### **Docente**
Joaquim Filipe

### **Estudantes**
150221081 - Daniela Sineiro

200221149 - Rafael Palma

## **Manual de Utilizador**
Neste manual encontram-se explicações sobre o jogo, como o iniciar, a estrutura do projeto e o essencial para iniciar o jogo através da consola e como terminar.

## **Indice**
* [Abstrato](#doc-abstract)
* [Estrutura do Projeto](#doc-estrutura)
* [Iniciar Programa](#tut-iniciar)
    * [Humano contra Computador](#mc-humano-contra-computador)
    * [Computador contra Computador](#mc-computador-contra-computador)
    * [Sair do Programa](#sair-programa)
* [Problemas](#tut-problemas)
* [Glossário](#glossario)

## <a name="doc-abstract">**Abstrato**</a>
Este projeto tem com o intuito de aplicar conhecimentos adquiridos no ambito da cadeira curricular IA e realizar uma análise entre os algoritmos de prócura para os diferentes estados do jogo Quatro.

Durante o desenvolvimento deste programa, utilizamos a ferramenta LispWorks para compilar e executar o programa.

*Aconselhamos a utilização da mesma ferramenta, por ser a única que podemos garantir o funcionamento deste programa*.

Quatro, é um jogo que contém um tabuleiro 4x4 e 16 peças com quatro carateristicas. Cada carateristica de uma peça utiliza dois valores possíveis, tal como um sistema binário, permitindo fazer combinações de 16 peças. Por norma uma peça tem 14 peças com pelo menos uma carateristica em comum e 1 peça sem qualquer carateristica em comum.

Quatro, é um jogo sequêncial disputado por 2 competidores.
O jogo é realizado num tabuleiro 4x4 e 16 peças com 4 carateristicas.

A cada turno, a peça é sempre escolhida pelo adversário que tem como missão entregar a peça com menos atributos iguais às peças que atualmente se encontram no tabuleiro.

O Quatro finaliza quando um jogador consegue alinhar 4 peças com pelo menos uma carateristica em comum, seja na vertical, horizontal ou diagonal, independentemente da direção.

Nesta versão do manual, o Quatro não é jogado, mas é selecionado um estado do tabuleiro e criada uma previsão para resolver o jogo com quatro peças com pelo menos um atributo em comum.

## <a name="doc-estrutura">**Estrutura do Projeto**</a>
O projeto encontra-se distribuído por três ficheiros principais: ***interact.LISP***, ***jogo.LISP*** e ***algoritmo.LISP***.

Os ficheiros acima especificados permitem o funcionamento do programa e têm de ser abertos e compilados no LispWorks, independentemente da sua ordem, antes de ser executado o programa.

Em anexo disponibilizamos o ficheiro **log.dat**, com jogadas diferentes, formatados para rápida utilização.


## <a name="tut-iniciar">**Iniciar Programa**</a>
Consideramos que o nível de conhecimento necessário para correr o nosso programa, seja básico, de forma que pelo menos necessitar saber de como utilizar básicamente o Lispworks: abrir e compilar ficheiros e utilizar o listener.

Abra o LispWorks e abra os três ficheiros: ***interact.LISP***, ***jogo.LISP*** e ***algoritmo.LISP***.

Compile os três ficheiros acima e verifique a existência, na pasta onde se encontram os três ficheiros acima, o ficheiro: ***log.dat***.

Se faltar o ficheiro ***log.dat***, apresentaremos uma explicação de como criar um ficheiro parecido em [Log](#tut-log).

Assumindo que já compilou os três ficheiros projeto, jogo, algoritmo, e interact, coloque no listener da ferramente LispWorks:

```l
(comecar)
```

No listener terá de apresentar como no exemplo abaixo.

```lisp
CL-USER> (comecar)
```

Pressione a tecla **ENTER** e de seguida deverá visualizar o seguinte menu:

```lisp
             _______________________________________________________
          Ã‚Â§                  JOGO DO PROBlEMA DO 4               Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§                 1-Humano contra Computador           Ã‚Â§
          Ã‚Â§                 2-Computador contra Computador       Ã‚Â§
          Ã‚Â§                 3-Sair                               Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§______________________________________________________Ã‚Â§


          Opcao ->
```

Para escolher opções, deverá inserir logo após a seta o número correspondente a uma das opções disponibilizadas pelo menu e pressione a tecla **ENTER**.

Esta ação aplica-se a todos os menus do programa.

* Se pertender [Humano contra Computador](#mc-humano-contra-computador), pressione a tecla numérica **1**.

* Se pertender [Computador contra Computador](#mc-computador-contra-computador) do jogo, pressione a tecla numérica **2**. 

* Para [Sair](#sair-programa) deverá pressionar a tecla numérica **3**.

### <a name="mc-resolve-jogo">Humano contra Computador</a>
O listener do LispWorks deverá apresentar o seguinte estado depois de selecionar a opção **1** do menu principal.

```lisp
                     _______________________________________________________
          Ã‚Â§                  JOGO DO PROBlEMA DO 4               Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§                 1-Humano contra Computador           Ã‚Â§
          Ã‚Â§                 2-Computador contra Computador       Ã‚Â§
          Ã‚Â§                 3-Sair                               Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§______________________________________________________Ã‚Â§


          Opcao -> 1


-----------------TABULEIRO INICIAL-----------------

"
TABULEIRO
____________________________________________________________________________________________
| 0 | 0 | 0 | 0 |
| 0 | 0 | 0 | 0 |
| 0 | 0 | 0 | 0 |
| 0 | 0 | 0 | 0 |
____________________________________________________________________________________________

"

-----------------TABULEIRO INICIAL-----------------

   
------ESCREVA O TEMPO LIMITE DO COMPUTADOR (1000 >= TEMPO [ms] >= 5000)------
5000
   
------ESCREVA A PROFUNDIDADE MAXIMA------
10










             _______________________________________________________
          Ã‚Â§           ESCOLHA O PRIMEIRO JOGADOR                 Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§                1-Humano                              Ã‚Â§
          Ã‚Â§                2-Computador                          Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§______________________________________________________Ã‚Â§


          Opcao -> 1
---HUM---"
TABULEIRO
____________________________________________________________________________________________
| 0 | 0 | 0 | 0 |
| 0 | 0 | 0 | 0 |
| 0 | 0 | 0 | 0 |
| 0 | 0 | 0 | 0 |
____________________________________________________________________________________________

"
Coordenadas: 
(0 0)
(0 1)
(0 2)
(0 3)
(1 0)
(1 1)
(1 2)
(1 3)
(2 0)
(2 1)
(2 2)
(2 3)
(3 0)
(3 1)
(3 2)
(3 3)
NIL 

Pecas: 
(BRANCA REDONDA ALTA OCA)
(PRETA REDONDA ALTA OCA)
(BRANCA REDONDA BAIXA OCA)
(PRETA REDONDA BAIXA OCA)
(BRANCA QUADRADA ALTA OCA)
(PRETA QUADRADA ALTA OCA)
(BRANCA QUADRADA BAIXA OCA)
(PRETA QUADRADA BAIXA OCA)
(BRANCA REDONDA ALTA CHEIA)
(PRETA REDONDA ALTA CHEIA)
(BRANCA REDONDA BAIXA CHEIA)
(PRETA REDONDA BAIXA CHEIA)
(BRANCA QUADRADA ALTA CHEIA)
(PRETA QUADRADA ALTA CHEIA)
(BRANCA QUADRADA BAIXA CHEIA)
(PRETA QUADRADA BAIXA CHEIA)
NIL 

Escreva as coordenadas e o numero da posicao da peca: 
1
1
------ Jogada efetuada por jogador 1















 ------------:JOGADA------------

 ----:  Tempo do jogo: 1471 Milisegundos

 ----:  Jogador: 1 

 ----:  Cortes Alfa: 0

 ----:  Cortes Beta: 0

 ----:  Nos Analisados: 0

 ----:  Nos Expandidos: 0

 ----:  Nos Cortados: 0


 ----:  Tabuleiro Atual:
"
TABULEIRO
____________________________________________________________________________________________
| (BRANCA REDONDA ALTA OCA) | 0 | 0 | 0 |
| 0 | 0 | 0 | 0 |
| 0 | 0 | 0 | 0 |
| 0 | 0 | 0 | 0 |
____________________________________________________________________________________________

"

---COM---(((((BRANCA REDONDA ALTA OCA) 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0)) ((PRETA REDONDA ALTA OCA) (BRANCA REDONDA BAIXA OCA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA ALTA OCA) (BRANCA QUADRADA BAIXA OCA) (PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA ALTA CHEIA) (PRETA REDONDA ALTA CHEIA) (BRANCA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA CHEIA) (BRANCA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA CHEIA) (BRANCA QUADRADA BAIXA CHEIA) (PRETA QUADRADA BAIXA CHEIA))) 3 1 0 NIL)















 ------------:JOGADA------------

 ----:  Tempo do jogo: 1763 Milisegundos

 ----:  Jogador: -1 

 ----:  Cortes Alfa: 9

 ----:  Cortes Beta: 9

 ----:  Nos Analisados: 3

 ----:  Nos Expandidos: 2890

 ----:  Nos Cortados: 18


 ----:  Tabuleiro Atual:
"
TABULEIRO
____________________________________________________________________________________________
| (BRANCA REDONDA ALTA OCA) | 0 | 0 | (BRANCA REDONDA BAIXA OCA) |
| 0 | 0 | 0 | 0 |
| 0 | 0 | 0 | 0 |
| 0 | 0 | 0 | 0 |
____________________________________________________________________________________________

"

---HUM---"
TABULEIRO
____________________________________________________________________________________________
| (BRANCA REDONDA ALTA OCA) | 0 | 0 | (BRANCA REDONDA BAIXA OCA) |
| 0 | 0 | 0 | 0 |
| 0 | 0 | 0 | 0 |
| 0 | 0 | 0 | 0 |
____________________________________________________________________________________________

"
Coordenadas: 
(0 1)
(0 2)
(1 0)
(1 1)
(1 2)
(1 3)
(2 0)
(2 1)
(2 2)
(2 3)
(3 0)
(3 1)
(3 2)
(3 3)
NIL 

Pecas: 
(PRETA REDONDA ALTA OCA)
(PRETA REDONDA BAIXA OCA)
(BRANCA QUADRADA ALTA OCA)
(PRETA QUADRADA ALTA OCA)
(BRANCA QUADRADA BAIXA OCA)
(PRETA QUADRADA BAIXA OCA)
(BRANCA REDONDA ALTA CHEIA)
(PRETA REDONDA ALTA CHEIA)
(BRANCA REDONDA BAIXA CHEIA)
(PRETA REDONDA BAIXA CHEIA)
(BRANCA QUADRADA ALTA CHEIA)
(PRETA QUADRADA ALTA CHEIA)
(BRANCA QUADRADA BAIXA CHEIA)
(PRETA QUADRADA BAIXA CHEIA)
NIL 

Escreva as coordenadas e o numero da posicao da peca: 
2
2
------ Jogada efetuada por jogador 1















 ------------:JOGADA------------

 ----:  Tempo do jogo: 5606 Milisegundos

 ----:  Jogador: 1 

 ----:  Cortes Alfa: 0

 ----:  Cortes Beta: 0

 ----:  Nos Analisados: 0

 ----:  Nos Expandidos: 2890

 ----:  Nos Cortados: 18


 ----:  Tabuleiro Atual:
"
TABULEIRO
____________________________________________________________________________________________
| (BRANCA REDONDA ALTA OCA) | 0 | (PRETA REDONDA BAIXA OCA) | (BRANCA REDONDA BAIXA OCA) |
| 0 | 0 | 0 | 0 |
| 0 | 0 | 0 | 0 |
| 0 | 0 | 0 | 0 |
____________________________________________________________________________________________

"

---COM---(((((BRANCA REDONDA ALTA OCA) 0 (PRETA REDONDA BAIXA OCA) (BRANCA REDONDA BAIXA OCA)) (0 0 0 0) (0 0 0 0) (0 0 0 0)) ((PRETA REDONDA ALTA OCA) (BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA ALTA OCA) (BRANCA QUADRADA BAIXA OCA) (PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA ALTA CHEIA) (PRETA REDONDA ALTA CHEIA) (BRANCA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA CHEIA) (BRANCA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA CHEIA) (BRANCA QUADRADA BAIXA CHEIA) (PRETA QUADRADA BAIXA CHEIA))) 1005 1 0 NIL)















 ------------:JOGADA------------

 ----:  Tempo do jogo: 144 Milisegundos

 ----:  Jogador: -1 

 ----:  Cortes Alfa: 1

 ----:  Cortes Beta: 1

 ----:  Nos Analisados: 9

 ----:  Nos Expandidos: 3141

 ----:  Nos Cortados: 20


 ----:  Tabuleiro Atual:
"
TABULEIRO
____________________________________________________________________________________________
| (BRANCA REDONDA ALTA OCA) | (PRETA REDONDA BAIXA CHEIA) | (PRETA REDONDA BAIXA OCA) | (BRANCA REDONDA BAIXA OCA) |
| 0 | 0 | 0 | 0 |
| 0 | 0 | 0 | 0 |
| 0 | 0 | 0 | 0 |
____________________________________________________________________________________________

"

---HUM---"
TABULEIRO
____________________________________________________________________________________________
| (BRANCA REDONDA ALTA OCA) | (PRETA REDONDA BAIXA CHEIA) | (PRETA REDONDA BAIXA OCA) | (BRANCA REDONDA BAIXA OCA) |
| 0 | 0 | 0 | 0 |
| 0 | 0 | 0 | 0 |
| 0 | 0 | 0 | 0 |
____________________________________________________________________________________________

"
O vencedor: -1

```

O presente menu representa a escolha de opcao de quem vai jogar primeiro se é o humano ou o compatador.


#### <a name="mc-problema">Computador contra Computador</a>
Para melhor ilustração, será selecionada a opção **1** do menu, correspondente ao modo computador contra computador.

O listener deverá apresentar o seguinte estado:

```lisp
                     _______________________________________________________
          Ã‚Â§                  JOGO DO PROBlEMA DO 4               Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§                 1-Humano contra Computador           Ã‚Â§
          Ã‚Â§                 2-Computador contra Computador       Ã‚Â§
          Ã‚Â§                 3-Sair                               Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§______________________________________________________Ã‚Â§


          Opcao -> 2


-----------------TABULEIRO INICIAL-----------------

"
TABULEIRO
____________________________________________________________________________________________
| 0 | 0 | 0 | 0 |
| 0 | 0 | 0 | 0 |
| 0 | 0 | 0 | 0 |
| 0 | 0 | 0 | 0 |
____________________________________________________________________________________________

"

-----------------TABULEIRO INICIAL-----------------

   
------ESCREVA O TEMPO LIMITE DO COMPUTADOR (1000 >= TEMPO [ms] >= 5000)------
5000
   
------ESCREVA A PROFUNDIDADE MAXIMA------
10
((((0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0)) ((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA REDONDA BAIXA OCA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA ALTA OCA) (BRANCA QUADRADA BAIXA OCA) (PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA ALTA CHEIA) (PRETA REDONDA ALTA CHEIA) (BRANCA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA CHEIA) (BRANCA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA CHEIA) (BRANCA QUADRADA BAIXA CHEIA) (PRETA QUADRADA BAIXA CHEIA))) 0 1 0 NIL)















 ------------:JOGADA------------

 ----:  Tempo do jogo: 3348 Milisegundos

 ----:  Jogador: 1 

 ----:  Cortes Alfa: 8

 ----:  Cortes Beta: 9

 ----:  Nos Analisados: 1

 ----:  Nos Expandidos: 2985

 ----:  Nos Cortados: 17


 ----:  Tabuleiro Atual:
"
TABULEIRO
____________________________________________________________________________________________
| (BRANCA REDONDA ALTA OCA) | 0 | 0 | 0 |
| 0 | 0 | 0 | 0 |
| 0 | 0 | 0 | 0 |
| 0 | 0 | 0 | 0 |
____________________________________________________________________________________________

"

(((((BRANCA REDONDA ALTA OCA) 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0)) ((PRETA REDONDA ALTA OCA) (BRANCA REDONDA BAIXA OCA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA ALTA OCA) (BRANCA QUADRADA BAIXA OCA) (PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA ALTA CHEIA) (PRETA REDONDA ALTA CHEIA) (BRANCA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA CHEIA) (BRANCA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA CHEIA) (BRANCA QUADRADA BAIXA CHEIA) (PRETA QUADRADA BAIXA CHEIA))) 3 1 0 NIL)















 ------------:JOGADA------------

 ----:  Tempo do jogo: 1993 Milisegundos

 ----:  Jogador: -1 

 ----:  Cortes Alfa: 9

 ----:  Cortes Beta: 9

 ----:  Nos Analisados: 3

 ----:  Nos Expandidos: 5875

 ----:  Nos Cortados: 35


 ----:  Tabuleiro Atual:
"
TABULEIRO
____________________________________________________________________________________________
| (BRANCA REDONDA ALTA OCA) | 0 | 0 | (BRANCA REDONDA BAIXA OCA) |
| 0 | 0 | 0 | 0 |
| 0 | 0 | 0 | 0 |
| 0 | 0 | 0 | 0 |
____________________________________________________________________________________________

"

(((((BRANCA REDONDA ALTA OCA) 0 0 (BRANCA REDONDA BAIXA OCA)) (0 0 0 0) (0 0 0 0) (0 0 0 0)) ((PRETA REDONDA ALTA OCA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA ALTA OCA) (BRANCA QUADRADA BAIXA OCA) (PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA ALTA CHEIA) (PRETA REDONDA ALTA CHEIA) (BRANCA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA CHEIA) (BRANCA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA CHEIA) (BRANCA QUADRADA BAIXA CHEIA) (PRETA QUADRADA BAIXA CHEIA))) 14 1 0 NIL)















 ------------:JOGADA------------

 ----:  Tempo do jogo: 328 Milisegundos

 ----:  Jogador: 1 

 ----:  Cortes Alfa: 2

 ----:  Cortes Beta: 2

 ----:  Nos Analisados: 1

 ----:  Nos Expandidos: 6486

 ----:  Nos Cortados: 39


 ----:  Tabuleiro Atual:
"
TABULEIRO
____________________________________________________________________________________________
| (BRANCA REDONDA ALTA OCA) | (PRETA REDONDA ALTA OCA) | 0 | (BRANCA REDONDA BAIXA OCA) |
| 0 | 0 | 0 | 0 |
| 0 | 0 | 0 | 0 |
| 0 | 0 | 0 | 0 |
____________________________________________________________________________________________

"

(((((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) 0 (BRANCA REDONDA BAIXA OCA)) (0 0 0 0) (0 0 0 0) (0 0 0 0)) ((PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA ALTA OCA) (BRANCA QUADRADA BAIXA OCA) (PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA ALTA CHEIA) (PRETA REDONDA ALTA CHEIA) (BRANCA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA CHEIA) (BRANCA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA CHEIA) (BRANCA QUADRADA BAIXA CHEIA) (PRETA QUADRADA BAIXA CHEIA))) 1005 1 0 NIL)















 ------------:JOGADA------------

 ----:  Tempo do jogo: 182 Milisegundos

 ----:  Jogador: -1 

 ----:  Cortes Alfa: 1

 ----:  Cortes Beta: 1

 ----:  Nos Analisados: 9

 ----:  Nos Expandidos: 6749

 ----:  Nos Cortados: 41


 ----:  Tabuleiro Atual:
"
TABULEIRO
____________________________________________________________________________________________
| (BRANCA REDONDA ALTA OCA) | (PRETA REDONDA ALTA OCA) | (PRETA REDONDA BAIXA CHEIA) | (BRANCA REDONDA BAIXA OCA) |
| 0 | 0 | 0 | 0 |
| 0 | 0 | 0 | 0 |
| 0 | 0 | 0 | 0 |
____________________________________________________________________________________________

"

O vencedor: -1"
TABULEIRO
____________________________________________________________________________________________
| (BRANCA REDONDA ALTA OCA) | (PRETA REDONDA ALTA OCA) | (PRETA REDONDA BAIXA CHEIA) | (BRANCA REDONDA BAIXA OCA) |
| 0 | 0 | 0 | 0 |
| 0 | 0 | 0 | 0 |
| 0 | 0 | 0 | 0 |
____________________________________________________________________________________________

"

             _______________________________________________________
          Ã‚Â§                  JOGO DO PROBlEMA DO 4               Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§                 1-Humano contra Computador           Ã‚Â§
          Ã‚Â§                 2-Computador contra Computador       Ã‚Â§
          Ã‚Â§                 3-Sair                               Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§______________________________________________________Ã‚Â§


          Opcao -> 

```
* Neste modo de jogo os computadores vão jogar sozinhos.


##### <a name="mc-TL">Tempo limite</a>
O listener do Lispworks deverá apresentar o seguinte:

```lisp
------ESCREVA O TEMPO LIMITE DO COMPUTADOR (1000 >= TEMPO [ms] >= 5000)------
```

##### <a name="mc-PM">Profundidade Maxima</a>
O listener do Lispworks deverá apresentar o seguinte:

```lisp
------ESCREVA A PROFUNDIDADE MAXIMA------
```


Cada problema apenas altera-se perante as jogadas geradas com as peças colocadas no tabuleiro e retiradas da sua reserva.

No ficheiro ***log.dat***, apenas necessita de registar todas as jogadas efetuadas pelos jogadores e quais os nós que foram analizados, cortados, expandidos e os cortes alfas e betas.

Como mencionada varias vezes ao longo do manual, o ficheiro ***log.dat*** apenas contém as jogadas efetuadas pelos jogadores.

Se tiver dúvidas veja como os problemas no ficheiro ***log.dat*** se encontram colocados.

## **Glossário**
* **LispWorks**: Ferramenta que permite compilação e execução de código Common Lisp. O seu ambiente léxico não é dinâmico.

* **Problema/s**: Designa-se ao estado de um tabuleiro, acompanhado pela sua reserva de peças.