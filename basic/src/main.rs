use std::env;
use std::process::ExitCode;

mod command;

fn main() -> ExitCode {
    println!("Hello, world!");

    // コマンドライン引数
    let args: Vec<String> = env::args().collect();
    println!("{:?}", args);

    // 環境変数
    match env::var("A") {
        Ok(env_var) => println!("env var A ({})", env_var),
        Err(err) => println!("env var A is not set ({})", err),
    }

    let a: i32 = args[1].parse().unwrap();
    let b: i32 = args[2].parse().unwrap();
    let result = command::add::add(a, b);
    println!("result: {}", result);

    ExitCode::from(42)
}
