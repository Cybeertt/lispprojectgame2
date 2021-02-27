(defvar *cortes-alfa* 0)
(defvar *cortes-beta* 0)
(defvar *nos-analisados* 0)
(defvar *nos-cortados*   0 )
(defvar *nos-expandidos* 0 )
(defvar *jogar* NIL)
(defvar *sc NIL)
(defvar *scm NIL)

(defparameter *dispersao* (make-hash-table))

(defun print-hash-entry (key value)
    (format t "The value associated with the key ~a is ~a~%" key value))

(let* (
  (*tabuleiro (tab))
  (*p 0))

(defun jogar-quatro (tab tempo j1)
  ;(princ "jogar-quatro")
  ;(no-profundidade-alphabeta *jogar*)
  (setf *cortes-alfa* 0)
  (setf *cortes-beta* 0)
  (setf *nos-analisados* 0)
  (let ((temp (get-internal-real-time)))
    (alphabeta tab *p j1 tempo)
    (princ tab)
    ;(cond
    ; ((= 1 (no-profundidade-alphabeta *jogar*))
      (setf *tabuleiro (no-estado *jogar*)) 
      (escreve-log *tabuleiro j1 (tempo-milisegundos temp) *cortes-alfa* *cortes-beta* *nos-analisados* *nos-expandidos* *nos-cortados*) (estatistica *tabuleiro j1 (tempo-milisegundos temp) *cortes-alfa* *cortes-beta* *nos-analisados* *nos-expandidos* *nos-cortados*) *tabuleiro))
     ;(t (no-estado tab)))))

 


(defun humano-quatro (jogo j1)
  (setf *cortes-alfa* 0)
  (setf *cortes-beta* 0)
  (setf *nos-analisados* 0)
  (let ((joga (jogada (car jogo) (cadr jogo) (car (cddr jogo)) *tabuleiro)))
    (princ "------ ")
    (cond
     ((null jogo) (setf joga *tabuleiro))
     (t (format t "Jogada efetuada por jogador ~a" j1) (setf *tabuleiro joga)
        ))))


(defun comcom (tempo profundidade &optional (j1 1))
 #| (reiniciar)
  (exibir-tab *tabuleiro)|#
  (setf *p profundidade)
  (cond
       ((null (no-solucaop (cria-no-alphabeta *tabuleiro))) (setf *tabuleiro (jogar-quatro (cria-no-alphabeta *tabuleiro) tempo j1)) (comcom tempo *p (outro-jogador j1)))
       (t (format t "O vencedor: ~a" (outro-jogador j1)) (exibir-tab *tabuleiro) (comecar))))
  #|(loop while (not (null (quatro-linha-p *tabuleiro))) 
        do
        (setf *tabuleiro (jogar-quatro (cria-no-alphabeta *tabuleiro) tempo profundidade j1))
        (comcom tempo profundidade (outro-jogador j1))(setf *jogador (outro-jogador *jogador))) (exibir-tab *tabuleiro) (comecar))|#

