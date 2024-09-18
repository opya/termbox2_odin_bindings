package main

import "core:fmt"
import "core:c"
import tb2 "termbox2"

main :: proc() {
    fmt.println("Current termbox2 version ->", tb2.tb_version())

    if tb2.tb_init() < 0 {
        fmt.println("Failed to tb_init().")
    }

    a : c.int = 0
    msg : cstring = "hello from termbox width - %d height -> %d"
    ev : tb2.tb_event = ---

    a += 1
    tb2.tb_printf(0, a, tb2.TB_GREEN, 0, msg, tb2.tb_width(), tb2.tb_height())
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