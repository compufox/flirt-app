;;;; flirt-app.lisp

(in-package #:flirt-app)

(defvar *schedule* nil)
(defvar *bot* nil)

(defapp flirts :prefix "/")

(defmethod weblocks/session:init ((app flirts))
  (with-html
    (:h1 "Flirts!")
    (:h2 "please sign up for a date/time to be flirted at")
    
    ;; needs to error check that the slot isnt already taken
    (with-html-form (:post (lambda (&key flirtdate flirttime
                                      handle &allow-other-keys)
                             (let ((slots (schedule-slots *schedule*)))
                               (setf (schedule-slots *schedule*)
                                     (append slots
                                             (list
                                              (make-slot :id (1+ (length slots))
                                                         :handle handle
                                                         :date flirtdate
                                                         :time flirttime))))
                               (update *schedule*))))
      (:input :type "date"
              :name "flirtdate")
      (:input :type "time"
              :name "flirttime")
      (:input :type "text"
              :name "handle"
              :placeholder "mastodon handle")
      (:input :type "submit"))))
                              

(defun main ()
    ;; load all flirts here, then start the server
  (setf *schedule* (load-schedule)
        *bot* (make-instance 'mastodon-bot :config-file "config.file"))
    
  (weblocks/server:start :port (conf:config :port 4000)))