;jogada humana
;ganhar funcionar
;para num certo numero de jogadas
; (< tempo (get-internal-real-time)))
(defun humcom (tempo profundidade &optional (j1 1))
  ;(setf *jogador j1)
  (setf *p profundidade)
  ;(princ *p)
  ;(exibir-comeco-tab *tabuleiro)
  (cond
   ((= j1 1)
    (princ "---HUM---") (exibir-tab *tabuleiro) ;(estatistica *tabuleiro 0 0 *cortes-alfa* *cortes-beta* *nos-analisados* *nos-expandidos* *nos-cortados*)
    (let* ((pecas (reserva (no-estado (cria-no-alphabeta *tabuleiro))))
           (casas (casas-vazias (tabuleiro-conteudo (cria-no-alphabeta *tabuleiro))))
           (temp (get-internal-real-time)))
           ;(ler (ler-jogada casas pecas)))
            ;(princ (tabuleiro *tabuleiro))
      (cond
       ((and (null pecas) (null casas)) (exibir-tab *tabuleiro))
       ((null (no-solucaop (cria-no-alphabeta *tabuleiro))) (setf *tabuleiro (humano-quatro (ler-jogada casas pecas) j1)) (escreve-log *tabuleiro j1  (tempo-milisegundos (get-internal-real-time)) *cortes-alfa* *cortes-beta* *nos-analisados* *nos-expandidos* *nos-cortados*) (estatistica *tabuleiro j1 (tempo-milisegundos temp) *cortes-alfa* *cortes-beta* *nos-analisados* *nos-expandidos* *nos-cortados*)
        (humcom tempo profundidade (outro-jogador j1)))
       (t (format t "O vencedor: ~a" (outro-jogador j1)) (comecar)))))
   (t (princ "---COM---") 
      (cond
       ((null (no-solucaop (cria-no-alphabeta *tabuleiro))) (setf *tabuleiro (jogar-quatro (cria-no-alphabeta *tabuleiro) tempo j1)) (humcom tempo profundidade (outro-jogador j1)))
       (t (format t "O vencedor: ~a" (outro-jogador j1)) (comecar))))))
    
  ;(escreve-log *tabuleiro 0 0 *cortes-alfa* *cortes-beta* *nos-analisados* *nos-expandidos* *nos-cortados*)
  #|(loop while (not (null (quatro-linha-p *tabuleiro))) ;(not (null (reserva *tabuleiro))))
        do
        (cond
         ((= *jogador 1)
          (princ "---HUM---") (exibir-tab *tabuleiro)
          (let* ((pecas (reserva (no-estado (cria-no-alphabeta *tabuleiro))))
                 (casas (casas-vazias (tabuleiro-conteudo (cria-no-alphabeta *tabuleiro))))
                 (ler (ler-jogada casas pecas)))
            
            (cond
             ((and (null pecas) (null casas)) (exibir-tab *tabuleiro))
             (t (setf *tabuleiro (humano-quatro ler)) ;(escreve-log *tabuleiro *jogador (- (get-internal-real-time) (get-internal-real-time)) *cortes-alfa* *cortes-beta* *nos-analisados* *nos-expandidos* *nos-cortados*)
                ))))
         (t (princ "---COM---") (setf *tabuleiro (jogar-quatro (cria-no-alphabeta *tabuleiro) tempo *p))))
        (setf *jogador (outro-jogador *jogador))) (exibir-tab *tabuleiro) (comecar))|#

(defun reiniciar ()
    (setf *tabuleiro (tab))
    (setf *cortes-alfa* 0)
    (setf *cortes-beta* 0)
    (setf *nos-analisados* 0)
    (setf *nos-cortados*   0 )
    (setf *nos-expandidos* 0 ))

(defun outro-jogador (j)
  (* -1 j))


(defun cria-no-alphabeta (estado &optional (profundidade 0) (pai NIL) (j1 1) &aux (value (avaliar-no (list estado 0 j1 profundidade pai))))
  (list estado value j1 profundidade pai))

;Estado Tabuleiro sem reserva
(defun tabuleiro-conteudo (no) (caar no)) ; usamos este?

(defun no-estado (no) (car no))
(defun no-value (no) (cadr no)) ; seguir como nos exercicios alphabeta corte, em que o valor esta no no
(defun no-jogador (no) (caddr no))
(defun no-profundidade-alphabeta (no) (cadddr no))
(defun no-pai (no) (car (cddddr no)))

