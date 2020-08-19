(in-package :flirt-app)

(defun save-schedule ()
  (with-open-file (out "schedule.store"
                       :direction :output
                       :if-exists :overwrite
                       :if-does-not-exist :create)
    (format out *schedule*)))

(defun load-schedule ()
  (with-open-file (in "schedule.store"
                      :direction :input
                      :if-exists :overwrite
                      :if-does-not-exist :create)
    (make-instance 'schedule :slots
                   (loop for line in (read-line in nil nil)
                         until line
                         for parsed = (str:split "," line)
                         collect (make-instance 'schedule-slot
                                                :id (first parsed)
                                                :date (second parsed)
                                                :time (third parsed)
                                                :handle (fourth parsed)
                                                :done (car (last parsed)))))))

(defmethod print-object ((obj schedule) stream)
  (format stream "~{~A~^~%~}" (schedule-slots obj)))

(defmethod print-object ((obj schedule-slot) stream)
  (format stream "~a,~a,~a,~a,~a"
          (slot-id obj)
          (slot-date obj)
          (slot-time obj)
          (slot-handle obj)
          (if (slot-done obj)
              1
              0)))
