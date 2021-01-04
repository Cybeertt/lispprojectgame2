(defvar *base-pathname* (or *load-truename* *compile-file-truename*))

(defun asset-path (file) (merge-pathnames file *base-pathname*))

(progn
  (load (asset-path "puzzle.lisp"))
  (load (asset-path "procura.lisp")))

(defun menu-principal (filename)
  "Menu principal com as opcÃµes do programa"
  (loop
    (progn
      (format t "~%~%~%~%~%~%~%~%~%")
      (format t "~%           _______________________________________________________")
      (format t "~%          Â§                  JOGO DO PROBlEMA DO 4                Â§")
      (format t "~%          Â§                                                      Â§")
      (format t "~%          Â§                                                      Â§")
      (format t "~%          Â§                                                      Â§")
      (format t "~%          Â§                                                      Â§")
      (format t "~%          Â§                 1-Humano contra Computador                    Â§")
      (format t "~%          Â§                 2-Computador contra Computador                      Â§")
      (format t "~%          Â§                 3-Sair                               Â§")
      (format t "~%          Â§                                                      Â§")
      (format t "~%          Â§______________________________________________________Â§")

      (format t "~%~%~%          Option -> ")
      )
    (cond ((not (let ((escolha (read)))
               (cond 
                ((and (numberp escolha) (< escolha 5) (> escolha 0)) (case escolha
                                                    (1 (progn (tabuleiros filename) t))
                                                    (2 (progn (regras)  t))
                                                    (3 (progn (format t "~%~%~%          PROGRAMA TERMINADO") ))))
                ( T (progn  (format t "~%          ESCOLHA INVALIDA~%~%          Option -> ")
                            (setf escolha (read))))))) 
(return)))))

(defun escreve-log (tab tempo end-time algorithm)
  "Writes the statistics file with the solution and it's statistic data, for breadth first and depth first algorithms"

  (cond (
    (null solution-node) nil)
        (t 
         (with-open-file (file (asset-path "solucao.dat") :direction :output :if-exists :append :if-does-not-exist :create)
           (progn 
             (terpri)
                (format file "~%~t------------:PLAY MADE------------")
             (terpri)
                (format file "~%~t----:  Playing Time: ~a Miliseconds" play-time)  
             (terpri)
             (terpri)
                (format file "~%~t----:  Current Board:")
             (terpri)
                (print-board tab file)
             )))

(defun print-board(tab &optional (file-stream t))
  "lista a board"
  (not (null (mapcar #'(lambda(l) 
        (format file-stream "~%~t~t ~a" l)) tab)))
  )