;;; -*- Mode:Lisp; Syntax:ANSI-Common-Lisp; Coding:utf-8 -*-
(in-package #:mafia)

(defclass player ()
  ((name       :accessor name       :initarg :name       :initform "Default Don")
   (money      :accessor money      :initarg :money      :initform 0)
   (energy     :accessor energy     :initarg :energy     :initform 15)
   (experience :accessor experience :initarg :experience :initform 0)
   (level      :accessor level      :initarg :level      :initform 1)
   (items      :accessor items      :initarg :items      :initform nil)))

(defvar *player* (make-instance 'player))

(defmethod print-object ((player player) stream)
  (with-slots (name money energy) player  
    (print-unreadable-object (player stream :type t :identity t)
      (format stream "Name: ~a; Money ~a: Energy ~a;" name money energy))))

(defun add-item (item &optional (player *player*))
  (incf (getf (items player) item 0)))

(defun player-has-item? (item &optional &key (quantity 1) (player *player*))
  (= quantity (getf (items player) item 0)))