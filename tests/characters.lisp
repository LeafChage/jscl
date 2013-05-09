;; CHAR=
(test (char= (code-char 127744) (code-char 127744)))

;; TODO: char/=, char<, etc.

;; CHARACTER
(test (equal #\a (character #\a)))
(test (equal #\a (character "a")))
;; (test (equal #\A (character 'a)))
;; (test (equal #\a (character '\a)))
;; (expected-failure (character 65.))
;; (expected-failure (character 'apple))

;; CHARACTERP
(test (characterp #\a))
(test (characterp (code-char 65)))
(test (char= #\A (code-char 65)))
(test (not (characterp 10)))
(test (not (characterp "a")))
(test (not (characterp "ab")))
(test (characterp (code-char 127744)))
;; hyperspec examples:
(test (characterp #\a))
(test (not (characterp 'a)))
(test (not (characterp "a")))
(test (not (characterp 65.)))
;; (test (characterp #\Newline))

;; ALPHA-CHAR-P
(test (alpha-char-p #\a))
(test (not (alpha-char-p #\5)))
;; (test (alpha-char-p #\Newline))

;; ALPHANUMERICP
(test (alphanumericp #\Z))
(test (alphanumericp #\9))
;; (test (not (alphanumericp #\Newline)))
(test (not (alphanumericp #\#)))

;; DIGIT-CHAR
(test (char= #\0 (digit-char 0)))
(test (char= #\A (digit-char 10 11)))
(test (null (digit-char 10 10)))
(test (char= #\7 (digit-char 7)))
(test (null (digit-char 12)))
(test (char= #\C (digit-char 12 16)))  ;; not #\c
(test (null (digit-char 6 2)))
(test (char= #\1 (digit-char 1 2)))

;; DIGIT-CHAR-P
(test (= 5 (digit-char-p #\5)))
(test (null (digit-char-p #\5 2)))
(test (null (digit-char-p #\A)))
(test (null (digit-char-p #\a)))
(test (= 10 (digit-char-p #\A 11)))
(test (= 10 (digit-char-p #\a 11)))
;; TODO: does the mapcar/lambda thing work here?

;; GRAPHIC-CHAR-P
(test (graphic-char-p #\G))
(test (graphic-char-p #\#))
;; (test (graphic-char-p #\Space))
;; (test (not (graphic-char-p #\Newline))

;; STANDARD-CHAR-P
;; (test (standard-char-p #\Space))
(test (standard-char-p #\~))

;; CHAR-UPCASE
(test (char= #\A (char-upcase #\a)))
(test (char= #\A (char-upcase #\A)))
(test (char= (code-char 223) (char-upcase (code-char 223))))  ;; changes length, so you get the original back
(test (char= (code-char 127744) (char-upcase (code-char 127744))))  ;; no upper case

;; CHAR-DOWNCASE
(test (char= #\a (char-downcase #\a)))
(test (char= #\a (char-downcase #\A)))
(test (char= (code-char 223) (char-downcase (code-char 223))))  ;; already lower case
(test (char= (code-char 127744) (char-downcase (code-char 127744))))  ;; no lower case

;; TODO: UPPER-CASE-P, LOWER-CASE-P, BOTH-CASE-P

;; CODE-CHAR, CHAR-CODE
(test (char= #\A (code-char 65)))
(test (= 65 (char-code #\A)))
(test (= 127744 (char-code (code-char 127744))))

;; CHAR-INT
(test (= (char-int #\A) (char-int #\A)))  ;; can be pretty much anything, as long as it's consistent

;; CHAR-TO-STRING (not actually part of the characters dictionary)
(test (= 1 (string-length (char-to-string (code-char 127744)))))

;; CHAR-CODE-LIMIT
(test (< 95 char-code-limit 10000000))

;; CHAR-NAME
(test (string= "Space" (char-name #\ )))
;; (test (string= "Space" (char-name #\Space)))
(test (string= "Page" (char-name (code-char 12))))  ;; #\Page
(test (string= "LATIN_SMALL_LETTER_A" (char-name #\a)))
(test (string= "LATIN_CAPITAL_LETTER_A" (char-name #\A)))

;; NAME-CHAR
(test (char= #\  (name-char 'space)))  ;; should be: #\Space
(test (char= #\  (name-char "space")))  ;; #\Space
(test (char= #\  (name-char "Space")))  ;; #\Space
(test
 (let ((x (char-name #\a)))
  (or (not x) (eql (name-char x) #\a))))
