package termbox2

import "core:c"

foreign import termbox2 {
    "../termbox2.a"
}

//NOTE: Most of the functionallity of Termbox2 as added as bindings.
//      Only the function and constats marked as deprecated skipped.

//NOTE: termbox2.a is compiled with #define TB_OPT_ATTR_W 64
//      after change in the termbox2.a should be changed here as well
TB_OPT_ATTR_W :: 64
TB_OUTPUT_TRUECOLOR :: 5

/* Colors (numeric) and attributes (bitwise) (`tb_cell.fg`, `tb_cell.bg`) */
TB_DEFAULT :: 0x0000
TB_BLACK   :: 0x0001
TB_RED     :: 0x0002
TB_GREEN   :: 0x0003
TB_YELLOW  :: 0x0004
TB_BLUE    :: 0x0005
TB_MAGENTA :: 0x0006
TB_CYAN    :: 0x0007
TB_WHITE   :: 0x0008

when TB_OPT_ATTR_W == 16 {
    TB_BOLD      :: 0x0100
    TB_UNDERLINE :: 0x0200
    TB_REVERSE   :: 0x0400
    TB_ITALIC    :: 0x0800
    TB_BLINK     :: 0x1000
    TB_HI_BLACK  :: 0x2000
    TB_BRIGHT    :: 0x4000
    TB_DIM       :: 0x8000
} else {
    // `TB_OPT_ATTR_W` is 32 or 64
    TB_BOLD      :: 0x01000000
    TB_UNDERLINE :: 0x02000000
    TB_REVERSE   :: 0x04000000
    TB_ITALIC    :: 0x08000000
    TB_BLINK     :: 0x10000000
    TB_HI_BLACK  :: 0x20000000
    TB_BRIGHT    :: 0x40000000
    TB_DIM       :: 0x80000000
}

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

/* ASCII key constants (`tb_event.key`) */
TB_KEY_CTRL_TILDE       :: 0x00
TB_KEY_CTRL_2           :: 0x00 // clash with `CTRL_TILDE`
TB_KEY_CTRL_A           :: 0x01
TB_KEY_CTRL_B           :: 0x02
TB_KEY_CTRL_C           :: 0x03
TB_KEY_CTRL_D           :: 0x04
TB_KEY_CTRL_E           :: 0x05
TB_KEY_CTRL_F           :: 0x06
TB_KEY_CTRL_G           :: 0x07
TB_KEY_BACKSPACE        :: 0x08
TB_KEY_CTRL_H           :: 0x08 // clash with `CTRL_BACKSPACE`
TB_KEY_TAB              :: 0x09
TB_KEY_CTRL_I           :: 0x09 // clash with `TAB`
TB_KEY_CTRL_J           :: 0x0a
TB_KEY_CTRL_K           :: 0x0b
TB_KEY_CTRL_L           :: 0x0c
TB_KEY_ENTER            :: 0x0d
TB_KEY_CTRL_M           :: 0x0d // clash with `ENTER`
TB_KEY_CTRL_N           :: 0x0e
TB_KEY_CTRL_O           :: 0x0f
TB_KEY_CTRL_P           :: 0x10
TB_KEY_CTRL_Q           :: 0x11
TB_KEY_CTRL_R           :: 0x12
TB_KEY_CTRL_S           :: 0x13
TB_KEY_CTRL_T           :: 0x14
TB_KEY_CTRL_U           :: 0x15
TB_KEY_CTRL_V           :: 0x16
TB_KEY_CTRL_W           :: 0x17
TB_KEY_CTRL_X           :: 0x18
TB_KEY_CTRL_Y           :: 0x19
TB_KEY_CTRL_Z           :: 0x1a
TB_KEY_ESC              :: 0x1b
TB_KEY_CTRL_LSQ_BRACKET :: 0x1b // clash with 'ESC'
TB_KEY_CTRL_3           :: 0x1b // clash with 'ESC'
TB_KEY_CTRL_4           :: 0x1c
TB_KEY_CTRL_BACKSLASH   :: 0x1c // clash with 'CTRL_4'
TB_KEY_CTRL_5           :: 0x1d
TB_KEY_CTRL_RSQ_BRACKET :: 0x1d // clash with 'CTRL_5'
TB_KEY_CTRL_6           :: 0x1e
TB_KEY_CTRL_7           :: 0x1f
TB_KEY_CTRL_SLASH       :: 0x1f // clash with 'CTRL_7'
TB_KEY_CTRL_UNDERSCORE  :: 0x1f // clash with 'CTRL_7'
TB_KEY_SPACE            :: 0x20
TB_KEY_BACKSPACE2       :: 0x7f
TB_KEY_CTRL_8           :: 0x7f // clash with 'BACKSPACE2'

