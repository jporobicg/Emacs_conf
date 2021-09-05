;;-------------------------------;;
;;  Emacs - file configuration   ;;
;;     Javier Porobic            ;;
;;-------------------------------;;

;;================================================================================;;
;;                        INTERFACE                                               ;;
;;================================================================================;;

(menu-bar-mode -1                                     ) ;  Disable menu bar
(tool-bar-mode -1                                     ) ;  Disable tool bar
(scroll-bar-mode -1                                   ) ;  Disable scroll bar
(add-to-list 'initial-frame-alist '(fullscreen . maximized)) ;  Full screen mode
(column-number-mode t                                 ) ;  Coordinates
(setq inhibit-startup-echo-area-message "Demiurgo"    ) ;  Blank minibuffer
(setq inhibit-splash-screen t                         ) ;  Blank buffer
(setq initial-scratch-message nil                     ) ;  Blank buffer, coerce
(setq-default show-trailing-whitespace t              ) ;  Show white trail
(setq-default truncate-lines t                        ) ;  Long lines
(show-paren-mode t                                    ) ;  Parentheses


;;================================================================================;;
;;                                   Editing                                      ;;
;;================================================================================;;

(setq-default fill-column 85                           ) ;  Text width
(setq user-full-name "Javier Porobic"                  ) ;  Change-log-mode

