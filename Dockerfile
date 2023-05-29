FROM rust:latest AS builder
ENV RUSTFLAGS='-C linker=x86_64-linux-gnu-gcc'
WORKDIR /wd
ADD binary /wd
RUN rustup target add x86_64-unknown-linux-musl
RUN apt update && apt install -y gcc-x86-64-linux-gnu
RUN cargo build --target x86_64-unknown-linux-musl --release

FROM scratch
WORKDIR /
COPY --from=builder /wd/target/x86_64-unknown-linux-musl/release/binary /binary
ENTRYPOINT [ "/binary" ]
