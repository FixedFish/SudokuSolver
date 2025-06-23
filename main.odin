package main

import "core:fmt"

main :: proc() {
	load_puzzle()
	fmt.println(is_valid_pos(0, 0, 4))
	fmt.println(find_empty_cell())
	fmt.println(grid)
	try_to_put_num()

}
