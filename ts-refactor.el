(defun tsr-extract-const (name)
  (interactive "sVariable name: ")
  (tsr--extract-var-between (region-beginning) (region-end) "const" name))

(defun tsr--extract-var-between (beg end keyword name)
  (let (
        (expression (buffer-substring beg end)))

    (delete-region beg end)
    (insert name)

		(backward-paragraph)
		(insert (format "%s %s" keyword name))
    (insert " = " expression ";")
    (newline)
		)
	)

(defun tsr-extract-function (name par)
   "extract region to an arrow function"
   (interactive "sfunction name: \nsparams: ")
   (tsr--extract-fun-between (region-beginning) (region-end) "const" name par))

(defun tsr--extract-fun-between (beg end keyword name par)
  (let (
        (expression (buffer-substring beg end)))

    (delete-region beg end)
    (insert name "(" par ");")
		(typescript-indent-line)
		(newline)

		(backward-paragraph)
		(insert (format "%s %s" keyword name))
    (insert " = (" par ") => {")
    (newline)
		(insert expression)
		(newline)
		(insert "};")
		(newline)
		)
	)
