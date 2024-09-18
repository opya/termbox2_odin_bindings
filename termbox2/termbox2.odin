package termbox2

import "core:c"

foreign import termbox2 {
    "../termbox2.a"
}

TB_OPT_ATTR_W :: #config(TB_OPT_ATTR_W, 64)

/* Some hard-coded caps */
TB_HARDCAP_ENTER_MOUSE  :: "\x1b[?1000h\x1b[?1002h\x1b[?1015h\x1b[?1006h"
TB_HARDCAP_EXIT_MOUSE   :: "\x1b[?1006l\x1b[?1015l\x1b[?1002l\x1b[?1000l"
TB_HARDCAP_STRIKEOUT    :: "\x1b[9m"
TB_HARDCAP_UNDERLINE_2  :: "\x1b[21m"
TB_HARDCAP_OVERLINE     :: "\x1b[53m"

/* Colors (numeric) and attributes (bitwise) (`tb_cell.fg`, `tb_cell.bg`) */
TB_DEFAULT ::             0x0000
TB_BLACK   ::             0x0001
TB_RED     ::             0x0002
TB_GREEN   ::             0x0003
TB_YELLOW  ::             0x0004
TB_BLUE    ::             0x0005
TB_MAGENTA ::             0x0006
TB_CYAN    ::             0x0007
TB_WHITE   ::             0x0008

when TB_OPT_ATTR_W == 16 {
    TB_BOLD      :: 0x0100
    TB_UNDERLINE :: 0x0200
    TB_REVERSE   :: 0x0400
    TB_ITALIC    :: 0x0800
    TB_BLINK     :: 0x1000
    TB_HI_BLACK  :: 0x2000
    TB_BRIGHT    :: 0x4000
    TB_DIM       :: 0x8000
    TB_256_BLACK :: TB_HI_BLACK // `TB_256_BLACK` is deprecated
} else {
    // `TB_OPT_ATTR_W` is 32 or 64
    TB_BOLD                :: 0x01000000
    TB_UNDERLINE           :: 0x02000000
    TB_REVERSE             :: 0x04000000
    TB_ITALIC              :: 0x08000000
    TB_BLINK               :: 0x10000000
    TB_HI_BLACK            :: 0x20000000
    TB_BRIGHT              :: 0x40000000
    TB_DIM                 :: 0x80000000
    TB_TRUECOLOR_BOLD      :: TB_BOLD // `TB_TRUECOLOR_*` is deprecated
    TB_TRUECOLOR_UNDERLINE :: TB_UNDERLINE
    TB_TRUECOLOR_REVERSE   :: TB_REVERSE
    TB_TRUECOLOR_ITALIC    :: TB_ITALIC
    TB_TRUECOLOR_BLINK     :: TB_BLINK
    TB_TRUECOLOR_BLACK     :: TB_HI_BLACK
}

//#if TB_OPT_ATTR_W == 64
TB_STRIKEOUT   :: 0x0000000100000000
TB_UNDERLINE_2 :: 0x0000000200000000
TB_OVERLINE    :: 0x0000000400000000
TB_INVISIBLE   :: 0x0000000800000000
//#endif

/* Event types (`tb_event.type`) */
TB_EVENT_KEY        :: 1
TB_EVENT_RESIZE     :: 2
TB_EVENT_MOUSE      :: 3

/* Key modifiers (bitwise) (`tb_event.mod`) */
TB_MOD_ALT          :: 1
TB_MOD_CTRL         :: 2
TB_MOD_SHIFT        :: 4
TB_MOD_MOTION       :: 8

/* Input modes (bitwise) (`tb_set_input_mode`) */
TB_INPUT_CURRENT    :: 0
TB_INPUT_ESC        :: 1
TB_INPUT_ALT        :: 2
TB_INPUT_MOUSE      :: 4

/* Output modes (`tb_set_output_mode`) */
TB_OUTPUT_CURRENT   :: 0
TB_OUTPUT_NORMAL    :: 1
TB_OUTPUT_256       :: 2
TB_OUTPUT_216       :: 3
TB_OUTPUT_GRAYSCALE :: 4
//#if TB_OPT_ATTR_W >= :: 32
// TB_OUTPUT_TRUECOLOR :: 5
//#endif

/* Common function return values unless otherwise noted.
 *
 * Library behavior is undefined after receiving `TB_ERR_MEM`. Callers may
 * attempt reinitializing by freeing memory, invoking `tb_shutdown`, then
 * `tb_init`.
 */
TB_OK                   :: 0
TB_ERR                  :: -1
TB_ERR_NEED_MORE        :: -2
TB_ERR_INIT_ALREADY     :: -3
TB_ERR_INIT_OPEN        :: -4
TB_ERR_MEM              :: -5
TB_ERR_NO_EVENT         :: -6
TB_ERR_NO_TERM          :: -7
TB_ERR_NOT_INIT         :: -8
TB_ERR_OUT_OF_BOUNDS    :: -9
TB_ERR_READ             :: -10
TB_ERR_RESIZE_IOCTL     :: -11
TB_ERR_RESIZE_PIPE      :: -12
TB_ERR_RESIZE_SIGACTION :: -13
TB_ERR_POLL             :: -14
TB_ERR_TCGETATTR        :: -15
TB_ERR_TCSETATTR        :: -16
TB_ERR_UNSUPPORTED_TERM :: -17
TB_ERR_RESIZE_WRITE     :: -18
TB_ERR_RESIZE_POLL      :: -19
TB_ERR_RESIZE_READ      :: -20
TB_ERR_RESIZE_SSCANF    :: -21
TB_ERR_CAP_COLLISION    :: -22

