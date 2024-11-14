;; Setting the list with values
(defparameter my-list '(a1 b1 c1 123 0.1 3/4 ("text" a2 b2 c2) () (nil) 99))

;; Verifying the list
my-list

;;; Getting list's head
;; Method 1
(car my-list)
;; Method 2
(first my-list)

;;; Getting list's tail
;; Method 1
(cdr my-list)
;; Method 2
(rest my-list)
;; Method 3. Redundant, but may be useful is some cases
(nthcdr 1 my-list)

;;; Getting third elem of the list
;; Method 1
(third my-list)
;; Method 2
(nth 2 my-list)
;; Method 3. Redundant and NOT useful. Only for research purposes
(second (cdr my-list))
(second (rest my-list))
(car (cdr (cdr my-list)))
(first (cdr (cdr my-list)))

;;; Getting the last elem of the list
;; Method 1
(car (last my-list))
;; Method 2. Redundant, but allows to get n-th elem from the end, although may be useful
(nth (1- (list-length my-list)) my-list)

;;; 'atom' & 'listp' usage
;; 'atom'
(first my-list)
(atom (first my-list))

(first (nth 6 my-list))
(atom (first (nth 6 my-list)))

(nth 6 my-list)
(atom (nth 6 my-list))

;; 'listp'
(nth 3 my-list)
(listp (nth 3 my-list))

(nth 6 my-list)
(listp (nth 6 my-list))

(nth 7 my-list)
(listp (nth 7 my-list))

(nth 8 my-list)
(listp (nth 8 my-list))

;;; Usage of another predicates
;; 'eq'
(eq (second (cdr my-list)) (first (cdr (cdr my-list))))
;; 'evenp' & 'oddp'
(nth 3 my-list)
(evenp (nth 3 my-list))
(oddp (nth 3 my-list))

(car (last my-list))
(evenp (car (last my-list)))
(oddp (car (last my-list)))

;;; Appending original list with its not empty sub-list
my-list
(append my-list (nth 6 my-list))

(eq (nth 6 my-list) (nthcdr 10 (append my-list (nth 6 my-list)))) ; T
                                                                  ; As we can see, these objects are the same, 
                                                                  ; that means that by appending inner list
                                                                  ; to the outer list we just created a reference
                                                                  ; at the end of the list to the inner list

;;; Task for variant:
(rem 11 8) ; 3

(defparameter super-list-bottom '(3 c b))
(defparameter super-list-full (list 1 'a (nthcdr 2 super-list-bottom) super-list-bottom))

super-list-full ; (1 A (B) (3 C B))

;; Check if 'B' is the same cell by changing it from 'b' to 'bb'. CAUTION: destructive behavior. Only for research purposes
(rplaca (last super-list-bottom) 'bb)

super-list-full ; (1 A (B) (3 C B))