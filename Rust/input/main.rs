use std::io;
//use std::io::prelude::*;

fn main() {

//    let stdin = io::stdin();
//    for line in stdin.lock().lines() {
//        println!("{}", line.unwrap());
//    }


    let mut input = String::new();
    io::stdin().read_line(&mut input)
        .ok()
        .expect("Couldn't read line");
    print!("{}", input);
}
