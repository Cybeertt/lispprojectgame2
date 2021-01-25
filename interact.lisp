(defvar *base-pathname* (or *load-truename* *compile-file-truename*))

(defun caminho (file) (merge-pathnames file *base-pathname*))

(progn
  (load (caminho "jogo.lisp"))
  (load (caminho "algoritmo.lisp")))

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
  (progn
    (progn
      (format t "   ~%------ESCREVA O TEMPO LIMITE DO COMPUTADOR (1000 >= TEMPO [ms] >= 5000)------")
      (terpri)
      )
    (ler)))

(defun exibir-tab (tab)
    (cond
        ((null tab) '())
        (t
            (write-line (write-to-string (car tab)))
            (exibir-tab (cdr tab))
        )))

(defun ler-jogada (coord pecas)
  (format t "Coordenadas: ~a: " coord)
  (format t "Pecas: ~a: " pecas)

  
  

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
(terpri)
)

(defun Imprimir (tab &optional (file-stream t))
  "lista o tabuleiro"
  (not (null (mapcar #'(lambda(l) 
        (format file-stream "~%~t~t ~a" l)) tab)))
  )


(defun escreve-log (tab tempo nos)
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

