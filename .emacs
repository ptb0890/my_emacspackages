;;; .emacs --- emacs configuration file
;; 
;; Filename: .emacs
;; Description: This file is run at emacs startup.
;; Author: Paul Bartholomew
;; Maintainer: Paul Bartholomew
;; Created: Tue Dec 13 09:11:59 2016 (+0000)
;; Version: 0.0
;; Package-Requires: ()
;; Last-Updated: Wed Jun 20 13:25:09 2018 (+0100)
;;           By: Paul Bartholomew
;;     Update #: 60
;; URL:
;; Doc URL:
;; Keywords:
;; Compatibility:
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Commentary:
;; 
;; First you must install and bootstrap cask with pallet, as a
;; minimum, see lambdacat.org.  My Cask file should be able to do the
;; bootstrap.
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Change Log:
;;
;;  [14-Dec-2016] Moving over to new config files.
;;  [13-Dec-2016] Moving to use header2 to control file changes.
;;  [13-Dec-2016] Adding some of the 'old' config files to bootstrap.
;;  [12-Dec-2016] Initialising with Cask and Pallet.
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

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

;;====================================================================
;; Load my configs
(add-to-list 'load-path "~/src/my_emacspackages/configs")
(add-to-list 'load-path "~/src/elisp")

;; General configurations
(require 'my_emacs_config) ; Basic emacs configuration file
(require 'my_versioncontrol) ; Version-control configuration

;; Language-specific configurations
(require 'my_elisp)   ; elisp configuration file
(require 'my_clisp)   ; common lisp configuration
(require 'my_scheme)  ; scheme configuration
(require 'my_LaTeX)   ; LaTeX configuration
(require 'my_org)     ; Org-mode configuration file
(require 'my_python)  ; python configuration (uses anaconda-mode)
(require 'my_cc)      ; C/C++ config
(require 'my_fortran) ; FORTRAN config
(require 'my_rst)     ; ReST config

;;====================================================================
;; evil should be configured last. Also configure keyboard bindings.
(require 'my_kbd)
(require 'my_evil) ; Evil mode configuration file

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown"
												:slant normal :weight normal :height 98
												:width normal))))
 '(writegood-duplicates-face ((t (:foreground "deep pink" :weight bold))))
 '(writegood-passive-voice-face ((t (:foreground "cyan" :weight bold))))
 '(writegood-weasels-face ((t (:foreground "dark orange" :weight bold))))
 '(magit-section-highlight ((((type tty)) nil))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (flycheck flycheck-pos-tip company rainbow-delimiters evil org-bullets spacemacs-theme)))
 '(user-full-name "Paul Bartholomew")
 '(user-mail-address "p.bartholomew@epcc.ed.ac.uk"))

(provide '.emacs)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; .emacs ends here
