fn main() {
    say(&|content| -> String {
        println!("{}", content);
        return "Hello Rust!".to_string();
    })
}

fn say(reply: &Fn(String) -> String) {
  println!("{}", reply("Hello World!".to_string()));
}
