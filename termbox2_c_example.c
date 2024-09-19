#include <stdio.h>

#define TB_IMPL
#define TB_OPT_ATTR_W 64
#include "./termbox2.h"

#define BACKGROUND_GOLOR 0xef2929

int main(void)
{
    int a = 0;
    struct tb_event ev;

    if (tb_init() < 0) {
        printf("Failed to tb_init().\n");
        return 1;
    }

    tb_set_output_mode(TB_OUTPUT_256);

    for (int i =0; i < tb_width(); i++) {
        for (int j =0; j < tb_height(); j++) {
            tb_set_cell(i, j, ' ', 0, BACKGROUND_GOLOR);
        }
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
