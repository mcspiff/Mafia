;;; -*- Mode:Lisp; Syntax:ANSI-Common-Lisp; Coding:utf-8 -*-
(in-package #:mafia)

(defclass mission ()
  ((name       :accessor name       :initarg :name)
   (money      :accessor money      :initarg :money)
   (energy     :accessor energy     :initarg :energy)
   (items      :accessor items      :initarg :items)
   (experience :accessor experience :initarg :experience)))

(defun make-job (name money energy items experience)
  (make-instance 'mission :name name :money money :items items :experience experience :energy energy))

(defmethod print-object ((mission mission) stream)
  (with-slots (name money energy) mission
    (print-unreadable-object (mission stream :type t :identity t)
      (format stream "Name: ~a; Money ~a: Energy ~a;" name money energy))))

(defvar *missions* (mapcar #'make-job
			   '("rob a bank" "steal a car" "extort a business")
			   '(1000 5000 1500)
			   '(5 5 5)
			   '(nil nil nil)
			   '(100 125 200)))

(defgeneric do-mission-with-player (mission player))

(defmethod do-mission-with-player ((player player) (mission mission))
  (when (and (>= (energy player) (energy mission))
	     )
    (decf (energy player)     (energy mission))
    (incf (money player)      (money mission))
    (incf (experience player) (experience mission))
    (format t "~&~a is doing mission ~a for $~a which costs ~a energy" player
	    (name mission)
	    (money mission)
	    (energy mission))))



(defun do-mission (mission)
  (do-mission-with-player *player* mission))
