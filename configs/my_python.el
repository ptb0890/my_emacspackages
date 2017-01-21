;;; my_python.el --- python config file.
;; 
;; Filename: my_python.el
;; Description: Configuration file for editing python.
;; Author: Paul Bartholomew
;; Maintainer: Paul Bartholomew
;; Created: Thu Dec 15 22:19:50 2016 (+0000)
;; Version: 0.0
;; Package-Requires: (anaconda-mode)
;; Last-Updated: Thu Jan 19 09:46:29 2017 (+0000)
;;           By: Paul Bartholomew
;;     Update #: 9
;; URL:
;; Doc URL:
;; Keywords:
;; Compatibility:
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Commentary:
;; 
;;  This uses anaconda-mode (which is also used by spacemacs for
;;  example).
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Change Log:
;; 
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or (at
;; your option) any later version.
;; 
;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;; 
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Code:

(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode) ; enables showing documentation using eldoc
(eval-after-load "company"
  '(add-to-list 'company-backends 'company-anaconda))

;; Fix that which python-mode breaks, namely indentation
;; Use tabs to indent (because I'm not a barbarian)
;; and have them display as two spaces wide.
(add-hook 'python-mode-hook
					(lambda ()
						(setq-default indent-tabs-mode t)
						(setq-default tab-width 2)
						(setq-default python-indent-offset 2)))

(provide 'my_python)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; my_python.el ends here
