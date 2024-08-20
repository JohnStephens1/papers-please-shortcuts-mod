; variables
my_screen_dim := [1920, 1080]
current_screen_dim := [A_ScreenWidth, A_ScreenHeight]

approve_pos := Relativy_pos([1650, 500])
deny_pos := Relativy_pos([1300, 500])
stamp_pos := Relativy_pos([1800, 530])

person_pos := Relativy_pos([400, 600])
desk_pos := Relativy_pos([1200, 700])
inspect_pos := Relativy_pos([1750, 1000])
lever_pos := Relativy_pos([600, 400]) ; not used in isolated key
tray_pos := Relativy_pos([400, 800])
next_pos := Relativy_pos([600, 300])
interrogate_pos := Relativy_pos([400, 900])
; add stamp reason shenanigans

detain_pos := Relativy_pos([1000, 400])
search_pos := Relativy_pos([1300, 400])
fingerprint_pos := Relativy_pos([1600, 400])
fingerprint_output_pos := Relativy_pos([1500, 700])

; screen helper functions
Relativy_pos(pos) {
    return [
        pos[1]*current_screen_dim[1]/my_screen_dim[1],
        pos[2]*current_screen_dim[2]/my_screen_dim[2]
    ]
}

PrintRelativeScreenDimensions(){
    MsgBox(
        Integer(Relativy_pos(current_screen_dim)[1])
        " "
        Integer(Relativy_pos(current_screen_dim)[2])
    )
}

; helper functions
MouseWrapper(Fun) {
    MouseGetPos &initial_mouse_pos_x, &initial_mouse_pos_y
    Fun()
    Sleep 50
    MouseMove initial_mouse_pos_x, initial_mouse_pos_y
}

ClickReturn(click_pos) {
    TempFun() {
        Click(click_pos*)
    }

    MouseWrapper(TempFun)
}

ClickDownMoveLetGo(pos) {
    Click "Down"
    Sleep 50
    SendEvent Format("{Click {1}, {2}}", pos*)
    Click "Up"
}

; game logic
ToggleStamp() {
    ClickReturn(stamp_pos)
}

Stamp(pos) {
    ClickDownMoveLetGo([pos[1], pos[2]+100])
    Sleep 20
    ToggleStamp()
    Sleep 300
    ClickReturn(pos)
    ToggleStamp()
}

Deny() {
    Stamp(deny_pos)
}

Approve() {
    Stamp(approve_pos)
}

HandToPerson() {
    TempFun() {
        ClickDownMoveLetGo(person_pos)
    }

    MouseWrapper(TempFun)
}

CallNext() {
    ClickReturn(next_pos)
}

MoveToDesk() {
    ClickDownMoveLetGo(desk_pos)
}

MoveToDeskAndGoBack() {
    TempFun() {
        ClickDownMoveLetGo(desk_pos)
    }

    MouseWrapper(TempFun)
}

ToggleInspect() {
    ClickReturn(inspect_pos)
}

MoveToTray() {
    TempFun() {
        ClickDownMoveLetGo(tray_pos)
    }

    MouseWrapper(TempFun)
}

Interrogate() {
    ClickReturn(interrogate_pos)
}


Detain() {
    TempFun() {
        Click(detain_pos*)
        sleep(50)
        Click(lever_pos*)
    }

    MouseWrapper(TempFun)
}

Search() {
    ClickReturn(search_pos)
}

Fingerprint() {
    TempFun() {
        Click(fingerprint_pos*)
        Sleep(600)
        MouseMove(fingerprint_output_pos[1], fingerprint_output_pos[2], 0)
        HandToPerson()
    }

    MouseWrapper(TempFun)
}


; keybinds
w:: {
    Interrogate()
}

tab:: {
    ToggleStamp()
}

q:: {
    CallNext()
}

a:: {
    Approve()
}

d:: {
    Deny()
}

e:: {
    HandToPerson()
}

^s:: {
    MoveToDesk()
}

s:: {
    MoveToTray()
}


x:: {
    Detain()
}

c:: {
    Search()
}

v:: {
    Fingerprint()
}


+Escape:: {
    Suspend()
}

^Escape:: {
    ExitApp()
}
