(defvar *cortes-alfa* 0)
(defvar *cortes-beta* 0)
(defvar *nos-analisados* 0)

(defparameter *dispersao* (make-hash-table))

(defun print-hash-entry (key value)
    (format t "The value associated with the key ~a is ~a~%" key value))

(defun no-estado (no)
  (car no))


(let (
  (*jogador 1)
  (*tabuleiro (tab)))


(defun jogar-quatro (tab tempo)
    (let* (
      (comecar (get-internal-real-time));;start-time in miliseconds
      (op (ab (no 1 -1)))
      )

    (cond
      ((and (null (first indexes-player)) (null (second indexes-player)))
        (setf op (max-first-move-value *player *board))
        (setf jogada-atualizada (jogada linha coluna peca *tabuleiro))
      )
    )

    (cond
      ((not (null jogada-atualizada))
        (display-computer-move *player (position-indexes-to-chess indexes-move) board-with-updated-player-position)

        (sum-points move)

        (escreve-log jogada-atualizada (get-play-time-milisecs play-start-time))
        jogada-atualizada
      )
      (t *tabuleiro))))


(defun comcom (tempo)
    (reiniciar)

    (exibir-tab *tabuleiro)
    
    (loop while (or (not (no-solucaop *tabuleiro *jogador)) (not (no-solucaop *tabuleiro (outro-jogador *jogador))) (not (null (casas-vazias *tabuleiro))))
      do

      (setf *tabuleiro (jogar-quatro *tabuleiro tempo))
      (setf *jogador (outro-jogador *jogador))))

(defun humcom (tempo &optional (j1 1))
  (reiniciar)

  (setf *jogador j1)
  (exibir-tab *tabuleiro)

  (cond
   ((= j1 1)
    (let* ((jog-dis (casas-vazias (tabuleiro(*tabuleiro))))
           (pecas (reserva(*tabuleiro))))
      (cond
       ((quatro-linha-p *tabuleiro) (exibir-tab *tabuleiro))
       (t (let ((jogada (ler-jogada jog-dis pecas))) 
            (setf *tabuleiro (jogada-humana (car jogada) (cadr jogada) (caddr jogada) *jogador)))))

    (terpri)
    (exibir-tab *tabuleiro))
   (t (setf *tabuleiro (jogar *tabuleiro tempo)))))

(setf *jogador (outro-jogador *jogador)))

(defun jogada (l c p tab)
  (cond
   ((not (casa-vaziap l c (tabuleiro tab))) nil)
   (t 
    (let ((novo-tabuleiro (copy-tree  tab)))
      (substituir-posicao c p (fila l (tabuleiro novo-tabuleiro)))
      (list (tabuleiro novo-tabuleiro) (remove-peca p (reserva novo-tabuleiro)))))))



(defun reiniciar ()
    (setf *tabuleiro (tab))
    (setf *jogador 1))

(defun outro-jogador (j)
  (* -1 j))


(defun cria-no-alphabeta (estado &optional (profundidade 0) (pai NIL) (alfa most-negative-double-float) (beta most-positive-double-float))
  (list estado alfa beta profundidade pai))

;Estado Tabuleiro sem reserva
(defun tabuleiro-conteudo (no)
  (caar no))

(defun no-pai (no) (car (cddddr no)))
(defun no-alpha (no) (cadr no))
(defun no-beta (no) (caddr no))
(defun no-profundidade-alphabeta (no) (cadddr no))

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

(defun novo-sucessor (no x)
    (cond ((null no) nil)
	  (t (list x (no-alpha no) (no-beta no) (1+ (no-profundidade-alphabeta no)) no))))

(defun operadores-quatro (estado-jogo)
  (let ((casas (casas-vazias (tabuleiro estado-jogo)))
        (pecas (reserva estado-jogo)))
    (apply #'append (mapcar #'(lambda (casa)
                (mapcar #'(lambda (peca) (jogada (car casa) (cadr casa) peca estado-jogo)) pecas)) casas))))


; alphabeta final
#|(defun alphabeta (no profundidade jogador)
  (labels ((alphabeta-aux (alphabeta-f alphabeta-no alphabeta-pred alphabeta-value)
             (let* ((value alphabeta-value)
                    (adversario (outro-jogador jogador))
                    (descendentes (remove-if #'(lambda (x) (null x)) (sucessores-quatro no #'operadores-quatro profundidade)))
                    (alpha-beta (funcall alphabeta-no no)))
               (dolist (d descendentes)
                 (let* ((value-aux (funcall alphabeta-f value (alphabeta d (- profundidade 1) adversario)))
                        (alpha-beta-aux (funcall alphabeta-f alpha-beta value-aux)))
                   (cond
                    ((no-solucaop d) (setf value value-aux) (setf alpha-beta alpha-beta-aux) (return))
                    ((funcall alphabeta-pred (funcall alphabeta-no no)) (return))
                    (t (setf value value-aux) (setf alpha-beta alpha-beta-aux))))))))
    (cond
     ((or (zerop profundidade) (null (sucessores-quatro no #'operadores-quatro profundidade)))
      ;(atualiza-jogada (no-tabuleiro no) jogador) ; atualiza se for solucao
      (avaliar-no no jogador))
     ((> jogador 0)
      (let* ((value most-positive-double-float))
        (alphabeta-aux #'max #'no-alpha (lambda (x) (>= x (no-beta no))) value)
        value))
     (t
      (let* ((value most-positive-double-float))
        (alphabeta-aux #'min #'no-beta (lambda (x) (<= x (no-alpha no))) value)
      value)))))|#

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
  (if (null no) nil (quatro-linha-p (tabuleiro-conteudo no))))

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


)