/* Terminal-dependent key constants (`tb_event.key`) and terminfo caps */
/* BEGIN codegen h */
/* Produced by ./codegen.sh on Tue, 03 Sep 2024 04:17:47 +0000 */
TB_KEY_F1               :: (0xffff - 0)
TB_KEY_F2               :: (0xffff - 1)
TB_KEY_F3               :: (0xffff - 2)
TB_KEY_F4               :: (0xffff - 3)
TB_KEY_F5               :: (0xffff - 4)
TB_KEY_F6               :: (0xffff - 5)
TB_KEY_F7               :: (0xffff - 6)
TB_KEY_F8               :: (0xffff - 7)
TB_KEY_F9               :: (0xffff - 8)
TB_KEY_F10              :: (0xffff - 9)
TB_KEY_F11              :: (0xffff - 10)
TB_KEY_F12              :: (0xffff - 11)
TB_KEY_INSERT           :: (0xffff - 12)
TB_KEY_DELETE           :: (0xffff - 13)
TB_KEY_HOME             :: (0xffff - 14)
TB_KEY_END              :: (0xffff - 15)
TB_KEY_PGUP             :: (0xffff - 16)
TB_KEY_PGDN             :: (0xffff - 17)
TB_KEY_ARROW_UP         :: (0xffff - 18)
TB_KEY_ARROW_DOWN       :: (0xffff - 19)
TB_KEY_ARROW_LEFT       :: (0xffff - 20)
TB_KEY_ARROW_RIGHT      :: (0xffff - 21)
TB_KEY_BACK_TAB         :: (0xffff - 22)
TB_KEY_MOUSE_LEFT       :: (0xffff - 23)
TB_KEY_MOUSE_RIGHT      :: (0xffff - 24)
TB_KEY_MOUSE_MIDDLE     :: (0xffff - 25)
TB_KEY_MOUSE_RELEASE    :: (0xffff - 26)
TB_KEY_MOUSE_WHEEL_UP   :: (0xffff - 27)
TB_KEY_MOUSE_WHEEL_DOWN :: (0xffff - 28)

TB_CAP_F1               :: 0
TB_CAP_F2               :: 1
TB_CAP_F3               :: 2
TB_CAP_F4               :: 3
TB_CAP_F5               :: 4
TB_CAP_F6               :: 5
TB_CAP_F7               :: 6
TB_CAP_F8               :: 7
TB_CAP_F9               :: 8
TB_CAP_F10              :: 9
TB_CAP_F11              :: 10
TB_CAP_F12              :: 11
TB_CAP_INSERT           :: 12
TB_CAP_DELETE           :: 13
TB_CAP_HOME             :: 14
TB_CAP_END              :: 15
TB_CAP_PGUP             :: 16
TB_CAP_PGDN             :: 17
TB_CAP_ARROW_UP         :: 18
TB_CAP_ARROW_DOWN       :: 19
TB_CAP_ARROW_LEFT       :: 20
TB_CAP_ARROW_RIGHT      :: 21
TB_CAP_BACK_TAB         :: 22
TB_CAP__COUNT_KEYS      :: 23
TB_CAP_ENTER_CA         :: 23
TB_CAP_EXIT_CA          :: 24
TB_CAP_SHOW_CURSOR      :: 25
TB_CAP_HIDE_CURSOR      :: 26
TB_CAP_CLEAR_SCREEN     :: 27
TB_CAP_SGR0             :: 28
TB_CAP_UNDERLINE        :: 29
TB_CAP_BOLD             :: 30
TB_CAP_BLINK            :: 31
TB_CAP_ITALIC           :: 32
TB_CAP_REVERSE          :: 33
TB_CAP_ENTER_KEYPAD     :: 34
TB_CAP_EXIT_KEYPAD      :: 35
TB_CAP_DIM              :: 36
TB_CAP_INVISIBLE        :: 37
TB_CAP__COUNT           :: 38
/* END codegen h */

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

/* Some hard-coded caps */
TB_HARDCAP_ENTER_MOUSE :: "\x1b[?1000h\x1b[?1002h\x1b[?1015h\x1b[?1006h"
TB_HARDCAP_EXIT_MOUSE  :: "\x1b[?1006l\x1b[?1015l\x1b[?1002l\x1b[?1000l"
TB_HARDCAP_STRIKEOUT   :: "\x1b[9m"
TB_HARDCAP_UNDERLINE_2 :: "\x1b[21m"
TB_HARDCAP_OVERLINE    :: "\x1b[53m"

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
}
