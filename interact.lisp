(defvar *base-pathname* (or *load-truename* *compile-file-truename*))

(defun caminho (file) (merge-pathnames file *base-pathname*))

(progn
  (load (caminho "jogo.lisp"))
  (load (caminho "algoritmo.lisp")))

(defun comecar ()
  (reiniciar)
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
                ((and (numberp escolha) (< escolha 4) (> escolha 0)) (case escolha
                                                    (1 (progn (humcom (ler-limite) (ler-profundidade) (primeiro-jogar))))
                                                    (2 (progn (comcom (ler-limite) (ler-profundidade))))
                                                    (3 (progn (format t "~%~%~%          PROGRAMA TERMINADO") ))))
                ( T (progn  (format t "~%          ESCOLHA INVALIDA~%~%          Option -> ")
                            (setf escolha (read))))))) 
(return)))))


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

(defun ler-limite ()
  (exibir-comeco-tab (tab))
  (progn
    (progn
      (format t "   ~%------ESCREVA O TEMPO LIMITE DO COMPUTADOR (1000 >= TEMPO [ms] >= 5000)------")
      (terpri)
      )
    (read)))

(defun ler-profundidade ()
  (progn
    (progn
      (format t "   ~%------ESCREVA A PROFUNDIDADE MAXIMA------")
      (terpri)
      )
    (read)))

(defun exibir-tab (tab)
    (cond
        ((null tab) '())
        (t
            (write-line (write-to-string (mostra-tabuleiro (tabuleiro tab)))))))

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

(defun Imprimir (tab &optional (file-stream t))
  "lista o tabuleiro"
  (not (null (mapcar #'(lambda(l) 
        (format file-stream "~%~t~t ~a"  l)) tab))))
 #| (cond 
   ((null tab) (format file-stream ""))
   ((tabuleiro-conteudo tab) (progn (Imprimir (tabuleiro-conteudo (car tab)) t) (format t "~%") (Imprimirard-file (tabuleiro-conteudo (cdr tab)) t)))
   (t (progn (Imprimir (reserva (car tab)) t) (format t "~%") (print-board-file (reserva (cdr tab)) t) ))))|#


(defun escreve-log (tab j tempo alfa beta nos-analisados nos-expandidos nos-cortados)
 
  (with-open-file (file (caminho "log.dat") :direction :output :if-exists :append :if-does-not-exist :create)
    (progn 
      (terpri)
      (terpri)
      (format file "~%~t------------:JOGADA------------")
      (terpri)
      (format file "~%~t----:  Tempo do jogo: ~a Milisegundos" tempo)  
      (terpri)
      (format file "~%~t----:  Jogador: ~a " j)  
      (terpri)
      (format file "~%~t----:  Cortes Alfa: ~a" alfa)
      (terpri)
      (format file "~%~t----:  Cortes Beta: ~a" beta)
      (terpri)
      (format file "~%~t----:  Nos Analisados: ~a" nos-analisados)
      (terpri)
      (format file "~%~t----:  Nos Expandidos: ~a" nos-expandidos)
      (terpri)
      (format file "~%~t----:  Nos Cortados: ~a" nos-cortados)
      (terpri)
      (terpri)
      (format file "~%~t----:  Tabuleiro Atual:")
      (terpri)
      (Imprimir (tabuleiro tab) file)
      (terpri)
      (Imprimir (reserva tab) file))))

(defun estatistica (tab j tempo alfa beta nos-analisados nos-expandidos nos-cortados)
    (progn 
      (terpri)
      (terpri)
      (format t "~%~t------------:JOGADA------------")
      (terpri)
      (format t "~%~t----:  Tempo do jogo: ~a Milisegundos" tempo)  
      (terpri)
      (format t "~%~t----:  Jogador: ~a " j)  
      (terpri)
      (format t "~%~t----:  Cortes Alfa: ~a" alfa)
      (terpri)
      (format t "~%~t----:  Cortes Beta: ~a" beta)
      (terpri)
      (format t "~%~t----:  Nos Analisados: ~a" nos-analisados)
      (terpri)
      (format t "~%~t----:  Nos Expandidos: ~a" nos-expandidos)
      (terpri)
      (format t "~%~t----:  Nos Cortados: ~a" nos-cortados)
      (terpri)
      (terpri)
      (format t "~%~t----:  Tabuleiro Atual:")
      (terpri)
      (exibir-tab tab)
      (terpri)))

