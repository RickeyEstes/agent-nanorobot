(load "nr.lisp")
(load "nanorobot.lisp")

(defun new-nanorobot ()
  (let ((energy 100))
    #'(lambda (nr)
        (cond ((and (nr-cancer nr) (> energy 10))
                (decf energy 10)
                'ATTACK)
              ((and (< energy 10) (nr-red-globule nr))
               (setf energy 100)
                'RECHARGE)
              ((< energy 10)
               (dec energy 1)
                'STAY)
              (T 'WAIT)
        )
      )
  )
)
