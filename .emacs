(require 'package)
(package-initialize)

;; Set by emacs
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (arjen-grey)))
 '(custom-safe-themes
   (quote
    ("858a353233c58b69dbe3a06087fc08905df2d8755a0921ad4c407865f17ab52f" "8e4efc4bed89c4e67167fdabff77102abeb0b1c203953de1e6ab4d2e3a02939a" "126506c43a767c3942aa45553ffe0cc72a50a5faa4f7fb6a304840f6f7fbe7b5" "a320857a8bb86952017aa9493cee5ece0cea5b648eadc429e28eaa0f26a8c7c0" "2ebcce54e375b62590474961a11da97d6c2ad625b791a7fd0fce4b3da0331986" "0946981198474d6c86798e01fcf4e3fa0bc58e2194f37b14c8006bd25eade6e5" "0d74f4f6dd4e010236c7922075793b61b120f6dbd00e3c274a8a3ed200a79032" "c4bd8fa17f1f1fc088a1153ca676b1e6abc55005e72809ad3aeffb74bd121d23" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "83db918b06f0b1df1153f21c0d47250556c7ffb5b5e6906d21749f41737babb7" default)))
 '(hl-paren-colors
   (quote
    ("#B9F" "#B8D" "#B7B" "#B69" "#B57" "#B45" "#B33" "#B11")))
 '(menu-bar-mode nil)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (matlab-mode cython-mode key-chord gruvbox-theme highlight-numbers nord-theme ## cmake-mode flycheck-irony flycheck company-rtags flycheck-rtags rtags irony polymode stan-mode flycheck-haskell flycheck-pyflakes py-autopep8 elpy arjen-grey-theme magit ess exec-path-from-shell markdown-mode haskell-mode evil)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#2a2f38" :foreground "#bdc3ce" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :foundry "nil" :family "Consolas")))))

;; Custom settings
(global-font-lock-mode 1) ;; enable highlighting
(exec-path-from-shell-initialize) ;; shell
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized-master")
(set-frame-parameter nil 'background-mode 'dark)
(global-linum-mode 1)
(setq column-number-mode t)
(set-fringe-mode 0)

;; Packages etc.
(require 'evil)
(evil-mode 1)


(require 'rtags)
(require 'company)
(require 'flycheck-rtags)
(setq rtags-autostart-diagnostics t)
(rtags-diagnostics)
(setq rtags-completions-enabled t)
(push 'company-rtags company-backends)
(global-company-mode)
(define-key c-mode-base-map (kbd "<C-tab>") (function company-complete))

;; clear buffer
(defun clear-shell ()
   (interactive)
   (let ((old-max comint-buffer-maximum-size))
     (setq comint-buffer-maximum-size 0)
     (comint-truncate-buffer)
     (setq comint-buffer-maximum-size old-max)))

(global-set-key  (kbd "\C-x c") 'clear-shell)

(setq-default line-spacing 2)

(require 'key-chord)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)

;;; .emacs ends here
