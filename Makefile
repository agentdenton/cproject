CC = gcc
CFLAGS = -Wall -Wextra -Werror

ifeq (RELEASE, 1)
	CFLAGS += -O2
else
	CFLAGS += -O0 -g
endif

sources = $(wildcard src/*.c)
objects = $(patsubst %.c,%.o,$(sources))

all: $(TARGET)

$(TARGET): $(objects)
	$(CC) $^ -o $@

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(objects) $(TARGET)

.PHONY clean
