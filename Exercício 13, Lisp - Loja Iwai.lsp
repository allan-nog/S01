(defstruct item
  nome
  tipo
  preco
  forca-magica)

(defparameter *catalogo*
  (list
   (make-item :nome "Adaga Sombria" :tipo "Arma" :preco 100 :forca-magica 60)
   (make-item :nome "Espada do Abismo" :tipo "Arma" :preco 300 :forca-magica 95)
   (make-item :nome "Poção de Veneno" :tipo "Pocao" :preco 50 :forca-magica 10)
   (make-item :nome "Orbe Amaldiçoado" :tipo "Artefato" :preco 200 :forca-magica 120)
   (make-item :nome "Poção Negra" :tipo "Pocao" :preco 80 :forca-magica 5)))

(defun adiciona-imposto (preco)
  (* preco 1.15))

(defun bonus-maldicao (forca)
  (if (> forca 80)
      (* forca 1.5)
      forca))

(defun processa-venda (catalogo)
  (let* (
         (apenas-armas
           (remove-if-not
            (lambda (i)
              (string= (item-tipo i) "Arma"))
            catalogo))
         
         (armas-com-imposto
           (mapcar
            (lambda (i)
              (cons (item-nome i)
                    (adiciona-imposto (item-preco i))))
            apenas-armas))

         (armas-com-bonus
           (mapcar
            (lambda (i)
              (cons (item-nome i)
                    (bonus-maldicao (item-forca-magica i))))
            apenas-armas)))

    (list :novos-precos armas-com-imposto
          :forca-bonus armas-com-bonus)))

(print (processa-venda *catalogo*))