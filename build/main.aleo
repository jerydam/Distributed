program ajo.aleo;

record ajo:
    owner as address.private;
    amount as u64.private;
    id_assigned as boolean.private;

struct Register:
    expected_amount as u16;
    expected_number as u16;
    day_range as u16;


function create_ajo:
    input r0 as u16.private;
    input r1 as u16.private;
    input r2 as u16.private;
    cast r0 r1 r2 into r3 as Register;
    output r3 as Register.private;
