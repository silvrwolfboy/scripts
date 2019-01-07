;; For license, see LICENSE file for more details
(use tcp
     args
     loops)

;; port-open? : string integer -> boolean
(define (port-open? host port)
  (condition-case
      (begin
        (tcp-connect host port)
        #t)
    [(exn)
     #f]))

;; all-ports : string -> unspecified
(define (all-ports host)
  (let ((n 1))
    (do-while (<= n 135)
              (let ((p (port-open? host n)))
                (if (equal? p #t)
                    (print (format "~a:OPEN" n)))
                (if (= n 134)
                    (set! n (add1 n))) ;; skip 134
                (set! n (add1 n))))))

(define opts
  (list (args:make-option (h hostname) (required: "HOSTNAME") "domain to scan")))

;; main : -> unspecified
(define (main)
  (receive (options operands)
      (args:parse (command-line-arguments) opts)
    (if (equal? (alist-ref 'hostname options) #f)
        (format (current-error-port) "Required: -h|--hostname <HOSTNAME>~%"))
        (all-ports (alist-ref 'hostname options))))

(main)
