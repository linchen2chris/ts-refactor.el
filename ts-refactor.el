(defun tsr-extract-const ()
  (interactive)
  (tsr--extract-var-between (region-beginning) (region-end) "const"))

(defun tsr--extract-var-between (beg end keyword)
  (let (
        (expression (buffer-substring beg end))
        (name "name"))

    (delete-region beg end)
    (insert name)

    (goto-char 0)
		(insert (format "%s %s" keyword name))
    (insert " = " expression ";")
    (newline)
		)
	)
