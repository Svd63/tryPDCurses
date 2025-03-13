O = o
E = .exe

ifeq ($(OS),Windows_NT)
	# RM = cmd /c del
	# use this with mingw32-make
	RM = rm -f
else
	RM = rm -f
endif

CC		= g++
AR		= ar
STRIP		= strip
LINK		= g++
WINDRES		= windres

ifeq ($(DEBUG),Y)
	CFLAGS  = -g -Wall -DPDCDEBUG
	LDFLAGS = -g
else
	CFLAGS  = -O2 -Wall
	LDFLAGS =
endif

CFLAGS += -I./include

.PHONY: clean

rain.exe:	rain.o
	$(LINK) $(LDFLAGS) -o$@ rain.o ./lib/pdcurses.a

rain.o: rain.c
	$(CC) -v -c $(CFLAGS) -o$@ $<

clean:
	-$(RM) *.o
	-$(RM) *.exe
	-$(RM) $(CLEAN)
