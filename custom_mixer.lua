-- custom_mixer.lua
-- Custom motor matrix for your real 4-motor vectored-thrust quad

-- Motor mapping (must match wiring / ArduPilot motor order):
-- Motor 1 = Front-Right (CCW)
-- Motor 2 = Rear-Left  (CCW)
-- Motor 3 = Front-Left (CW)
-- Motor 4 = Rear-Right (CW)

------------------------------------------------------
-- ROLL factors (INVERTED to fix roll direction)
-- Original:  M1 +0.861   M2 -1.000   M3 -0.861   M4 +1.000
-- New:       M1 -0.861   M2 +1.000   M3 +0.861   M4 -1.000
------------------------------------------------------

------------------------------------------------------
-- PITCH factors (INVERTED to fix pitch direction)
-- Original:  M1 -0.861   M2 +1.000   M3 -0.861   M4 +1.000
-- New:       M1  0.861   M2 -1.000   M3  0.861   M4 -1.000
------------------------------------------------------

------------------------------------------------------
-- YAW factors (UNCHANGED – yaw already correct)
-- M1 = -1.000   M2 = -0.918   M3 = +1.000   M4 = +0.918
------------------------------------------------------

MotorsMatrix:add_motor_raw(0, -0.861,  0.861, -1.000, 1)  -- M1 Front-Right
MotorsMatrix:add_motor_raw(1,  1.000, -1.000, -0.918, 2)  -- M2 Rear-Left
MotorsMatrix:add_motor_raw(2,  0.861,  0.861,  1.000, 3)  -- M3 Front-Left
MotorsMatrix:add_motor_raw(3, -1.000, -1.000,  0.918, 4)  -- M4 Rear-Right

assert(MotorsMatrix:init(4), "Failed to init MotorsMatrix")

if motors and motors.set_frame_string then
    motors:set_frame_string("Real 3D vectored quad (roll+pitch fixed, yaw OK)")
end
