(TeX-add-style-hook
 "ws00_precalc-review_1117"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("amsart" "11pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("geometry" "margin=0.75in") ("enumitem" "inline")))
   (TeX-run-style-hooks
    "latex2e"
    "amsart"
    "amsart11"
    "amsfonts"
    "amsthm"
    "amssymb"
    "amsmath"
    "stmaryrd"
    "etoolbox"
    "mathtools"
    "graphicx"
    "caption"
    "subcaption"
    "xcolor"
    "multicol"
    "geometry"
    "enumitem"
    "tikz")
   (LaTeX-add-environments
    "q"))
 :latex)

