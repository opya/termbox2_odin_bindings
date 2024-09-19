package main

import "core:fmt"
import "core:c"
import "base:runtime"
import tb2 "termbox2"

BASE_BACKGROUND_GOLOR :: 0x565454

main :: proc() {
    tb2.tb_init()
    defer tb2.tb_shutdown()

    tb2.tb_set_output_mode(tb2.TB_OUTPUT_TRUECOLOR)

    draw_base_layout()

    ev : tb2.tb_event
    tb2.tb_poll_event(&ev)
}

set_bg_color :: proc(color: c.uint64_t) {
    for i :=0; i < int(tb2.tb_width()); i+=1 {
        for j :=0; j < int(tb2.tb_height()); j+=1 {
            tb2.tb_set_cell(c.int(i), c.int(j), ' ', 0, color) 
        }
    }
}

draw_base_layout :: proc() {
    set_bg_color(BASE_BACKGROUND_GOLOR)

    weather_title : cstring = "Времето"

    tb2.tb_printf(0, 0, 0, 0, weather_title)
    tb2.tb_present()

    for i :=0; i < 35; i+=1 {
        tb2.tb_set_cell(c.int(i), 5, '-', 0x000001, BASE_BACKGROUND_GOLOR | tb2.TB_BOLD)
    }

    for i :=0; i < int(tb2.tb_height()); i+=1 {
        tb2.tb_set_cell(35, c.int(i), '|', 0x494949, 0x333333)
    }
    tb2.tb_present()
}
