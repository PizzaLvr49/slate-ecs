const std = @import("std");
const world = @import("world.zig");

pub fn add(a: i32, b: i32) i32 {
    return a + b;
}

test "add works" {
    try std.testing.expect(add(2, 3) == 5);
}

const FuzzContext = struct {};

fn fuzzAdd(_: FuzzContext, smith: *std.testing.Smith) !void {
    const a = smith.value(i32);
    const b = smith.value(i32);

    try std.testing.expect(add(a, b) == add(b, a));
}

test "add fuzz" {
    try std.testing.fuzz(FuzzContext{}, fuzzAdd, .{});
}
