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

(defun tsr-extract-function ()
   "extract region to an arrow function"
   (interactive)
   (tsr--extract-fun-between (region-beginning) (region-end) "const"))

(defun tsr--extract-fun-between (beg end keyword)
  (let (
        (expression (buffer-substring beg end))
        (name "name"))

    (delete-region beg end)
    (insert name)

    (goto-char 0)
		(insert (format "%s %s" keyword name))
    (insert " = () => {")
    (newline)
		(insert expression)
		(newline)
		(insert "}")
		)
	)
