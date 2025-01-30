#Requires AutoHotkey v2.0
Layout2Active := false

; Layout 1 (comportamiento normal)
; (En v2, no es necesario redefinir teclas si su comportamiento es estándar).

; Hotkey para alternar layouts: Ctrl + Q
^q:: {
    global Layout2Active
    if Layout2Active {
        DeactivateLayout2()
    } else {
        ActivateLayout2()
    }
}

; Layout 2 (personalizado)
ActivateLayout2() {
    global Layout2Active := true

    ; Flechas direccionales
    Hotkey("w", (*) => Send("{Up}"), "On")
    Hotkey("a", (*) => Send("{Left}"), "On")
    Hotkey("s", (*) => Send("{Down}"), "On")
    Hotkey("d", (*) => Send("{Right}"), "On")

    ; Números (UIOPJKL)
    Hotkey("u", (*) => Send("4"), "On")
    Hotkey("i", (*) => Send("5"), "On")
    Hotkey("o", (*) => Send("6"), "On")
    Hotkey("j", (*) => Send("1"), "On")
    Hotkey("k", (*) => Send("2"), "On")
    Hotkey("l", (*) => Send("3"), "On")

    ; Volumen
    Hotkey("z", (*) => Send("{Volume_Down}"), "On")
    Hotkey("x", (*) => Send("{Volume_Mute}"), "On")
    Hotkey("c", (*) => Send("{Volume_Up}"), "On")

    ; Funciones especiales
    Hotkey("r", (*) => Send("{Backspace}"), "On")
    Hotkey("f", (*) => Send("#d"), "On") ; Minimizar ventanas
    Hotkey("e", (*) => Send("{Enter}"), "On")
    Hotkey("v", (*) => (WinRestore("A"), WinMaximize("A")), "On") ; Maximizar ventana
    Hotkey("q", (*) => Send("+{F10}"), "On") ; Menú contextual

    ; Selección de texto (Shift + WASD)
    Hotkey("~LShift & w", (*) => Send("+{Up}"), "On")
    Hotkey("~LShift & a", (*) => Send("+{Left}"), "On")
    Hotkey("~LShift & s", (*) => Send("+{Down}"), "On")
    Hotkey("~LShift & d", (*) => Send("+{Right}"), "On")
}

DeactivateLayout2() {
    global Layout2Active := false
    ; Desactiva todas las teclas redefinidas
    for key in ["w", "a", "s", "d", "u", "i", "o", "j", "k", "l", 
                "z", "x", "c", "r", "f", "e", "v", "q", 
                "~LShift & w", "~LShift & a", "~LShift & s", "~LShift & d"] {
        Hotkey(key, "Off")
    }
}