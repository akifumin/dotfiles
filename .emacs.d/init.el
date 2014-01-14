;; Emacs 23より前のバージョンを利用している方は
;; user-emacs-directory変数が未定義のため次の設定を追加
(when (< emacs-major-version 23)
  (defvar user-emacs-directory "~/.emacs.d/"))

;; load-path を追加する関数を定義
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
              (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))

;; 引数のディレクトリとそのサブディレクトリをload-pathに追加
(add-to-load-path "elisp" "conf" "public_repos")

;; auto-installの設定
(when (require 'auto-install nil t)
  ;; インストールディレクトリを設定する
  (setq auto-install-directory "~/.emacs.d/elisp/")
  ;; EmacsWikiに灯籠されているelispの名前を取得する
  (auto-install-update-emacswiki-package-name t)
  ;; 必要であればプロキシの設定を行う
  ;;(setq url-proxy-services '(("http" . "localhost:8339")))
  ;; install-elisp の関数を利用可能にする
  (auto-install-compatibility-setup))

;; redo+の設定 (auto-install)
(when (require 'redo+ nil t)
  ;; C-'にRedoを割り当てる
  ;;  (global-set-key (kbd "C-'") 'redo)
  ;; 日本語だとC-.がいい？
  (global-set-key (kbd "C-.") 'redo)
  )







;; カラーテーマ
(when (require 'color-theme nil t)
  ;; テーマを読み込むための設定
  (color-theme-initialize))


;;(function arg)

;; C-m にnewline-and-indentを割り当てる。初期値はnewline
;;(define-key global-map (kbd "C-m") 'newline-and-indent)
(global-set-key (kbd "C-m") 'newline-and-indent)


;; 折り返しトグルコマンド
(define-key global-map (kbd "C-c l") 'toggle-truncate-lines)

;;　入力されるキーシーケンスを置き換える
;; ?\C-?はDELのキーシーケンス
;; (keyboard-translate ?\C-h ?\C-?)


;; "C-t" でウィンドウを切り替える。初期値はtranspose-chars
(define-key global-map (kbd "C-t") 'other-window)

;; ローケールを指定
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)

;;Mac OS X の場合のファイル名の設定
(when (eq system-type 'darwin )
  (require 'ucs-normalize)
  (set-file-name-coding-system 'utf-8-hfs);; 
  (setq locale-coding-system 'utf-8-hfs))

;; モードラインにカラム番号も表示
(column-number-mode t)

;; ファイルサイズを表示
(size-indication-mode t)

;; 時計を表示(好みに応じてフォーマットを変更可能)
;; 曜日、月、日を表示
;;(setq display-time-day-and-date t)
;; 24時間表示
;;(setq display-time-24hr-format t)
(display-time-mode t)

;; バッテリー残量を表示
;;(display-battery-mode t)

;; タイトルバーにファイルのフルパスを表示
(setq frame-title-format "%f")

;; 行番号を常に表示する
(global-linum-mode t)

;; TABの表示幅。初期値は８
;;(setq-default tab-width 4)

;; インデントにタブ文字を使用しない
(setq-default indent-tabs-mode nil)

;; php-modeのみタブを利用しない
;; (add-hook 'php-mode-hook
;; 		  (lamba ()
;; 				 (seqt indent-tabs-mode nil))) ;

;; フェイス
;; M-x list-faces-display RET
;; リージョンの背景色を変更
;;(set-face-background 'region "darkgreen")
;; 色の一覧
;; M-x list-colors-display RET
;; red, green, yellow, 

;; 表示カラーテーマ
(when (require 'color-theme nil t)
;; テーマを読み込むための設定
  (color-theme-initialize)
;; テーマをhoberに変更すする
;;  (color-theme-hober)
  )

;; asciiフォントをMenloに
 (set-face-attribute 'default nil
                     :family "Menlo"
                     :height 120)

;; 日本語フォントをヒラギノ明朝 Proに
;;(set-fontset-font
;; "fontset-default"
;; 'japanese-jisx0208
;;(set-fontset-font nil 'japanese-jisx-0208
 ;; 英語名の場合
;; (font-spec :family "Hiragino Mincho Pro"))
;; (font-spec :family "ヒラギノ明朝 Pro"))


;; php-mode
(require 'php-mode)
;;(setq php-mode-force-pear t);PEAR規約のインデント設定にする
;;(add-to-list 'auto-mode-alist '("\\.php$".php-mode));*.phpファイルのときにphp-modeを自動起動する

;; ハイライト
(defface my-hl-line-face
  ;; 背景がdarkならば背景を紺に
  '((((class color) (background dark))
     (:background "NavyBlue" t))
    ;; 背景がlightならば背景を緑色に
    (((class color) (background light))
     (:bacground "LightGolodenrodYellow" t))
    (t (:bold t)))
  "hl-line's my face")
(setq hl-line-face 'my-line-face)
(global-hl-line-mode t)

;; 括弧のハイライト
;; paren-mode:対応する括弧を強調する
(setq show-paren-delay 0) ; 表示までの「秒数。初期値は0.125
(show-paren-mode t);
;; parenのスタイル : expressionは括弧内も強調表示
(setq show-paren-style 'expression)
;; フェイスを変更する
(set-face-background 'show-paren-match-face  nil)
(set-face-underline-p 'show-paren-match-face "yellow")

;; バックアップファイルを作成しない
;;(setq make-backkup-files nil)
;; オートセーブファイルを作らない
;;(setq auto-save-default nil)

;; バックアップファイルの作成場所をシステムのtempディレクトリに変更する
;;(setq backup-directory-alist
;;      `((".*" . ,temporay-file-directory)))
;; オートセーブファイルの作成場所をシステムのtempディレクトリに変更する
;;(setq auto-save-file-name-transforms
;;      `((".*" ,temporary-file-directory t)))

;; バックアップとオートセーブファイルを~/.emacs.d/backups/へ集める
(add-to-list 'backup-directory-alist
             (cons "." "~/.emacs.d/backups/"))
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "~/.emacs.d/backups/") t)))

;; オートセーブファイル作成までの秒間隔
(setq auto-savetimeout 15)
;; オートセーブファイル作成までのタイプ間隔
(setq auto-save-interval 60)


;; emacs-plisp-modeのフックをセット
;; 無名関数
;; 無名関数は再起動した時じゃないと評価されない
;; (add-hook 'emacs-lisp-mode-hook
;;           '(lambda ()
;;              (when (require 'eldoc nil t)
;;                (setq eldoc-idle-delay 0.2)
;;                (setq eldoc-echo-area-use-multiline-p t)
;;                (turn-on-eldoc-mode))))

;; emacs-lisp-mode-hook用の関数を定義
(defun elisp-mode-hooks ()
  "lisp-mode-hooks"
  (when (require 'eldoc nil t)
    (setq eldoc-idle-delay 0.2)
    (setq eldoc-echo-area-use-multiline-p t)
    (turn-on-eldoc-mode)))
;; emacs-lisp-modeのフックをセット
(add-hook 'emacs-lisp-mode-hook 'elisp-mode-hooks)
  
