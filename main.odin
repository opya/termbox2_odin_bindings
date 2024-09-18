package main

import "core:fmt"
import "core:c"
import "base:runtime"
import tb2 "termbox2"

custom_tb_func :: proc "c" (tb_event_struct: ^tb2.tb_event, size: ^c.size_t) -> (c.int) {
    context = runtime.default_context()
    fmt.println(tb_event_struct^)
    fmt.println(size^)
    return c.int(1)
}

main :: proc() {
    fmt.println("Current termbox2 version ->", tb2.tb_version())

    if tb2.tb_init() < 0 {
        fmt.println("Failed to tb_init().")
    }

    tb2.tb_set_func(tb2.TB_FUNC_EXTRACT_POST, custom_tb_func)

    a : c.int = 0
    ev : tb2.tb_event

    a += 1
    tb2.tb_printf(0, a, tb2.TB_GREEN, 0, "hello from termbox width - %d height -> %d", tb2.tb_width(), tb2.tb_height())
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
