pub const IdFlags = packed struct(u4) {
    is_pair: bool,
    _reserved: u3,
};

pub const Identifier = packed union(u64) {
    raw: u64,

    entity: packed struct {
        id: u32,
        generation: u28,
        flags: IdFlags,
    },

    pair: packed struct {
        object: u32,
        relation: u28,
        flags: IdFlags,
    },
};
