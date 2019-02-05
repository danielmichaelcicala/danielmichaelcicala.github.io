(TeX-add-style-hook
 "document_cv-research"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("geometry" "left=0.75in" "top=0.6in" "right=0.75in" "bottom=0.6in")))
   (TeX-run-style-hooks
    "latex2e"
    "Resume"
    "Resume10"
    "geometry"
    "verbatim"
    "multicol"))
 :latex)

