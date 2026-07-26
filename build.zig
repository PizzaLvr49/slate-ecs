const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib_mod = b.createModule(.{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .optimize = optimize,
    });

    const lib = b.addLibrary(.{
        .name = "slate_ecs",
        .root_module = lib_mod,
        .linkage = .static,
    });

    b.installArtifact(lib);

    const tests = b.addTest(.{
        .root_module = lib_mod,
    });

    const run_tests = b.addRunArtifact(tests);

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&run_tests.step);

    const check = b.step("check", "Check library");
    const lib_check = b.addLibrary(.{
        .name = "slate_ecs",
        .root_module = lib_mod,
        .linkage = .static,
    });
    check.dependOn(&lib_check.step);
    check.dependOn(&run_tests.step);
}
