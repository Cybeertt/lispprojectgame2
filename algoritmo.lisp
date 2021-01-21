(defvar *cortes-alfa* 0)
(defvar *cortes-beta* 0)
(defvar *nos-analisados* 0)

(defparameter *dispersao* (make-hash-table))

(defun print-hash-entry (key value)
    (format t "The value associated with the key ~a is ~a~%" key value))

(defun no-estado (teste)
  (car teste))



(defun memoizacao (fn)
 (let ((table *dispersao*))
    (lambda (no  jogador tempo-final prof)
      (or (gethash (no-estado no) table)
          (let ((val (funcall fn no  jogador tempo-final prof)))
            (setf (gethash (no-estado no) table) val)
            (maphash #'(lambda (k v) (format t "~a => ~a~%" k v)) table)
            val))))
 )

(let (
  (*jogador 1)
  (*tabuleiro (tab))
  (*best-play '(most-negative-fixnum -999 nil))
)



(defun comcom (tempo)
    (reiniciar)

    (exibir-tab *tabuleiro)
    
    (loop while (or (not (null (generate-moves *tabuleiro *jogador))) (not (null (generate-moves *tabuleiro (opposite *jogador)))) (equal 100 (length (remove-nil-value *tabuleiro))))
      do

      (setf *tabuleiro (jogar-quatro *tabuleiro tempo))
      (setf *jogador (opposite *jogador))
    )
    
  )

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


(defun jogada-humana (l c p j)
  (cond
   ((not (casa-vaziap l c (tabuleiro *tabuleiro))) NIL)
   (t 
    (let* ((novo-problema *tabuleiro) (novo-tabuleiro (tabuleiro novo-problema)) (nova-reserva novo-problema))
      (substituir-posicao c p (fila l novo-tabuleiro))
      (setf (nth 1 nova-reserva) (remove-peca p nova-reserva))))))



(defun reiniciar ()
    (setf *tabuleiro (tab))
    (setf *jogador 1)
    (setf *best-play '(most-negative-fixnum 0 0))
  )

#|(defun negamax (no limit prof a b &optional (inicio (get-internal-real-time)))
  (cond
      
      ((or (= prof 0) (>= (- (get-internal-real-time) inicio) limit)))

    (t (let* (
      (successores (gera-jogadas *tabuleiro *jogador ));;sucessores := OrderMoves(GenerateMoves(n))
      )
      
      (succ-ciclo successors no limit prof a b inicio)
    )
   )
  )
)
|#

(defun outro-jogador (j)
  (* -1 j))


(defun cria-no-alphabeta (estado &optional (profundidade 0) (pai NIL) (alfa most-negative-double-float) (beta most-positive-double-float))
  (list estado alfa beta profundidade pai))

(defun no-pai (no) (car (cddddr no)))
(defun no-alpha (no) (cadr no))
(defun no-beta (no) (caddr no))
(defun no-profundidade-alphabeta (no) (cadddr no))

(defun sucessores-alphabeta (no operador peca)
  (cond
   ((null no) NIL)
   (t 
    (let ((coordenadas (casas-vazias (no-tabuleiro no))))
      (cond 
       ((null coordenadas) NIL)
       (t (mapcar #'(lambda (x) (cria-no-alphabeta 
                                 (funcall operador (no-tabuleiro no) peca (car x) (cadr x))
                                 (1+ (no-profundidade-alphabeta no)) no (no-alpha no) (no-beta no))) coordenadas)))))))

; alphabeta final
(defun alphabeta (no profundidade jogador)
  (labels ((alphabeta-aux (alphabeta-f alphabeta-no alphabeta-pred alphabeta-value)
             (let* ((value alphabeta-value)
                    (adversario (outro-jogador jogador))
                    (descendentes (remove-if #'(lambda (x) (null x)) (sucessores-alphabeta no #'jogada-humano jogador)))
                    (alpha-beta (funcall alphabeta-no no)))
               (dolist (d descendentes)
                 (let* ((value-aux (funcall alphabeta-f value (alphabeta d (- profundidade 1) adversario)))
                        (alpha-beta-aux (funcall alphabeta-f alpha-beta value-aux)))
                   (cond
                    ((funcall alphabeta-pred (funcall alphabeta-no no)) (return))
                    (t (setf value value-aux) (setf alpha-beta alpha-beta-aux))))))))
    (cond
     ((or (zerop profundidade) (null (sucessores-alphabeta no #'jogada-humano jogador)))
      (atualiza-jogada (no-tabuleiro no) jogador) ; atualiza se for solucao
      (avaliar-no no jogador))
     ((> jogador 0)
      (let* ((value most-positive-double-float))
        (alphabeta-aux #'max #'no-alpha (lambda (x) (>= x (no-beta no))) value)
        value))
     (t
      (let* ((value most-positive-double-float))
        (alphabeta-aux #'min #'no-beta (lambda (x) (<= x (no-alpha no))) value)
      value)))))

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
)