const std = @import("std");
const archetype = @import("archetype.zig");

pub const World = struct {
    allocator: std.mem.Allocator,
    archetypes: std.ArrayList(archetype.Archetype),

    pub fn init(allocator: std.mem.Allocator) World {
        return .{
            .allocator = allocator,
            .archetypes = std.ArrayList(archetype.Archetype).empty,
        };
    }

    pub fn deinit(self: *World) void {
        for (self.archetypes.items) |arch| {
            self.allocator.free(arch.signature);
        }
        self.archetypes.deinit(self.allocator);
    }
};

test "make_world" { // for some reason without this zig doesnt compile or analyze world at all
    var world = World.init(std.testing.allocator);
    defer world.deinit();
}
