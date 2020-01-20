(TeX-add-style-hook
 "homework-example"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("enumitem" "inline") ("xcolor" "table" "dvipsnames")))
   (TeX-run-style-hooks
    "latex2e"
    "amsart"
    "amsart10"
    "amsfonts"
    "amssymb"
    "amsthm"
    "amsmath"
    "caption"
    "enumitem"
    "etoolbox"
    "stmaryrd"
    "graphicx"
    "xcolor"))
 :latex)

