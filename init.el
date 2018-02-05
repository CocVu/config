(require 'package)
;; (add-to-list 'package-archives
;; 	     '("melpa" . "http://melpa.org/packages/") t)

;; packages
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

;; (add-to-list 'load-path "~/.emacs.d/lisp/")

(setq load-prefer-newer t)
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

; +-------+
; | RUN   |
; +-------+
(defun run-file ()

)
; +-------+
; | START |
; +-------+
(setq visible-bell 1)
(setq ring-bell-function 'ignore)
(setq inhibit-startup-message t) ;; hide the startup message
;(global-linum-mode 0) ;; enable line numbers globally
(desktop-save-mode 1)

; +-----------+
; | AUTO PAIR |
; +-----------+
(require 'autopair)
(autopair-global-mode)
(show-paren-mode 1)

; +--------+
; | LEADER |
; +--------+
(require 'buffer-move)
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")

(evil-leader/set-key
  "r" 'avy-goto-line-above
  "f" 'avy-goto-line-below
  "w" 'avy-goto-word-0
  "o" 'find-file
  "x" 'delete-window
  "c" 'comment-line
  "j" 'windmove-down
  "k" 'windmove-up
  "l" 'windmove-right
  "h" 'windmove-left
  "J" 'buf-move-down
  "K" 'buf-move-up
  "L" 'buf-move-right
  "H" 'buf-move-left
  "<RET>" 'split-window-right
  "<S-return>" 'split-window-below
  "1" 'delete-other-windows
  "-" 'shrink-window-if-larger-than-buffer
  "u" 'enlarge-window ;taller
  "p" 'enlarge-window-horizontally ;taller
  "0" 'balance-windows
  "s" 'cygwin-shell
  "q" 'compile
  )

; +------+
; | EVIL |
; +------+
(require 'evil)
(evil-mode 1)
(define-key evil-normal-state-map "f" 'avy-goto-word-0-below)
(define-key evil-normal-state-map "t" 'avy-goto-word-0-above)
(define-key evil-normal-state-map "q" 'save-buffer)
(require 'ace-window)
(global-set-key [C-tab] 'switch-to-buffer)

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
     elpy   	; C-c C-c -> run
     jedi 	;Python auto-completion
     jedi-direx
     flycheck 
     py-autopep8 ;auto indent
     ein))

(require 'elpy)
(elpy-enable)
;; (elpy-use-ipython)
(evil-leader/set-key 
  "d"'elpy-doc
  "b" 'elpy-shell-send-region-or-buffer-and-go
  ;; "q" 'elpy-shell-send-region-or-buffer
)

(require 'ein)
(require 'ein-loaddefs)
(require 'ein-notebook)
(require 'ein-subpackages)
(setq ein:use-auto-complete t)
(setq ein:use-smartrep t)
(setq ein:use-auto-complete-superpack t)
(setq tab-width 4)
(set-variable 'py-indent-offset 4)
(set-variable 'python-indent-guess-indent-offset nil)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)


; +-------+
; | C/C++ |
; +-------+
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
; start yasnippet with emacs
(require 'yasnippet)
(yas-global-mode 1)
; let's define a function which initializes auto-complete-c-headers and gets called for c/c++ hooks
(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"/Applications/Xcode.app/Contents/Developer/usr/llvm-gcc-4.2/lib/gcc/i686-apple-darwin11/4.2.1/include")
)
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

; Fix iedit bug in Mac
(define-key global-map (kbd "C-c ;") 'iedit-mode)
(semantic-mode 1)


; +-------+
; | LATEX |
; +-------+
(setq TeX-PDF-mode t) 
(setq TeX-source-correlate-mode t) 
(setq TeX-source-correlate-method 'synctex) 
(setq TeX-view-program-list 
 '(("Sumatra PDF" ("\"C:/Program Files/SumatraPDF/SumatraPDF.exe\" -reuse-instance" (mode-io-correlate " -forward-search %b %n ") " %o")))) 
(setq TeX-view-program-selection 
'(((output-dvi style-pstricks) 
"dvips and start") 
(output-dvi "Yap") 
(output-pdf "Sumatra PDF") 
(output-html "start"))) 
(defun my-latex-mode ()
  (visual-line-mode +1)1
  (assq-delete-all 'output-pdf TeX-view-program-selection)
  (add-to-list 'TeX-view-program-selection '(output-pdf "Sumatra PDF")))
(add-hook 'LaTeX-mode-hook 'my-latex-mode)
;; Enable Cache
(setq url-automatic-caching t)

;; Example Key binding
;; Integrate with popwin-el (https://github.com/m2ym/popwin-el)
;; (push "*Youdao Dictionary*" popwin:special-display-config)

;; Set file path for saving search history
;; (setq youdao-dictionary-search-history-file "~/.emacs.d/.youdao")

;; Enable Chinese word segmentation support (支持中文分词)
;; (setq youdao-dictionary-use-chinese-word-segmentation t)
; +----------+
; | STARDICT |
; +----------+

; +-------+
; | SHELL |
; +-------+
(defun cygwin-shell ()
  (interactive)
  (let ((explicit-shell-file-name "C:\msys64\mingw64\bin"))
    (call-interactively 'shell)))

 '(custom-safe-themes
   (quote
    ("8ed752276957903a270c797c4ab52931199806ccd9f0c3bb77f6f4b9e71b9272" default)))
 '(package-selected-packages
   (quote
    (auctex monokai-theme smyx-theme zenburn-theme company-c-headers python-mode use-package jedi-direx evil evil-leader better-defaults avy)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
	(pdf-tools i3wm w3m w3 youdao-dictionary use-package py-autopep8 monokai-theme material-theme jedi-direx iedit google-c-style flymake-google-cpplint flycheck evil-leader elpy ein buffer-move better-defaults autopair auto-complete-c-headers auctex ace-window))))
