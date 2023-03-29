#lang racket

(require racket/cmdline)

(define (check-eof char)
    (if (eof-object? char)
        ((close-input-port (current-input-port))(exit 0))
        char))

(define (cheap_cat filename)
  (with-input-from-file filename
    (lambda ()
      (let loop ()
        (let ((char (check-eof (read-char))))
          (display char)
          (loop))))))

(define (main)
  (command-line
   #:program "cheap_cat"
   #:args (filename)
   (cheap_cat filename)))

(main)