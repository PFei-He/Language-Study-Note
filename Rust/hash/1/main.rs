use std::collections::HashMap;

fn main() {
    let mut hash = HashMap::new();
    hash.insert(String::from("A"), 1);
    hash.insert(String::from("B"), 2);
    hash.insert(String::from("C"), 3);
    println!("{:?}", hash);
    println!("{:?}", hash.get(&String::from("A")));
    println!("{:?}", hash.get(&String::from("B")));
    println!("{:?}", hash.get(&String::from("C")));
}
