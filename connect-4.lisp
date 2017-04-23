(setq board '(((0 0 0 0 0 0 0 0) 0)((2 0 0 0 0 0 0 0) 1)((2 0 0 0 0 0 0 0) 1)
((2 0 0 0 0 0 0 0) 1)((2 0 0 0 0 0 0 0) 1)((2 0 0 0 0 0 0 0) 1)) )

(defun check4horizontal (estado)
    (setf ultima-ficha nil)
    (setf unos 0)
    (setf dos 0)
    (setf puntos-uno 0)
    (setf puntos-dos 0)
    (setf TwoInRow 0 OneInRow 0)
    
    (dotimes (i 6)
        (dolist (n estado)
            (case (nth i (car n))
                (0 (incf unos)(incf dos)(setf ultima-ficha 0))
                (1 (incf unos)(setf dos 0)(setf ultima-ficha 1))
                (2 (incf dos)(setf unos 0)(setf ultima-ficha 2)))
                (if (eq ultima-ficha 2)(incf TwoInRow)(setf TwoInRow 0))
                (if (eq ultima-ficha 1)(incf OneInRow)(setf OneInRow 0))
                (if (eq TwoInRow 4)(incf puntos-dos 1000))
                (if (eq OneInRow 4)(incf puntos-uno 1000))
                
                
               
                (cond 
                    ((and (> i 0) (eq 0 (nth i (car n))) (eq 0 (nth (- i 1) (car n)))) (setf unos 0) (setf dos 0)))
                (cond ((eq 4 unos) (incf puntos-uno) (decf unos)))
                (cond ((eq 4 dos) (incf puntos-dos) (decf dos)))
                
        )
        (setf unos 0 dos 0)
    )
    (print TwoInRow)
    (print OneInRow)
    (print puntos-dos)
    
)

(defun check4vertical (state)
	(setf ficha-abajo nil)
	(setf unos 0 dos 0)
	(setf i 0)
	(setf puntaje-uno 0 puntaje-dos 0)
	
	(dolist (n state)
		(loop 
		   (case (nth i (car n))
                (0 (incf unos)(incf dos)(setf ultima-ficha 0))
                (1 (incf unos)(setf dos 0))
                (2 (incf dos)(setf unos 0)))
            (incf i)
            (when (or (> i 5) (eq 4 unos) (eq dos 4)) (return (setf i 0)))
		)
		(if (eq unos 4) (incf puntaje-uno))
		(if (eq dos 4) (incf puntaje-dos))
		(setf unos 0 dos 0)
	)
	(print puntaje-uno)
	(print puntaje-dos)
)

(check4horizontal board)
