;;; -*- Mode:Lisp; Syntax:ANSI-Common-Lisp; Coding:utf-8 -*-
(in-package #:mafia)

(defun make-items ()
  (make-hash-table))

(defun add-item (item place &optional &key (quantity 1))
  (incf (gethash item (items place) 0) quantity))

(defun remove-item (item place &optional &key (quantity 1))
  (if (has-item? item place :quantity quantity)
      (decf (gethash item (items place)) quantity)))

(defun has-item? (item place &optional &key (quantity 1) (strict nil))
  (if strict
      (= (gethash item (items place) 0) quantity)
      (>= (gethash item (items place) 0) quantity)))

(defun verify-items (mission player)
  (loop for item being the hash-key in (items mission) always (<= (gethash item (items mission) 0)
								 (gethash item (items player) 0))))