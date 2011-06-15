
/*
 * lpc23xx-binsem.s
 */

/*
 *  http://en.wikipedia.org/wiki/Application_binary_interface#EABI
 *
 *  EABI says r0-r3 are reserved for calling and return
 *
 *  The EABI standard dictates that the ARM Stack be:
 *  "Full Descending" which means that stores need to decrement beforehand and loads must increment
 *  afterward. You can use the actual addressing types "DB" and "IA" or just "FD" on the assembly instructions.
 */

/*
 * FOR ARM:
 * sp is r13
 * lr is r14
 * pc is r15
 */

.text

# generate 32 bit ARM 
.code           32

# align on 4 byte (word) boundary
.align          4

# defining constants
.equ LOCKED    , 0
.equ UNLOCKED  , 1

# renaming registers
binsem_addr .req r0
cycles      .req r1

/*
 * init_binsem
 *  r0 contains address of semaphore, need to initialize semaphore to non-zero value
 *  prior to using.
 *
 * In C define prototype: void init_binsem(uint32_t *binsem_addr);
 */
.global init_binsem
init_binsem:
    ### prolog ###
    stmdb sp!, {r4-r11}

    mov r4, binsem_addr

    ldr r5, =UNLOCKED
    swp r5, r5, [r4]

    ### epilog ###
    ldmia sp!, {r4-r11}

    mov r0, #0
    mov pc, lr

/*
 * is_binsem_locked
 * input: r0 contains binsem_addr
 *
 * return: 1 if locked 
 *         0 if not locked 
 * in C define prototype: uint32_t is_binsem_locked(uint32_t* binsem_addr);
 */
.global is_binsem_locked
is_binsem_locked:
    ### prolog ###
    # store multiple, decrement before. '!' says to write back new value to sp
    stmdb sp!, {r4-r11}

    mov r4, binsem_addr

    ldr r5, [r4]
    cmp r5, #LOCKED
    beq is_locked
    b   not_locked

is_locked:
    mov r5, #1

not_locked:
    mov r5, #0

    ### epilog ###
    # load multiple, increment after. '!' says to write back new value to sp
    ldmia sp!, {r4-r11}

    # return value goes into r0, here it's zero
    # return value into r0
    mov r0, r5
    # lr contains address of next instruction after function
    mov pc, lr


/*
 * get_binsem
 * in: binsem_addr is r0
 *      wait_count is r1
 * return: a '1' for successful lock
 *         a '0' if wait for cycles count and not successful
 * In C define prototype: uint32_t get_binsem(uint32_t* binsem_addr, uint32_t wait_count);
 */ 
.global get_binsem
get_binsem:
    ### prolog ###
    # store multiple, decrement before. '!' says to write back new value to sp
    stmdb sp!, {r4-r11}

    mov r4, binsem_addr
    mov r5, cycles

    ldr r6, =LOCKED

spin_lock:
    # r1 is an indirect address (note '[' and ']')
    swp r6, r6, [r4]
    # use immediate value of LOCKED constant
    cmp r6, #LOCKED
    beq waitcount
    b gotlock

waitcount:
    sub r5, #0x1
    cmp r5, #0x0
    beq timeout
    b spin_lock
 
gotlock:
    mov r5, #1

timeout:
    mov r5, #0

    ### epilog ###
    ldmia sp!, {r4-r11}

    # move return value into r0
    mov r0, r5
    # lr contains address of next instruction after function
    mov pc, lr

/*
 * release_binsem
 * input: r0 is binsem_addr
 * returns a '1' for release of locked binary semaphore
 * returns a '0' for release of unlocked binary semaphore
 * in C define prototype: uint32_t release_binsem(uint32_t* binsem_addr);
 */ 
.global release_binsem
release_binsem:
    ### prolog ###
    stmdb sp!, {r4-r11}

    mov r4, binsem_addr
  
    ldr r5, =UNLOCKED
   
    swp r5, r5, [r4]
    
    cmp r5, #UNLOCKED
    beq was_not_locked
    b released_lock
 
released_lock:
    mov r5, #1

was_not_locked:
    mov r5, #0

    ### epilog ###
    ldmia sp!, {r4-r11}

    # move return value into r0
    mov r0, r5

    mov pc, lr

.end

