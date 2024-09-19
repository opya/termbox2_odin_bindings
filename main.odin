package main

import "core:fmt"
import "core:c"
import "base:runtime"
import tb2 "termbox2"

BACKGROUND_GOLOR :: 0xef2929

main :: proc() {
    fmt.println("Current termbox2 version ->", tb2.tb_version())

    if tb2.tb_init() < 0 {
        fmt.println("Failed to tb_init().")
    }

    tb2.tb_set_output_mode(tb2.TB_OUTPUT_256)

    a : c.int = 0
    ev : tb2.tb_event

    a += 10

    set_bg_color(BACKGROUND_GOLOR)

    tb2.tb_present()
    tb2.tb_poll_event(&ev)

    a += 1
    tb2.tb_printf(0, a, 0, 0, "event type=%d key=%d ch=%c", ev.type, ev.key, ev.ch)
    a += 1
    tb2.tb_printf(0, a, 0, 0, "press any key to quit...")
    tb2.tb_present()
    tb2.tb_poll_event(&ev)

    if tb2.tb_shutdown() < 0 {
        fmt.println("Failed to tb_shutdown().")
    }
}

set_bg_color :: proc(color: c.uint64_t) {
    for i :=0; i < int(tb2.tb_width()); i+=1 {
        for j :=0; j < int(tb2.tb_height()); j+=1 {
            tb2.tb_set_cell(c.int(i), c.int(j), ' ', 0, color) 
        }
    }
}
