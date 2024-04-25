BIN_DIR := bin
SRC_DIR := src


CC := gcc
CFLAGS := -O3

SRC_OBJS := main.o 
$(UTIL_OBJS)

default: run

debug: CFLAGS+= -g -O0 -DDEBUG 

driver: $(SRC_OBJS) 
	$(CC) $(BIN_DIR)/$(SRC_OBJS) -o $(BIN_DIR)/driver.x $(LDFLAGS)

run: clean driver
	./$(BIN_DIR)/driver.x

%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $(BIN_DIR)/$@

.PHONY: clean

clean:
	rm -rf $(BIN_DIR)/*





