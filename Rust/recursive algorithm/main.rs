fn main() {
    recursive(0);
}

fn recursive(i: i32) {
    let mut j = i;
    if j >= 10 {
        return;
    } else {
        println!("{}", j);
        j += 1;
        recursive(j);
    }
}
