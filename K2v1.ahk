;Programa Script para layouts en teclado desarrollado en AHKv2 prueba que hice con mi amigo maruchanobed


global Layout2Active := false

; Hotkeys para el layout 1 (normal)
w::w
a::a
s::s
d::d
u::u
i::i
o::o
j::j
k::k
l::l
z::z
x::x
c::c
r::r
f::f

; Activar o desactivar el layout al presionar Ctrl + Q
^q:: 
    if Layout2Active {
        DeactivateLayout2()
    } else {
        ActivateLayout2()
    }
return

; Activar las asignaciones personalizadas layout 2
ActivateLayout2() {
    global Layout2Active := true
    ; Redefinir las teclas "W", "A", "S", "D" para que actúen como flechas
    Hotkey, w, SendUp, On
    Hotkey, a, SendLeft, On
    Hotkey, s, SendDown, On
    Hotkey, d, SendRight, On

    ; Redefinir las teclas "U", "I", "O", "J", "K", "L"
    Hotkey, u, Send4, On
    Hotkey, i, Send5, On
    Hotkey, o, Send6, On
    Hotkey, j, Send1, On
    Hotkey, k, Send2, On
    Hotkey, l, Send3, On

    ; Redefinir teclas "Z", "X", "C" para control de volumen
    Hotkey, z, VolumeDown, On
    Hotkey, x, VolumeMute, On
    Hotkey, c, VolumeUp, On

    ; Redefinir las teclas "R" y "F"
    Hotkey, r, SendBackspace, On
    Hotkey, f, MinimizeAll, On

    ; Definir el comportamiento de Shift + WASD para selección de texto
    ; Usamos el `~` para no bloquear el Shift original
    Hotkey, ~LShift & w, SendSelectionUp, On
    Hotkey, ~LShift & a, SendSelectionLeft, On
    Hotkey, ~LShift & s, SendSelectionDown, On
    Hotkey, ~LShift & d, SendSelectionRight, On
}

; Desactivar las asignaciones personalizadas layout 2
DeactivateLayout2() {
    global Layout2Active := false
    ; Restaurar todas las teclas a su comportamiento original
    Hotkey, w, Off
    Hotkey, a, Off
    Hotkey, s, Off
    Hotkey, d, Off
    Hotkey, u, Off
    Hotkey, i, Off
    Hotkey, o, Off
    Hotkey, j, Off
    Hotkey, k, Off
    Hotkey, l, Off
    Hotkey, z, Off
    Hotkey, x, Off
    Hotkey, c, Off
    Hotkey, r, Off
    Hotkey, f, Off

    ; Desactivar combinaciones Shift + WASD
    Hotkey, ~LShift & w, Off
    Hotkey, ~LShift & a, Off
    Hotkey, ~LShift & s, Off
    Hotkey, ~LShift & d, Off
}

; Funciones de envío para teclas personalizadas
SendSelectionUp:
    Send, +{Up} ; Enviar Shift + Up
return

SendSelectionLeft:
    Send, +{Left} ; Enviar Shift + Left
return

SendSelectionDown:
    Send, +{Down} ; Enviar Shift + Down
return

SendSelectionRight:
    Send, +{Right} ; Enviar Shift + Right
return

SendUp:
    Send, {Up}
return

SendLeft:
    Send, {Left}
return

SendDown:
    Send, {Down}
return

SendRight:
    Send, {Right}
return

Send4:
    Send, 4
return

Send5:
    Send, 5
return

Send6:
    Send, 6
return

Send1:
    Send, 1
return

Send2:
    Send, 2
return

Send3:
    Send, 3
return

VolumeDown:
    Send, {Volume_Down}
return

VolumeMute:
    Send, {Volume_Mute}
return

VolumeUp:
    Send, {Volume_Up}
return

SendBackspace:
    Send, {Backspace}
return

MinimizeAll:
    Send, #d ; # es la tecla de Windows
return