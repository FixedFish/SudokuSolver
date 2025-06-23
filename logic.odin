package main

import "core:fmt"
import "core:math"

GRID_SIZE: u8 : 4
BOX_SIZE: u8 : 2

grid: [GRID_SIZE][GRID_SIZE]u8

try_to_put_num :: proc() {
	row, col: u8
	found: bool
	row, col, found = find_empty_cell()
	fmt.println("found: ", found)
	if found {
		for i: u8 = 1; i <= 4; i += 1 {
			fmt.println("num: ", i)
			if is_valid_pos(row, col, i) {
				grid[row][col] = i
				fmt.println(grid)
				try_to_put_num()
			}
		}
	} else {
		fmt.println("Not found or already solven")
	}
}


/* Helper functions */
find_empty_cell :: proc() -> (row, col: u8, found: bool) {
	for r in 0 ..< GRID_SIZE {
		for c in 0 ..< GRID_SIZE {
			if grid[r][c] == 0 {
				return r, c, true
			}
		}
	}
	return 0, 0, false
}

is_valid_pos :: proc(row, col, num: u8) -> bool {
	return is_valid_row(row, num) && is_valid_col(col, num) && is_valid_box(row, col, num)
}

is_valid_row :: proc(row, num: u8) -> bool {
	for col in 0 ..< GRID_SIZE {
		if grid[row][u8(col)] == num {
			return false
		}
	}
	return true
}

is_valid_col :: proc(col, num: u8) -> bool {
	for row in 0 ..< GRID_SIZE {
		if grid[u8(row)][col] == num {
			return false
		}
	}
	return true
}

is_valid_box :: proc(row, col, num: u8) -> bool {
	start_row := (row / BOX_SIZE) * BOX_SIZE
	start_col := (col / BOX_SIZE) * BOX_SIZE

	for r in start_row ..< start_row + BOX_SIZE {
		for c in start_col ..< start_col + BOX_SIZE {
			if grid[u8(r)][u8(c)] == num {
				return false
			}
		}
	}
	return true
}

load_puzzle :: proc() {
	grid[0][1] = 2
	grid[0][2] = 4
	grid[1][0] = 1
	grid[1][3] = 3
	grid[2][0] = 4
	grid[2][3] = 2
	grid[3][1] = 1
	grid[3][2] = 3
}
