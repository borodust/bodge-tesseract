(claw:c-include "bodge_tesseract.h" bodge-tesseract
  :in-package (:%tesseract :%tess)
  :sysincludes (:tesseract-api-includes :tesseract-util-includes)
  :include-definitions ("Tess[A-Z]+\\w*")
  :rename-symbols (claw:by-removing-prefixes "Tess"))
