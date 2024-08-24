; Graciously aped from http://nocash.emubase.de/pandocs.htm .

; MBC3
DEF MBC3SRamEnable EQU $0000
DEF MBC3RomBank    EQU $2000
DEF MBC3SRamBank   EQU $4000
DEF MBC3LatchClock EQU $6000
DEF MBC3RTC        EQU $a000

DEF SRAM_DISABLE EQU $00
DEF SRAM_ENABLE  EQU $0a

DEF NUM_SRAM_BANKS EQU 4

DEF RTC_S  EQU $08 ; Seconds   0-59 (0-3Bh)
DEF RTC_M  EQU $09 ; Minutes   0-59 (0-3Bh)
DEF RTC_H  EQU $0a ; Hours     0-23 (0-17h)
DEF RTC_DL EQU $0b ; Lower 8 bits of Day Counter (0-FFh)
DEF RTC_DH EQU $0c ; Upper 1 bit of Day Counter, Carry Bit, Halt Flag
        ; Bit 0  Most significant bit of Day Counter (Bit 8)
        ; Bit 6  Halt (0=Active, 1=Stop Timer)
        ; Bit 7  Day Counter Carry Bit (1=Counter Overflow)

; interrupt flags
DEF VBLANK   EQU 0
DEF LCD_STAT EQU 1
DEF TIMER    EQU 2
DEF SERIAL   EQU 3
DEF JOYPAD   EQU 4

; OAM attribute flags
DEF OAM_PALETTE   EQU %111
DEF OAM_TILE_BANK EQU 3
DEF OAM_OBP_NUM   EQU 4 ; Non CGB Mode Only
DEF OAM_X_FLIP    EQU 5
DEF OAM_Y_FLIP    EQU 6
DEF OAM_PRIORITY  EQU 7 ; 0: OBJ above BG, 1: OBJ behind BG (colors 1-3)

