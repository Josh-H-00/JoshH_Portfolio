pub fn baby_eve(alice_broadcasts: u64, bob_broadcasts: u64, public_base: u64) -> [u64; 3] {
    // Purpose:     Crack baby DH
    // Parameters:  alice's broadcast, bob's broadcast, and the public base
    // User-input:  None
    // Prints:      Nothing
    // Returns:     Should return an array of 3 unsigned ints:
    //              Alice's secret, Bob's secret, shared secret
    // Modifies:    Nothing
    // Calls:       ?
    // Tests:       unit_test_babydh.rs
    // Status:      Done, correct, but is it ideal?

    let b_secret: u64 = (bob_broadcasts as f64).log(public_base as f64) as u64;

    return [
        (alice_broadcasts as f64).log(public_base as f64) as u64,
        b_secret,
        alice_broadcasts.pow(b_secret as u32),
    ];
}