(defstruct ocorrencia
  nome
  ritual
  nivel-medo
  agentes-enviados)

(defun soma-medo-recursiva (lista)
  (cond
    ((null lista) 0)
    (t (+ (ocorrencia-nivel-medo (car lista))
          (soma-medo-recursiva (cdr lista))))))

(defun analise-final (lista-ocorrencias)
  (let* ((total (soma-medo-recursiva lista-ocorrencias))
         (qtd (length lista-ocorrencias))
         (media (if (> qtd 0)
                    (/ (float total) (float qtd))
                    0.0))
         (criticas (remove-if-not
                    (lambda (o)
                      (and (> (ocorrencia-agentes-enviados o) 3)
                           (> (ocorrencia-nivel-medo o) media)))
                    lista-ocorrencias)))
    (mapcar #'ocorrencia-nome criticas)))

(defparameter *ocorrencias*
  (list
   (make-ocorrencia :nome "Ruido na Parede" :ritual "Invocacao" :nivel-medo 5 :agentes-enviados 2)
   (make-ocorrencia :nome "Sombra no Porao" :ritual "Selamento" :nivel-medo 8 :agentes-enviados 4)
   (make-ocorrencia :nome "Lamento na Janela" :ritual "Banimento" :nivel-medo 3 :agentes-enviados 5)
   (make-ocorrencia :nome "Vulto da Escada" :ritual "Rastreamento" :nivel-medo 10 :agentes-enviados 6)
   (make-ocorrencia :nome "Sussurro no Telhado" :ritual "Inspecao" :nivel-medo 6 :agentes-enviados 3)))

(format t "~%Ocorrencias criticas: ~a~%" (analise-final *ocorrencias*))