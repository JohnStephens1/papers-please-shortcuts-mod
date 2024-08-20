; variables
my_screen_dim := [1920, 1080]
current_screen_dim := [A_ScreenWidth, A_ScreenHeight]

approve_pos := Relativy_pos([1550, 600])
deny_pos := Relativy_pos([1300, 600])
stamp_pos := Relativy_pos([1800, 530])

person_pos := Relativy_pos([400, 600])
desk_pos := Relativy_pos([1200, 700])
inspect_pos := Relativy_pos([1750, 1000])
shutter_pos := Relativy_pos([600, 400])
tray_pos := Relativy_pos([400, 800])
next_pos := Relativy_pos([600, 300])
interrogate_pos := Relativy_pos([400, 900])
time_pos := Relativy_pos([150, 950])
weight_pos := Relativy_pos([600, 950])

reason_pos := Relativy_pos([800, 400])
reason_stamp_pos := Relativy_pos([800, 600])
detain_pos := Relativy_pos([1000, 400])
search_pos := Relativy_pos([1300, 400])
fingerprint_pos := Relativy_pos([1600, 400])
fingerprint_from_person_pos := Relativy_pos([370, 800])
fingerprint_goal_pos := Relativy_pos([1200, 550])
fingerprint_result_pos := Relativy_pos([1200, 800])
fingerprint_output_pos := Relativy_pos([1500, 700])

in_inspect_mode := false


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
    ClickDownMoveLetGo([pos[1], pos[2]])
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
    global in_inspect_mode := !in_inspect_mode
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

ToggleShutter() {
    Click(shutter_pos*)
}

ToggleShutterAndReturn() {
    TempFun() {
        ToggleShutter()
    }

    MouseWrapper(TempFun)
}


StampReason() {
    ClickDownMoveLetGo(reason_stamp_pos)
    Sleep(100)

    ToggleStamp()
    Sleep(350)

    Click(reason_stamp_pos*)
    Sleep(100)

    ToggleStamp()
}

Reason() {
    Deny()
    Sleep(50)

    StampReason()
}

Detain() {
    TempFun() {
        Click(detain_pos*)
        sleep(50)
        ToggleShutter()
    }

    MouseWrapper(TempFun)
}

AdvancedDetain() {
    TempFun() {
        Click(detain_pos*)
        sleep(50)
        ToggleShutter()
    }

    MouseWrapper(TempFun)
    Sleep(8000)
    CallNext()
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

CompareFingerprint() {
    MouseMove(fingerprint_from_person_pos[1], fingerprint_from_person_pos[2], 0)
    ClickDownMoveLetGo(fingerprint_goal_pos)
    Sleep(50)
    ToggleInspect()
    Sleep(50)
    Click(fingerprint_goal_pos*)
    Sleep(100)
    Click(fingerprint_result_pos*)
}

AdvancedFingerprint() {
    TempFun() {
        Click(fingerprint_pos*)
        Sleep(600)
        MouseMove(fingerprint_output_pos[1], fingerprint_output_pos[2], 0)
        HandToPerson()
        Sleep(5000)
        CompareFingerprint()
    }

    MouseWrapper(TempFun)
}


EnterInspectAndCompareWith(item_pos) {
    if in_inspect_mode {
        ToggleInspect()
        Sleep(100)
    }

    ToggleInspect()
    Click()
    Sleep(50)
    ClickReturn(item_pos)
}

ManualInInspectModeToggle() {
    global in_inspect_mode := !in_inspect_mode
}

CompareWithTime() {
    EnterInspectAndCompareWith(time_pos)
}

CompareWithPerson() {
    EnterInspectAndCompareWith(person_pos)
}

CompareWithWeight() {
    EnterInspectAndCompareWith(weight_pos)
}


; keybinds
Space:: {
    ToggleInspect()
}

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

t:: {
    ToggleShutterAndReturn()
}


y:: {
    Reason()
}

x:: {
    Detain()
}

^x:: {
    AdvancedDetain()
}

c:: {
    Search()
}

v:: {
    Fingerprint()
}

^v:: {
    AdvancedFingerprint()
}


F1:: {
    ManualInInspectModeToggle()
}

1:: {
    CompareWithTime()
}

2:: {
    CompareWithPerson()
}

3:: {
    CompareWithWeight()
}


+Escape:: {
    Suspend()
}

^Escape:: {
    ExitApp()
}
