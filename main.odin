package main

import "core:fmt"

main :: proc() {
	load_puzzle()
	fmt.println(is_valid_pos(0, 0, 4))
	fmt.println(grid)

}
