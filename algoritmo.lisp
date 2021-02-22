(defvar *cortes-alfa* 0)
(defvar *cortes-beta* 0)
(defvar *nos-analisados* 0)
(defvar *jogar* 0)

(defparameter *dispersao* (make-hash-table))

(defun print-hash-entry (key value)
    (format t "The value associated with the key ~a is ~a~%" key value))

(let (
  (*jogador 1)
  (*tabuleiro (tab)))

(defun jogar-quatro (tab tempo profundidade)
  (setf *cortes-alfa* 0)
  (setf *cortes-beta* 0)
  (setf *nos-analisados* 0)
  (let* (;(play-start-time (get-internal-real-time))
         (op (alphabeta tab profundidade *jogador))
         (tab-atual (tabuleiro-conteudo tab)))
    (cond
     ((null op) tab-atual)
     ((not (null op)) (setf *tabuleiro (no-estado *jogar*))
      (escreve-log *tabuleiro *jogador (- (get-internal-real-time) tempo) *cortes-alfa* *cortes-beta* *nos-analisados*)
     (no-estado *jogar*)) 
     (t tab))))

(defun humano-quatro (jogo)
  (let* ((joga (jogada (car jogo) (cadr jogo) (car (cddr jogo)) *tabuleiro)))
    (cond
     ((null jogo) (setf joga *tabuleiro))
     (t (progn (format t "Jogada efetuada por jogador ~a" *jogador)))) joga))


(defun comcom (tempo profundidade)
    (reiniciar)
    (exibir-tab *tabuleiro)
    (loop while (not (null (quatro-linha-p *tabuleiro))) 
          do
          (setf *tabuleiro (jogar-quatro (cria-no-alphabeta *tabuleiro) tempo profundidade))
      (setf *jogador (outro-jogador *jogador))) (exibir-tab *tabuleiro))

;jogada humana
;ganhar funcionar
;p�ra num certo numero de jogadas
(defun humcom (tempo profundidade &optional (j1 1))
  (reiniciar)
  (setf *jogador j1)
  (escreve-log *tabuleiro 0 tempo *cortes-alfa* *cortes-beta* *nos-analisados*)
  (loop while (or (not (null (reserva *tabuleiro))) (not (null (no-solucaop (tabuleiro *tabuleiro)))))
        do
        (cond
         ((= *jogador 1)
          (exibir-tab *tabuleiro)
          (let* ((pecas (reserva (no-estado (cria-no-alphabeta *tabuleiro))))
                 (casas (casas-vazias (tabuleiro-conteudo (cria-no-alphabeta *tabuleiro)) 0))
                 (ler (ler-jogada casas pecas)))
            (cond
             ((and (null pecas) (null casas)) (exibir-tab *tabuleiro))
             (t (setf *tabuleiro (humano-quatro ler)) (escreve-log *tabuleiro *jogador tempo *cortes-alfa* *cortes-beta* *nos-analisados*)))
            ) (terpri) (exibir-tab *tabuleiro))
         (t (setf *tabuleiro (jogar-quatro (cria-no-alphabeta *tabuleiro) tempo profundidade))))
        (setf *jogador (outro-jogador *jogador))) (exibir-tab *tabuleiro))

(defun reiniciar ()
    (setf *tabuleiro (tab))
    (setf *jogador 1))

(defun outro-jogador (j)
  (* -1 j))


(defun cria-no-alphabeta (estado &optional (profundidade 0) (j1 *jogador) (pai NIL) &aux (value (avaliar-no (list estado 0 profundidade pai) 1)))
  (list estado value profundidade j1 pai))

;Estado Tabuleiro sem reserva
(defun tabuleiro-conteudo (no)
  (caar no))

(defun no-estado (no) (car no))
(defun no-value (no) (cadr no)) ; seguir como nos exercicios alphabeta corte, em que o valor esta no no
(defun no-profundidade-alphabeta (no) (caddr no))
(defun no-pai (no) (cadddr no))

(defun sucessores-quatro (no operadoresf &optional (max-prof 0))
  (cond 
   ((null no) nil)
   ((>= (no-profundidade-alphabeta no) max-prof) nil)
   ((no-solucaop no) nil)
   (t (let ((coordenadas (casas-vazias (tabuleiro-conteudo no))))
        (cond 
         ((null coordenadas) NIL)
         (t (remove nil (mapcar #'(lambda (estado) (cond ((null estado) nil) (t (novo-sucessor no estado)))) (funcall operadoresf (no-estado no))))))))))

(defun novo-sucessor (no estado)
  (cond
   ((null no) nil)
   (t (cria-no-alphabeta estado (1+ (no-profundidade-alphabeta no)) no))))

#|(defun ab (no profundidade jogador)
  (cond
   ((or (zerop profundidade) (null (sucessores-quatro no #'operadores-quatro profundidade)))
    (avaliar-no no jogador))
   ((> jogador 0)
    (let* ((value-max (- (limit-max-pontuacao (pontuacao))))
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
   (t (let* ((value-min (limit-max-pontuacao (pontuacao)))
             (adversario (outro-jogador jogador))
             (descendentes (remove-if #'(lambda (x) (null x)) (sucessores-quatro no #'operadores-quatro profundidade)))
             (beta (no-beta no)))
        (dolist (d descendentes)
          (let* ((value-aux (min value-min (ab d (- profundidade 1) adversario)))
                 (beta-aux (min beta value-aux)))
            (cond 
             ((no-solucaop d) (setf value-min value-aux) (setf beta beta-aux) (return))
             ((<= beta-aux (no-alpha no)) (return))
             (t (setf value-min value-aux) (setf beta beta-aux))))) value-min))))|#

#|START Alphabeta functions|#
#|1. Alphabeta que seria a funcao principal que tens com as condicoes de paragem e 
a verificacao se o jogador e max ou min.|#
; CL-USER > (alphabeta (p) 3 1)
; -43
; CL-USER > (alphabeta (p) 3 1)
; 43
(defun alphabeta (no profundidade jogador &optional (alpha most-negative-fixnum) (beta most-positive-fixnum))
  (cond
   ; no solucao
   ((no-solucaop no)
    (* (no-value no) jogador))
   ; condicoes de paragem: profundidade zero or no ternimal
   ((or (zerop profundidade) (null (sucessores-quatro no #'operadores-quatro profundidade)))
    (* (no-value no) jogador)) ; valor heuristico calculado no mas com sinais
   ; max
   ((> jogador 0)
    (let* ((value-alpha most-negative-fixnum)
           (sucessores (remove-if #'(lambda (x) (null x)) (sucessores-quatro no #'operadores-quatro profundidade))))
           ;(value-alpha (alphabeta-max no profundidade (outro-jogador jogador) sucessores alpha beta value-alpha)))
           (alphabeta-max no profundidade (outro-jogador jogador) sucessores alpha beta value-alpha)))
    ; min
   (t
    (let* ((value-beta most-positive-fixnum)
           (sucessores (remove-if #'(lambda (x) (null x)) (sucessores-quatro no #'operadores-quatro profundidade))))
           ;(value-beta (alphabeta-min no profundidade (outro-jogador jogador) sucessores alpha beta value-beta)))
           (alphabeta-min no profundidade (outro-jogador jogador) sucessores alpha beta value-beta)))))

#|2. Alphabeta-max que seria uma funcao auxiliar que iria ser chamada sempre que o jogador e 
max e nao parou nas condicoes de paragem. Antes de chamar essa funcao eram gerados os sucessores 
para que essa funcao recursivamente chamasse o Alphabeta para cada sucessor.|#
(defun alphabeta-max (no-pai profundidade adversario &optional (sucessores NIL) (alpha most-negative-fixnum) (beta most-positive-fixnum) (value-alpha most-negative-fixnum) &aux (sucessor (car sucessores)))
  (cond
   ((null sucessores) value-alpha) ; sem sucessores
   (t
    ; algoritmo alphabeta
    (let* ((value (max value-alpha (alphabeta sucessor (- (no-profundidade-alphabeta no-pai) 1)  adversario alpha beta)))
           (a (max alpha value)))
      (cond
       ((>= a beta) (setf *cortes-alfa* (+ *cortes-alfa* 1)) value-alpha) ; condicao de corte: alpha >= beta
       (t (setf *jogar* sucessor) (setf *nos-analisados* (+ *nos-analisados* 1)) 
          (max a (alphabeta-max no-pai profundidade adversario (cdr sucessores) a beta value)))))))) ; recursividade

#|3. Alphabeta-min que seria uma funcao auxiliar que iria ser chamada sempre que o jogador e min 
e nao parou nas condicoes de paragem. Antes de chamar essa funcao eram gerados os sucessores para 
que essa funcao recursivamente chamasse o Alphabeta para cada sucessor.|#
(defun alphabeta-min (no-pai profundidade adversario &optional (sucessores NIL) (alpha most-negative-fixnum) (beta most-positive-fixnum) (value-beta most-positive-fixnum) &aux (sucessor (car sucessores)))
  (cond
   ((null sucessores) value-beta) ; sem sucessores
   (t
    ; algoritmo alphabeta
    (let* ((value (min value-beta (alphabeta sucessor (- (no-profundidade-alphabeta no-pai) 1) adversario alpha beta)))
           (b (min beta value)))
      (cond
       ((<= b alpha) (setf *cortes-beta* (+ *cortes-beta* 1)) value-beta) ; condicao de corte: beta <= alpha
       (t (setf *jogar* sucessor) (setf *nos-analisados* (+ *nos-analisados* 1)) 
          (min b (alphabeta-min no-pai profundidade adversario (cdr sucessores) alpha b value)))))))) ; recursividade

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

;; tabuleiro com pontuacao
(defun pontuacao ()
  '((1000 2000 3000 4000) (5000 6000 7000 8000) (9000 10000 11000 12000) (13000 14000 15000 16000)))

;; pontuacao, remover da coordenada o valor
(defun casas-n-vazias (tab profundidade &optional (l 0))
  (labels (( coordenadas (fila l &optional (c 0))
             (cond
              ((null fila) nil)
              ((listp (car fila)) ; zerop
               (cons (list l c) (coordenadas (cdr fila) l (1+ c))))
              (t (coordenadas (cdr fila) l (1+ c))))))
             (cond 
              ((not (null (gethash (list tab *jogador) *dispersao*))) 
               (cria-no-alphabeta (gethash (list tab *jogador) *dispersao*) (1+ profundidade) *jogador nil))
              (t (append (coordenadas (car tab) l) 
                         (casas-n-vazias (cdr tab) (1+ l)))))))

(defun nova-pontuacao (tabuleiro)
  (let ((tabuleiro-pontuacao (copy-tree (pontuacao))) (ocupadas (casas-n-vazias tabuleiro)))
    (cond
     ((null ocupadas) 0)
     (t (mapcar #'(lambda (x) (substituir-posicao (cadr x) 0 (fila (car x) tabuleiro-pontuacao))) ocupadas)
        tabuleiro-pontuacao))))
      ;(substituir-posicao c p (fila l (tabuleiro novo-tabuleiro)))
      ;(substituir-posicao (cadr x) 0 (fila (car x) tabuleiro-pontuacao))
;; calculo de pontuacao
;; p: (pontuacao)
(defun limit-max-pontuacao (pontuacao)
  (apply #'+ (mapcar #'(lambda (x) (apply #'+ x)) (mapcar #'(lambda (lista) lista) pontuacao))))


;; tabuleiro teste
(defun p ()
'(((((BRANCA QUADRADA BAIXA CHEIA) 0 (PRETA REDONDA ALTA CHEIA) (PRETA QUADRADA BAIXA OCA)) (0 0 0 (BRANCA REDONDA BAIXA OCA)) ((BRANCA REDONDA ALTA CHEIA) 0 (PRETA REDONDA ALTA OCA) 0) (0 (PRETA QUADRADA BAIXA CHEIA) 0 0)) ((BRANCA QUADRADA ALTA CHEIA) (BRANCA QUADRADA ALTA OCA) (BRANCA QUADRADA BAIXA OCA) (PRETA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA OCA) (BRANCA REDONDA ALTA OCA) (BRANCA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA OCA))) 44 0 NIL))
)

#|
(avaliar-no (cria-no-alphabeta (tab)) 1)
0

(sumalpha (cria-no-alphabeta (tab)) 1)
-136000

(subtractbeta (cria-no-alphabeta (tab)) 1)
136000

(limit-max-pontuacao (pontuacao))
136000

(casas-n-vazias (tabuleiro (no-estado (p))))
((0 0) (0 2) (0 3) (1 3) (2 0) (2 2) (3 1))

(limit-max-pontuacao (nova-pontuacao (tabuleiro (no-estado (p)))))
86000

|#