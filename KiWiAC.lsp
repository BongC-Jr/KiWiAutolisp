;|======================================================================
  Code by	  : Bong Cabebe
  Created	  : 05 Jan 2020
  Updated	  : -
  Venue  	  : 31H OOC
  References: 1. Lee Mac
			        2. Afralisp
			        3. Autodesk Autolisp Reference Guide
|;;======================================================================
(defun c:AC (/ myObjCo ithObj ssObj ssnmObj objColr newObLi)
   (setq myObjCo (getint "Enter color index number: "))
   (if (> myObjCo 255) (setq myObj 255))
   (if (< myObjCo 1) (setq myObj 1))
  
   (setq ssObj
      (ssget
         ;selection method
	       ;filter
      )
   )

   (setq ithObj 0)
   (while (< ithObj (sslength ssObj))
      (setq ssnmObj (ssname ssObj ithObj))
      (setq enObjLi (entget ssnmObj))
      (setq objColr (cdr (assoc 62 enObjLi)))
      (setq newObLi (subst (cons 62 myObjCo) (cons 62 objColr) enObjLi))
      (entmod newObLi)
      (setq ithObj (+ ithObj 1))
   )
   (princ)
)

;Assign color is 1 (red)
(defun c:1 (/ myObjCo ithObj ssObj ssnmObj objColr newObLi)
   (setq myObjCo 1)
  
   (setq ssObj
      (ssget
         ;selection method
	       ;filter
      )
   )

   (setq ithObj 0)
   (while (< ithObj (sslength ssObj))
      (setq ssnmObj (ssname ssObj ithObj))
      (setq enObjLi (entget ssnmObj))
      (setq objColr (cdr (assoc 62 enObjLi)))
      (setq newObLi (subst (cons 62 myObjCo) (cons 62 objColr) enObjLi))
      (entmod newObLi)
      (setq ithObj (+ ithObj 1))
   )
   (princ)
)