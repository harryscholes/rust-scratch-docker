# Rust scratch Docker images

```console
$ ❯ cat binary/src/main.rs
fn main() {
    println!("Hello, world!");
}

$ docker build -t rust-docker-scratch . > /dev/null 2>&1

$ docker run rust-docker-scratch
Hello, world!
```