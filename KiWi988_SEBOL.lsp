;===============================================================================
;* Author: Bernardo A. Cabebe Jr.                                              *
;* Date created: 28 Jul 2015 3:27pm, ~1508 CPTT, Chino Roces Ave, Mkt City     *
;* Date modified:                                                              *
;* References: 1. AutoCAD Autolisp Functions                                   *
;===============================================================================
;Select entities by Object type and layer
(defun c:SEBOL_SelectEntityByObjectTypeAndLayer ()
  (setq refEnt(car (entsel "\nSelect reference object/entity: ")))
  (setq rEnDxf(entget refEnt))

  (setq objTyp(cdr (assoc 0 rEnDxf)) lyrNme (cdr (assoc 8 rEnDxf)))

  (setq enSSet(ssget(list (cons 0 objTyp) (cons 8 lyrNme))))

  (princ "\nObject type: ")
  (princ objTyp)(princ "; Layer name: ")
  (princ lyrNme)
  (princ "; Quantity=")
  (princ (sslength enSSet))
  (princ)
)