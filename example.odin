package main

import "core:fmt"
import "core:c"
import tb2 "termbox2"

main :: proc() {
    ev : tb2.tb_event
    y := c.int(0)

    tb2.tb_init()

    tb2.tb_printf(0, y, tb2.TB_GREEN, 0, "hello from termbox")
    y += 1
    tb2.tb_printf(0, y, 0, 0, "width=%d height=%d", tb2.tb_width(), tb2.tb_height())
    y += 1
    tb2.tb_printf(0, y, 0, 0, "press any key...")
    y += 1
    tb2.tb_present()

    tb2.tb_poll_event(&ev)

    y += 1
    tb2.tb_printf(0, y, 0, 0, "event type=%d key=%d ch=%c", ev.type, ev.key, ev.ch)
    y += 1
    tb2.tb_printf(0, y, 0, 0, "press any key to quit...")
    tb2.tb_present()

    tb2.tb_poll_event(&ev)
    tb2.tb_shutdown()
}
