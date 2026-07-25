const std = @import("std");

pub const Id = packed struct(u64) {
    data: u64, // for now plain layout
};
