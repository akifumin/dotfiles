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
