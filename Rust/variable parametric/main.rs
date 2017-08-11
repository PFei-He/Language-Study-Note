fn main() {
    print(&["A", "B", "C"]);
}

fn print(values: &[&str]) {
    for value in values {
        println!("{}", value);
    }
}
