const std = @import("std");
const id = @import("id.zig");
const component = @import("component.zig");

const ArchetypeSignature = []component.ComponentId;

const ArchetypeId = u32;

pub const Archetype = struct {
    id: ArchetypeId,
    signature: []component.ComponentId,
};

const ArchetypeIndex = std.AutoHashMap(ArchetypeSignature, Archetype);
const EntityIndex = std.AutoHashMap(id.Identifier, ArchetypeId);
const ArchetypeSet = std.AutoHashMap(ArchetypeId, void);
const ComponentIndex = std.AutoHashMap(component.ComponentId, ArchetypeSet);