(defun sucessores-quatro (no operadoresf &optional (max-prof 0) (jogador 0))
  (cond 
   ((null no) nil)
   ((>= (no-profundidade-alphabeta no) max-prof) nil)
   ((no-solucaop no) nil)
   (t (let ((coordenadas (casas-vazias (tabuleiro-conteudo no))))
        (cond 
         ((null coordenadas) NIL)
         (t (remove nil (mapcar #'(lambda (estado) (cond ((null estado) NIL) (t (novo-sucessor no estado jogador)))) (funcall operadoresf (no-estado no))))))))))

(defun novo-sucessor (no estado jogador)
  (cria-no-alphabeta estado (1+ (no-profundidade-alphabeta no)) no jogador))

#|START Alphabeta functions|#
#|1. Alphabeta que seria a funcao principal que tens com as condicoes de paragem e 
a verificacao se o jogador e max ou min.|#
; CL-USER > (alphabeta (p) 3 1)
; -43
; CL-USER > (alphabeta (p) 3 1)
; 43
; (let* ((tempo (+ (get-internal-real-time) 6000))) (alphabeta (cria-no-alphabeta (tab)) 10 1 tempo))
(defun alphabeta (no profundidade jogador &optional (tempo 6000) (alpha most-negative-fixnum) (beta most-positive-fixnum))
  (cond
   ; no solucao
   ((no-solucaop no)
    (no-value no)) ; valor heuristico calculado
   ; condicoes de paragem: profundidade zero or no ternimal
   ((or (zerop profundidade) (null (sucessores-quatro no #'operadores-quatro profundidade jogador)))
    (no-value no)) ; valor heuristico calculado
   (t (let* ((sucessores (remove-if #'(lambda (s) (null s)) (sucessores-quatro no #'operadores-quatro profundidade jogador)))
             (tamanho (length sucessores)))
        (cond
         ; max
         ((> jogador 0); (sort-max sucessores)
          (let* ((sucessores-max (sorter sucessores 'max)))
            
            (progn (setf *sc sucessores-max) (setf *nos-expandidos* (+ *nos-expandidos* tamanho))
              (alphabeta-max profundidade jogador sucessores-max tempo alpha beta))))
         ; min
         ;(sort-min sucessores)
         (t (let* ((sucessores-min (sorter sucessores 'min)))
              (progn (setf *scm sucessores-min) (setf *nos-expandidos* (+ *nos-expandidos* tamanho))
              (alphabeta-min profundidade jogador sucessores-min tempo alpha beta)))))))))

#|2. Alphabeta-max que seria uma funcao auxiliar que iria ser chamada sempre que o jogador e 
max e nao parou nas condicoes de paragem. Antes de chamar essa funcao eram gerados os sucessores 
para que essa funcao recursivamente chamasse o Alphabeta para cada sucessor.|#
(defun alphabeta-max (profundidade jogador &optional (sucessores NIL) (tempo 6000) (alpha most-negative-fixnum) (beta most-positive-fixnum) &aux (sucessor (car sucessores)) (tempo-agora (get-internal-real-time)))
  (cond
   ((= tempo tempo-agora) alpha) ; sem tempo
   ((null sucessores) alpha) ; sem sucessores
   (t
    ; algoritmo alphabeta
    (let* ((value (max alpha (alphabeta sucessor profundidade (outro-jogador jogador) tempo alpha beta)))
           (a (max alpha value)))
      (cond
       ((>= a beta) (progn (setf *cortes-alfa* (+ *cortes-alfa* 1)) (setf *nos-cortados* (+ *nos-cortados* 1)) alpha)) ; condicao de corte: alpha >= beta
       (t (cond 
           ((= 1 (no-profundidade-alphabeta sucessor)) (progn (setf *jogar* sucessor) (setf *nos-analisados* (+ *nos-analisados* 1)) (max a (alphabeta-max profundidade jogador (cdr *sc) tempo a beta))))
           (t (alphabeta-max profundidade jogador (cddddr sucessor) tempo a beta))))))))) ; recursividade

#|3. Alphabeta-min que seria uma funcao auxiliar que iria ser chamada sempre que o jogador e min 
e nao parou nas condicoes de paragem. Antes de chamar essa funcao eram gerados os sucessores para 
que essa funcao recursivamente chamasse o Alphabeta para cada sucessor.|#
(defun alphabeta-min (profundidade jogador &optional (sucessores NIL) (tempo 6000) (alpha most-negative-fixnum) (beta most-positive-fixnum) &aux (sucessor (car sucessores)) (tempo-agora (get-internal-real-time)))
  (cond
   ((= tempo tempo-agora) beta) ; sem tempo
   ((null sucessores) beta) ; sem sucessores
   (t
    ; algoritmo alphabeta
    (let* ((value (min beta (alphabeta sucessor profundidade (outro-jogador jogador) tempo alpha beta)))
           (b (min beta value)))
      (cond
       ((<= b alpha) (progn (setf *cortes-beta* (+ *cortes-beta* 1)) (setf *nos-cortados* (+ *nos-cortados* 1)) beta)) ; condicao de corte: beta <= alpha
       (t (cond 
           ((= 1 (no-profundidade-alphabeta sucessor)) (progn (setf *jogar* sucessor) (setf *nos-analisados* (+ *nos-analisados* 1)) (min b (alphabeta-min profundidade jogador (cdr sucessores) tempo alpha b))))
           (t (alphabeta-min profundidade jogador (cddddr sucessor) tempo alpha b)))))))))

#|END Alphabeta functions|#

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

(defun sao-iguaisp (linha)
  (labels ((eq-list (x &rest y) 
             (cond 
              ((null y) T) 
              ((eq x (car y)) (apply #'eq-list x (cdr y)))
              (t nil))))
    (cond
     ((null linha) nil)
     (t (reduce #'(lambda (&optional a b) (or a b)) (apply #'mapcar #'eq-list linha))))))

(defun no-solucaop (no)
  (if (null no) nil (quatro-linha-p (tabuleiro (no-estado no)))))

(defun avaliar-no (no &aux (jogador (no-jogador no)))
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
           (linhas-pecas (remove-if #'(lambda (z) (null z))
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

#|SORTER
sucessores - Lista de nos
ordem - Ordenacao 'min ou 'max
|#
(defun sorter (sucessores ordem)
  "Ordena os sucessores por ordem 'min:= ascendente ou 'max:= descendente"
  (cond 
   ((null sucessores) NIL)
   (t
    (let ((nos (copy-tree sucessores)))
      (cond
       ((eq ordem 'min) (sort nos #'< :key #'no-value))
       (t (sort nos #'> :key #'no-value)))))))
)

#|
TIME

; alphabeta with sort (common lisp)
(time (alphabeta (p) 10 1))

Timing the evaluation of (ALPHABETA (P) 10 1)

User time    =        0.015
System time  =        0.000
Elapsed time =        0.022
Allocation   = 24178936 bytes
0 Page faults
Calls to %EVAL    227583


;alphabeta with mergesort
(time (alphabeta (p) 10 1))

Timing the evaluation of (ALPHABETA (P) 10 1)

User time    =        0.140
System time  =        0.000
Elapsed time =        0.125
Allocation   = 136198736 bytes
0 Page faults
Calls to %EVAL    1289187
1030

;sort (common lisp)
Timing the evaluation of (SORT-MIN (REMOVE-IF (FUNCTION (LAMBDA (X) (NULL X))) (SUCESSORES-QUATRO (P) (FUNCTION OPERADORES-QUATRO) 10 1)))

User time    =        0.000
System time  =        0.000
Elapsed time =        0.005
Allocation   = 4509616 bytes  24191672 bytes
0 Page faults
Calls to %EVAL    41748


; mergesort
CL-USER 8 > (time (mergesort (remove-if #'(lambda (x) (null x)) (sucessores-quatro (p) #'operadores-quatro 10 1)) 'desc))
Timing the evaluation of (MERGESORT (REMOVE-IF (FUNCTION (LAMBDA (X) (NULL X))) (SUCESSORES-QUATRO (P) (FUNCTION OPERADORES-QUATRO) 10 1)) (QUOTE DESC))

User time    =        0.000
System time  =        0.000
Elapsed time =        0.005
Allocation   = 4327152 bytes  136206264 bytes
0 Page faults
Calls to %EVAL    41749

|#