; Hardware registers
DEF rJOYP       EQU $ff00 ; Joypad (R/W)
DEF rSB         EQU $ff01 ; Serial transfer data (R/W)
DEF rSC         EQU $ff02 ; Serial Transfer Control (R/W)
DEF rSC_ON    EQU 7
DEF rSC_CGB   EQU 1
DEF rSC_CLOCK EQU 0
DEF rDIV        EQU $ff04 ; Divider Register (R/W)
DEF rTIMA       EQU $ff05 ; Timer counter (R/W)
DEF rTMA        EQU $ff06 ; Timer Modulo (R/W)
DEF rTAC        EQU $ff07 ; Timer Control (R/W)
DEF rTAC_ON        EQU 2
DEF rTAC_4096_HZ   EQU 0
DEF rTAC_262144_HZ EQU 1
DEF rTAC_65536_HZ  EQU 2 
DEF rTAC_16384_HZ  EQU 3
DEF rIF         EQU $ff0f ; Interrupt Flag (R/W)
DEF rNR10       EQU $ff10 ; Channel 1 Sweep register (R/W)
DEF rNR11       EQU $ff11 ; Channel 1 Sound length/Wave pattern duty (R/W)
DEF rNR12       EQU $ff12 ; Channel 1 Volume Envelope (R/W)
DEF rNR13       EQU $ff13 ; Channel 1 Frequency lo (Write Only)
DEF rNR14       EQU $ff14 ; Channel 1 Frequency hi (R/W)
DEF rNR21       EQU $ff16 ; Channel 2 Sound Length/Wave Pattern Duty (R/W)
DEF rNR22       EQU $ff17 ; Channel 2 Volume Envelope (R/W)
DEF rNR23       EQU $ff18 ; Channel 2 Frequency lo data (W)
DEF rNR24       EQU $ff19 ; Channel 2 Frequency hi data (R/W)
DEF rNR30       EQU $ff1a ; Channel 3 Sound on/off (R/W)
DEF rNR31       EQU $ff1b ; Channel 3 Sound Length
DEF rNR32       EQU $ff1c ; Channel 3 Select output level (R/W)
DEF rNR33       EQU $ff1d ; Channel 3 Frequency's lower data (W)
DEF rNR34       EQU $ff1e ; Channel 3 Frequency's higher data (R/W)
DEF rNR41       EQU $ff20 ; Channel 4 Sound Length (R/W)
DEF rNR42       EQU $ff21 ; Channel 4 Volume Envelope (R/W)
DEF rNR43       EQU $ff22 ; Channel 4 Polynomial Counter (R/W)
DEF rNR44       EQU $ff23 ; Channel 4 Counter/consecutive; Inital (R/W)
DEF rNR50       EQU $ff24 ; Channel control / ON-OFF / Volume (R/W)
DEF rNR51       EQU $ff25 ; Selection of Sound output terminal (R/W)
DEF rNR52       EQU $ff26 ; Sound on/off
DEF rLCDC       EQU $ff40 ; LCD Control (R/W)
DEF rSTAT       EQU $ff41 ; LCDC Status (R/W)
DEF rSCY        EQU $ff42 ; Scroll Y (R/W)
DEF rSCX        EQU $ff43 ; Scroll X (R/W)
DEF rLY         EQU $ff44 ; LCDC Y-Coordinate (R)
DEF rLYC        EQU $ff45 ; LY Compare (R/W)
DEF rDMA        EQU $ff46 ; DMA Transfer and Start Address (W)
DEF rBGP        EQU $ff47 ; BG Palette Data (R/W) - Non CGB Mode Only
DEF rOBP0       EQU $ff48 ; Object Palette 0 Data (R/W) - Non CGB Mode Only
DEF rOBP1       EQU $ff49 ; Object Palette 1 Data (R/W) - Non CGB Mode Only
DEF rWY         EQU $ff4a ; Window Y Position (R/W)
DEF rWX         EQU $ff4b ; Window X Position minus 7 (R/W)
DEF rKEY1       EQU $ff4d ; CGB Mode Only - Prepare Speed Switch
DEF rVBK        EQU $ff4f ; CGB Mode Only - VRAM Bank
DEF rHDMA1      EQU $ff51 ; CGB Mode Only - New DMA Source, High
DEF rHDMA2      EQU $ff52 ; CGB Mode Only - New DMA Source, Low
DEF rHDMA3      EQU $ff53 ; CGB Mode Only - New DMA Destination, High
DEF rHDMA4      EQU $ff54 ; CGB Mode Only - New DMA Destination, Low
DEF rHDMA5      EQU $ff55 ; CGB Mode Only - New DMA Length/Mode/Start
DEF rRP         EQU $ff56 ; CGB Mode Only - Infrared Communications Port
DEF rBGPI       EQU $ff68 ; CGB Mode Only - Background Palette Index
DEF rBGPD       EQU $ff69 ; CGB Mode Only - Background Palette Data
DEF rOBPI       EQU $ff6a ; CGB Mode Only - Sprite Palette Index
DEF rOBPD       EQU $ff6b ; CGB Mode Only - Sprite Palette Data
DEF rUNKNOWN1   EQU $ff6c ; (FEh) Bit 0 (Read/Write) - CGB Mode Only
DEF rSVBK       EQU $ff70 ; CGB Mode Only - WRAM Bank
DEF rUNKNOWN2   EQU $ff72 ; (00h) - Bit 0-7 (Read/Write)
DEF rUNKNOWN3   EQU $ff73 ; (00h) - Bit 0-7 (Read/Write)
DEF rUNKNOWN4   EQU $ff74 ; (00h) - Bit 0-7 (Read/Write) - CGB Mode Only
DEF rUNKNOWN5   EQU $ff75 ; (8Fh) - Bit 4-6 (Read/Write)
DEF rUNKNOWN6   EQU $ff76 ; (00h) - Always 00h (Read Only)
DEF rUNKNOWN7   EQU $ff77 ; (00h) - Always 00h (Read Only)
DEF rIE         EQU $ffff ; Interrupt Enable (R/W)

