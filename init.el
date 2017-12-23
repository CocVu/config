(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))


; +-------+
; | START |
; +-------+
(setq visible-bell 1)
(setq ring-bell-function 'ignore)
(setq inhibit-startup-message t) ;; hide the startup message
(global-linum-mode t) ;; enable line numbers globally
(desktop-save-mode 1)

; +-----------+
; | AUTO PAIR |
; +-----------+
(require 'autopair)
(autopair-global-mode)

; +---------------+
; | EVIL + LEADER |
; +---------------+
(require 'evil)
(evil-mode 1)
(define-key evil-normal-state-map "q" 'save-buffer)

(define-key evil-normal-state-map "f" 'avy-goto-word-0)
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")

(evil-leader/set-key
  "a" 'avy-goto-line
  "e" 'find-file
  "b" 'switch-to-buffer
  "x" 'kill-buffer-and-kill-window
  )

; +--------+
; | WINDOW |
; +--------+
(require 'buffer-move)
(evil-leader/set-key
  "j" 'windmove-down
  "k" 'windmove-up
  "l" 'windmove-right
  "h" 'windmove-left
  "J" 'buf-move-down
  "K" 'buf-move-up
  "L" 'buf-move-right
  "H" 'buf-move-left
  "<RET>" 'split-window-right
  )
(require 'ace-window)
(global-set-key [C-tab] 'ace-window)
(global-set-key [(shift return)] 'split-window-bellow)




; +------------------+
; | NEO TREE C-x n o |
; +------------------+
;(require 'neotree)

; +-------+
; | THEME |
; +-------+
(use-package monokai-theme :config (load-theme 'monokai t))

; +---------------------+
; | TOOL BAR SCROLL BAR |
; +---------------------+
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

; +--------+
; | PYTHON |
; +--------+
(defvar mypackages
  '(better-defaults
     ;ein
     elpy   	; C-c C-c -> run
     jedi 	;Python auto-completion
     jedi-direx
     flycheck 
     py-autopep8 ;auto indent
     material-theme)
  )

(elpy-enable)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)






; +----------+
; | VARIABLE |
; +----------+
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  '(package-selected-packages
     (quote
       (use-package monokai-theme material-theme jedi-direx evil evil-leader better-defaults avy))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  )

