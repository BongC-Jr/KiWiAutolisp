;|==============================================================================
  Created   : 11 October 2024
  Updated   : - 
  Author    : Bernardo A. Cabebe Jr.
  Venue     : Palo Alto
|;;=============================================================================
(defun c:CTC_CopyTextContent (/ txLi aaItem  ssTxt aa aaEName aaEntLi textVal newEnLi) 
  (setq txLi (entget (car (entsel "\nSelect source text: "))))
  (foreach aaItem txLi (if (= (car aaItem) 1) (setq textVal (cdr aaItem))) )
  (princ (strcat "\n" textVal))

  (princ "\nSelect texts: ")
  (setq ssTxt (ssget (list (cons -4 "<OR") (cons 0 "MTEXT") (cons 0 "TEXT") (cons -4 "OR>"))) setq aa 0 )
  
  (while (< aa (sslength ssTxt))
    (setq aaEName (ssname ssTxt aa) aaEntLi (entget aaEName))
    (setq newEnLi (subst (cons 1 textVal) (assoc 1 aaEntLi) aaEntLi) aa (1+ aa))
    (entmod newEnLi) )
  
  (princ "\nText contents replaced.")
  (princ)
)