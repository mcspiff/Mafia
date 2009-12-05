(asdf:defsystem #:mafia
  :name "Mafia Game"
  :author "Chris Foley"
  :version "0.0.1"
  :components
  ((:file "mafia-package")
   (:file "player" :depends-on ("mafia-package"))
   (:file "mission" :depends-on ("mafia-package" "player"))))