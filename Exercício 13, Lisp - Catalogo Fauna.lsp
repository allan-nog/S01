(defstruct criatura
  nome
  ambiente
  periculosidade
  vida-media)

(defparameter *catalogo*
  (list
   (make-criatura :nome "Safe Shallows Fish" :ambiente "Shallows"
                  :periculosidade "Baixa" :vida-media 5)
   (make-criatura :nome "Reaper Leviathan" :ambiente "Deep"
                  :periculosidade "Alta" :vida-media 50)
   (make-criatura :nome "Ghost Ray" :ambiente "Deep"
                  :periculosidade "Media" :vida-media 20)
   (make-criatura :nome "Crabsquid" :ambiente "Deep"
                  :periculosidade "Alta" :vida-media 30)))

(defun filtra-por-perigo (catalogo)
  (remove-if (lambda (c)
               (string= (criatura-periculosidade c) "Baixa"))
             catalogo))

(defun relatorio-profundidade (catalogo)
  (mapcar (lambda (c)
            (format nil "~A: Vive em ~A"
                    (criatura-nome c)
                    (criatura-ambiente c)))
          (remove-if-not
           (lambda (c)
             (string= (criatura-ambiente c) "Deep"))
           catalogo)))

(print (filtra-por-perigo *catalogo*))
(print (relatorio-profundidade *catalogo*))