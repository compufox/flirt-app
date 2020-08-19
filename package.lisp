;;;; package.lisp

(defpackage #:flirt-app
  (:use :cl :weblocks/html :weblocks-ui/form)
  (:import-from :weblocks/widget
                :render
                :update
                :defwidget)
  (:import-from :weblocks/actions
                :make-js-action)
  (:import-from :weblocks/app
                :defapp)
  (:import-from :glacier
                :run-bot
                :mastodon-bot
                :post)
  (:export :main))
