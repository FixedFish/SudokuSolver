package main

import "core:fmt"

row_num :: 4
column_num :: 4

grid: [row_num][column_num]u8

is_valid_pos :: proc(row, col, num: u8) -> bool {
	if is_valid_row(row, num) && is_valid_column(col, num) && is_valid_box(row, col, num) {
		return true
	}
	return false
}

is_valid_row :: proc(row, num: u8) -> bool {
	for i in 0 ..< column_num {
		if grid[row][i] == num {
			return false
		}
	}
	return true
}

is_valid_column :: proc(column, num: u8) -> bool {
	for i in 0 ..< row_num {
		if grid[i][column] == num {
			return false
		}
	}
	return true
}

is_valid_box :: proc(row, col, num: u8) -> bool {
	box := get_box(row, col)
	for val in box {
		if val == num {
			return false
		}
	}
	return true
}

get_box :: proc(row, col: u8) -> [4]u8 {
	result: [4]u8
	start_row := 2 * (row / 2)
	start_column := 2 * (col / 2)
	index := 0

	for i in 0 ..< 2 {
		for j in 0 ..< 2 {
			result[index] = grid[start_row + u8(i)][start_column + u8(j)]
			index += 1
		}
	}
	return result
}

init_grid :: proc() {
	for y in 0 ..< row_num {
		for x in 0 ..< column_num {
			grid[y][x] = 0
		}
	}
}
stuff_init :: proc() {
	grid[0][1] = 2
	grid[0][2] = 4
	grid[1][0] = 1
	grid[1][3] = 3
	grid[2][0] = 4
	grid[2][3] = 2
	grid[3][1] = 1
	grid[3][2] = 3
}

main :: proc() {
	init_grid()
	stuff_init()
	fmt.print(is_valid_pos(0, 0, 4))
	fmt.println(grid)
}
