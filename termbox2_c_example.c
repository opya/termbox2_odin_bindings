#include <stdio.h>

#define TB_IMPL
#include "./termbox2.h"

int main(void)
{
    int a = 0;
    struct tb_event ev;

    if (tb_init() < 0) {
        printf("Failed to tb_init().\n");
        return 1;
    }

    tb_printf(0, a++, TB_GREEN, 0, "hello from termbox width - %d height -> %d", tb_width(), tb_height());
    tb_present();
    tb_poll_event(&ev);

    tb_printf(0, a++, 0, 0, "event type=%d key=%d ch=%c", ev.type, ev.key, ev.ch);
    tb_printf(0, a++, 0, 0, "press any key to quit...");
    tb_present();
    tb_poll_event(&ev);

    if(tb_shutdown() < 0) {
        printf("Failed to tb_shutdown().\n");
    }

    return 0;
}
