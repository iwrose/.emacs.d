(provide 'yjj-conf-program)

(require 'cedet)

;;semantic配置 
(semantic-load-enable-minimum-features)
(semantic-load-enable-code-helpers)
(semantic-load-enable-guady-code-helpers)
(semantic-load-enable-excessive-code-helpers)
;(semantic-load-enable-semantic-debugging-helpers)

;; (setq semanticdb-project-roots (list (expand-file-name "/")))
;;(defconst cedet-user-include-dirs
;;  (list ".." "../include" "../inc" "../common" "../public"
;;        "../.." "../../include" "../../inc" "../../common" "../../public"))
;;(defconst cedet-win32-include-dirs
;;  (list "C:/MinGW/include"
;;        "C:/MinGW/include/c++/3.4.5"
;;        "C:/MinGW/include/c++/3.4.5/mingw32"
;;        "C:/MinGW/include/c++/3.4.5/backward"
;;        "C:/MinGW/lib/gcc/mingw32/3.4.5/include"
;;        "C:/Program Files/Microsoft Visual Studio/VC98/MFC/Include"))
;;(require 'semantic-c nil 'noerror)
;;(let ((include-dirs cedet-user-include-dirs))
;;  (when (eq system-type 'windows-nt)
;;    (setq include-dirs (append include-dirs cedet-win32-include-dirs)))
;;  (mapc (lambda (dir)
;;          (semantic-add-system-include dir 'c++-mode)
;;          (semantic-add-system-include dir 'c-mode))
;;        include-dirs))

;;跳转功能
(global-set-key [f12] 'semantic-ia-fast-jump)
(global-set-key [S-f12]
                (lambda ()
                  (interactive)
                  (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
                      (error "Semantic Bookmark ring is currently empty"))
                  (let* ((ring (oref semantic-mru-bookmark-ring ring))
                         (alist (semantic-mrub-ring-to-assoc-list ring))
                         (first (cdr (car alist))))
                    (if (semantic-equivalent-tag-p (oref first tag)
                                                   (semantic-current-tag))
                        (setq first (cdr (car (cdr alist)))))
                    (semantic-mrub-switch-tags first))))

;;声明与函数间的跳转按键定义
;(define-key c-mode-base-map [M-S-f12] 'semantic-analyze-proto-impl-toggle)

;;代码补全按键定义
;(define-key c-mode-base-map (kbd "M-n") 'semantic-ia-complete-symbol-menu)

;;EED配置
(global-ede-mode t)

(require 'semantic-tag-folding nil 'noerror)
(global-semantic-tag-folding-mode 1)