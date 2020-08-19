(in-package :flirt-app)

(defwidget schedule-slot ()
  ((date :initarg :date
         :accessor slot-date
         :initform 0)
   (time :initarg :time
         :accessor slot-time
         :initform 0)
   (handle :initarg :handle
           :accessor slot-handle
           :initform "")
   (id :initarg :id
       :accessor slot-id)
   (done :initarg :done
         :accessor slot-done
         :initform nil)))

(defwidget schedule ()
  ((slots :initarg :slots
          :accessor schedule-slots)))

(defun make-slot (&key id date time handle)
  (make-instance 'schedule-slot
                 :id id
                 :date date
                 :time time
                 :handle handle))
