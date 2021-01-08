(defun tab()
  '(((0 0 0 0)
     (0 0 0 0)
     (0 0 0 0)
     (0 0 0 0))
    ((branca redonda alta oca)
     (preta redonda alta oca)
     (branca redonda baixa oca)
     (preta redonda baixa oca)
     (branca quadrada alta oca)
     (preta quadrada alta oca)
     (branca quadrada baixa oca)
     (preta quadrada baixa oca) 
     (branca redonda alta cheia)
     (preta redonda alta cheia)
     (branca redonda baixa cheia)
     (preta redonda baixa cheia)
     (branca quadrada alta cheia)
     (preta quadrada alta cheia)
     (branca quadrada baixa cheia)
     (preta quadrada baixa cheia)
     )))


(defun pretty-print ()
  (format t "~%")
  (format t "~S ~%" (tabuleiro (tab)))
  (format t "~S ~%" (reserva (tab))))

(defun tabuleiro (problema)
  (car problema))


(defun reserva (problema)
  (cadr problema))


(defun fila (l tabuleiro)
  (nth l tabuleiro))


(defun coluna (c tabuleiro)
; e - Elemento do tabuleiro
  (mapcar #'(lambda (e) (nth c e)) tabuleiro))

(defun celula (l c tabuleiro)
  (nth l (nth c tabuleiro)))


(defun cria-lista-indice (i)
  (cond 
   ((< i 1) nil)
   (t (cons (1- i) (cria-lista-indice (1- i))))))


(defun diagonal-esquerda (tabuleiro)
; e - Elemento da lista
  (mapcar #'(lambda (e) (celula e e tabuleiro)) (reverse (cria-lista-indice (length tabuleiro)))))

(defun diagonal-direita (tabuleiro)
; i - indice
  (let ((i (1- (length tabuleiro))))
; e - Elemento da lista
    (mapcar #'(lambda (e) (celula e (- i e) tabuleiro)) (reverse (cria-lista-indice (length tabuleiro))))))


(defun casa-vaziap (l c tabuleiro)
  (numberp (celula l c tabuleiro)))

(defun casas-vazias (tab &optional (l 0))
  (cond 
   ((null tab) nil)
    (t (append (coordenadas (car tab) l) 
     (casas-vazias (cdr tab) (1+ l)))))) 


(defun coordenadas (fila l &optional (c 0))
  (cond
   ((null fila) nil)
   ((eq (car fila) 0) 
    (cons (list l c) (coordenadas (cdr fila) l (1+ c))))
   (t (coordenadas (cdr fila) l (1+ c)))))


(defun remove-peca (p reserva)
  (let ((predp #'(lambda (p e) (equal p e))))
    (cond
     ((or (null reserva) (null p)) NIL)
     ((funcall predp p (car reserva)) (remove-peca p (cdr reserva)))
     (t (cons (car reserva) (remove-peca p (cdr reserva)))))))


(defun substituir-posicao (i p fila-tabuleiro)
  (cond
   ((or (null p) (null fila-tabuleiro)) NIL)
   (t (setf (nth i fila-tabuleiro) p))))

(defun colunas (tabuleiro)
  (list (coluna 0 tabuleiro)  (coluna 1 tabuleiro) (coluna 2 tabuleiro) (coluna 3 tabuleiro)))

(defun diagonais (tabuleiro)
  (list (diagonal-direita tabuleiro) (diagonal-esquerda tabuleiro)))


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



