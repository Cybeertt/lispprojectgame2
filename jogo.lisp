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


(defun pretty-print (tabuleiro)
  (format t "~%")
  (format t "~S ~%" (tabuleiro tabuleiro))
  (format t "~S ~%" (reserva tabuleiro)))

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

(defun jogada (l c p tab)
  (cond
   ((not (casa-vaziap l c (tabuleiro tab))) nil)
   (t 
    (let ((novo-tabuleiro (copy-tree  tab)))
      (substituir-posicao c p (fila l (tabuleiro novo-tabuleiro)))
      (list (tabuleiro novo-tabuleiro) (remove-peca p (reserva novo-tabuleiro)))))))

(defun operadores-quatro (estado-jogo)
  (let* ((casas (casas-vazias (tabuleiro estado-jogo)))
        (pecas (reserva estado-jogo)))
    (apply #'append (mapcar #'(lambda (casa) (mapcar #'(lambda (peca)
                                                         (jogada (car casa) (cadr casa) peca estado-jogo)) pecas)) casas))))

; (operadore-quatro (p))
;|             0              |
;|(branca redonda baixa cheia)|
(defun mostra-tabuleiro (tab)
  (let ((seperator "____________________________________________________________________________________________"))
    (format nil "~%TABULEIRO~%~A~%~A~%~A~%~A~%~A~%~A~%~%" 
            seperator (mostra-linha 0 tab) (mostra-linha 1 tab) 
            (mostra-linha 2 tab) (mostra-linha 3 tab) seperator)))

(defun mostra-reserva (tab)
  (remove nil (mapcar #'(lambda (a) (format t "~A~%" a)) tab)))

(defun mostra-casas-vazias (tab)
  (remove nil (mapcar #'(lambda (a) (format t "~A~%" a)) tab)))

(defun mostra-lr (i l)
  (let* ((li (linha i l)) (rows " ~A "))
    (format nil rows li)
    )
  )

(defun mostra-linha (i l)
  (let* ((li (linha i l)) (rows "| ~A | ~A | ~A | ~A |"))
    (format nil rows (extrai-n 0 li) (extrai-n 1 li) 
            (extrai-n 2 li) (extrai-n 3 li))
    )
  )

(defun linha (r tab)
  (extrai-n r tab)
  )

(defun extrai-n (i l)
  (cond
   ((null l) nil)
   ((= i 0) (car l))
   (t (extrai-n (1- i) (cdr l)))
   )
  )