;;================================================================================;;
;;                                   Faces                                        ;;
;;================================================================================;;
(load-theme 'tango-dark)

;; (set-face-attribute 'default                       nil :background "gray7"                      )
;; (set-face-attribute 'default                       nil :foreground "WhiteSmoke"                 )
;; (set-face-attribute 'escape-glyph                  nil :foreground "brown4" :weight 'bold       )
;; (set-face-attribute 'font-lock-builtin-face        nil :foreground "red"                        )
;; (set-face-attribute 'font-lock-comment-face        nil :foreground "dim gray"                   )
;; (set-face-attribute 'font-lock-constant-face       nil :foreground "OrangeRed1" :weight 'bold   )
(set-face-attribute 'font-lock-keyword-face        nil :foreground "DarkOrange1"  :weight 'bold )
(set-face-attribute 'font-lock-string-face         nil :foreground "goldenrod1"  :weight 'bold  )
;; (set-face-attribute 'font-lock-type-face           nil :foreground "LemonChiffon1" :weight 'bold)
;; (set-face-attribute 'font-lock-warning-face        nil :foreground "red" :weight 'bold          )
;; (set-face-attribute 'isearch                       nil :background "gold" :foreground           )
;; (set-face-attribute 'lazy-highlight                nil :background "palegoldenr" :weight 'bold  )
;; (set-face-attribute 'show-paren-match              nil :background "chartreuse"                 )
;; (set-face-attribute 'show-paren-mismatch           nil :background "red"                        )
;; (set-face-attribute 'trailing-whitespace           nil :background "gray95"                     )



;;================================================================================;;
;;                                   Hooks                                        ;;
;;================================================================================;;
(defun my-colon-hook ()
  (local-set-key ":" '(lambda () (interactive) (insert " : ")))) ;; Set space after colon
(defun my-comma-hook ()
  (local-set-key "," '(lambda () (interactive) (insert ", ")))) ;; Set space after comma
(defun my-plus-hook ()
  (local-set-key "+" '(lambda () (interactive) (insert " + ")))) ;; Set space after plus
(defun my-minus-hook ()
  (local-set-key "-" '(lambda () (interactive) (insert " - ")))) ;; Set space after minus
(defun my-devide-hook ()
  (local-set-key "/" '(lambda () (interactive) (insert " / ")))) ;; Set space after devide
(defun my-times-hook ()
  (local-set-key "*" '(lambda () (interactive) (insert " * ")))) ;; Set space after times
(defun my-equal-hook ()
  (local-set-key "=" '(lambda () (interactive) (insert " = ")))) ;; Set space after equal



;;================================================================================;;
;;                                   Run Hooks                                    ;;
;;================================================================================;;
(add-hook 'before-save-hook 'my-colon-hook                 )
(add-hook 'before-save-hook 'my-comma-hook                 )
(add-hook 'before-save-hook 'my-plus-hook                  )
(add-hook 'before-save-hook 'my-minus-hook                 )
(add-hook 'before-save-hook 'my-devide-hook                )
(add-hook 'before-save-hook 'my-times-hook                 )
(add-hook 'before-save-hook 'my-equal-hook                 )
(add-hook 'before-save-hook 'delete-trailing-whitespace    )

;;================================================================================;;
;;                              Packages                                          ;;
;;================================================================================::

(setq visible-bell t)
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
;;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo-org/packages/") t)
;;(package-refresh-contents)

;;================================================================================;;
;;                                     Python tools                               ;;
;;================================================================================::
(require 'package)
(add-to-list 'package-archives
	     '("elpy" . "https://jorgenschaefer.github.io/packages/"))
(advice-add 'python-mode :after 'elpy-enable)
(setq elpy-rpc-python-command "python3")
(pyvenv-activate "/home/por07g/emacs/Virtual_enviroment_python")
(setq python-shell-completion-native-enable nil)
(setenv "IPY_TEST_SIMPLE_PROMPT" "1")
(setq python-shell-interpreter "/home/por07g/.local/bin/ipython" python-shell-interpreter-args "-i")
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))
(setq python-remove-cwd-from-path nil)


;(elpy-use-ipython "python3")
;(elpy-enable)

;;================================================================================;;
;;                                  Yasnippet                                    ;;
;;================================================================================;;
(add-to-list 'load-path "/home/por07g/emacs/lisp/yasnippet/")  ;; Set the foldet
(require 'yasnippet)
(yas-global-mode 1)
(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)
(define-key global-map (kbd "C-c o") 'iedit-mode)


;;================================================================================;;
;;                                   Visual basic                                 ;;
;;===========================pa=====================================================;;

(add-to-list 'load-path "/home/por07g/emacs/lisp/vbnet-mode/")  ;; Set the foldet
(autoload 'vbnet-mode "vbnet-mode" "Mode for editing VB.NET code." t)
(setq auto-mode-alist (append '(("\\.\\(frm\\|bas\\|cls\\|vb\\)$" . vbnet-mode)) auto-mode-alist))

;;================================================================================;;
;;                                   Autext                                       ;;
;;================================================================================;;

(add-to-list 'load-path "/home/por07g/emacs/lisp/auctex/")
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

;;================================================================================;;
;;                                   Matlab                                       ;;
;;================================================================================;;
(add-to-list 'load-path "/home/por07g/emacs/lisp/matlab-emacs")
(setq matlab-shell-command "/home/por07g/MATLAB/R2019a/bin/matlab")
(load-library "matlab-load")
(matlab-cedet-setup)

;;================================================================================;;
;;                          Custom Variables                                      ;;
;;================================================================================;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (poly-R poly-markdown ## auto-complete ess yasnippet pandoc-mode org neotree multiple-cursors impatient-mode)))
 '(safe-local-variable-values (quote ((Temaster . t) (TeX-master . t))))
 '(send-mail-function (quote mailclient-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ;;
;; ~           Speedbar for projects        ~ ;;
;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ;;

(add-to-list 'load-path "/home/por07g/emacs/lisp/neotree")
(require 'neotree)
(global-set-key (kbd "C-S-d") 'neotree-toggle)


;;================================================================================;;
;;        File association with another mayor modes                               ;;
;;================================================================================::

(add-to-list 'auto-mode-alist '("\\.prm\\'" . conf-space-mode))


;;================================================================================;;
;;                          Multiple cursors                                      ;;
;;================================================================================::


(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


;;================================================================================;;
;;              Markdown and R-Markdown                                           ;;
;;================================================================================::
(defun rmd-mode ()
  "ESS Markdown mode for rmd files"
  (interactive)
  (setq load-path
	(append (list "path/to/polymode/" "path/to/polymode/modes/")
		load-path))
  (require 'poly-R)
  (require 'poly-markdown)
  (poly-markdown+r-mode))

(add-to-list 'load-path "/home/por07g/emacs/lisp/markdown/")
(setq load-path
      (append '("/home/por07g/emacs/lisp/polymode/"  "/home/por07g/emacs/lisp/polymode/modes/")
              load-path))

(require 'markdown-mode)
(require 'poly-R)
(require 'poly-markdown)
(eval-after-load "org"
  '(require 'ox-md nil t)) ;; I'm using this to be able to work with the back-end ORG2MD
;; Usign minted version for orgmdoe export textcode
(setq org-latex-listings 'minted
      org-latex-packages-alist '(("" "minted"))
      org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))


;;; MARKDOWN
(add-to-list 'auto-mode-alist '("\\.md" . poly-markdown-mode))

;;; R modes
(add-to-list 'auto-mode-alist '("\\.Snw" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rnw" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))
(put 'downcase-region 'disabled nil)

(add-to-list 'load-path "/home/por07g/emacs/ess-17.11/lisp/")
(require 'ess-site)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
;;; R-orgmode
(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t) (latex . t)))
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images)
(add-hook 'org-mode-hook 'org-display-inline-images)


;;; Skeletons
(define-skeleton R-comment
  "Insert a R comment for the header"
  ""
  '(setq str (skeleton-read "Comment: "))
  '(when (string= str "") (setq str " - "))
  '(setq v1 (make-string  (* (length str) 2) ?~))
  ;'(setq v2 (make-string (- (length v1) (length str)) ?\ ))
  "## " v1 " ##" \n
  ;(print (length v2))
  "## ~ "
  (make-string (floor (/ (length v1) 2) 2) ?\ )
  str
  (make-string (ceiling (/ (length v1) 2) 2) ?\ )
  " ~ ##" \n
  "## " v1 " ##")

(global-set-key "\C-cr" 'R-comment)


;; TEXcount function
(defun latex-word-count ()
  (interactive)
  (shell-command (concat "/home/por07g/emacs/lisp/TEXcount/texcount.pl "
					; "uncomment then options go here "
                         (buffer-file-name))))
(global-set-key "\C-cw" 'latex-word-count)


;; Minted enviroment from org-mode to latex
;; I needed to have installed in python the package Pygments
;; pip install Pygments
(setq org-latex-listings 'minted)
(setq org-latex-custom-lang-environments
      '(
	(emacs-lisp "common-lispcode")
	))
(setq org-latex-minted-options
      '(("frame" "lines")
	("breaklines" "")
	("breakafter" "d")
	("fontsize" "\\scriptsize")
	("linenos" "")))
(setq org-latex-to-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
	"pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
	"pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
