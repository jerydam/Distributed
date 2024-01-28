// The 'ajo' program.
program ajo.aleo {

    record ajo {
        owner: address;
        amount: u64;
        id_assigned: bool;
       
    }
   struct Register {
    expected_amount: u16,
    expected_number: u16,
    day_range: u16,
}

transition create_ajo(expected_amount: u16, expected_number: u16, day_range: u16) -> Register {
    let registration: Register = Register {
        expected_amount,
        expected_number,
        day_range,
    };
   return registration;
}

 transition join_ajo(req_amount: u16, req_number: u16) -> Register {
    let registration: Register = create_ajo( expected_amount: u16, expected_number: u16, day_range: u16);

    require(req_amount == registration.expected_amount, "Amount too low");
    require(req_number == registration.expected_number, "Limit exceeded");
    require(time.blockstamp > day_range, "Registration time expired");
   return registration;
}
}