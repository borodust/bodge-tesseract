[![Build Status](https://travis-ci.org/borodust/bodge-tesseract.svg)](https://travis-ci.org/borodust/bodge-tesseract) [![Build status](https://ci.appveyor.com/api/projects/status/yi6fseaw1acx0jg4?svg=true)](https://ci.appveyor.com/project/borodust/bodge-tesseract)


# Tesseract OCR library wrapper for Common Lisp

Wrapper over [`Tesseract OCR`](https://github.com/tesseract-ocr/tesseract) library.

## Install

### bodge-tesseract
```lisp
;; add cl-bodge distribution into quicklisp
(ql-dist:install-dist "http://bodge.borodust.org/dist/org.borodust.bodge.txt")

;; load the wrapper
(ql:quickload :bodge-tesseract)
```

## Usage

`%tesseract` package contains direct bindings to Tesseract C API.

## Example

```lisp
(ql:quickload '(tesseract-blob bodge-tesseract))
(%tess:version)
```
