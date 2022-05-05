.POSIX:

NAME    = devour
VERSION = 12.0

CC     = cc
CFLAGS = -std=c11 -D_POSIX_C_SOURCE=200809L -Wall -Wextra -pedantic -O2
LDLIBS = -s -lX11
LDFLAGS= -static
PREFIX = /usr

SRC = devour.c
OBJ = devour.o

all: $(NAME)
$(NAME): $(OBJ)
install: all
	@mkdir -p ${DESTDIR}${PREFIX}/bin
	@mv devour ${DESTDIR}${PREFIX}/bin
	@rm -f ${OBJ}
	@echo Done installing executable files to ${DESTDIR}${PREFIX}/bin

uninstall:
	@rm -f ${DESTDIR}${PREFIX}/bin/devour
	@echo Done removing executable files from ${DESTDIR}${PREFIX}/bin

.PHONY: all install uninstall
