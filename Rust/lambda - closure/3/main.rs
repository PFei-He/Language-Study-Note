fn main() {
    say(&|end| {
        println!("Hello Rust!");
        end("^_^".to_string());
    })
}

fn say(reply: &Fn(&Fn(String))) {
    println!("Hello World!");
    reply(&|content| {
        println!("{}", content);
    })
}
