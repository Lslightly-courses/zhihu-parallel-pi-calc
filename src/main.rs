use std::{ptr::null_mut, sync::Arc, thread};

#[derive(Debug)]
struct S {
    arr: i64,
    len: i64,
    cap: i64,
}

fn main() {
    // 使用 String 因为它有明显的 Stack (ptr/len/cap) 和 Heap 部分
    // 且 Move 语义明显（所有权转移）
    let data = S{
        arr: 10,
        len: 20,
        cap: 20,
    };
    
    // 这里的 move 关键字强制将 data 的所有权移入闭包
    let handle = thread::spawn(move || {
        // 实际使用 data，强迫编译器捕获
        println!("Captured: {:?}", data);
    });

    handle.join().unwrap();
}
