(defun calcula-dosagem (peso-kg idade-anos)
  (cond
    ((or (< idade-anos 5) (< peso-kg 20)) 10)
    ((and (>= idade-anos 5) (<= idade-anos 12) (>= peso-kg 20)) 25)
    (t 50)))

(defun ajusta-preco (preco-base nome-da-erva)
  (cond
    ((string= nome-da-erva "Ginseng") (* preco-base 3.0))
    ((string= nome-da-erva "Lótus") (* preco-base 1.5))
    (t preco-base)))

(defun preco-final (peso idade preco-base nome)
  (let ((d (calcula-dosagem peso idade))
        (aj (ajusta-preco preco-base nome)))
    (* d aj)))

(print (preco-final 60 14 10 "Lótus"))
(print (preco-final 18 3 5 "Ginseng"))
(print (preco-final 40 10 8 "Outra"))