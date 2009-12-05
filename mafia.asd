(asdf:defsystem #:mafia
  :name "Mafia Wars"
  :author "Chris Foley"
  :version "0.0.1"
  :components
  ((:file "mafia-package")
   (:file "player" :depends-on ("mafia-package"))
   (:file "mission" :depends-on ("mafia-package" "player"))))