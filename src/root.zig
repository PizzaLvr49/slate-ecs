const std = @import("std");
pub const world = @import("world.zig");
pub const id = @import("id.zig");
pub const archetype = @import("archetype.zig");
pub const component = @import("component.zig");

comptime {
    std.testing.refAllDecls(@This());
}
