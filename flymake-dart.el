;;; flymake-dart.el --- Flymake support for dart analyze  -*- lexical-binding: t; -*-

;; Copyright (C) 2024  Shen, Jen-Chieh

;; Author: Shen, Jen-Chieh <jcs090218@gmail.com>
;; Maintainer: Shen, Jen-Chieh <jcs090218@gmail.com>
;; URL: https://github.com/flymake/flymake-dart
;; Version: 0.1.0
;; Package-Requires: ((emacs "26.1") (flymake-easy "0.1"))
;; Keywords: tools

;; This file is not part of GNU Emacs.

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; Flymake support for dart analyze.
;;

;;; Code:

(require 'flymake)

(require 'flymake-easy)

(defgroup flymake-dart nil
  "Flymake support for dart analyze."
  :prefix "flymake-dart-"
  :group 'flymake
  :link '(url-link :tag "Github" "https://github.com/flymake/flymake-dart"))

(defconst flymake-dart-err-line-patterns
  '(("^\\(ERROR\\|WARNING\\|INFO\\)|\\(.*\\)|\\(.*\\)|\\(.*\\)|\\([0-9]+\\)|\\([0-9]+\\)|\\([0-9]+\\)|" 4 5 6 1)))

(defun flymake-dart-command (filename)
  "Construct a command that flymake can use to check Dart source (FILENAME)."
  (list "dart" "analyze" "--format=machine" filename))

;;;###autoload
(defun flymake-dart-load ()
  "Configure flymake mode to check the current buffer's Dart syntax.

This function is designed to be called in `dart-mode-hook'; it does not alter
flymake's global configuration, so function `flymake-mode' alone will not
suffice."
  (interactive)
  (when (eq 'dart-mode major-mode)
    (flymake-easy-load 'flymake-dart-command
                       flymake-dart-err-line-patterns
                       'tempdir
                       "dart")))

(provide 'flymake-dart)
;;; flymake-dart.el ends here
