;; 加载所有 load-path
;;http://emacswiki.org/emacs/LoadPath
(let ((dir (expand-file-name "~/.emacs.d")))
  (if (member dir load-path) nil
    (setq load-path (cons dir load-path))
    (let ((default-directory dir))
      (load (expand-file-name "subdirs.el") t t t))))

;;加载总配置文件
(require 'yjj-config)