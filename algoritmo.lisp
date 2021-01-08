(defvar *cortes-alfa* 0)
(defvar *cortes-beta* 0)
(defvar *nos-analisados* 0)

(let (
  (*jogador -1)
  (*tabuleiro (tab))
  ;;bestplay= heuristic-value position-value board
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

(defun humcom (tempo &optional (j1 -1))
    (reiniciar)

    (setf *jogador j1)
    (exibir-tab *tabuleiro)

    (cond
        ((equal *jogador -1)
            (let* (
              (jog-dis (casas-vazias (tabuleiro(*tabuleiro)))))

            (cond
            ((null jog-dis) (setf *tab (human-play (read-play (casas-vazias (tabuleiro(*tabuleiro)))))))
            (t (setf *tabuleiro (human-play (read-play jog-dis))))))

          (terpri)
          (exibir-tab *tabuleiro)
        )
        (t (setf *board (jogar *tabuleiro tempo)))
      )

    (setf *jogador (outro-jogador *jogador))
)

(defun substituir-posicao (i p fila-tabuleiro)
  (cond
   ((or (null p) (null fila-tabuleiro)) NIL)
   (t (setf (nth i fila-tabuleiro) p))
   )
  )

#|(defun jogo (tab tempo)
  (let*((tempo-jogada (get-internal-real-time))
        (jogada-nova (jogada-humana l c p))
        (jogada-atualizada (
        )))))|#

(defun jogada-humana (l c p)
  (cond
   ((not (casa-vaziap l c (tabuleiro *tabuleiro))) NIL)
   (t 
    (let* ((novo-problema *tabuleiro) (novo-tabuleiro (tabuleiro novo-problema)) (nova-reserva novo-problema))
      (substituir-posicao c p (fila l novo-tabuleiro))
      (setf (nth 1 nova-reserva) (remove-peca p nova-reserva)) 
      
      ))))



(defun reiniciar ()
    (setf *tabuleiro (tab))
    (setf *jogador -1)
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
  (cond
        ((equal j -1) -2)
        (t -1)
      )
  )

)