NAME = tesseract
BIN = lib$(NAME)

WORK_DIR = $(dir $(realpath $(firstword $(MAKEFILE_LIST))))


# Flags
CCFLAGS += $(CFLAGS)


SRC =
OBJ = $(SRC:.c=.o)

ifeq ($(OS),Windows_NT)
	EXTENSION := dll
	LIBRARY_FILE := $(WORK_DIR)/tesseract/src/api/.libs/libtesseract-4.$(EXTENSION)
else
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S),Darwin)
		EXTENSION := dylib
		LIBRARY_FILE := $(WORK_DIR)/tesseract/src/api/.libs/libtesseract.$(EXTENSION)
	else
		EXTENSION := so
		LIBRARY_FILE := $(WORK_DIR)/tesseract/src/api/.libs/libtesseract.$(EXTENSION)
	endif
endif

BIN := $(BIN).$(EXTENSION).bodged
TARGET_FILE := $(WORK_DIR)/$(BIN)

build:
	CXXFLAGS="$(CFLAGS)" cd tesseract/							\
	&& ./autogen.sh										\
	&& ./configure --disable-graphics --disable-legacy --disable-tessdata-prefix		\
		--enable-shared --disable-static						\
	&& make
	cp -L $(LIBRARY_FILE) $(TARGET_FILE)
	strip -S $(TARGET_FILE)
	if [ "$(EXTENSION)" = "so" ]; then							\
	  patchelf --set-rpath '@ORIGIN/' "$(TARGET_FILE)";					\
	  patchelf --set-soname '$(BIN)' "$(TARGET_FILE)";					\
	fi

clean:
	cd tesseract/ && make clean || true
	rm -f $(TARGET_FILE)