TB_ERR_SELECT           :: TB_ERR_POLL
TB_ERR_RESIZE_SELECT    :: TB_ERR_RESIZE_POLL

/* Deprecated. Function types to be used with `tb_set_func`. */
TB_FUNC_EXTRACT_PRE     :: 0
TB_FUNC_EXTRACT_POST    :: 1

/* Define this to set the size of the buffer used in `tb_printf`
 * and `tb_sendf`
 */
//#ifndef TB_OPT_PRINTF_BUF
// TB_OPT_PRINTF_BUF :: 4096
//#endif

/* Define this to set the size of the read buffer used when reading
 * from the tty
 */
//#ifndef TB_OPT_READ_BUF
// TB_OPT_READ_BUF :: 64
//#endif

tb_event :: struct {
    type: c.uint8_t, // one of `TB_EVENT_*` constants
    mod: c.uint8_t,  // bitwise `TB_MOD_*` constants
    key: c.uint16_t, // one of `TB_KEY_*` constants
    ch: c.uint32_t,  // a Unicode codepoint
    w: c.uint32_t,    // resize width
    h: c.uint32_t,    // resize height
    x: c.uint32_t,    // mouse x
    y: c.uint32_t    // mouse y
}

_tb_set_func :: #type proc "c" (tb_event_struct: ^tb_event, size: ^c.size_t) -> (c.int)

foreign termbox2 {
    tb_init                 :: proc() -> (c.int) ---
    tb_init_file            :: proc(path: cstring) -> (c.int) ---
    tb_init_fd              :: proc(ttyfd: c.int) -> (c.int) ---
    tb_init_rwfd            :: proc(rfd: c.int, wfd: c.int) -> (c.int) ---
    tb_shutdown             :: proc() -> (c.int) ---
    tb_width                :: proc() -> (c.int) ---
    tb_height               :: proc() -> (c.int) ---
    tb_clear                :: proc() -> (c.int) ---
    tb_set_clear_attrs      :: proc(fg: c.uint64_t, bg: c.uint64_t) -> (c.int) ---
    tb_present              :: proc() -> (c.int) ---
    tb_invalidate           :: proc() -> (c.int) ---
    tb_set_cursor           :: proc(cx: c.int, cy: c.int) -> (c.int) ---
    tb_hide_cursor          :: proc() -> (c.int) ---
    tb_set_cell             :: proc(x: c.int, y: c.int, ch: c.uint32_t,fg: c.uint64_t, bg: c.uint64_t) -> (c.int) ---
    tb_set_cell_ex          :: proc(x: c.int, y: c.int, ch: ^c.uint32_t, nch: c.size_t, fg: c.uint64_t, bg: c.uint64_t) -> (c.int) ---
    tb_extend_cell          :: proc(x: c.int, y: c.int, ch: c.uint32_t) -> (c.int) ---
    tb_set_input_mode       :: proc(mode: c.int) -> (c.int) ---
    tb_set_output_mode      :: proc(mode: c.int) -> (c.int) ---
    tb_peek_event           :: proc(event: ^tb_event, timeout_ms: c.int) -> (c.int) ---
    tb_poll_event           :: proc(event: ^tb_event) -> (c.int) ---
    tb_get_fds              :: proc(ttyfd: ^c.int, resizefd: ^c.int) -> (c.int) ---
    tb_print                :: proc(x: c.int, y: c.int, fg: c.uint64_t, bg: c.uint64_t, str: cstring) -> (c.int) ---
    tb_printf               :: proc(x: c.int, y: c.int, fg: c.uint64_t, bg: c.uint64_t, fmt: cstring, #c_vararg args: ..any) -> (c.int) ---
    tb_print_ex             :: proc(x: c.int, y: c.int, fg: c.uint64_t, bg: c.uint64_t, out_w: ^c.size_t, str: cstring) -> (c.int) ---
    tb_printf_ex            :: proc(x: c.int, y: c.int, fg: c.uint64_t, bg: c.uint64_t, out_w: ^c.size_t, fmt: cstring, #c_vararg args: ..any) -> (c.int) ---
    tb_send                 :: proc(buf: cstring, nbuf: c.size_t) -> (c.int) ---
    tb_sendf                :: proc(fmt: cstring, #c_vararg args: ..any) -> (c.int) ---
    tb_utf8_char_length     :: proc(c_char: c.char) -> (c.int) ---
    tb_utf8_char_to_unicode :: proc(out: ^c.uint32_t, c_char: cstring) -> (c.int) ---
    tb_utf8_unicode_to_char :: proc(out: cstring, c_char: c.uint32_t) -> (c.int) ---
    tb_last_errno           :: proc() -> (c.int) ---
    tb_strerror             :: proc(err: c.int) -> (cstring) ---
    tb_has_truecolor        :: proc() -> (c.int) ---
    tb_has_egc              :: proc() -> (c.int) ---
    tb_attr_width           :: proc() -> (c.int) ---
    tb_version              :: proc() -> (cstring) ---
    tb_set_func             :: proc(fn_type: c.int, callback: _tb_set_func) -> (c.int) ---
}
