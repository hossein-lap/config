;; -*- no-byte-compile: t; -*-
;;  _  _  ___  ___   ___   ___   ___  __  __   ___ __  __   _   ___ ___ 
;; | || |/ _ \/ __| |   \ / _ \ / _ \|  \/  | | __|  \/  | /_\ / __/ __|
;; | __ | (_) \__ \ | |) | (_) | (_) | |\/| | | _|| |\/| |/ _ \ (__\__ \
;; |_||_|\___/|___/ |___/ \___/ \___/|_|  |_| |___|_|  |_/_/ \_\___|___/
;;                                                                      

;; ; battery display {{{
;; (unless (equal "Battery status not available" (battery))
;;   (display-battery-mode 1)) ; On laptops it's nice to know how much power you have
;; ; }}}

; frame settings {{{

;; ; frame title {{{
;; (setq frame-title-format '("primejade")
;;       ring-bell-function 'ignore
;;       frame-resize-pixelwise t
;;       default-directory "~/")
;; ; }}}

;; ; frame width {{{
;; ;; (setq initial-frame-alist '((fullscreen . maximized))) ;; fullscreen window
;; (if (eq initial-window-system 'x) ; if started by emacs command or desktop file
;;     (toggle-frame-maximized)
;;   (toggle-frame-fullscreen))
;; ; }}}

;; (set-frame-parameter nil 'undecorated t) ; remove window frame

; }}}

; GPG configuration, email clients, file templates and snippets. {{{
(setq user-full-name "Hossein Smail"
      user-mail-address "hosteam01@gmail.com")
; }}}

; Doom fonts: {{{
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))

(setq doom-font (font-spec :family "JetBrains Mono" :size 18)
      doom-variable-pitch-font (font-spec :family "Source Sans Pro" :size 18)
      doom-serif-font (font-spec :family "Libertinus Sans" :size 18)
      doom-sans-font (font-spec :family "Fira Sans" :size 18)
      doom-unicode-font (font-spec :family "Fira Code" :size 18))

      ;; (set-face-attribute 'default nil
      ;;                     :height 280
      ;;                     :weight 'normal)

;; Font for Arabic/Persian text
(defun set-persian-font-arabic-script ()
  ;; (set-fontset-font t 'arabic "Parastoo"))
  (set-fontset-font t 'arabic "Sahel"))

(after! server
  (add-hook 'server-after-make-frame-hook #'set-persian-font-arabic-script))

(after! doom-themes
  (set-persian-font-arabic-script))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(+bidi-arabic-face ((t (:slant normal :weight normal :height 1.0 :width normal :foundry "PfEd" :family "Sahel"))))
 '(+bidi-hebrew-face ((t (:slant normal :weight normal :height 1.0 :width normal :foundry "PfEd" :family "DejaVu Sans")))))

;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!
; }}}

; theme {{{

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:

; dark
;; (setq doom-theme 'doom-solarized-dark)
;; (setq doom-theme 'doom-gruvbox)
;; (setq doom-theme 'doom-molokai)

(setq doom-theme 'doom-tomorrow-night)
;; (setq doom-theme 'doom-material)
;; (setq doom-theme 'doom-one)
;; (setq doom-theme 'doom-tokyo-night)
;; (setq doom-theme 'doom-dracula)

; light
;; (setq doom-theme 'doom-gruvbox-light)

; bw
;; (setq doom-theme 'doom-plain-dark)
;; (setq doom-theme 'doom-plain)
;; (setq doom-theme 'doom-1337)
;; (setq doom-theme 'doom-Iosvkem)
;; (setq doom-theme 'doom-meltbus)

; }}}

;; ; Enable LaTeX module {{{
;; (setq! +latex-enable-lsp t) ; Enable LSP integration for LaTeX
;; 
;; ;; Set XeLaTeX as the default engine
;; (setq! +latex-build-command "xelatex")

(setq TeX-engine 'xetex)

;; (setq auto-mode-alist (cons '("\\.latex$" . latex-mode) auto-mode-alist))
;; (setq TeX-view-program-selection 'atril)
;; ;; latex
;; (add-hook! 'latex-mode-hook (setq TeX-engine 'xelatex) 99)

;; }}}

; org mode {{{

;; ;; This determines the style of line numbers in effect. If set to `nil', line
;; ;; numbers are disabled. For relative line numbers, set this to `relative'.
;; (setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/documents/org/")

;; (custom-theme-set-faces!
;; 'doom-city-lights
;; '(org-level-3 :inherit outline-3 :height 3.2)
;; '(org-level-2 :inherit outline-2 :height 4.5)
;; '(org-level-1 :inherit outline-1 :height 5.75)
;; '(org-document-title  :height 5.0 :underline nil))

;; ; org-mode headings icon
(require 'org-bullets)
;; ;; (setq org-bullets-bullet-list '("☯" "○" "✸" "✿" "~"))
;; (setq org-bullets-bullet-list '("⦿" "✸" "◉" "✿" "◆"))
(setq org-bullets-bullet-list '(" " " " " " " " " "))

(add-hook! 'org-mode-hook 'doom-docs-mode)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(setq org-hide-emphasis-markers t)

(defvar hosfamily "Source Sans Pro")

; org-mode
; custom faces (fonts/sizes)
(custom-set-faces
  `(org-document-title ((t (:inherit outline-1 :height 2.0 :family ,hosfamily))))
  `(org-level-1        ((t (:inherit outline-1 :height 2.0 :family ,hosfamily))))
  `(org-level-2        ((t (:inherit outline-2 :height 1.75 :family ,hosfamily))))
  `(org-level-3        ((t (:inherit outline-3 :height 1.5 :family ,hosfamily))))
  `(org-level-4        ((t (:inherit outline-4 :height 1.25 :family ,hosfamily))))
  `(org-level-5        ((t (:inherit outline-5 :height 1.0 :family ,hosfamily)))))

;; (defun org-mode-remove-stars ()
;;   (font-lock-add-keywords
;;    nil
;;    '(("^\\*+ "
;;       (0
;;        (prog1 nil
;;          (put-text-property (match-beginning 0) (match-end 0)
;;                             'invisible t)))))))
;; (add-hook! 'org-mode-hook #'org-mode-remove-stars)

;; ;; hide title / author ... keywords
;; ;;; Ugly org hooks
;; (defun nicer-org ()
;;   (progn
;;   (+org-pretty-mode 1)
;;   (mixed-pitch-mode 1)
;;   (hl-line-mode -1)
;;   (display-line-numbers-mode -1)
;;   (olivetti-mode 1)
;;   ;(org-num-mode 1)
;;   (org-superstar-mode -1)
;;   (org-indent-mode -1)
;;   ))
;;
;; (add-hook! 'org-mode-hook  #'nicer-org)

;; ; ligatures {{{
;;         (after! org
;; (setq org-ellipsis " ▾ ")
;;   (appendq! +ligatures-extra-symbols
;;           `(:checkbox      "☐"
;;             :pending       "◼"
;;             :checkedbox    "☑"
;;             :list_property "∷"
;;             :em_dash       "—"
;;             :ellipses      "…"
;;             :arrow_right   "→"
;;             :arrow_left    "←"
;;             :title         nil
;;             :subtitle      "𝙩"
;;             :author        "𝘼"
;;             :date          "𝘿"
;;             :property      ""
;;             :options       "⌥"
;;             :startup       "⏻"
;;             :macro         "𝓜"
;;             :html_head     "🅷"
;;             :html          "🅗"
;;             :latex_class   "🄻"
;;             :latex_header  "🅻"
;;             :beamer_header "🅑"
;;             :latex         "🅛"
;;             :attr_latex    "🄛"
;;             :attr_html     "🄗"
;;             :attr_org      "⒪"
;;             :begin_quote   "❝"
;;             :end_quote     "❞"
;;             :caption       "☰"
;;             :header        "›"
;;             :results       "🠶"
;;             :begin_export  "⏩"
;;             :end_export    "⏪"
;;             :properties    ""
;;             :end           "∎"
;;             :priority_a   ,(propertize "⚑" 'face 'all-the-icons-red)
;;             :priority_b   ,(propertize "⬆" 'face 'all-the-icons-orange)
;;             :priority_c   ,(propertize "■" 'face 'all-the-icons-yellow)
;;             :priority_d   ,(propertize "⬇" 'face 'all-the-icons-green)
;;             :priority_e   ,(propertize "❓" 'face 'all-the-icons-blue)
;;             :roam_tags nil
;;             :filetags nil))
;; (set-ligatures! 'org-mode
;;   :merge t
;;   :checkbox      "[ ]"
;;   :pending       "[-]"
;;   :checkedbox    "[X]"
;;   :list_property "::"
;;   :em_dash       "---"
;;   :ellipsis      "..."
;;   :arrow_right   "->"
;;   :arrow_left    "<-"
;;   :title         "#+title:"
;;   :subtitle      "#+subtitle:"
;;   :author        "#+author:"
;;   :date          "#+date:"
;;   :property      "#+property:"
;;   :options       "#+options:"
;;   :startup       "#+startup:"
;;   :macro         "#+macro:"
;;   :html_head     "#+html_head:"
;;   :html          "#+html:"
;;   :latex_class   "#+latex_class:"
;;   :latex_header  "#+latex_header:"
;;   :beamer_header "#+beamer_header:"
;;   :latex         "#+latex:"
;;   :attr_latex    "#+attr_latex:"
;;   :attr_html     "#+attr_html:"
;;   :attr_org      "#+attr_org:"
;;   :begin_quote   "#+begin_quote"
;;   :end_quote     "#+end_quote"
;;   :caption       "#+caption:"
;;   :header        "#+header:"
;;   :begin_export  "#+begin_export"
;;   :end_export    "#+end_export"
;;   :results       "#+RESULTS:"
;;   :property      ":PROPERTIES:"
;;   :end           ":END:"
;;   :priority_a    "[#A]"
;;   :priority_b    "[#B]"
;;   :priority_c    "[#C]"
;;   :priority_d    "[#D]"
;;   :priority_e    "[#E]"
;;   :roam_tags     "#+roam_tags:"
;;   :filetags      "#+filetags:")
;; (plist-put +ligatures-extra-symbols :name "⁍")
;; )
;;
;; (with-eval-after-load 'org
;;   (plist-put org-format-latex-options :background 'default))
;;
;; ; }}}

; }}}

; markdown {{{

;; (setq markdown-list-item-bullets '("☯" "○" "✸" "✿" "~"))
(setq markdown-list-item-bullets '("●" "◎" "○" "◆" "◇" "►" "•"))
;; (setq markdown-header-delimiter-face '("●" "◎" "○" "◆" "◇" "►" "•"))
  
(setq markdown-hide-markup t)
(custom-set-faces
  `(markdown-header-face ((t (:inherit font-lock-function-name-face :weight bold :family ,hosfamily))))
  '(markdown-header-face-1 ((t (:inherit markdown-header-face :height 2.00))))
  '(markdown-header-face-2 ((t (:inherit markdown-header-face :height 1.75))))
  '(markdown-header-face-3 ((t (:inherit markdown-header-face :height 1.50))))
  '(markdown-header-face-4 ((t (:inherit markdown-header-face :height 1.25))))
  '(markdown-header-face-5 ((t (:inherit markdown-header-face :height 1.15))))
  '(markdown-header-face-6 ((t (:inherit markdown-header-face :height 1.00))))

  ;; '(markdown-header-face-1 ((t (:inherit markdown-header-face :foreground "medium blue" :height 1.0))))
  ;; '(markdown-header-face-2 ((t (:inherit markdown-header-face :foreground "medium blue" :height 1.0))))
  ;; '(markdown-header-face-3 ((t (:inherit markdown-header-face :foreground "dark orange" :height 1.0))))
  ;; '(markdown-header-face-4 ((t (:inherit markdown-header-face :foreground "dark cyan" :height 1.0)))))
  )


;; (defun markdown-mode-remove-stars ()
;;   (font-lock-add-keywords
;;    nil
;;    '(("^\\#+ "
;;       (0
;;        (prog1 nil
;;          (put-text-property (match-beginning 0) (match-end 0)
;;                             'invisible t)))))))
;; (add-hook! 'markdown-mode-hook #'markdown-mode-remove-stars)

; }}}

; swtich alt and super key {{{
(setq x-meta-keysym 'super)
(setq x-super-keysym 'meta)
; }}}

; transparent background {{{
(set-frame-parameter nil 'alpha-background 98)
(add-to-list 'default-frame-alist '(alpha-background . 98))
; }}}

;; ; dashboard image {{{
;; (setq fancy-splash-image "/home/hos/downloads/telegram/test.png")
;; ; }}}

;; ; menu bar {{{
;; (menu-bar-mode 1)
;; (tool-bar-mode 1)
;; (tab-bar-mode 1)
;; (scroll-bar-mode 1)
;; ; }}}

;; ; mdoeline {{{
;; (after! doom-modeline
;;   (setq doom-modeline-enable-word-count t
;;         doom-modeline-header-line nil
;;         ;doom-modeline-hud nil
;;         doom-themes-padded-modeline t
;;         doom-flatwhite-brighter-modeline nil
;;         doom-plain-brighter-modeline nil))
;; (add-hook! 'doom-modeline-mode-hook
;;            (progn
;;   (set-face-attribute 'header-line nil
;;                       :background (face-background 'mode-line)
;;                       :foreground (face-foreground 'mode-line))
;;   ))
;; ; }}}

;; (require 'org-superstar)
;; (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))

(setq confirm-kill-emacs nil)     ;; disable exit prompt

;; ; test {{{
;;
;; ;; (define-minor-mode prot/display-line-number-mode
;; ;;   "Disable line numbers, except for programming modes."
;; ;;   :init-value nil
;; ;;   :global nil
;; ;;   (if prot/display-line-number-mode
;; ;;       (unless (derived-mode-p 'prog-mode)
;; ;;         (display-line-numbers-mode -1))
;; ;;     (display-line-numbers-mode 1)))
;; ;;
;; ;; (use-package! focus
;; ;;   :after org-mode-hook
;; ;;   :config
;; ;;         (add-to-list 'focus-mode-to-thing '(org-mode . paragraph))
;; ;;   )
;;
;; ;(require 'nano-writer)
;; (defun margin-width-pixel (&optional right)
;;   "Return the width of the left or optionally right margin in pixels."
;;   (if (window-margins)
;;      (if right
;;            (* (frame-char-width) (cdr (window-margins))) ;;right margin
;;           (* (frame-char-width) (car (window-margins))))
;;           0))
;;
;; ;; (server-start) ; run emacs-daemon for every instance (not recommended)
;; ; }}}

;; RSS Reader {{{
;; (setq elfeed-feeds
;;       '(("https://tubedu.org/feeds/videos.xml?videoChannelId=2421" jadi RadioGeek)
;;        ("https://archlinux.org/feeds/news/" archlinux news)
;;        ("https://lukesmith.xyz/index.xml" blog luke-smith)))

;; (setq elfeed-feeds
;;       '("https://this-week-in-rust.org/rss.xml"
;;         "http://feeds.bbci.co.uk/news/rss.xml"))

(add-hook! 'elfeed-search-mode-hook #'elfeed-update)
;; }}}
