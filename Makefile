CC = cc
CFLAGS = -g -Wall -Wextra -Wno-unused-parameter

#drm_cflags = $(shell pkg-config libdrm --cflags --libs)
drm_cflags = `pkg-config --cflags --libs libdrm`

cflags = $(CFLAGS) $(drm_cflags)

targets = 01-modelist 02-selectres 03-showfb 04-animatefb

all: $(targets)

%: %.c
	$(CC) $(cflags) -o $@ $^

.PHONY: clean
clean:
	$(RM) $(targets)
