use std::env;
use std::fs;
use std::io::Write;

mod eve;

fn main() {
    // Purpose:    Driver for DH problems
    // Parameters: None
    // User Input: If no args, input dec numbers
    // Prints:     If no args, then print result
    // Returns:    Nothing
    // Modifies:   Nothing
    // Calls:      ?
    // Tests:      arg_tests/ and stdio_tests/
    // Status:     Student does this

    let args: Vec<String> = env::args().collect();

    if args.len() > 2 {
        let line = fs::read_to_string(args[1].to_owned()).unwrap();

        let alice_broadcast: u64 = line
            .split_whitespace()
            .nth(0)
            .unwrap()
            .trim()
            .parse::<u64>()
            .unwrap();
        let bob_broadcast: u64 = line
            .split_whitespace()
            .nth(1)
            .unwrap()
            .trim()
            .parse::<u64>()
            .unwrap();
        let shared_base: u64 = line
            .split_whitespace()
            .nth(2)
            .unwrap()
            .trim()
            .parse::<u64>()
            .unwrap();

        let mut file = fs::File::create(args[2].to_owned()).unwrap();
        file.write_all(
            eve::baby_eve(alice_broadcast, bob_broadcast, shared_base)
                .iter()
                .map(|val| format!("{}", val))
                .collect::<Vec<String>>()
                .join(" ")
                .as_bytes(),
        )
        .expect("Failed to write to file.");
    } else {
        let mut line = String::new();

        let inp = std::io::stdin().read_line(&mut line);
        let a_b: u64 = line.trim().parse::<u64>().unwrap();
        line.clear();

        let inp = std::io::stdin().read_line(&mut line);
        let b_b: u64 = line.trim().parse::<u64>().unwrap();
        line.clear();

        let inp = std::io::stdin().read_line(&mut line);
        let s_b: u64 = line.trim().parse::<u64>().unwrap();

        println!(
            "{}",
            eve::baby_eve(a_b, b_b, s_b)
                .iter()
                .map(|val| format!("{}", val))
                .collect::<Vec<String>>()
                .join(" ")
        );
    }
}
