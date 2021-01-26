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
    * [Resolver Jogo](#mc-resolve-jogo)
        * [Resolver Problema](#mc-problema)
            * [BFS](#mc-bfs)
            * [DFS](#mc-dfs)
            * [A*](#mc-a-star)
            * [Home Menu](#mc-home-menu)
    * [Mostrar Regras](#mc-ver-regras)
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
O projeto encontra-se distribuído por três ficheiros principais: ***projecto.LISP***, ***puzzle.LISP*** e ***procura.LISP***.

Os ficheiros acima especificados permitem o funcionamento do programa e têm de ser abertos e compilados no LispWorks, independentemente da sua ordem, antes de ser executado o programa.

Em anexo disponibilizamos o ficheiro **problemas.dat**, com seis problemas diferentes, formatados para rápida utilização.


## <a name="tut-iniciar">**Iniciar Programa**</a>
Consideramos que o nível de conhecimento necessário para correr o nosso programa, seja básico, de forma que pelo menos necessitar saber de como utilizar básicamente o Lispworks: abrir e compilar ficheiros e utilizar o listener.

Abra o LispWorks e abra os três ficheiros: ***projecto.LISP***, ***puzzle.LISP*** e ***procura.LISP***.

Compile os três ficheiros acima e verifique a existência, na pasta onde se encontram os três ficheiros acima, o ficheiro: ***problemas.dat***.

Se faltar o ficheiro ***problemas.dat***, apresentaremos uma explicação de como criar um ficheiro parecido em [Problemas](#tut-problemas).

Assumindo que já compilou os três ficheiros projeto, puzzle e procura, e existe o ficheiro problemas, coloque no listener da ferramente LispWorks:

```l
(startup)
```

No listener terá de apresentar como no exemplo abaixo.

```lisp
CL-USER> (startup)
```

Pressione a tecla **ENTER** e de seguida deverá visualizar o seguinte menu:

```lisp
             _______________________________________________________
          Ã‚Â§                  JOGO DO PROBlEMA DO 4               Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§                 1-Resolver o jogo                    Ã‚Â§
          Ã‚Â§                 2-Regras do Jogo                     Ã‚Â§
          Ã‚Â§                 3-Sair                               Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§______________________________________________________Ã‚Â§


          Option -> 
```

Para escolher opções, deverá inserir logo após a seta o número correspondente a uma das opções disponibilizadas pelo menu e pressione a tecla **ENTER**.

Esta ação aplica-se a todos os menus do programa.

* Se pertender [resolver um jogo](#mc-resolve-jogo), pressione a tecla numérica **1**.

* Se pertender [ver as regras](#mc-ver-regras) do jogo, pressione a tecla numérica **2**. 

* Para [terminar o programa](#sair-programa) deverá pressionar a tecla numérica **3**.

### <a name="mc-resolve-jogo">Resolver Jogo</a>
O listener do LispWorks deverá apresentar o seguinte estado depois de selecionar a opção **1** do menu principal.

```lisp
             _______________________________________________________
          Ã‚Â§                  JOGO DO PROBlEMA DO 4               Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§                 1-Resolver o jogo                    Ã‚Â§
          Ã‚Â§                 2-Regras do Jogo                     Ã‚Â§
          Ã‚Â§                 3-Sair                               Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§______________________________________________________Ã‚Â§


          Option -> 1

              ______________________________________________________
          Ã‚Â§                ESCOLHA O TABULEIRO                   Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§                 1-Problema A                         Ã‚Â§
          Ã‚Â§                 2-Problema B                         Ã‚Â§
          Ã‚Â§                 3-Problema C                         Ã‚Â§
          Ã‚Â§                 4-Problema D                         Ã‚Â§
          Ã‚Â§                 5-Problema E                         Ã‚Â§
          Ã‚Â§                 6-Problema F                         Ã‚Â§
          Ã‚Â§                 7-Problema G                         Ã‚Â§
          Ã‚Â§                 8-Problema Teste                     Ã‚Â§
          Ã‚Â§                 9-Home Menu                          Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§______________________________________________________Ã‚Â§


          Opcao -> 
```

O presente menu disponibiliza os problemas que devem de estar no ficheiro ***problemas.dat***, à exceção do **Problema Teste**, que deverá ser colocado no ficheiro de [problemas](#tut-problemas).

* Se pertender [voltar ao menu principal](#mc-home-menu), selecione a opção **9**.

* Se pertender [resolver um dos jogos](#mc-problema), selecione um número das opções entre **1** e **7**, com especial atenção para a opção **8**, que só é fazível se for colocado um problema extra no ficheiro [problemas](#tut-problemas).

#### <a name="mc-problema">Resolver Problema</a>
Para melhor ilustração, será selecionada a opção **1** do menu, correspondente ao Problema A.

O listener deverá apresentar o seguinte estado:

```lisp
             _______________________________________________________
          Ã‚Â§                  JOGO DO PROBlEMA DO 4               Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§                 1-Resolver o jogo                    Ã‚Â§
          Ã‚Â§                 2-Regras do Jogo                     Ã‚Â§
          Ã‚Â§                 3-Sair                               Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§______________________________________________________Ã‚Â§


          Option -> 1

              ______________________________________________________
          Ã‚Â§                ESCOLHA O TABULEIRO                   Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§                 1-Problema A                         Ã‚Â§
          Ã‚Â§                 2-Problema B                         Ã‚Â§
          Ã‚Â§                 3-Problema C                         Ã‚Â§
          Ã‚Â§                 4-Problema D                         Ã‚Â§
          Ã‚Â§                 5-Problema E                         Ã‚Â§
          Ã‚Â§                 6-Problema F                         Ã‚Â§
          Ã‚Â§                 7-Problema G                         Ã‚Â§
          Ã‚Â§                 8-Problema Teste                     Ã‚Â§
          Ã‚Â§                 9-Home Menu                          Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§______________________________________________________Ã‚Â§


          Opcao -> 1
(((((BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA BAIXA CHEIA) 0 (PRETA QUADRADA ALTA OCA)) ((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA REDONDA ALTA CHEIA) 0) (0 (PRETA REDONDA ALTA CHEIA) (PRETA REDONDA BAIXA CHEIA) 0) ((BRANCA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA CHEIA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA BAIXA CHEIA))) ((PRETA QUADRADA ALTA CHEIA) (PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA BAIXA CHEIA) (BRANCA QUADRADA BAIXA OCA))) 0 NIL)
           ______________________________________________________
          Â§                                                      Â§
          Â§                  ESCOLHA O ALGORITMO                 Â§
          Â§                 (algoritmo de procura)               Â§
          Â§                                                      Â§
          Â§                 1-Procura em largura                 Â§
          Â§                 2-Procura em profundidade            Â§
          Â§                 3-Procura em A*                      Â§
          Â§                 0-Home Menu                          Â§
          Â§                                                      Â§
          Â§______________________________________________________Â§


          Option -> 
```

* Se pertender obter uma solução para o problema utilizando o algoritmo de prócura em largura, selecione a opção **1**.

* Se pertender obter uma solução para o problema utilizando o algoritmo de prócura em profundidade, selecione a opção **2**.

* Se pertender obter uma solução para o problema utilizando o algoritmo A*, selecione a opção **3**.

*Se pertender [voltar ao menu principal](#mc-home-menu), selecione a opção **0**.

##### <a name="mc-bfs">BFS</a>
O listener do Lispworks deverá apresentar o seguinte estado:

```lisp
           ______________________________________________________
          Â§                                                      Â§
          Â§                  ESCOLHA O ALGORITMO                 Â§
          Â§                 (algoritmo de procura)               Â§
          Â§                                                      Â§
          Â§                 1-Procura em largura                 Â§
          Â§                 2-Procura em profundidade            Â§
          Â§                 3-Procura em A*                      Â§
          Â§                 0-Home Menu                          Â§
          Â§                                                      Â§
          Â§______________________________________________________Â§


          Option -> 1
```
Pressione a tecla **ENTER** e um ficheiro ***solucao.dat*** será gerado com uma possível solução. 

```lisp
; solucao.dat
Algoritmo: BFS 
Inicio: 8:15:57
Fim: 8:16:1
Numero de nos gerados: 1
Numero de nos expandidos: 0
Nivel de penetracao: 2.0
Tamanho da solucao: 2
Solucao: ((((BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA BAIXA CHEIA) (PRETA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA OCA)) ((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA REDONDA ALTA CHEIA) 0) (0 (PRETA REDONDA ALTA CHEIA) (PRETA REDONDA BAIXA CHEIA) 0) ((BRANCA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA CHEIA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA BAIXA CHEIA))) ((PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA BAIXA CHEIA) (BRANCA QUADRADA BAIXA OCA)))
Tabuleiro-inicial:
(((BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA BAIXA CHEIA) 0 (PRETA QUADRADA ALTA OCA)) ((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA REDONDA ALTA CHEIA) 0) (0 (PRETA REDONDA ALTA CHEIA) (PRETA REDONDA BAIXA CHEIA) 0) ((BRANCA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA CHEIA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA BAIXA CHEIA)))
((PRETA QUADRADA ALTA CHEIA) (PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA BAIXA CHEIA) (BRANCA QUADRADA BAIXA OCA))
Tabuleiro-final:
(((BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA BAIXA CHEIA) (PRETA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA OCA)) ((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA REDONDA ALTA CHEIA) 0) (0 (PRETA REDONDA ALTA CHEIA) (PRETA REDONDA BAIXA CHEIA) 0) ((BRANCA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA CHEIA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA BAIXA CHEIA)))
((PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA BAIXA CHEIA) (BRANCA QUADRADA BAIXA OCA))
```

##### <a name="mc-dfs">DFS</a>
O listener do Lispworks deverá apresentar o seguinte estado:

```lisp
            ______________________________________________________
          Â§                                                      Â§
          Â§                  ESCOLHA O ALGORITMO                 Â§
          Â§                 (algoritmo de procura)               Â§
          Â§                                                      Â§
          Â§                 1-Procura em largura                 Â§
          Â§                 2-Procura em profundidade            Â§
          Â§                 3-Procura em A*                      Â§
          Â§                 0-Home Menu                          Â§
          Â§                                                      Â§
          Â§______________________________________________________Â§


          Option -> 2
```
Insira a profundidade máxima permitida para a prócura. Este valor encontra-se no intervalo [0, 999]. Caso coloque um valor fora do intervalo, será pedido novamente para colocar um valor válido. Dependentemente do valor de profundidade que colocar, poderá ser possível obter uma solução ou não.

```lisp
            ______________________________________________________
          Â§                    PROFUNDIDADE                      Â§
          Â§                                                      Â§
          Â§                      ATENCAO                         Â§
          Â§                                                      Â§
          Â§            SO PODE USAR NUMEROS ACIMA DE 0           Â§
          Â§                     0-Home Menu                      Â§
          Â§                                                      Â§
          Â§______________________________________________________Â§


          Depth-> 10
```

Pressione a tecla **ENTER** e um ficheiro ***solucao.dat*** será gerado com uma possível solução. 

```lisp
; solucao.dat
Algoritmo: DFS 
Inicio: 8:26:21
Fim: 8:26:22
Numero de nos gerados: 1
Numero de nos expandidos: 0
Nivel de penetracao: 2.0
Profundidade Maxima: 1
Tamanho da solucao: 2
Solucao: ((((BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA BAIXA CHEIA) (PRETA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA OCA)) ((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA REDONDA ALTA CHEIA) 0) (0 (PRETA REDONDA ALTA CHEIA) (PRETA REDONDA BAIXA CHEIA) 0) ((BRANCA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA CHEIA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA BAIXA CHEIA))) ((PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA BAIXA CHEIA) (BRANCA QUADRADA BAIXA OCA)))
Tabuleiro-inicial:
(((BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA BAIXA CHEIA) 0 (PRETA QUADRADA ALTA OCA)) ((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA REDONDA ALTA CHEIA) 0) (0 (PRETA REDONDA ALTA CHEIA) (PRETA REDONDA BAIXA CHEIA) 0) ((BRANCA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA CHEIA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA BAIXA CHEIA)))
((PRETA QUADRADA ALTA CHEIA) (PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA BAIXA CHEIA) (BRANCA QUADRADA BAIXA OCA))
Tabuleiro-final:
(((BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA BAIXA CHEIA) (PRETA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA OCA)) ((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA REDONDA ALTA CHEIA) 0) (0 (PRETA REDONDA ALTA CHEIA) (PRETA REDONDA BAIXA CHEIA) 0) ((BRANCA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA CHEIA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA BAIXA CHEIA)))
((PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA BAIXA CHEIA) (BRANCA QUADRADA BAIXA OCA))
```

##### <a name="mc-a-star">A*</a>
O listener do Lispworks deverá apresentar o seguinte estado:

```lisp
            ______________________________________________________
          Â§                                                      Â§
          Â§                  ESCOLHA O ALGORITMO                 Â§
          Â§                 (algoritmo de procura)               Â§
          Â§                                                      Â§
          Â§                 1-Procura em largura                 Â§
          Â§                 2-Procura em profundidade            Â§
          Â§                 3-Procura em A*                      Â§
          Â§                 0-Home Menu                          Â§
          Â§                                                      Â§
          Â§______________________________________________________Â§


          Option -> 3
```

Pressione a tecla **ENTER** e um ficheiro ***solucao.dat*** será gerado com uma possível solução. 

```lisp
; solucao.dat
Algoritmo: A-STAR 
Inicio: 8:26:22
Fim: 8:29:26
Numero de nos gerados: 1
Numero de nos expandidos: 0
Nivel de penetracao: 2.0
Tamanho da solucao: 2
Solucao: ((((BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA BAIXA CHEIA) 0 (PRETA QUADRADA ALTA OCA)) ((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA REDONDA ALTA CHEIA) 0) ((BRANCA QUADRADA BAIXA OCA) (PRETA REDONDA ALTA CHEIA) (PRETA REDONDA BAIXA CHEIA) 0) ((BRANCA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA CHEIA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA BAIXA CHEIA))) ((PRETA QUADRADA ALTA CHEIA) (PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA BAIXA CHEIA)))
Tabuleiro-inicial:
(((BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA BAIXA CHEIA) 0 (PRETA QUADRADA ALTA OCA)) ((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA REDONDA ALTA CHEIA) 0) (0 (PRETA REDONDA ALTA CHEIA) (PRETA REDONDA BAIXA CHEIA) 0) ((BRANCA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA CHEIA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA BAIXA CHEIA)))
((PRETA QUADRADA ALTA CHEIA) (PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA BAIXA CHEIA) (BRANCA QUADRADA BAIXA OCA))
Tabuleiro-final:
(((BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA BAIXA CHEIA) 0 (PRETA QUADRADA ALTA OCA)) ((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA REDONDA ALTA CHEIA) 0) ((BRANCA QUADRADA BAIXA OCA) (PRETA REDONDA ALTA CHEIA) (PRETA REDONDA BAIXA CHEIA) 0) ((BRANCA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA CHEIA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA BAIXA CHEIA)))
((PRETA QUADRADA ALTA CHEIA) (PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA BAIXA CHEIA))
```

#### <a name="mc-home-menu">Home Menu</a>
Embora o estado esteja especificado para o [menu de resolver jogo](#mc-resolve-jogo), em todos os menus existe uma opção **Home menu** que permite voltar ao menu inicial.

```lisp
              ______________________________________________________
          Ã‚Â§                ESCOLHA O TABULEIRO                   Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§                 1-Problema A                         Ã‚Â§
          Ã‚Â§                 2-Problema B                         Ã‚Â§
          Ã‚Â§                 3-Problema C                         Ã‚Â§
          Ã‚Â§                 4-Problema D                         Ã‚Â§
          Ã‚Â§                 5-Problema E                         Ã‚Â§
          Ã‚Â§                 6-Problema F                         Ã‚Â§
          Ã‚Â§                 7-Problema G                         Ã‚Â§
          Ã‚Â§                 8-Problema Teste                     Ã‚Â§
          Ã‚Â§                 9-Home Menu                          Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§______________________________________________________Ã‚Â§


          Opcao -> 9
Escolha invalida
```

### <a name="mc-ver-regras">Mostrar Regras</a>
O listener do Lispworks deverá apresentar o seguinte estado depois de selecionar a opção **2** do menu principal.

```lisp
             _______________________________________________________
          Ã‚Â§                  JOGO DO PROBlEMA DO 4               Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§                 1-Resolver o jogo                    Ã‚Â§
          Ã‚Â§                 2-Regras do Jogo                     Ã‚Â§
          Ã‚Â§                 3-Sair                               Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§______________________________________________________Ã‚Â§


          Option -> 2

________________________________________   REGRAS DO JOGO   ________________________________________
                                          (jogo do quarto)  
                                          
     1- Esta versÃ£o do jogo consiste num tabuleiro com 4 linhas e 4 colunas (4X4)   
     2- Em que cada casa possui uma pea com 4 atributos sem pecas repetidas                               
     3- O objectivo do jogo Ã© obter 4 elementos com um atributo em comum.
        Cada jogador tem um cavalo da sua cor (branco ou preto).                                                
     4- O jogo termina quando existem 4 elementos com um atributo comum.           
                                                                                          
_________________________________________________________________________________________________
  









             _______________________________________________________
          Ã‚Â§                  JOGO DO PROBlEMA DO 4               Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§                 1-Resolver o jogo                    Ã‚Â§
          Ã‚Â§                 2-Regras do Jogo                     Ã‚Â§
          Ã‚Â§                 3-Sair                               Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§______________________________________________________Ã‚Â§


          Option -> 
```

### <a name="mc-sair-programa">Sair do Programa</a>
O listener do LispWorks deverá apresentar o seguinte estado depois de selecionar a opção **3** do menu principal:

```lisp
             _______________________________________________________
          Ã‚Â§                  JOGO DO PROBlEMA DO 4               Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§                 1-Resolver o jogo                    Ã‚Â§
          Ã‚Â§                 2-Regras do Jogo                     Ã‚Â§
          Ã‚Â§                 3-Sair                               Ã‚Â§
          Ã‚Â§                                                      Ã‚Â§
          Ã‚Â§______________________________________________________Ã‚Â§


          Option -> 3



          PROGRAMA TERMINADO
NIL
```

## <a name="tut-problemas">**Problemas**</a>
Um problema é constituído por um estado de um tabuleiro e a sua reserva de peças.

O ficheiro ***problemas.dat*** envia em conjunto com este manual, já contém seis problemas por definição, no entanto, poderão ser alteradas caso queira.

O seguinte problema ilustra um tabuleiro no seu estado inicial, sem quaisquer peças nele colocado e com as 16 peças na sua reserva.

```lisp
; problema com tabuleiro sem peças e reserva com as 16 peças
((
    (0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0)
)(
    (BRANCA QUADRADA ALTA CHEIA) (BRANCA QUADRADA ALTA OCA) (BRANCA QUADRADA BAIXA OCA) (BRANCA QUADRADA BAIXA CHEIA) (PRETA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA OCA) (PRETA QUADRADA BAIXA OCA) (PRETA QUADRADA BAIXA CHEIA) (BRANCA REDONDA ALTA CHEIA) (BRANCA REDONDA ALTA OCA) (BRANCA REDONDA BAIXA CHEIA) (BRANCA REDONDA BAIXA OCA) (PRETA REDONDA ALTA CHEIA) (PRETA REDONDA ALTA OCA) (PRETA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA OCA)))
```

Cada problema apenas altera-se perante as peças colocadas no tabuleiro e retiradas da sua reserva.

No ficheiro ***problemas.dat***, apenas necessita de substituir cada problema com recorrendo ao formato exemplo acima ilustrado, mas tenha a atenção de verificar que existe pelo menos uma linha de intervalo a separar cada problema.

Como mencionada varias vezes ao longo do manual, o ficheiro ***problemas.dat*** apenas contém seis problemas por definição, mas requer adicionar um último problema.

Para tal apenas necessita de abrir o ficheiro ***problemas.dat*** e colocar um problema, de perferência diferente dos problemas existentes, tendo em conta com o exemplo acima ilistrado e manter a separação de uma linha entre o último problema do ficheiro e o novo problema a inserir.

Se tiver dúvidas veja como os problemas no ficheiro ***problemas.dat*** se encontram colocados.

## **Glossário**
* **LispWorks**: Ferramenta que permite compilação e execução de código Common Lisp. O seu ambiente léxico não é dinâmico.

* **Problema/s**: Designa-se ao estado de um tabuleiro, acompanhado pela sua reserva de peças.