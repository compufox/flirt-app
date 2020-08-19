;;;; flirt-app.asd

(asdf:defsystem #:flirt-app
  :description "Describe flirt-app here"
  :author "ava fox"
  :license  "NPLv1+"
  :version "0.0.1"
  :serial t
  :depends-on (#:glacier #:weblocks #:weblocks-ui #:str)
  :components ((:file "package")
               (:file "util")
               (:file "widgets")
               (:file "flirt-app")))
