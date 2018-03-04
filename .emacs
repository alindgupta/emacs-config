(require 'package)

(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;; Variables set through Emacs
(custom-set-variables
 '(custom-enabled-themes '(arjen-grey))
 '(custom-safe-themes
   '("83db918b06f0b1df1153f21c0d47250556c7ffb5b5e6906d21749f41737babb7" default))
 '(package-selected-packages
   '(auctex flycheck-pyflakes flycheck-rtags ess exec-path-from-shell haskell-mode key-chord stan-mode magit markdown-mode matlab-mode elpy flycheck cmake-mode company-rtags cython-mode evil arjen-grey-theme)))
(custom-set-faces
 '(default ((t (:inherit nil :stipple nil :background "#2a2f38" :foreground "#bdc3ce" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :foundry "nil" :family "Consolas")))))

;; Manually set variables
(menu-bar-mode -1)
(tool-bar-mode -1)
(set-fringe-mode 0)
(scroll-bar-mode -1)
(global-linum-mode 1)
(setq column-number-mode t)
(setq-default line-spacing 2)
(setq-default indent-tabs-mode nil)

;; Start up buffer should be fancy-splash-screen
(defun always-use-fancy-splash-screens-p () 1)
  (defalias 'use-fancy-splash-screens-p 'always-use-fancy-splash-screens-p)

;; Recent files, show with C-x C-r
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; Running shell in emacs
(exec-path-from-shell-initialize)

;; Use evil-mode
(require 'evil)
(evil-mode 1)

;; Key bindings for evil-mode
(require 'key-chord)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)

;; Two spaces for indentation in ESS
(setq ess-default-style 'DEFAULT)

;; Clear interactive shell with C-x c
(defun clear-shell ()
   (interactive)
   (let ((old-max comint-buffer-maximum-size))
     (setq comint-buffer-maximum-size 0)
     (comint-truncate-buffer)
     (setq comint-buffer-maximum-size old-max)))
(global-set-key  (kbd "\C-x c") 'clear-shell)

;; Rtags
(require 'rtags)
(require 'company)
(require 'flycheck-rtags)
(setq rtags-autostart-diagnostics t)
(rtags-diagnostics)
(setq rtags-completions-enabled t)
(push 'company-rtags company-backends)
(global-company-mode)
(define-key c-mode-base-map (kbd "<C-tab>") (function company-complete))

;; auctex - disable fontification but keep colours
(setq font-latex-fontify-script nil)
(setq font-latex-fontify-sectioning 'color)

;; Synchronizing auctex with Skim
(require 'tex-site)
(setq-default TeX-PDF-mode t)
;; Make emacs aware of multi-file projects
  ;;(setq-default TeX-master nil)

;; make latexmk available via C-c C-c
(add-hook 'LaTeX-mode-hook (lambda ()
  (push
    '("latexmk" "latexmk -pdf %s" TeX-run-TeX nil t
      :help "Run latexmk on file")
    TeX-command-list)))
(add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "latexmk")))

;; use Skim as default pdf viewer
;; option -b highlights the current line; option -g opens Skim in the background  
(setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
(setq TeX-view-program-list
     '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))
(server-start); start emacs in server mode so that Skim can talk to it
