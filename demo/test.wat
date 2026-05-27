(component
  (component (;0;)
    (core module $main (;0;)
      (type (;0;) (func))
      (type (;1;) (func (param i32 i32) (result i32)))
      (type (;2;) (func (param i32 i32 i32 i32) (result i32)))
      (type (;3;) (func (param i32) (result i32)))
      (type (;4;) (func (param i32 i32 i32) (result i32)))
      (type (;5;) (func (param i32)))
      (type (;6;) (func (param i32 i32)))
      (table (;0;) 4 4 funcref)
      (memory (;0;) 17)
      (global $__stack_pointer (;0;) (mut i32) i32.const 1048576)
      (global $GOT.data.internal.__memory_base (;1;) i32 i32.const 0)
      (global $GOT.data.internal.errno (;2;) i32 i32.const 1048712)
      (global $GOT.data.internal.__heap_base (;3;) i32 i32.const 1049216)
      (global $GOT.data.internal.__heap_end (;4;) i32 i32.const 1114112)
      (export "memory" (memory 0))
      (export "docs:adder/add@0.1.0#add" (func $docs:adder/add@0.1.0#add))
      (export "cabi_realloc" (func $cabi_realloc))
      (elem (;0;) (i32.const 1) func $_RNvCs8GLn6hXA1cj_5adder40___link_custom_section_describing_imports $cabi_realloc $_RNvNtCs29yq1xGkpr0_6wasip25proxy40___link_custom_section_describing_imports)
      (func $__wasm_call_ctors (;0;) (type 0))
      (func $_RNvCs8GLn6hXA1cj_5adder40___link_custom_section_describing_imports (;1;) (type 0))
      (func $docs:adder/add@0.1.0#add (;2;) (type 1) (param i32 i32) (result i32)
        call $_RNvNtCsjnzt6jtcXzx_11wit_bindgen2rt14run_ctors_once
        local.get 1
        local.get 0
        i32.add
      )
      (func $_RNvCs9yhMa3bQ28w_7___rustc12___rust_alloc (;3;) (type 1) (param i32 i32) (result i32)
        local.get 0
        local.get 1
        call $_RNvCs9yhMa3bQ28w_7___rustc11___rdl_alloc
        return
      )
      (func $_RNvCs9yhMa3bQ28w_7___rustc14___rust_realloc (;4;) (type 2) (param i32 i32 i32 i32) (result i32)
        local.get 0
        local.get 1
        local.get 2
        local.get 3
        call $_RNvCs9yhMa3bQ28w_7___rustc13___rdl_realloc
        return
      )
      (func $_RNvCs9yhMa3bQ28w_7___rustc35___rust_no_alloc_shim_is_unstable_v2 (;5;) (type 0)
        return
      )
      (func $_RNvNtCsjnzt6jtcXzx_11wit_bindgen2rt14run_ctors_once (;6;) (type 0)
        (local i32)
        block ;; label = @1
          global.get $GOT.data.internal.__memory_base
          i32.const 1048708
          i32.add
          i32.load8_u
          br_if 0 (;@1;)
          global.get $GOT.data.internal.__memory_base
          local.set 0
          call $__wasm_call_ctors
          local.get 0
          i32.const 1048708
          i32.add
          i32.const 1
          i32.store8
        end
      )
      (func $_RNvCs9yhMa3bQ28w_7___rustc11___rdl_alloc (;7;) (type 1) (param i32 i32) (result i32)
        (local i32)
        global.get $__stack_pointer
        i32.const 16
        i32.sub
        local.tee 2
        global.set $__stack_pointer
        block ;; label = @1
          block ;; label = @2
            block ;; label = @3
              local.get 1
              i32.const 8
              i32.gt_u
              br_if 0 (;@3;)
              local.get 1
              local.get 0
              i32.le_u
              br_if 1 (;@2;)
            end
            local.get 2
            i32.const 0
            i32.store offset=12
            local.get 2
            i32.const 12
            i32.add
            local.get 1
            i32.const 4
            local.get 1
            i32.const 4
            i32.gt_u
            select
            local.get 0
            call $posix_memalign
            local.set 1
            i32.const 0
            local.get 2
            i32.load offset=12
            local.get 1
            select
            local.set 1
            br 1 (;@1;)
          end
          local.get 0
          call $malloc
          local.set 1
        end
        local.get 2
        i32.const 16
        i32.add
        global.set $__stack_pointer
        local.get 1
      )
      (func $_RNvCs9yhMa3bQ28w_7___rustc13___rdl_realloc (;8;) (type 2) (param i32 i32 i32 i32) (result i32)
        (local i32 i32)
        global.get $__stack_pointer
        i32.const 16
        i32.sub
        local.tee 4
        global.set $__stack_pointer
        block ;; label = @1
          block ;; label = @2
            block ;; label = @3
              local.get 2
              i32.const 8
              i32.gt_u
              br_if 0 (;@3;)
              local.get 2
              local.get 3
              i32.le_u
              br_if 1 (;@2;)
            end
            i32.const 0
            local.set 5
            local.get 4
            i32.const 0
            i32.store offset=12
            local.get 4
            i32.const 12
            i32.add
            local.get 2
            i32.const 4
            local.get 2
            i32.const 4
            i32.gt_u
            select
            local.get 3
            call $posix_memalign
            br_if 1 (;@1;)
            local.get 4
            i32.load offset=12
            local.tee 2
            i32.eqz
            br_if 1 (;@1;)
            block ;; label = @3
              local.get 3
              local.get 1
              local.get 3
              local.get 1
              i32.lt_u
              select
              local.tee 3
              i32.eqz
              br_if 0 (;@3;)
              local.get 2
              local.get 0
              local.get 3
              memory.copy
            end
            local.get 0
            call $free
            local.get 2
            local.set 5
            br 1 (;@1;)
          end
          local.get 0
          local.get 3
          call $realloc
          local.set 5
        end
        local.get 4
        i32.const 16
        i32.add
        global.set $__stack_pointer
        local.get 5
      )
      (func $_RNvNtNtNtCsbH2HoTk6zdg_3std3sys3pal4wasi14abort_internal (;9;) (type 0)
        call $abort
        unreachable
      )
      (func $cabi_realloc (;10;) (type 2) (param i32 i32 i32 i32) (result i32)
        block ;; label = @1
          block ;; label = @2
            block ;; label = @3
              local.get 1
              br_if 0 (;@3;)
              local.get 3
              i32.eqz
              br_if 2 (;@1;)
              call $_RNvCs9yhMa3bQ28w_7___rustc35___rust_no_alloc_shim_is_unstable_v2
              local.get 3
              local.get 2
              call $_RNvCs9yhMa3bQ28w_7___rustc12___rust_alloc
              local.tee 2
              i32.eqz
              br_if 1 (;@2;)
              br 2 (;@1;)
            end
            local.get 0
            local.get 1
            local.get 2
            local.get 3
            call $_RNvCs9yhMa3bQ28w_7___rustc14___rust_realloc
            local.tee 2
            br_if 1 (;@1;)
          end
          call $_RNvNtNtNtCsbH2HoTk6zdg_3std3sys3pal4wasi14abort_internal
          unreachable
        end
        local.get 2
      )
      (func $_RNvNtCs29yq1xGkpr0_6wasip25proxy40___link_custom_section_describing_imports (;11;) (type 0))
      (func $abort (;12;) (type 0)
        unreachable
      )
      (func $__component_type_object_force_link_wasip2_public_use_in_this_compilation_unit (;13;) (type 0)
        call $__component_type_object_force_link_wasip2
      )
      (func $sbrk (;14;) (type 3) (param i32) (result i32)
        block ;; label = @1
          local.get 0
          br_if 0 (;@1;)
          memory.size
          i32.const 16
          i32.shl
          return
        end
        block ;; label = @1
          local.get 0
          i32.const 65535
          i32.and
          br_if 0 (;@1;)
          local.get 0
          i32.const -1
          i32.le_s
          br_if 0 (;@1;)
          block ;; label = @2
            local.get 0
            i32.const 16
            i32.shr_u
            memory.grow
            local.tee 0
            i32.const -1
            i32.ne
            br_if 0 (;@2;)
            global.get $GOT.data.internal.errno
            i32.const 48
            i32.store
            i32.const -1
            return
          end
          local.get 0
          i32.const 16
          i32.shl
          return
        end
        call $abort
        unreachable
      )
      (func $malloc (;15;) (type 3) (param i32) (result i32)
        local.get 0
        call $dlmalloc
      )
      (func $dlmalloc (;16;) (type 3) (param i32) (result i32)
        (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
        global.get $__stack_pointer
        i32.const 16
        i32.sub
        local.tee 1
        global.set $__stack_pointer
        block ;; label = @1
          block ;; label = @2
            block ;; label = @3
              block ;; label = @4
                block ;; label = @5
                  block ;; label = @6
                    block ;; label = @7
                      block ;; label = @8
                        block ;; label = @9
                          block ;; label = @10
                            block ;; label = @11
                              block ;; label = @12
                                block ;; label = @13
                                  global.get $GOT.data.internal.__memory_base
                                  i32.const 1048716
                                  i32.add
                                  i32.load offset=24
                                  local.tee 2
                                  br_if 0 (;@13;)
                                  block ;; label = @14
                                    global.get $GOT.data.internal.__memory_base
                                    i32.const 1049188
                                    i32.add
                                    i32.load
                                    local.tee 3
                                    br_if 0 (;@14;)
                                    global.get $GOT.data.internal.__memory_base
                                    local.tee 4
                                    i32.const 1049188
                                    i32.add
                                    local.tee 5
                                    i32.const 0
                                    i32.store offset=20
                                    local.get 5
                                    i64.const -1
                                    i64.store offset=12 align=4
                                    local.get 5
                                    i64.const 281474976776192
                                    i64.store offset=4 align=4
                                    local.get 4
                                    i32.const 1048716
                                    i32.add
                                    i32.const 0
                                    i32.store offset=444
                                    local.get 5
                                    local.get 1
                                    i32.const 8
                                    i32.add
                                    i32.const -16
                                    i32.and
                                    i32.const 1431655768
                                    i32.xor
                                    local.tee 3
                                    i32.store
                                  end
                                  global.get $GOT.data.internal.__heap_base
                                  local.set 5
                                  global.get $GOT.data.internal.__heap_end
                                  local.get 5
                                  i32.lt_u
                                  br_if 1 (;@12;)
                                  global.get $GOT.data.internal.__heap_base
                                  local.set 5
                                  i32.const 0
                                  local.set 2
                                  global.get $GOT.data.internal.__heap_end
                                  local.get 5
                                  i32.sub
                                  i32.const 89
                                  i32.lt_u
                                  br_if 0 (;@13;)
                                  global.get $GOT.data.internal.__heap_base
                                  local.set 4
                                  global.get $GOT.data.internal.__heap_end
                                  local.set 6
                                  global.get $GOT.data.internal.__memory_base
                                  i32.const 1048716
                                  i32.add
                                  local.tee 5
                                  local.get 6
                                  local.get 4
                                  i32.sub
                                  local.tee 6
                                  i32.store offset=452
                                  local.get 5
                                  local.get 4
                                  i32.store offset=448
                                  local.get 5
                                  local.get 4
                                  i32.store offset=16
                                  local.get 5
                                  local.get 6
                                  i32.store offset=436
                                  local.get 5
                                  local.get 6
                                  i32.store offset=432
                                  local.get 5
                                  local.get 3
                                  i32.store offset=36
                                  local.get 5
                                  i32.const -1
                                  i32.store offset=32
                                  i32.const -256
                                  local.set 4
                                  loop ;; label = @14
                                    global.get $GOT.data.internal.__memory_base
                                    i32.const 1048716
                                    i32.add
                                    local.get 4
                                    i32.add
                                    local.tee 5
                                    i32.const 316
                                    i32.add
                                    local.get 5
                                    i32.const 304
                                    i32.add
                                    local.tee 3
                                    i32.store
                                    local.get 3
                                    local.get 5
                                    i32.const 296
                                    i32.add
                                    local.tee 6
                                    i32.store
                                    local.get 5
                                    i32.const 308
                                    i32.add
                                    local.get 6
                                    i32.store
                                    local.get 5
                                    i32.const 324
                                    i32.add
                                    local.get 5
                                    i32.const 312
                                    i32.add
                                    local.tee 6
                                    i32.store
                                    local.get 6
                                    local.get 3
                                    i32.store
                                    local.get 5
                                    i32.const 332
                                    i32.add
                                    local.get 5
                                    i32.const 320
                                    i32.add
                                    local.tee 3
                                    i32.store
                                    local.get 3
                                    local.get 6
                                    i32.store
                                    local.get 5
                                    i32.const 328
                                    i32.add
                                    local.get 3
                                    i32.store
                                    local.get 4
                                    i32.const 32
                                    i32.add
                                    local.tee 4
                                    br_if 0 (;@14;)
                                  end
                                  global.get $GOT.data.internal.__heap_end
                                  local.tee 3
                                  i32.const -52
                                  i32.add
                                  i32.const 56
                                  i32.store
                                  global.get $GOT.data.internal.__memory_base
                                  local.tee 4
                                  i32.const 1048716
                                  i32.add
                                  local.tee 5
                                  local.get 4
                                  i32.const 1049188
                                  i32.add
                                  i32.load offset=16
                                  i32.store offset=28
                                  local.get 5
                                  global.get $GOT.data.internal.__heap_base
                                  local.tee 4
                                  i32.const -8
                                  local.get 4
                                  i32.sub
                                  i32.const 15
                                  i32.and
                                  local.tee 6
                                  i32.add
                                  local.tee 2
                                  i32.store offset=24
                                  local.get 5
                                  local.get 3
                                  local.get 4
                                  i32.sub
                                  local.get 6
                                  i32.sub
                                  i32.const -56
                                  i32.add
                                  local.tee 4
                                  i32.store offset=12
                                  local.get 2
                                  local.get 4
                                  i32.const 1
                                  i32.or
                                  i32.store offset=4
                                end
                                block ;; label = @13
                                  block ;; label = @14
                                    local.get 0
                                    i32.const 236
                                    i32.gt_u
                                    br_if 0 (;@14;)
                                    block ;; label = @15
                                      global.get $GOT.data.internal.__memory_base
                                      i32.const 1048716
                                      i32.add
                                      i32.load
                                      local.tee 7
                                      i32.const 16
                                      local.get 0
                                      i32.const 19
                                      i32.add
                                      i32.const 496
                                      i32.and
                                      local.get 0
                                      i32.const 11
                                      i32.lt_u
                                      select
                                      local.tee 3
                                      i32.const 3
                                      i32.shr_u
                                      local.tee 4
                                      i32.shr_u
                                      local.tee 5
                                      i32.const 3
                                      i32.and
                                      i32.eqz
                                      br_if 0 (;@15;)
                                      block ;; label = @16
                                        block ;; label = @17
                                          global.get $GOT.data.internal.__memory_base
                                          i32.const 1048716
                                          i32.add
                                          local.get 5
                                          i32.const 1
                                          i32.and
                                          local.get 4
                                          i32.or
                                          i32.const 1
                                          i32.xor
                                          local.tee 0
                                          i32.const 3
                                          i32.shl
                                          local.tee 3
                                          i32.add
                                          local.tee 4
                                          i32.const 40
                                          i32.add
                                          local.tee 5
                                          local.get 4
                                          i32.load offset=48
                                          local.tee 4
                                          i32.load offset=8
                                          local.tee 6
                                          i32.ne
                                          br_if 0 (;@17;)
                                          global.get $GOT.data.internal.__memory_base
                                          i32.const 1048716
                                          i32.add
                                          local.get 7
                                          i32.const -2
                                          local.get 0
                                          i32.rotl
                                          i32.and
                                          i32.store
                                          br 1 (;@16;)
                                        end
                                        local.get 5
                                        local.get 6
                                        i32.store offset=8
                                        local.get 6
                                        local.get 5
                                        i32.store offset=12
                                      end
                                      local.get 4
                                      i32.const 8
                                      i32.add
                                      local.set 5
                                      local.get 4
                                      local.get 3
                                      i32.const 3
                                      i32.or
                                      i32.store offset=4
                                      local.get 4
                                      local.get 3
                                      i32.add
                                      local.tee 4
                                      local.get 4
                                      i32.load offset=4
                                      i32.const 1
                                      i32.or
                                      i32.store offset=4
                                      br 14 (;@1;)
                                    end
                                    local.get 3
                                    global.get $GOT.data.internal.__memory_base
                                    i32.const 1048716
                                    i32.add
                                    i32.load offset=8
                                    local.tee 8
                                    i32.le_u
                                    br_if 1 (;@13;)
                                    block ;; label = @15
                                      local.get 5
                                      i32.eqz
                                      br_if 0 (;@15;)
                                      block ;; label = @16
                                        block ;; label = @17
                                          global.get $GOT.data.internal.__memory_base
                                          i32.const 1048716
                                          i32.add
                                          local.get 5
                                          local.get 4
                                          i32.shl
                                          i32.const 2
                                          local.get 4
                                          i32.shl
                                          local.tee 5
                                          i32.const 0
                                          local.get 5
                                          i32.sub
                                          i32.or
                                          i32.and
                                          i32.ctz
                                          local.tee 9
                                          i32.const 3
                                          i32.shl
                                          local.tee 4
                                          i32.add
                                          local.tee 5
                                          i32.const 40
                                          i32.add
                                          local.tee 6
                                          local.get 5
                                          i32.load offset=48
                                          local.tee 5
                                          i32.load offset=8
                                          local.tee 0
                                          i32.ne
                                          br_if 0 (;@17;)
                                          global.get $GOT.data.internal.__memory_base
                                          i32.const 1048716
                                          i32.add
                                          local.get 7
                                          i32.const -2
                                          local.get 9
                                          i32.rotl
                                          i32.and
                                          local.tee 7
                                          i32.store
                                          br 1 (;@16;)
                                        end
                                        local.get 6
                                        local.get 0
                                        i32.store offset=8
                                        local.get 0
                                        local.get 6
                                        i32.store offset=12
                                      end
                                      local.get 5
                                      local.get 3
                                      i32.const 3
                                      i32.or
                                      i32.store offset=4
                                      local.get 5
                                      local.get 4
                                      i32.add
                                      local.get 4
                                      local.get 3
                                      i32.sub
                                      local.tee 6
                                      i32.store
                                      local.get 5
                                      local.get 3
                                      i32.add
                                      local.tee 0
                                      local.get 6
                                      i32.const 1
                                      i32.or
                                      i32.store offset=4
                                      block ;; label = @16
                                        local.get 8
                                        i32.eqz
                                        br_if 0 (;@16;)
                                        global.get $GOT.data.internal.__memory_base
                                        i32.const 1048716
                                        i32.add
                                        local.tee 4
                                        local.get 8
                                        i32.const -8
                                        i32.and
                                        i32.add
                                        i32.const 40
                                        i32.add
                                        local.set 3
                                        local.get 4
                                        i32.load offset=20
                                        local.set 4
                                        block ;; label = @17
                                          block ;; label = @18
                                            local.get 7
                                            i32.const 1
                                            local.get 8
                                            i32.const 3
                                            i32.shr_u
                                            i32.shl
                                            local.tee 9
                                            i32.and
                                            br_if 0 (;@18;)
                                            global.get $GOT.data.internal.__memory_base
                                            i32.const 1048716
                                            i32.add
                                            local.get 7
                                            local.get 9
                                            i32.or
                                            i32.store
                                            local.get 3
                                            local.set 9
                                            br 1 (;@17;)
                                          end
                                          local.get 3
                                          i32.load offset=8
                                          local.set 9
                                        end
                                        local.get 9
                                        local.get 4
                                        i32.store offset=12
                                        local.get 3
                                        local.get 4
                                        i32.store offset=8
                                        local.get 4
                                        local.get 3
                                        i32.store offset=12
                                        local.get 4
                                        local.get 9
                                        i32.store offset=8
                                      end
                                      local.get 5
                                      i32.const 8
                                      i32.add
                                      local.set 5
                                      global.get $GOT.data.internal.__memory_base
                                      i32.const 1048716
                                      i32.add
                                      local.tee 4
                                      local.get 0
                                      i32.store offset=20
                                      local.get 4
                                      local.get 6
                                      i32.store offset=8
                                      br 14 (;@1;)
                                    end
                                    global.get $GOT.data.internal.__memory_base
                                    i32.const 1048716
                                    i32.add
                                    i32.load offset=4
                                    local.tee 10
                                    i32.eqz
                                    br_if 1 (;@13;)
                                    global.get $GOT.data.internal.__memory_base
                                    i32.const 1048716
                                    i32.add
                                    local.get 10
                                    i32.ctz
                                    i32.const 2
                                    i32.shl
                                    i32.add
                                    i32.load offset=304
                                    local.tee 6
                                    i32.load offset=4
                                    i32.const -8
                                    i32.and
                                    local.get 3
                                    i32.sub
                                    local.set 4
                                    local.get 6
                                    local.set 0
                                    block ;; label = @15
                                      loop ;; label = @16
                                        block ;; label = @17
                                          local.get 6
                                          i32.load offset=16
                                          local.tee 5
                                          br_if 0 (;@17;)
                                          local.get 6
                                          i32.load offset=20
                                          local.tee 5
                                          i32.eqz
                                          br_if 2 (;@15;)
                                        end
                                        local.get 5
                                        i32.load offset=4
                                        i32.const -8
                                        i32.and
                                        local.get 3
                                        i32.sub
                                        local.tee 6
                                        local.get 4
                                        local.get 6
                                        local.get 4
                                        i32.lt_u
                                        local.tee 6
                                        select
                                        local.set 4
                                        local.get 5
                                        local.get 0
                                        local.get 6
                                        select
                                        local.set 0
                                        local.get 5
                                        local.set 6
                                        br 0 (;@16;)
                                      end
                                    end
                                    local.get 0
                                    i32.load offset=24
                                    local.set 2
                                    block ;; label = @15
                                      local.get 0
                                      i32.load offset=12
                                      local.tee 5
                                      local.get 0
                                      i32.eq
                                      br_if 0 (;@15;)
                                      local.get 0
                                      i32.load offset=8
                                      local.tee 6
                                      local.get 5
                                      i32.store offset=12
                                      local.get 5
                                      local.get 6
                                      i32.store offset=8
                                      br 13 (;@2;)
                                    end
                                    block ;; label = @15
                                      block ;; label = @16
                                        local.get 0
                                        i32.load offset=20
                                        local.tee 6
                                        i32.eqz
                                        br_if 0 (;@16;)
                                        local.get 0
                                        i32.const 20
                                        i32.add
                                        local.set 9
                                        br 1 (;@15;)
                                      end
                                      local.get 0
                                      i32.load offset=16
                                      local.tee 6
                                      i32.eqz
                                      br_if 4 (;@11;)
                                      local.get 0
                                      i32.const 16
                                      i32.add
                                      local.set 9
                                    end
                                    loop ;; label = @15
                                      local.get 9
                                      local.set 11
                                      local.get 6
                                      local.tee 5
                                      i32.const 20
                                      i32.add
                                      local.set 9
                                      local.get 5
                                      i32.load offset=20
                                      local.tee 6
                                      br_if 0 (;@15;)
                                      local.get 5
                                      i32.const 16
                                      i32.add
                                      local.set 9
                                      local.get 5
                                      i32.load offset=16
                                      local.tee 6
                                      br_if 0 (;@15;)
                                    end
                                    local.get 11
                                    i32.const 0
                                    i32.store
                                    br 12 (;@2;)
                                  end
                                  i32.const -1
                                  local.set 3
                                  local.get 0
                                  i32.const -65
                                  i32.gt_u
                                  br_if 0 (;@13;)
                                  local.get 0
                                  i32.const 19
                                  i32.add
                                  local.tee 4
                                  i32.const -16
                                  i32.and
                                  local.set 3
                                  global.get $GOT.data.internal.__memory_base
                                  i32.const 1048716
                                  i32.add
                                  i32.load offset=4
                                  local.tee 10
                                  i32.eqz
                                  br_if 0 (;@13;)
                                  i32.const 0
                                  local.set 5
                                  i32.const 31
                                  local.set 8
                                  block ;; label = @14
                                    local.get 0
                                    i32.const 16777196
                                    i32.gt_u
                                    br_if 0 (;@14;)
                                    local.get 3
                                    i32.const 38
                                    local.get 4
                                    i32.const 8
                                    i32.shr_u
                                    i32.clz
                                    local.tee 4
                                    i32.sub
                                    i32.shr_u
                                    i32.const 1
                                    i32.and
                                    local.get 4
                                    i32.const 1
                                    i32.shl
                                    i32.sub
                                    i32.const 62
                                    i32.add
                                    local.set 8
                                  end
                                  i32.const 0
                                  local.get 3
                                  i32.sub
                                  local.set 4
                                  block ;; label = @14
                                    block ;; label = @15
                                      block ;; label = @16
                                        block ;; label = @17
                                          global.get $GOT.data.internal.__memory_base
                                          i32.const 1048716
                                          i32.add
                                          local.get 8
                                          i32.const 2
                                          i32.shl
                                          i32.add
                                          i32.load offset=304
                                          local.tee 6
                                          br_if 0 (;@17;)
                                          i32.const 0
                                          local.set 9
                                          br 1 (;@16;)
                                        end
                                        i32.const 0
                                        local.set 5
                                        local.get 3
                                        i32.const 0
                                        i32.const 25
                                        local.get 8
                                        i32.const 1
                                        i32.shr_u
                                        i32.sub
                                        local.get 8
                                        i32.const 31
                                        i32.eq
                                        select
                                        i32.shl
                                        local.set 0
                                        i32.const 0
                                        local.set 9
                                        loop ;; label = @17
                                          block ;; label = @18
                                            local.get 6
                                            i32.load offset=4
                                            i32.const -8
                                            i32.and
                                            local.get 3
                                            i32.sub
                                            local.tee 7
                                            local.get 4
                                            i32.ge_u
                                            br_if 0 (;@18;)
                                            local.get 7
                                            local.set 4
                                            local.get 6
                                            local.set 9
                                            local.get 7
                                            br_if 0 (;@18;)
                                            i32.const 0
                                            local.set 4
                                            local.get 6
                                            local.set 9
                                            local.get 6
                                            local.set 5
                                            br 3 (;@15;)
                                          end
                                          local.get 5
                                          local.get 6
                                          i32.load offset=20
                                          local.tee 7
                                          local.get 7
                                          local.get 6
                                          local.get 0
                                          i32.const 29
                                          i32.shr_u
                                          i32.const 4
                                          i32.and
                                          i32.add
                                          i32.load offset=16
                                          local.tee 11
                                          i32.eq
                                          select
                                          local.get 5
                                          local.get 7
                                          select
                                          local.set 5
                                          local.get 0
                                          i32.const 1
                                          i32.shl
                                          local.set 0
                                          local.get 11
                                          local.set 6
                                          local.get 11
                                          br_if 0 (;@17;)
                                        end
                                      end
                                      block ;; label = @16
                                        local.get 5
                                        local.get 9
                                        i32.or
                                        br_if 0 (;@16;)
                                        i32.const 0
                                        local.set 9
                                        i32.const 2
                                        local.get 8
                                        i32.shl
                                        local.tee 5
                                        i32.const 0
                                        local.get 5
                                        i32.sub
                                        i32.or
                                        local.get 10
                                        i32.and
                                        local.tee 5
                                        i32.eqz
                                        br_if 3 (;@13;)
                                        global.get $GOT.data.internal.__memory_base
                                        i32.const 1048716
                                        i32.add
                                        local.get 5
                                        i32.ctz
                                        i32.const 2
                                        i32.shl
                                        i32.add
                                        i32.load offset=304
                                        local.set 5
                                      end
                                      local.get 5
                                      i32.eqz
                                      br_if 1 (;@14;)
                                    end
                                    loop ;; label = @15
                                      local.get 5
                                      i32.load offset=4
                                      i32.const -8
                                      i32.and
                                      local.get 3
                                      i32.sub
                                      local.tee 7
                                      local.get 4
                                      i32.lt_u
                                      local.set 0
                                      block ;; label = @16
                                        local.get 5
                                        i32.load offset=16
                                        local.tee 6
                                        br_if 0 (;@16;)
                                        local.get 5
                                        i32.load offset=20
                                        local.set 6
                                      end
                                      local.get 7
                                      local.get 4
                                      local.get 0
                                      select
                                      local.set 4
                                      local.get 5
                                      local.get 9
                                      local.get 0
                                      select
                                      local.set 9
                                      local.get 6
                                      local.set 5
                                      local.get 6
                                      br_if 0 (;@15;)
                                    end
                                  end
                                  local.get 9
                                  i32.eqz
                                  br_if 0 (;@13;)
                                  local.get 4
                                  global.get $GOT.data.internal.__memory_base
                                  i32.const 1048716
                                  i32.add
                                  i32.load offset=8
                                  local.get 3
                                  i32.sub
                                  i32.ge_u
                                  br_if 0 (;@13;)
                                  local.get 9
                                  i32.load offset=24
                                  local.set 11
                                  block ;; label = @14
                                    local.get 9
                                    i32.load offset=12
                                    local.tee 5
                                    local.get 9
                                    i32.eq
                                    br_if 0 (;@14;)
                                    local.get 9
                                    i32.load offset=8
                                    local.tee 6
                                    local.get 5
                                    i32.store offset=12
                                    local.get 5
                                    local.get 6
                                    i32.store offset=8
                                    br 11 (;@3;)
                                  end
                                  block ;; label = @14
                                    block ;; label = @15
                                      local.get 9
                                      i32.load offset=20
                                      local.tee 6
                                      i32.eqz
                                      br_if 0 (;@15;)
                                      local.get 9
                                      i32.const 20
                                      i32.add
                                      local.set 0
                                      br 1 (;@14;)
                                    end
                                    local.get 9
                                    i32.load offset=16
                                    local.tee 6
                                    i32.eqz
                                    br_if 4 (;@10;)
                                    local.get 9
                                    i32.const 16
                                    i32.add
                                    local.set 0
                                  end
                                  loop ;; label = @14
                                    local.get 0
                                    local.set 7
                                    local.get 6
                                    local.tee 5
                                    i32.const 20
                                    i32.add
                                    local.set 0
                                    local.get 5
                                    i32.load offset=20
                                    local.tee 6
                                    br_if 0 (;@14;)
                                    local.get 5
                                    i32.const 16
                                    i32.add
                                    local.set 0
                                    local.get 5
                                    i32.load offset=16
                                    local.tee 6
                                    br_if 0 (;@14;)
                                  end
                                  local.get 7
                                  i32.const 0
                                  i32.store
                                  br 10 (;@3;)
                                end
                                block ;; label = @13
                                  global.get $GOT.data.internal.__memory_base
                                  i32.const 1048716
                                  i32.add
                                  i32.load offset=8
                                  local.tee 5
                                  local.get 3
                                  i32.lt_u
                                  br_if 0 (;@13;)
                                  global.get $GOT.data.internal.__memory_base
                                  i32.const 1048716
                                  i32.add
                                  i32.load offset=20
                                  local.set 4
                                  block ;; label = @14
                                    block ;; label = @15
                                      local.get 5
                                      local.get 3
                                      i32.sub
                                      local.tee 6
                                      i32.const 16
                                      i32.lt_u
                                      br_if 0 (;@15;)
                                      local.get 4
                                      local.get 3
                                      i32.add
                                      local.tee 0
                                      local.get 6
                                      i32.const 1
                                      i32.or
                                      i32.store offset=4
                                      local.get 4
                                      local.get 5
                                      i32.add
                                      local.get 6
                                      i32.store
                                      local.get 4
                                      local.get 3
                                      i32.const 3
                                      i32.or
                                      i32.store offset=4
                                      br 1 (;@14;)
                                    end
                                    local.get 4
                                    local.get 5
                                    i32.const 3
                                    i32.or
                                    i32.store offset=4
                                    local.get 4
                                    local.get 5
                                    i32.add
                                    local.tee 5
                                    local.get 5
                                    i32.load offset=4
                                    i32.const 1
                                    i32.or
                                    i32.store offset=4
                                    i32.const 0
                                    local.set 6
                                    i32.const 0
                                    local.set 0
                                  end
                                  global.get $GOT.data.internal.__memory_base
                                  i32.const 1048716
                                  i32.add
                                  local.tee 5
                                  local.get 6
                                  i32.store offset=8
                                  local.get 5
                                  local.get 0
                                  i32.store offset=20
                                  local.get 4
                                  i32.const 8
                                  i32.add
                                  local.set 5
                                  br 12 (;@1;)
                                end
                                block ;; label = @13
                                  global.get $GOT.data.internal.__memory_base
                                  i32.const 1048716
                                  i32.add
                                  i32.load offset=12
                                  local.tee 0
                                  local.get 3
                                  i32.le_u
                                  br_if 0 (;@13;)
                                  local.get 2
                                  local.get 3
                                  i32.add
                                  local.tee 5
                                  local.get 0
                                  local.get 3
                                  i32.sub
                                  local.tee 4
                                  i32.const 1
                                  i32.or
                                  i32.store offset=4
                                  global.get $GOT.data.internal.__memory_base
                                  i32.const 1048716
                                  i32.add
                                  local.tee 6
                                  local.get 5
                                  i32.store offset=24
                                  local.get 6
                                  local.get 4
                                  i32.store offset=12
                                  local.get 2
                                  local.get 3
                                  i32.const 3
                                  i32.or
                                  i32.store offset=4
                                  local.get 2
                                  i32.const 8
                                  i32.add
                                  local.set 5
                                  br 12 (;@1;)
                                end
                                block ;; label = @13
                                  block ;; label = @14
                                    global.get $GOT.data.internal.__memory_base
                                    i32.const 1049188
                                    i32.add
                                    i32.load
                                    i32.eqz
                                    br_if 0 (;@14;)
                                    global.get $GOT.data.internal.__memory_base
                                    i32.const 1049188
                                    i32.add
                                    i32.load offset=8
                                    local.set 4
                                    br 1 (;@13;)
                                  end
                                  global.get $GOT.data.internal.__memory_base
                                  local.tee 4
                                  i32.const 1049188
                                  i32.add
                                  local.tee 5
                                  i32.const 0
                                  i32.store offset=20
                                  local.get 5
                                  i64.const -1
                                  i64.store offset=12 align=4
                                  local.get 5
                                  i64.const 281474976776192
                                  i64.store offset=4 align=4
                                  local.get 4
                                  i32.const 1048716
                                  i32.add
                                  i32.const 0
                                  i32.store offset=444
                                  local.get 5
                                  local.get 1
                                  i32.const 12
                                  i32.add
                                  i32.const -16
                                  i32.and
                                  i32.const 1431655768
                                  i32.xor
                                  i32.store
                                  i32.const 65536
                                  local.set 4
                                end
                                i32.const 0
                                local.set 5
                                block ;; label = @13
                                  local.get 4
                                  local.get 3
                                  i32.const 71
                                  i32.add
                                  local.tee 8
                                  i32.add
                                  local.tee 7
                                  i32.const 0
                                  local.get 4
                                  i32.sub
                                  local.tee 11
                                  i32.and
                                  local.tee 9
                                  local.get 3
                                  i32.gt_u
                                  br_if 0 (;@13;)
                                  global.get $GOT.data.internal.errno
                                  i32.const 48
                                  i32.store
                                  br 12 (;@1;)
                                end
                                block ;; label = @13
                                  global.get $GOT.data.internal.__memory_base
                                  i32.const 1048716
                                  i32.add
                                  i32.load offset=440
                                  local.tee 4
                                  i32.eqz
                                  br_if 0 (;@13;)
                                  block ;; label = @14
                                    global.get $GOT.data.internal.__memory_base
                                    i32.const 1048716
                                    i32.add
                                    i32.load offset=432
                                    local.tee 6
                                    local.get 9
                                    i32.add
                                    local.tee 10
                                    local.get 6
                                    i32.le_u
                                    br_if 0 (;@14;)
                                    local.get 10
                                    local.get 4
                                    i32.le_u
                                    br_if 1 (;@13;)
                                  end
                                  global.get $GOT.data.internal.errno
                                  i32.const 48
                                  i32.store
                                  br 12 (;@1;)
                                end
                                global.get $GOT.data.internal.__memory_base
                                i32.const 1048716
                                i32.add
                                i32.load8_u offset=444
                                i32.const 4
                                i32.and
                                br_if 5 (;@7;)
                                block ;; label = @13
                                  block ;; label = @14
                                    block ;; label = @15
                                      local.get 2
                                      i32.eqz
                                      br_if 0 (;@15;)
                                      global.get $GOT.data.internal.__memory_base
                                      i32.const 1048716
                                      i32.add
                                      i32.const 448
                                      i32.add
                                      local.set 4
                                      loop ;; label = @16
                                        block ;; label = @17
                                          local.get 2
                                          local.get 4
                                          i32.load
                                          local.tee 6
                                          i32.lt_u
                                          br_if 0 (;@17;)
                                          local.get 2
                                          local.get 6
                                          local.get 4
                                          i32.load offset=4
                                          i32.add
                                          i32.lt_u
                                          br_if 3 (;@14;)
                                        end
                                        local.get 4
                                        i32.load offset=8
                                        local.tee 4
                                        br_if 0 (;@16;)
                                      end
                                    end
                                    i32.const 0
                                    call $sbrk
                                    local.tee 7
                                    i32.const -1
                                    i32.eq
                                    br_if 6 (;@8;)
                                    local.get 9
                                    local.set 11
                                    block ;; label = @15
                                      global.get $GOT.data.internal.__memory_base
                                      i32.const 1049188
                                      i32.add
                                      i32.load offset=4
                                      local.tee 4
                                      i32.const -1
                                      i32.add
                                      local.tee 6
                                      local.get 7
                                      i32.and
                                      i32.eqz
                                      br_if 0 (;@15;)
                                      local.get 9
                                      local.get 7
                                      i32.sub
                                      local.get 6
                                      local.get 7
                                      i32.add
                                      i32.const 0
                                      local.get 4
                                      i32.sub
                                      i32.and
                                      i32.add
                                      local.set 11
                                    end
                                    global.get $GOT.data.internal.__memory_base
                                    local.set 4
                                    local.get 11
                                    local.get 3
                                    i32.le_u
                                    br_if 6 (;@8;)
                                    local.get 11
                                    i32.const 2147483646
                                    i32.gt_u
                                    br_if 6 (;@8;)
                                    local.get 4
                                    i32.const 1048716
                                    i32.add
                                    i32.load offset=432
                                    local.set 4
                                    block ;; label = @15
                                      global.get $GOT.data.internal.__memory_base
                                      i32.const 1048716
                                      i32.add
                                      i32.load offset=440
                                      local.tee 6
                                      i32.eqz
                                      br_if 0 (;@15;)
                                      local.get 4
                                      local.get 11
                                      i32.add
                                      local.tee 0
                                      local.get 4
                                      i32.le_u
                                      br_if 7 (;@8;)
                                      local.get 0
                                      local.get 6
                                      i32.gt_u
                                      br_if 7 (;@8;)
                                    end
                                    local.get 11
                                    call $sbrk
                                    local.tee 4
                                    local.get 7
                                    i32.ne
                                    br_if 1 (;@13;)
                                    br 8 (;@6;)
                                  end
                                  local.get 7
                                  local.get 0
                                  i32.sub
                                  local.get 11
                                  i32.and
                                  local.tee 11
                                  i32.const 2147483646
                                  i32.gt_u
                                  br_if 5 (;@8;)
                                  local.get 11
                                  call $sbrk
                                  local.tee 7
                                  local.get 4
                                  i32.load
                                  local.get 4
                                  i32.load offset=4
                                  i32.add
                                  i32.eq
                                  br_if 4 (;@9;)
                                  local.get 7
                                  local.set 4
                                end
                                block ;; label = @13
                                  local.get 11
                                  local.get 3
                                  i32.const 72
                                  i32.add
                                  i32.ge_u
                                  br_if 0 (;@13;)
                                  local.get 4
                                  i32.const -1
                                  i32.eq
                                  br_if 0 (;@13;)
                                  block ;; label = @14
                                    local.get 8
                                    local.get 11
                                    i32.sub
                                    global.get $GOT.data.internal.__memory_base
                                    i32.const 1049188
                                    i32.add
                                    i32.load offset=8
                                    local.tee 6
                                    i32.add
                                    i32.const 0
                                    local.get 6
                                    i32.sub
                                    i32.and
                                    local.tee 6
                                    i32.const 2147483646
                                    i32.le_u
                                    br_if 0 (;@14;)
                                    local.get 4
                                    local.set 7
                                    br 8 (;@6;)
                                  end
                                  block ;; label = @14
                                    local.get 6
                                    call $sbrk
                                    i32.const -1
                                    i32.eq
                                    br_if 0 (;@14;)
                                    local.get 6
                                    local.get 11
                                    i32.add
                                    local.set 11
                                    local.get 4
                                    local.set 7
                                    br 8 (;@6;)
                                  end
                                  i32.const 0
                                  local.get 11
                                  i32.sub
                                  call $sbrk
                                  drop
                                  br 5 (;@8;)
                                end
                                local.get 4
                                local.set 7
                                local.get 4
                                i32.const -1
                                i32.ne
                                br_if 6 (;@6;)
                                br 4 (;@8;)
                              end
                              unreachable
                            end
                            i32.const 0
                            local.set 5
                            br 8 (;@2;)
                          end
                          i32.const 0
                          local.set 5
                          br 6 (;@3;)
                        end
                        local.get 7
                        i32.const -1
                        i32.ne
                        br_if 2 (;@6;)
                      end
                      global.get $GOT.data.internal.__memory_base
                      i32.const 1048716
                      i32.add
                      local.tee 4
                      local.get 4
                      i32.load offset=444
                      i32.const 4
                      i32.or
                      i32.store offset=444
                    end
                    local.get 9
                    i32.const 2147483646
                    i32.gt_u
                    br_if 1 (;@5;)
                    local.get 9
                    call $sbrk
                    local.set 7
                    i32.const 0
                    call $sbrk
                    local.set 4
                    local.get 7
                    i32.const -1
                    i32.eq
                    br_if 1 (;@5;)
                    local.get 4
                    i32.const -1
                    i32.eq
                    br_if 1 (;@5;)
                    local.get 7
                    local.get 4
                    i32.ge_u
                    br_if 1 (;@5;)
                    local.get 4
                    local.get 7
                    i32.sub
                    local.tee 11
                    local.get 3
                    i32.const 56
                    i32.add
                    i32.le_u
                    br_if 1 (;@5;)
                  end
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1048716
                  i32.add
                  local.tee 4
                  local.get 4
                  i32.load offset=432
                  local.get 11
                  i32.add
                  local.tee 6
                  i32.store offset=432
                  block ;; label = @6
                    local.get 6
                    local.get 4
                    i32.load offset=436
                    i32.le_u
                    br_if 0 (;@6;)
                    global.get $GOT.data.internal.__memory_base
                    i32.const 1048716
                    i32.add
                    local.get 6
                    i32.store offset=436
                  end
                  block ;; label = @6
                    block ;; label = @7
                      block ;; label = @8
                        block ;; label = @9
                          global.get $GOT.data.internal.__memory_base
                          i32.const 1048716
                          i32.add
                          i32.load offset=24
                          local.tee 6
                          i32.eqz
                          br_if 0 (;@9;)
                          global.get $GOT.data.internal.__memory_base
                          i32.const 1048716
                          i32.add
                          i32.const 448
                          i32.add
                          local.set 4
                          loop ;; label = @10
                            local.get 7
                            local.get 4
                            i32.load
                            local.tee 0
                            local.get 4
                            i32.load offset=4
                            local.tee 9
                            i32.add
                            i32.eq
                            br_if 2 (;@8;)
                            local.get 4
                            i32.load offset=8
                            local.tee 4
                            br_if 0 (;@10;)
                            br 3 (;@7;)
                          end
                        end
                        block ;; label = @9
                          block ;; label = @10
                            global.get $GOT.data.internal.__memory_base
                            i32.const 1048716
                            i32.add
                            i32.load offset=16
                            local.tee 4
                            i32.eqz
                            br_if 0 (;@10;)
                            local.get 7
                            local.get 4
                            i32.ge_u
                            br_if 1 (;@9;)
                          end
                          global.get $GOT.data.internal.__memory_base
                          i32.const 1048716
                          i32.add
                          local.get 7
                          i32.store offset=16
                        end
                        global.get $GOT.data.internal.__memory_base
                        local.tee 6
                        i32.const 1048716
                        i32.add
                        local.tee 4
                        i32.const 0
                        i32.store offset=460
                        local.get 4
                        local.get 11
                        i32.store offset=452
                        local.get 4
                        local.get 7
                        i32.store offset=448
                        local.get 4
                        i32.const -1
                        i32.store offset=32
                        local.get 4
                        local.get 6
                        i32.const 1049188
                        i32.add
                        i32.load
                        i32.store offset=36
                        i32.const -256
                        local.set 6
                        loop ;; label = @9
                          global.get $GOT.data.internal.__memory_base
                          i32.const 1048716
                          i32.add
                          local.get 6
                          i32.add
                          local.tee 4
                          i32.const 316
                          i32.add
                          local.get 4
                          i32.const 304
                          i32.add
                          local.tee 0
                          i32.store
                          local.get 0
                          local.get 4
                          i32.const 296
                          i32.add
                          local.tee 9
                          i32.store
                          local.get 4
                          i32.const 308
                          i32.add
                          local.get 9
                          i32.store
                          local.get 4
                          i32.const 324
                          i32.add
                          local.get 4
                          i32.const 312
                          i32.add
                          local.tee 9
                          i32.store
                          local.get 9
                          local.get 0
                          i32.store
                          local.get 4
                          i32.const 332
                          i32.add
                          local.get 4
                          i32.const 320
                          i32.add
                          local.tee 0
                          i32.store
                          local.get 0
                          local.get 9
                          i32.store
                          local.get 4
                          i32.const 328
                          i32.add
                          local.get 0
                          i32.store
                          local.get 6
                          i32.const 32
                          i32.add
                          local.tee 6
                          br_if 0 (;@9;)
                        end
                        local.get 7
                        i32.const -8
                        local.get 7
                        i32.sub
                        i32.const 15
                        i32.and
                        local.tee 4
                        i32.add
                        local.tee 6
                        local.get 11
                        i32.const -56
                        i32.add
                        local.tee 0
                        local.get 4
                        i32.sub
                        local.tee 9
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        global.get $GOT.data.internal.__memory_base
                        local.tee 11
                        i32.const 1048716
                        i32.add
                        local.tee 4
                        local.get 11
                        i32.const 1049188
                        i32.add
                        i32.load offset=16
                        i32.store offset=28
                        local.get 4
                        local.get 9
                        i32.store offset=12
                        local.get 4
                        local.get 6
                        i32.store offset=24
                        local.get 7
                        local.get 0
                        i32.add
                        i32.const 56
                        i32.store offset=4
                        br 2 (;@6;)
                      end
                      local.get 6
                      local.get 7
                      i32.ge_u
                      br_if 0 (;@7;)
                      local.get 6
                      local.get 0
                      i32.lt_u
                      br_if 0 (;@7;)
                      local.get 4
                      i32.load offset=12
                      i32.const 8
                      i32.and
                      br_if 0 (;@7;)
                      local.get 6
                      i32.const -8
                      local.get 6
                      i32.sub
                      i32.const 15
                      i32.and
                      local.tee 7
                      i32.add
                      local.tee 2
                      global.get $GOT.data.internal.__memory_base
                      local.tee 8
                      i32.const 1048716
                      i32.add
                      local.tee 0
                      i32.load offset=12
                      local.get 11
                      i32.add
                      local.tee 10
                      local.get 7
                      i32.sub
                      local.tee 7
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get 4
                      local.get 9
                      local.get 11
                      i32.add
                      i32.store offset=4
                      local.get 0
                      local.get 8
                      i32.const 1049188
                      i32.add
                      i32.load offset=16
                      i32.store offset=28
                      local.get 0
                      local.get 2
                      i32.store offset=24
                      local.get 0
                      local.get 7
                      i32.store offset=12
                      local.get 6
                      local.get 10
                      i32.add
                      i32.const 56
                      i32.store offset=4
                      br 1 (;@6;)
                    end
                    block ;; label = @7
                      local.get 7
                      global.get $GOT.data.internal.__memory_base
                      i32.const 1048716
                      i32.add
                      i32.load offset=16
                      i32.ge_u
                      br_if 0 (;@7;)
                      global.get $GOT.data.internal.__memory_base
                      i32.const 1048716
                      i32.add
                      local.get 7
                      i32.store offset=16
                    end
                    local.get 7
                    local.get 11
                    i32.add
                    local.set 0
                    global.get $GOT.data.internal.__memory_base
                    i32.const 1048716
                    i32.add
                    i32.const 448
                    i32.add
                    local.set 4
                    block ;; label = @7
                      block ;; label = @8
                        loop ;; label = @9
                          local.get 4
                          i32.load
                          local.tee 9
                          local.get 0
                          i32.eq
                          br_if 1 (;@8;)
                          local.get 4
                          i32.load offset=8
                          local.tee 4
                          br_if 0 (;@9;)
                          br 2 (;@7;)
                        end
                      end
                      local.get 4
                      i32.load8_u offset=12
                      i32.const 8
                      i32.and
                      i32.eqz
                      br_if 3 (;@4;)
                    end
                    global.get $GOT.data.internal.__memory_base
                    i32.const 1048716
                    i32.add
                    i32.const 448
                    i32.add
                    local.set 4
                    block ;; label = @7
                      loop ;; label = @8
                        block ;; label = @9
                          local.get 6
                          local.get 4
                          i32.load
                          local.tee 0
                          i32.lt_u
                          br_if 0 (;@9;)
                          local.get 6
                          local.get 0
                          local.get 4
                          i32.load offset=4
                          i32.add
                          local.tee 0
                          i32.lt_u
                          br_if 2 (;@7;)
                        end
                        local.get 4
                        i32.load offset=8
                        local.set 4
                        br 0 (;@8;)
                      end
                    end
                    local.get 7
                    i32.const -8
                    local.get 7
                    i32.sub
                    i32.const 15
                    i32.and
                    local.tee 4
                    i32.add
                    local.tee 2
                    local.get 11
                    i32.const -56
                    i32.add
                    local.tee 9
                    local.get 4
                    i32.sub
                    local.tee 8
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    local.get 7
                    local.get 9
                    i32.add
                    i32.const 56
                    i32.store offset=4
                    local.get 6
                    local.get 0
                    i32.const 55
                    local.get 0
                    i32.sub
                    i32.const 15
                    i32.and
                    i32.add
                    i32.const -63
                    i32.add
                    local.tee 4
                    local.get 4
                    local.get 6
                    i32.const 16
                    i32.add
                    i32.lt_u
                    select
                    local.tee 9
                    i32.const 35
                    i32.store offset=4
                    global.get $GOT.data.internal.__memory_base
                    local.tee 10
                    i32.const 1048716
                    i32.add
                    local.tee 4
                    local.get 10
                    i32.const 1049188
                    i32.add
                    i32.load offset=16
                    i32.store offset=28
                    local.get 4
                    local.get 8
                    i32.store offset=12
                    local.get 4
                    local.get 2
                    i32.store offset=24
                    local.get 9
                    local.get 4
                    i64.load offset=456 align=4
                    i64.store offset=16 align=4
                    local.get 9
                    local.get 4
                    i64.load offset=448 align=4
                    i64.store offset=8 align=4
                    local.get 4
                    local.get 7
                    i32.store offset=448
                    local.get 4
                    i32.const 0
                    i32.store offset=460
                    local.get 4
                    local.get 9
                    i32.const 8
                    i32.add
                    i32.store offset=456
                    local.get 4
                    local.get 11
                    i32.store offset=452
                    local.get 9
                    i32.const 36
                    i32.add
                    local.set 4
                    loop ;; label = @7
                      local.get 4
                      i32.const 7
                      i32.store
                      local.get 4
                      i32.const 4
                      i32.add
                      local.tee 4
                      local.get 0
                      i32.lt_u
                      br_if 0 (;@7;)
                    end
                    local.get 9
                    local.get 6
                    i32.eq
                    br_if 0 (;@6;)
                    local.get 9
                    local.get 9
                    i32.load offset=4
                    i32.const -2
                    i32.and
                    i32.store offset=4
                    local.get 9
                    local.get 9
                    local.get 6
                    i32.sub
                    local.tee 7
                    i32.store
                    local.get 6
                    local.get 7
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    block ;; label = @7
                      block ;; label = @8
                        local.get 7
                        i32.const 255
                        i32.gt_u
                        br_if 0 (;@8;)
                        global.get $GOT.data.internal.__memory_base
                        i32.const 1048716
                        i32.add
                        local.tee 0
                        local.get 7
                        i32.const 248
                        i32.and
                        i32.add
                        i32.const 40
                        i32.add
                        local.set 4
                        block ;; label = @9
                          block ;; label = @10
                            local.get 0
                            i32.load
                            local.tee 0
                            i32.const 1
                            local.get 7
                            i32.const 3
                            i32.shr_u
                            i32.shl
                            local.tee 9
                            i32.and
                            br_if 0 (;@10;)
                            global.get $GOT.data.internal.__memory_base
                            i32.const 1048716
                            i32.add
                            local.get 0
                            local.get 9
                            i32.or
                            i32.store
                            local.get 4
                            local.set 0
                            br 1 (;@9;)
                          end
                          local.get 4
                          i32.load offset=8
                          local.set 0
                        end
                        local.get 0
                        local.get 6
                        i32.store offset=12
                        local.get 4
                        local.get 6
                        i32.store offset=8
                        i32.const 12
                        local.set 9
                        i32.const 8
                        local.set 7
                        br 1 (;@7;)
                      end
                      i32.const 31
                      local.set 4
                      block ;; label = @8
                        local.get 7
                        i32.const 16777215
                        i32.gt_u
                        br_if 0 (;@8;)
                        local.get 7
                        i32.const 38
                        local.get 7
                        i32.const 8
                        i32.shr_u
                        i32.clz
                        local.tee 4
                        i32.sub
                        i32.shr_u
                        i32.const 1
                        i32.and
                        local.get 4
                        i32.const 1
                        i32.shl
                        i32.or
                        i32.const 62
                        i32.xor
                        local.set 4
                      end
                      local.get 6
                      local.get 4
                      i32.store offset=28
                      local.get 6
                      i64.const 0
                      i64.store offset=16 align=4
                      global.get $GOT.data.internal.__memory_base
                      i32.const 1048716
                      i32.add
                      local.tee 9
                      local.get 4
                      i32.const 2
                      i32.shl
                      i32.add
                      i32.const 304
                      i32.add
                      local.set 0
                      block ;; label = @8
                        block ;; label = @9
                          block ;; label = @10
                            local.get 9
                            i32.load offset=4
                            local.tee 9
                            i32.const 1
                            local.get 4
                            i32.shl
                            local.tee 11
                            i32.and
                            br_if 0 (;@10;)
                            local.get 0
                            local.get 6
                            i32.store
                            global.get $GOT.data.internal.__memory_base
                            i32.const 1048716
                            i32.add
                            local.get 9
                            local.get 11
                            i32.or
                            i32.store offset=4
                            local.get 6
                            local.get 0
                            i32.store offset=24
                            br 1 (;@9;)
                          end
                          local.get 7
                          i32.const 0
                          i32.const 25
                          local.get 4
                          i32.const 1
                          i32.shr_u
                          i32.sub
                          local.get 4
                          i32.const 31
                          i32.eq
                          select
                          i32.shl
                          local.set 4
                          local.get 0
                          i32.load
                          local.set 9
                          loop ;; label = @10
                            local.get 9
                            local.tee 0
                            i32.load offset=4
                            i32.const -8
                            i32.and
                            local.get 7
                            i32.eq
                            br_if 2 (;@8;)
                            local.get 4
                            i32.const 29
                            i32.shr_u
                            local.set 9
                            local.get 4
                            i32.const 1
                            i32.shl
                            local.set 4
                            local.get 0
                            local.get 9
                            i32.const 4
                            i32.and
                            i32.add
                            local.tee 11
                            i32.load offset=16
                            local.tee 9
                            br_if 0 (;@10;)
                          end
                          local.get 11
                          i32.const 16
                          i32.add
                          local.get 6
                          i32.store
                          local.get 6
                          local.get 0
                          i32.store offset=24
                        end
                        i32.const 8
                        local.set 9
                        i32.const 12
                        local.set 7
                        local.get 6
                        local.set 0
                        local.get 6
                        local.set 4
                        br 1 (;@7;)
                      end
                      local.get 0
                      i32.load offset=8
                      local.set 4
                      local.get 0
                      local.get 6
                      i32.store offset=8
                      local.get 4
                      local.get 6
                      i32.store offset=12
                      local.get 6
                      local.get 4
                      i32.store offset=8
                      i32.const 0
                      local.set 4
                      i32.const 24
                      local.set 9
                      i32.const 12
                      local.set 7
                    end
                    local.get 6
                    local.get 7
                    i32.add
                    local.get 0
                    i32.store
                    local.get 6
                    local.get 9
                    i32.add
                    local.get 4
                    i32.store
                  end
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1048716
                  i32.add
                  i32.load offset=12
                  local.tee 4
                  local.get 3
                  i32.le_u
                  br_if 0 (;@5;)
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1048716
                  i32.add
                  local.tee 5
                  i32.load offset=24
                  local.tee 6
                  local.get 3
                  i32.add
                  local.tee 0
                  local.get 4
                  local.get 3
                  i32.sub
                  local.tee 4
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get 5
                  local.get 4
                  i32.store offset=12
                  local.get 5
                  local.get 0
                  i32.store offset=24
                  local.get 6
                  local.get 3
                  i32.const 3
                  i32.or
                  i32.store offset=4
                  local.get 6
                  i32.const 8
                  i32.add
                  local.set 5
                  br 4 (;@1;)
                end
                global.get $GOT.data.internal.errno
                i32.const 48
                i32.store
                br 3 (;@1;)
              end
              local.get 4
              local.get 7
              i32.store
              local.get 4
              local.get 4
              i32.load offset=4
              local.get 11
              i32.add
              i32.store offset=4
              local.get 7
              local.get 9
              local.get 3
              call $prepend_alloc
              local.set 5
              br 2 (;@1;)
            end
            block ;; label = @3
              local.get 11
              i32.eqz
              br_if 0 (;@3;)
              block ;; label = @4
                block ;; label = @5
                  local.get 9
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1048716
                  i32.add
                  local.get 9
                  i32.load offset=28
                  local.tee 0
                  i32.const 2
                  i32.shl
                  i32.add
                  local.tee 6
                  i32.load offset=304
                  i32.ne
                  br_if 0 (;@5;)
                  local.get 6
                  i32.const 304
                  i32.add
                  local.get 5
                  i32.store
                  local.get 5
                  br_if 1 (;@4;)
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1048716
                  i32.add
                  local.get 10
                  i32.const -2
                  local.get 0
                  i32.rotl
                  i32.and
                  local.tee 10
                  i32.store offset=4
                  br 2 (;@3;)
                end
                block ;; label = @5
                  block ;; label = @6
                    local.get 11
                    i32.load offset=16
                    local.get 9
                    i32.ne
                    br_if 0 (;@6;)
                    local.get 11
                    local.get 5
                    i32.store offset=16
                    br 1 (;@5;)
                  end
                  local.get 11
                  local.get 5
                  i32.store offset=20
                end
                local.get 5
                i32.eqz
                br_if 1 (;@3;)
              end
              local.get 5
              local.get 11
              i32.store offset=24
              block ;; label = @4
                local.get 9
                i32.load offset=16
                local.tee 6
                i32.eqz
                br_if 0 (;@4;)
                local.get 5
                local.get 6
                i32.store offset=16
                local.get 6
                local.get 5
                i32.store offset=24
              end
              local.get 9
              i32.load offset=20
              local.tee 6
              i32.eqz
              br_if 0 (;@3;)
              local.get 5
              local.get 6
              i32.store offset=20
              local.get 6
              local.get 5
              i32.store offset=24
            end
            block ;; label = @3
              block ;; label = @4
                local.get 4
                i32.const 15
                i32.gt_u
                br_if 0 (;@4;)
                local.get 9
                local.get 4
                local.get 3
                i32.or
                local.tee 5
                i32.const 3
                i32.or
                i32.store offset=4
                local.get 9
                local.get 5
                i32.add
                local.tee 5
                local.get 5
                i32.load offset=4
                i32.const 1
                i32.or
                i32.store offset=4
                br 1 (;@3;)
              end
              local.get 9
              local.get 3
              i32.add
              local.tee 0
              local.get 4
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 9
              local.get 3
              i32.const 3
              i32.or
              i32.store offset=4
              local.get 0
              local.get 4
              i32.add
              local.get 4
              i32.store
              block ;; label = @4
                local.get 4
                i32.const 255
                i32.gt_u
                br_if 0 (;@4;)
                global.get $GOT.data.internal.__memory_base
                i32.const 1048716
                i32.add
                local.tee 3
                local.get 4
                i32.const 248
                i32.and
                i32.add
                i32.const 40
                i32.add
                local.set 5
                block ;; label = @5
                  block ;; label = @6
                    local.get 3
                    i32.load
                    local.tee 3
                    i32.const 1
                    local.get 4
                    i32.const 3
                    i32.shr_u
                    i32.shl
                    local.tee 4
                    i32.and
                    br_if 0 (;@6;)
                    global.get $GOT.data.internal.__memory_base
                    i32.const 1048716
                    i32.add
                    local.get 3
                    local.get 4
                    i32.or
                    i32.store
                    local.get 5
                    local.set 4
                    br 1 (;@5;)
                  end
                  local.get 5
                  i32.load offset=8
                  local.set 4
                end
                local.get 4
                local.get 0
                i32.store offset=12
                local.get 5
                local.get 0
                i32.store offset=8
                local.get 0
                local.get 5
                i32.store offset=12
                local.get 0
                local.get 4
                i32.store offset=8
                br 1 (;@3;)
              end
              i32.const 31
              local.set 5
              block ;; label = @4
                local.get 4
                i32.const 16777215
                i32.gt_u
                br_if 0 (;@4;)
                local.get 4
                i32.const 38
                local.get 4
                i32.const 8
                i32.shr_u
                i32.clz
                local.tee 5
                i32.sub
                i32.shr_u
                i32.const 1
                i32.and
                local.get 5
                i32.const 1
                i32.shl
                i32.or
                i32.const 62
                i32.xor
                local.set 5
              end
              local.get 0
              local.get 5
              i32.store offset=28
              local.get 0
              i64.const 0
              i64.store offset=16 align=4
              global.get $GOT.data.internal.__memory_base
              i32.const 1048716
              i32.add
              local.get 5
              i32.const 2
              i32.shl
              i32.add
              i32.const 304
              i32.add
              local.set 3
              block ;; label = @4
                local.get 10
                i32.const 1
                local.get 5
                i32.shl
                local.tee 6
                i32.and
                br_if 0 (;@4;)
                local.get 3
                local.get 0
                i32.store
                global.get $GOT.data.internal.__memory_base
                i32.const 1048716
                i32.add
                local.get 10
                local.get 6
                i32.or
                i32.store offset=4
                local.get 0
                local.get 3
                i32.store offset=24
                local.get 0
                local.get 0
                i32.store offset=8
                local.get 0
                local.get 0
                i32.store offset=12
                br 1 (;@3;)
              end
              local.get 4
              i32.const 0
              i32.const 25
              local.get 5
              i32.const 1
              i32.shr_u
              i32.sub
              local.get 5
              i32.const 31
              i32.eq
              select
              i32.shl
              local.set 5
              local.get 3
              i32.load
              local.set 6
              block ;; label = @4
                loop ;; label = @5
                  local.get 6
                  local.tee 3
                  i32.load offset=4
                  i32.const -8
                  i32.and
                  local.get 4
                  i32.eq
                  br_if 1 (;@4;)
                  local.get 5
                  i32.const 29
                  i32.shr_u
                  local.set 6
                  local.get 5
                  i32.const 1
                  i32.shl
                  local.set 5
                  local.get 3
                  local.get 6
                  i32.const 4
                  i32.and
                  i32.add
                  local.tee 7
                  i32.load offset=16
                  local.tee 6
                  br_if 0 (;@5;)
                end
                local.get 7
                i32.const 16
                i32.add
                local.get 0
                i32.store
                local.get 0
                local.get 3
                i32.store offset=24
                local.get 0
                local.get 0
                i32.store offset=12
                local.get 0
                local.get 0
                i32.store offset=8
                br 1 (;@3;)
              end
              local.get 3
              i32.load offset=8
              local.tee 5
              local.get 0
              i32.store offset=12
              local.get 3
              local.get 0
              i32.store offset=8
              local.get 0
              i32.const 0
              i32.store offset=24
              local.get 0
              local.get 3
              i32.store offset=12
              local.get 0
              local.get 5
              i32.store offset=8
            end
            local.get 9
            i32.const 8
            i32.add
            local.set 5
            br 1 (;@1;)
          end
          block ;; label = @2
            local.get 2
            i32.eqz
            br_if 0 (;@2;)
            block ;; label = @3
              block ;; label = @4
                local.get 0
                global.get $GOT.data.internal.__memory_base
                i32.const 1048716
                i32.add
                local.get 0
                i32.load offset=28
                local.tee 9
                i32.const 2
                i32.shl
                i32.add
                local.tee 6
                i32.load offset=304
                i32.ne
                br_if 0 (;@4;)
                local.get 6
                i32.const 304
                i32.add
                local.get 5
                i32.store
                local.get 5
                br_if 1 (;@3;)
                global.get $GOT.data.internal.__memory_base
                i32.const 1048716
                i32.add
                local.get 10
                i32.const -2
                local.get 9
                i32.rotl
                i32.and
                i32.store offset=4
                br 2 (;@2;)
              end
              block ;; label = @4
                block ;; label = @5
                  local.get 2
                  i32.load offset=16
                  local.get 0
                  i32.ne
                  br_if 0 (;@5;)
                  local.get 2
                  local.get 5
                  i32.store offset=16
                  br 1 (;@4;)
                end
                local.get 2
                local.get 5
                i32.store offset=20
              end
              local.get 5
              i32.eqz
              br_if 1 (;@2;)
            end
            local.get 5
            local.get 2
            i32.store offset=24
            block ;; label = @3
              local.get 0
              i32.load offset=16
              local.tee 6
              i32.eqz
              br_if 0 (;@3;)
              local.get 5
              local.get 6
              i32.store offset=16
              local.get 6
              local.get 5
              i32.store offset=24
            end
            local.get 0
            i32.load offset=20
            local.tee 6
            i32.eqz
            br_if 0 (;@2;)
            local.get 5
            local.get 6
            i32.store offset=20
            local.get 6
            local.get 5
            i32.store offset=24
          end
          block ;; label = @2
            block ;; label = @3
              local.get 4
              i32.const 15
              i32.gt_u
              br_if 0 (;@3;)
              local.get 0
              local.get 4
              local.get 3
              i32.or
              local.tee 5
              i32.const 3
              i32.or
              i32.store offset=4
              local.get 0
              local.get 5
              i32.add
              local.tee 5
              local.get 5
              i32.load offset=4
              i32.const 1
              i32.or
              i32.store offset=4
              br 1 (;@2;)
            end
            local.get 0
            local.get 3
            i32.add
            local.tee 6
            local.get 4
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 0
            local.get 3
            i32.const 3
            i32.or
            i32.store offset=4
            local.get 6
            local.get 4
            i32.add
            local.get 4
            i32.store
            block ;; label = @3
              local.get 8
              i32.eqz
              br_if 0 (;@3;)
              global.get $GOT.data.internal.__memory_base
              i32.const 1048716
              i32.add
              local.tee 5
              local.get 8
              i32.const -8
              i32.and
              i32.add
              i32.const 40
              i32.add
              local.set 3
              local.get 5
              i32.load offset=20
              local.set 5
              block ;; label = @4
                block ;; label = @5
                  i32.const 1
                  local.get 8
                  i32.const 3
                  i32.shr_u
                  i32.shl
                  local.tee 9
                  local.get 7
                  i32.and
                  br_if 0 (;@5;)
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1048716
                  i32.add
                  local.get 9
                  local.get 7
                  i32.or
                  i32.store
                  local.get 3
                  local.set 9
                  br 1 (;@4;)
                end
                local.get 3
                i32.load offset=8
                local.set 9
              end
              local.get 9
              local.get 5
              i32.store offset=12
              local.get 3
              local.get 5
              i32.store offset=8
              local.get 5
              local.get 3
              i32.store offset=12
              local.get 5
              local.get 9
              i32.store offset=8
            end
            global.get $GOT.data.internal.__memory_base
            i32.const 1048716
            i32.add
            local.tee 5
            local.get 6
            i32.store offset=20
            local.get 5
            local.get 4
            i32.store offset=8
          end
          local.get 0
          i32.const 8
          i32.add
          local.set 5
        end
        local.get 1
        i32.const 16
        i32.add
        global.set $__stack_pointer
        local.get 5
      )
      (func $prepend_alloc (;17;) (type 4) (param i32 i32 i32) (result i32)
        (local i32 i32 i32 i32 i32 i32 i32)
        local.get 0
        i32.const -8
        local.get 0
        i32.sub
        i32.const 15
        i32.and
        i32.add
        local.tee 3
        local.get 2
        i32.const 3
        i32.or
        i32.store offset=4
        local.get 1
        i32.const -8
        local.get 1
        i32.sub
        i32.const 15
        i32.and
        i32.add
        local.tee 4
        local.get 3
        local.get 2
        i32.add
        local.tee 5
        i32.sub
        local.set 0
        block ;; label = @1
          block ;; label = @2
            local.get 4
            global.get $GOT.data.internal.__memory_base
            i32.const 1048716
            i32.add
            i32.load offset=24
            i32.ne
            br_if 0 (;@2;)
            global.get $GOT.data.internal.__memory_base
            i32.const 1048716
            i32.add
            local.tee 2
            local.get 5
            i32.store offset=24
            local.get 2
            local.get 2
            i32.load offset=12
            local.get 0
            i32.add
            local.tee 0
            i32.store offset=12
            local.get 5
            local.get 0
            i32.const 1
            i32.or
            i32.store offset=4
            br 1 (;@1;)
          end
          block ;; label = @2
            local.get 4
            global.get $GOT.data.internal.__memory_base
            i32.const 1048716
            i32.add
            i32.load offset=20
            i32.ne
            br_if 0 (;@2;)
            global.get $GOT.data.internal.__memory_base
            i32.const 1048716
            i32.add
            local.tee 1
            local.get 5
            i32.store offset=20
            local.get 1
            local.get 1
            i32.load offset=8
            local.get 0
            i32.add
            local.tee 2
            i32.store offset=8
            local.get 5
            local.get 2
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 5
            local.get 2
            i32.add
            local.get 2
            i32.store
            br 1 (;@1;)
          end
          block ;; label = @2
            local.get 4
            i32.load offset=4
            local.tee 1
            i32.const 3
            i32.and
            i32.const 1
            i32.ne
            br_if 0 (;@2;)
            local.get 1
            i32.const -8
            i32.and
            local.set 6
            local.get 4
            i32.load offset=12
            local.set 2
            block ;; label = @3
              block ;; label = @4
                local.get 1
                i32.const 255
                i32.gt_u
                br_if 0 (;@4;)
                block ;; label = @5
                  local.get 2
                  local.get 4
                  i32.load offset=8
                  local.tee 7
                  i32.ne
                  br_if 0 (;@5;)
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1048716
                  i32.add
                  local.tee 2
                  local.get 2
                  i32.load
                  i32.const -2
                  local.get 1
                  i32.const 3
                  i32.shr_u
                  i32.rotl
                  i32.and
                  i32.store
                  br 2 (;@3;)
                end
                local.get 2
                local.get 7
                i32.store offset=8
                local.get 7
                local.get 2
                i32.store offset=12
                br 1 (;@3;)
              end
              local.get 4
              i32.load offset=24
              local.set 8
              block ;; label = @4
                block ;; label = @5
                  local.get 2
                  local.get 4
                  i32.eq
                  br_if 0 (;@5;)
                  local.get 4
                  i32.load offset=8
                  local.tee 1
                  local.get 2
                  i32.store offset=12
                  local.get 2
                  local.get 1
                  i32.store offset=8
                  br 1 (;@4;)
                end
                block ;; label = @5
                  block ;; label = @6
                    block ;; label = @7
                      local.get 4
                      i32.load offset=20
                      local.tee 1
                      i32.eqz
                      br_if 0 (;@7;)
                      local.get 4
                      i32.const 20
                      i32.add
                      local.set 7
                      br 1 (;@6;)
                    end
                    local.get 4
                    i32.load offset=16
                    local.tee 1
                    i32.eqz
                    br_if 1 (;@5;)
                    local.get 4
                    i32.const 16
                    i32.add
                    local.set 7
                  end
                  loop ;; label = @6
                    local.get 7
                    local.set 9
                    local.get 1
                    local.tee 2
                    i32.const 20
                    i32.add
                    local.set 7
                    local.get 2
                    i32.load offset=20
                    local.tee 1
                    br_if 0 (;@6;)
                    local.get 2
                    i32.const 16
                    i32.add
                    local.set 7
                    local.get 2
                    i32.load offset=16
                    local.tee 1
                    br_if 0 (;@6;)
                  end
                  local.get 9
                  i32.const 0
                  i32.store
                  br 1 (;@4;)
                end
                i32.const 0
                local.set 2
              end
              local.get 8
              i32.eqz
              br_if 0 (;@3;)
              block ;; label = @4
                block ;; label = @5
                  local.get 4
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1048716
                  i32.add
                  local.get 4
                  i32.load offset=28
                  local.tee 7
                  i32.const 2
                  i32.shl
                  i32.add
                  local.tee 1
                  i32.load offset=304
                  i32.ne
                  br_if 0 (;@5;)
                  local.get 1
                  i32.const 304
                  i32.add
                  local.get 2
                  i32.store
                  local.get 2
                  br_if 1 (;@4;)
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1048716
                  i32.add
                  local.tee 2
                  local.get 2
                  i32.load offset=4
                  i32.const -2
                  local.get 7
                  i32.rotl
                  i32.and
                  i32.store offset=4
                  br 2 (;@3;)
                end
                block ;; label = @5
                  block ;; label = @6
                    local.get 8
                    i32.load offset=16
                    local.get 4
                    i32.ne
                    br_if 0 (;@6;)
                    local.get 8
                    local.get 2
                    i32.store offset=16
                    br 1 (;@5;)
                  end
                  local.get 8
                  local.get 2
                  i32.store offset=20
                end
                local.get 2
                i32.eqz
                br_if 1 (;@3;)
              end
              local.get 2
              local.get 8
              i32.store offset=24
              block ;; label = @4
                local.get 4
                i32.load offset=16
                local.tee 1
                i32.eqz
                br_if 0 (;@4;)
                local.get 2
                local.get 1
                i32.store offset=16
                local.get 1
                local.get 2
                i32.store offset=24
              end
              local.get 4
              i32.load offset=20
              local.tee 1
              i32.eqz
              br_if 0 (;@3;)
              local.get 2
              local.get 1
              i32.store offset=20
              local.get 1
              local.get 2
              i32.store offset=24
            end
            local.get 6
            local.get 0
            i32.add
            local.set 0
            local.get 4
            local.get 6
            i32.add
            local.tee 4
            i32.load offset=4
            local.set 1
          end
          local.get 4
          local.get 1
          i32.const -2
          i32.and
          i32.store offset=4
          local.get 5
          local.get 0
          i32.add
          local.get 0
          i32.store
          local.get 5
          local.get 0
          i32.const 1
          i32.or
          i32.store offset=4
          block ;; label = @2
            local.get 0
            i32.const 255
            i32.gt_u
            br_if 0 (;@2;)
            global.get $GOT.data.internal.__memory_base
            i32.const 1048716
            i32.add
            local.tee 1
            local.get 0
            i32.const 248
            i32.and
            i32.add
            i32.const 40
            i32.add
            local.set 2
            block ;; label = @3
              block ;; label = @4
                local.get 1
                i32.load
                local.tee 1
                i32.const 1
                local.get 0
                i32.const 3
                i32.shr_u
                i32.shl
                local.tee 0
                i32.and
                br_if 0 (;@4;)
                global.get $GOT.data.internal.__memory_base
                i32.const 1048716
                i32.add
                local.get 1
                local.get 0
                i32.or
                i32.store
                local.get 2
                local.set 0
                br 1 (;@3;)
              end
              local.get 2
              i32.load offset=8
              local.set 0
            end
            local.get 0
            local.get 5
            i32.store offset=12
            local.get 2
            local.get 5
            i32.store offset=8
            local.get 5
            local.get 2
            i32.store offset=12
            local.get 5
            local.get 0
            i32.store offset=8
            br 1 (;@1;)
          end
          i32.const 31
          local.set 2
          block ;; label = @2
            local.get 0
            i32.const 16777215
            i32.gt_u
            br_if 0 (;@2;)
            local.get 0
            i32.const 38
            local.get 0
            i32.const 8
            i32.shr_u
            i32.clz
            local.tee 2
            i32.sub
            i32.shr_u
            i32.const 1
            i32.and
            local.get 2
            i32.const 1
            i32.shl
            i32.or
            i32.const 62
            i32.xor
            local.set 2
          end
          local.get 5
          local.get 2
          i32.store offset=28
          local.get 5
          i64.const 0
          i64.store offset=16 align=4
          global.get $GOT.data.internal.__memory_base
          i32.const 1048716
          i32.add
          local.tee 7
          local.get 2
          i32.const 2
          i32.shl
          i32.add
          i32.const 304
          i32.add
          local.set 1
          block ;; label = @2
            local.get 7
            i32.load offset=4
            local.tee 7
            i32.const 1
            local.get 2
            i32.shl
            local.tee 4
            i32.and
            br_if 0 (;@2;)
            local.get 1
            local.get 5
            i32.store
            global.get $GOT.data.internal.__memory_base
            i32.const 1048716
            i32.add
            local.get 7
            local.get 4
            i32.or
            i32.store offset=4
            local.get 5
            local.get 1
            i32.store offset=24
            local.get 5
            local.get 5
            i32.store offset=8
            local.get 5
            local.get 5
            i32.store offset=12
            br 1 (;@1;)
          end
          local.get 0
          i32.const 0
          i32.const 25
          local.get 2
          i32.const 1
          i32.shr_u
          i32.sub
          local.get 2
          i32.const 31
          i32.eq
          select
          i32.shl
          local.set 2
          local.get 1
          i32.load
          local.set 7
          block ;; label = @2
            loop ;; label = @3
              local.get 7
              local.tee 1
              i32.load offset=4
              i32.const -8
              i32.and
              local.get 0
              i32.eq
              br_if 1 (;@2;)
              local.get 2
              i32.const 29
              i32.shr_u
              local.set 7
              local.get 2
              i32.const 1
              i32.shl
              local.set 2
              local.get 1
              local.get 7
              i32.const 4
              i32.and
              i32.add
              local.tee 4
              i32.load offset=16
              local.tee 7
              br_if 0 (;@3;)
            end
            local.get 4
            i32.const 16
            i32.add
            local.get 5
            i32.store
            local.get 5
            local.get 1
            i32.store offset=24
            local.get 5
            local.get 5
            i32.store offset=12
            local.get 5
            local.get 5
            i32.store offset=8
            br 1 (;@1;)
          end
          local.get 1
          i32.load offset=8
          local.tee 2
          local.get 5
          i32.store offset=12
          local.get 1
          local.get 5
          i32.store offset=8
          local.get 5
          i32.const 0
          i32.store offset=24
          local.get 5
          local.get 1
          i32.store offset=12
          local.get 5
          local.get 2
          i32.store offset=8
        end
        local.get 3
        i32.const 8
        i32.add
      )
      (func $free (;18;) (type 5) (param i32)
        local.get 0
        call $dlfree
      )
      (func $dlfree (;19;) (type 5) (param i32)
        (local i32 i32 i32 i32 i32 i32 i32 i32)
        block ;; label = @1
          local.get 0
          i32.eqz
          br_if 0 (;@1;)
          local.get 0
          i32.const -8
          i32.add
          local.tee 1
          local.get 0
          i32.const -4
          i32.add
          i32.load
          local.tee 2
          i32.const -8
          i32.and
          local.tee 0
          i32.add
          local.set 3
          global.get $GOT.data.internal.__memory_base
          local.set 4
          block ;; label = @2
            local.get 2
            i32.const 1
            i32.and
            br_if 0 (;@2;)
            local.get 2
            i32.const 2
            i32.and
            i32.eqz
            br_if 1 (;@1;)
            local.get 1
            local.get 1
            i32.load
            local.tee 5
            i32.sub
            local.tee 1
            local.get 4
            i32.const 1048716
            i32.add
            i32.load offset=16
            i32.lt_u
            br_if 1 (;@1;)
            local.get 5
            local.get 0
            i32.add
            local.set 0
            block ;; label = @3
              block ;; label = @4
                block ;; label = @5
                  block ;; label = @6
                    local.get 1
                    global.get $GOT.data.internal.__memory_base
                    i32.const 1048716
                    i32.add
                    i32.load offset=20
                    i32.eq
                    br_if 0 (;@6;)
                    local.get 1
                    i32.load offset=12
                    local.set 2
                    block ;; label = @7
                      local.get 5
                      i32.const 255
                      i32.gt_u
                      br_if 0 (;@7;)
                      local.get 2
                      local.get 1
                      i32.load offset=8
                      local.tee 4
                      i32.ne
                      br_if 2 (;@5;)
                      global.get $GOT.data.internal.__memory_base
                      i32.const 1048716
                      i32.add
                      local.tee 2
                      local.get 2
                      i32.load
                      i32.const -2
                      local.get 5
                      i32.const 3
                      i32.shr_u
                      i32.rotl
                      i32.and
                      i32.store
                      br 5 (;@2;)
                    end
                    local.get 1
                    i32.load offset=24
                    local.set 6
                    block ;; label = @7
                      local.get 2
                      local.get 1
                      i32.eq
                      br_if 0 (;@7;)
                      local.get 1
                      i32.load offset=8
                      local.tee 4
                      local.get 2
                      i32.store offset=12
                      local.get 2
                      local.get 4
                      i32.store offset=8
                      br 4 (;@3;)
                    end
                    block ;; label = @7
                      block ;; label = @8
                        local.get 1
                        i32.load offset=20
                        local.tee 4
                        i32.eqz
                        br_if 0 (;@8;)
                        local.get 1
                        i32.const 20
                        i32.add
                        local.set 5
                        br 1 (;@7;)
                      end
                      local.get 1
                      i32.load offset=16
                      local.tee 4
                      i32.eqz
                      br_if 3 (;@4;)
                      local.get 1
                      i32.const 16
                      i32.add
                      local.set 5
                    end
                    loop ;; label = @7
                      local.get 5
                      local.set 7
                      local.get 4
                      local.tee 2
                      i32.const 20
                      i32.add
                      local.set 5
                      local.get 2
                      i32.load offset=20
                      local.tee 4
                      br_if 0 (;@7;)
                      local.get 2
                      i32.const 16
                      i32.add
                      local.set 5
                      local.get 2
                      i32.load offset=16
                      local.tee 4
                      br_if 0 (;@7;)
                    end
                    local.get 7
                    i32.const 0
                    i32.store
                    br 3 (;@3;)
                  end
                  local.get 3
                  i32.load offset=4
                  local.tee 2
                  i32.const 3
                  i32.and
                  i32.const 3
                  i32.ne
                  br_if 3 (;@2;)
                  local.get 3
                  local.get 2
                  i32.const -2
                  i32.and
                  i32.store offset=4
                  local.get 3
                  local.get 0
                  i32.store
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1048716
                  i32.add
                  local.get 0
                  i32.store offset=8
                  local.get 1
                  local.get 0
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  return
                end
                local.get 2
                local.get 4
                i32.store offset=8
                local.get 4
                local.get 2
                i32.store offset=12
                br 2 (;@2;)
              end
              i32.const 0
              local.set 2
            end
            local.get 6
            i32.eqz
            br_if 0 (;@2;)
            block ;; label = @3
              block ;; label = @4
                local.get 1
                global.get $GOT.data.internal.__memory_base
                i32.const 1048716
                i32.add
                local.get 1
                i32.load offset=28
                local.tee 5
                i32.const 2
                i32.shl
                i32.add
                local.tee 4
                i32.load offset=304
                i32.ne
                br_if 0 (;@4;)
                local.get 4
                i32.const 304
                i32.add
                local.get 2
                i32.store
                local.get 2
                br_if 1 (;@3;)
                global.get $GOT.data.internal.__memory_base
                i32.const 1048716
                i32.add
                local.tee 2
                local.get 2
                i32.load offset=4
                i32.const -2
                local.get 5
                i32.rotl
                i32.and
                i32.store offset=4
                br 2 (;@2;)
              end
              block ;; label = @4
                block ;; label = @5
                  local.get 6
                  i32.load offset=16
                  local.get 1
                  i32.ne
                  br_if 0 (;@5;)
                  local.get 6
                  local.get 2
                  i32.store offset=16
                  br 1 (;@4;)
                end
                local.get 6
                local.get 2
                i32.store offset=20
              end
              local.get 2
              i32.eqz
              br_if 1 (;@2;)
            end
            local.get 2
            local.get 6
            i32.store offset=24
            block ;; label = @3
              local.get 1
              i32.load offset=16
              local.tee 4
              i32.eqz
              br_if 0 (;@3;)
              local.get 2
              local.get 4
              i32.store offset=16
              local.get 4
              local.get 2
              i32.store offset=24
            end
            local.get 1
            i32.load offset=20
            local.tee 4
            i32.eqz
            br_if 0 (;@2;)
            local.get 2
            local.get 4
            i32.store offset=20
            local.get 4
            local.get 2
            i32.store offset=24
          end
          local.get 1
          local.get 3
          i32.ge_u
          br_if 0 (;@1;)
          local.get 3
          i32.load offset=4
          local.tee 4
          i32.const 1
          i32.and
          i32.eqz
          br_if 0 (;@1;)
          block ;; label = @2
            block ;; label = @3
              block ;; label = @4
                block ;; label = @5
                  block ;; label = @6
                    local.get 4
                    i32.const 2
                    i32.and
                    br_if 0 (;@6;)
                    block ;; label = @7
                      local.get 3
                      global.get $GOT.data.internal.__memory_base
                      i32.const 1048716
                      i32.add
                      i32.load offset=24
                      i32.ne
                      br_if 0 (;@7;)
                      global.get $GOT.data.internal.__memory_base
                      i32.const 1048716
                      i32.add
                      local.tee 2
                      local.get 1
                      i32.store offset=24
                      local.get 2
                      local.get 2
                      i32.load offset=12
                      local.get 0
                      i32.add
                      local.tee 0
                      i32.store offset=12
                      local.get 1
                      local.get 0
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get 1
                      local.get 2
                      i32.load offset=20
                      i32.ne
                      br_if 6 (;@1;)
                      global.get $GOT.data.internal.__memory_base
                      i32.const 1048716
                      i32.add
                      local.tee 1
                      i32.const 0
                      i32.store offset=8
                      local.get 1
                      i32.const 0
                      i32.store offset=20
                      return
                    end
                    block ;; label = @7
                      local.get 3
                      global.get $GOT.data.internal.__memory_base
                      i32.const 1048716
                      i32.add
                      i32.load offset=20
                      local.tee 6
                      i32.ne
                      br_if 0 (;@7;)
                      global.get $GOT.data.internal.__memory_base
                      i32.const 1048716
                      i32.add
                      local.tee 2
                      local.get 1
                      i32.store offset=20
                      local.get 2
                      local.get 2
                      i32.load offset=8
                      local.get 0
                      i32.add
                      local.tee 0
                      i32.store offset=8
                      local.get 1
                      local.get 0
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get 1
                      local.get 0
                      i32.add
                      local.get 0
                      i32.store
                      return
                    end
                    local.get 4
                    i32.const -8
                    i32.and
                    local.get 0
                    i32.add
                    local.set 0
                    local.get 3
                    i32.load offset=12
                    local.set 2
                    block ;; label = @7
                      local.get 4
                      i32.const 255
                      i32.gt_u
                      br_if 0 (;@7;)
                      block ;; label = @8
                        local.get 2
                        local.get 3
                        i32.load offset=8
                        local.tee 5
                        i32.ne
                        br_if 0 (;@8;)
                        global.get $GOT.data.internal.__memory_base
                        i32.const 1048716
                        i32.add
                        local.tee 2
                        local.get 2
                        i32.load
                        i32.const -2
                        local.get 4
                        i32.const 3
                        i32.shr_u
                        i32.rotl
                        i32.and
                        i32.store
                        br 5 (;@3;)
                      end
                      local.get 2
                      local.get 5
                      i32.store offset=8
                      local.get 5
                      local.get 2
                      i32.store offset=12
                      br 4 (;@3;)
                    end
                    local.get 3
                    i32.load offset=24
                    local.set 8
                    block ;; label = @7
                      local.get 2
                      local.get 3
                      i32.eq
                      br_if 0 (;@7;)
                      local.get 3
                      i32.load offset=8
                      local.tee 4
                      local.get 2
                      i32.store offset=12
                      local.get 2
                      local.get 4
                      i32.store offset=8
                      br 3 (;@4;)
                    end
                    block ;; label = @7
                      block ;; label = @8
                        local.get 3
                        i32.load offset=20
                        local.tee 4
                        i32.eqz
                        br_if 0 (;@8;)
                        local.get 3
                        i32.const 20
                        i32.add
                        local.set 5
                        br 1 (;@7;)
                      end
                      local.get 3
                      i32.load offset=16
                      local.tee 4
                      i32.eqz
                      br_if 2 (;@5;)
                      local.get 3
                      i32.const 16
                      i32.add
                      local.set 5
                    end
                    loop ;; label = @7
                      local.get 5
                      local.set 7
                      local.get 4
                      local.tee 2
                      i32.const 20
                      i32.add
                      local.set 5
                      local.get 2
                      i32.load offset=20
                      local.tee 4
                      br_if 0 (;@7;)
                      local.get 2
                      i32.const 16
                      i32.add
                      local.set 5
                      local.get 2
                      i32.load offset=16
                      local.tee 4
                      br_if 0 (;@7;)
                    end
                    local.get 7
                    i32.const 0
                    i32.store
                    br 2 (;@4;)
                  end
                  local.get 3
                  local.get 4
                  i32.const -2
                  i32.and
                  i32.store offset=4
                  local.get 1
                  local.get 0
                  i32.add
                  local.get 0
                  i32.store
                  local.get 1
                  local.get 0
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  br 3 (;@2;)
                end
                i32.const 0
                local.set 2
              end
              local.get 8
              i32.eqz
              br_if 0 (;@3;)
              block ;; label = @4
                block ;; label = @5
                  local.get 3
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1048716
                  i32.add
                  local.get 3
                  i32.load offset=28
                  local.tee 5
                  i32.const 2
                  i32.shl
                  i32.add
                  local.tee 4
                  i32.load offset=304
                  i32.ne
                  br_if 0 (;@5;)
                  local.get 4
                  i32.const 304
                  i32.add
                  local.get 2
                  i32.store
                  local.get 2
                  br_if 1 (;@4;)
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1048716
                  i32.add
                  local.tee 2
                  local.get 2
                  i32.load offset=4
                  i32.const -2
                  local.get 5
                  i32.rotl
                  i32.and
                  i32.store offset=4
                  br 2 (;@3;)
                end
                block ;; label = @5
                  block ;; label = @6
                    local.get 8
                    i32.load offset=16
                    local.get 3
                    i32.ne
                    br_if 0 (;@6;)
                    local.get 8
                    local.get 2
                    i32.store offset=16
                    br 1 (;@5;)
                  end
                  local.get 8
                  local.get 2
                  i32.store offset=20
                end
                local.get 2
                i32.eqz
                br_if 1 (;@3;)
              end
              local.get 2
              local.get 8
              i32.store offset=24
              block ;; label = @4
                local.get 3
                i32.load offset=16
                local.tee 4
                i32.eqz
                br_if 0 (;@4;)
                local.get 2
                local.get 4
                i32.store offset=16
                local.get 4
                local.get 2
                i32.store offset=24
              end
              local.get 3
              i32.load offset=20
              local.tee 4
              i32.eqz
              br_if 0 (;@3;)
              local.get 2
              local.get 4
              i32.store offset=20
              local.get 4
              local.get 2
              i32.store offset=24
            end
            local.get 1
            local.get 0
            i32.add
            local.get 0
            i32.store
            local.get 1
            local.get 0
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 1
            local.get 6
            i32.ne
            br_if 0 (;@2;)
            global.get $GOT.data.internal.__memory_base
            i32.const 1048716
            i32.add
            local.get 0
            i32.store offset=8
            return
          end
          block ;; label = @2
            local.get 0
            i32.const 255
            i32.gt_u
            br_if 0 (;@2;)
            global.get $GOT.data.internal.__memory_base
            i32.const 1048716
            i32.add
            local.tee 4
            local.get 0
            i32.const 248
            i32.and
            i32.add
            i32.const 40
            i32.add
            local.set 2
            block ;; label = @3
              block ;; label = @4
                local.get 4
                i32.load
                local.tee 4
                i32.const 1
                local.get 0
                i32.const 3
                i32.shr_u
                i32.shl
                local.tee 0
                i32.and
                br_if 0 (;@4;)
                global.get $GOT.data.internal.__memory_base
                i32.const 1048716
                i32.add
                local.get 4
                local.get 0
                i32.or
                i32.store
                local.get 2
                local.set 0
                br 1 (;@3;)
              end
              local.get 2
              i32.load offset=8
              local.set 0
            end
            local.get 0
            local.get 1
            i32.store offset=12
            local.get 2
            local.get 1
            i32.store offset=8
            local.get 1
            local.get 2
            i32.store offset=12
            local.get 1
            local.get 0
            i32.store offset=8
            return
          end
          i32.const 31
          local.set 2
          block ;; label = @2
            local.get 0
            i32.const 16777215
            i32.gt_u
            br_if 0 (;@2;)
            local.get 0
            i32.const 38
            local.get 0
            i32.const 8
            i32.shr_u
            i32.clz
            local.tee 2
            i32.sub
            i32.shr_u
            i32.const 1
            i32.and
            local.get 2
            i32.const 1
            i32.shl
            i32.or
            i32.const 62
            i32.xor
            local.set 2
          end
          local.get 1
          local.get 2
          i32.store offset=28
          local.get 1
          i64.const 0
          i64.store offset=16 align=4
          global.get $GOT.data.internal.__memory_base
          i32.const 1048716
          i32.add
          local.tee 4
          local.get 2
          i32.const 2
          i32.shl
          i32.add
          i32.const 304
          i32.add
          local.set 5
          block ;; label = @2
            block ;; label = @3
              block ;; label = @4
                block ;; label = @5
                  local.get 4
                  i32.load offset=4
                  local.tee 4
                  i32.const 1
                  local.get 2
                  i32.shl
                  local.tee 3
                  i32.and
                  br_if 0 (;@5;)
                  local.get 5
                  local.get 1
                  i32.store
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1048716
                  i32.add
                  local.get 4
                  local.get 3
                  i32.or
                  i32.store offset=4
                  i32.const 8
                  local.set 0
                  i32.const 24
                  local.set 2
                  br 1 (;@4;)
                end
                local.get 0
                i32.const 0
                i32.const 25
                local.get 2
                i32.const 1
                i32.shr_u
                i32.sub
                local.get 2
                i32.const 31
                i32.eq
                select
                i32.shl
                local.set 2
                local.get 5
                i32.load
                local.set 5
                loop ;; label = @5
                  local.get 5
                  local.tee 4
                  i32.load offset=4
                  i32.const -8
                  i32.and
                  local.get 0
                  i32.eq
                  br_if 2 (;@3;)
                  local.get 2
                  i32.const 29
                  i32.shr_u
                  local.set 5
                  local.get 2
                  i32.const 1
                  i32.shl
                  local.set 2
                  local.get 4
                  local.get 5
                  i32.const 4
                  i32.and
                  i32.add
                  local.tee 3
                  i32.load offset=16
                  local.tee 5
                  br_if 0 (;@5;)
                end
                local.get 3
                i32.const 16
                i32.add
                local.get 1
                i32.store
                i32.const 8
                local.set 0
                i32.const 24
                local.set 2
                local.get 4
                local.set 5
              end
              local.get 1
              local.set 4
              local.get 1
              local.set 3
              br 1 (;@2;)
            end
            local.get 4
            i32.load offset=8
            local.tee 5
            local.get 1
            i32.store offset=12
            local.get 4
            local.get 1
            i32.store offset=8
            i32.const 0
            local.set 3
            i32.const 24
            local.set 0
            i32.const 8
            local.set 2
          end
          local.get 1
          local.get 2
          i32.add
          local.get 5
          i32.store
          local.get 1
          local.get 4
          i32.store offset=12
          local.get 1
          local.get 0
          i32.add
          local.get 3
          i32.store
          global.get $GOT.data.internal.__memory_base
          i32.const 1048716
          i32.add
          local.tee 1
          local.get 1
          i32.load offset=32
          i32.const -1
          i32.add
          local.tee 1
          i32.const -1
          local.get 1
          select
          i32.store offset=32
        end
      )
      (func $realloc (;20;) (type 1) (param i32 i32) (result i32)
        (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
        block ;; label = @1
          local.get 0
          br_if 0 (;@1;)
          local.get 1
          call $dlmalloc
          return
        end
        block ;; label = @1
          local.get 1
          i32.const -64
          i32.lt_u
          br_if 0 (;@1;)
          global.get $GOT.data.internal.errno
          i32.const 48
          i32.store
          i32.const 0
          return
        end
        i32.const 16
        local.get 1
        i32.const 19
        i32.add
        i32.const -16
        i32.and
        local.get 1
        i32.const 11
        i32.lt_u
        select
        local.set 2
        local.get 0
        i32.const -4
        i32.add
        local.tee 3
        i32.load
        local.tee 4
        i32.const -8
        i32.and
        local.set 5
        block ;; label = @1
          block ;; label = @2
            block ;; label = @3
              local.get 4
              i32.const 3
              i32.and
              br_if 0 (;@3;)
              local.get 2
              i32.const 256
              i32.lt_u
              br_if 1 (;@2;)
              local.get 5
              local.get 2
              i32.le_u
              br_if 1 (;@2;)
              local.get 5
              local.get 2
              i32.sub
              global.get $GOT.data.internal.__memory_base
              i32.const 1049188
              i32.add
              i32.load offset=8
              i32.const 1
              i32.shl
              i32.le_u
              br_if 2 (;@1;)
              br 1 (;@2;)
            end
            local.get 0
            i32.const -8
            i32.add
            local.tee 6
            local.get 5
            i32.add
            local.set 7
            block ;; label = @3
              local.get 5
              local.get 2
              i32.lt_u
              br_if 0 (;@3;)
              local.get 5
              local.get 2
              i32.sub
              local.tee 1
              i32.const 16
              i32.lt_u
              br_if 2 (;@1;)
              local.get 3
              local.get 2
              local.get 4
              i32.const 1
              i32.and
              i32.or
              i32.const 2
              i32.or
              i32.store
              local.get 6
              local.get 2
              i32.add
              local.tee 2
              local.get 1
              i32.const 3
              i32.or
              i32.store offset=4
              local.get 7
              local.get 7
              i32.load offset=4
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 2
              local.get 1
              call $dispose_chunk
              local.get 0
              return
            end
            local.get 7
            i32.load offset=4
            local.set 8
            block ;; label = @3
              local.get 7
              global.get $GOT.data.internal.__memory_base
              i32.const 1048716
              i32.add
              i32.load offset=24
              i32.ne
              br_if 0 (;@3;)
              global.get $GOT.data.internal.__memory_base
              i32.const 1048716
              i32.add
              i32.load offset=12
              local.get 5
              i32.add
              local.tee 5
              local.get 2
              i32.le_u
              br_if 1 (;@2;)
              local.get 3
              local.get 2
              local.get 4
              i32.const 1
              i32.and
              i32.or
              i32.const 2
              i32.or
              i32.store
              global.get $GOT.data.internal.__memory_base
              i32.const 1048716
              i32.add
              local.tee 1
              local.get 6
              local.get 2
              i32.add
              local.tee 4
              i32.store offset=24
              local.get 1
              local.get 5
              local.get 2
              i32.sub
              local.tee 2
              i32.store offset=12
              local.get 4
              local.get 2
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 0
              return
            end
            block ;; label = @3
              local.get 7
              global.get $GOT.data.internal.__memory_base
              i32.const 1048716
              i32.add
              i32.load offset=20
              i32.ne
              br_if 0 (;@3;)
              global.get $GOT.data.internal.__memory_base
              i32.const 1048716
              i32.add
              i32.load offset=8
              local.get 5
              i32.add
              local.tee 5
              local.get 2
              i32.lt_u
              br_if 1 (;@2;)
              block ;; label = @4
                block ;; label = @5
                  local.get 5
                  local.get 2
                  i32.sub
                  local.tee 1
                  i32.const 16
                  i32.lt_u
                  br_if 0 (;@5;)
                  local.get 3
                  local.get 2
                  local.get 4
                  i32.const 1
                  i32.and
                  i32.or
                  i32.const 2
                  i32.or
                  i32.store
                  local.get 6
                  local.get 2
                  i32.add
                  local.tee 2
                  local.get 1
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get 6
                  local.get 5
                  i32.add
                  local.tee 5
                  local.get 1
                  i32.store
                  local.get 5
                  local.get 5
                  i32.load offset=4
                  i32.const -2
                  i32.and
                  i32.store offset=4
                  br 1 (;@4;)
                end
                local.get 3
                local.get 4
                i32.const 1
                i32.and
                local.get 5
                i32.or
                i32.const 2
                i32.or
                i32.store
                local.get 6
                local.get 5
                i32.add
                local.tee 1
                local.get 1
                i32.load offset=4
                i32.const 1
                i32.or
                i32.store offset=4
                i32.const 0
                local.set 2
                i32.const 0
                local.set 1
              end
              global.get $GOT.data.internal.__memory_base
              i32.const 1048716
              i32.add
              local.tee 5
              local.get 2
              i32.store offset=20
              local.get 5
              local.get 1
              i32.store offset=8
              local.get 0
              return
            end
            local.get 8
            i32.const 2
            i32.and
            br_if 0 (;@2;)
            local.get 8
            i32.const -8
            i32.and
            local.get 5
            i32.add
            local.tee 9
            local.get 2
            i32.lt_u
            br_if 0 (;@2;)
            local.get 9
            local.get 2
            i32.sub
            local.set 10
            local.get 7
            i32.load offset=12
            local.set 1
            block ;; label = @3
              block ;; label = @4
                local.get 8
                i32.const 255
                i32.gt_u
                br_if 0 (;@4;)
                block ;; label = @5
                  local.get 1
                  local.get 7
                  i32.load offset=8
                  local.tee 5
                  i32.ne
                  br_if 0 (;@5;)
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1048716
                  i32.add
                  local.tee 1
                  local.get 1
                  i32.load
                  i32.const -2
                  local.get 8
                  i32.const 3
                  i32.shr_u
                  i32.rotl
                  i32.and
                  i32.store
                  br 2 (;@3;)
                end
                local.get 1
                local.get 5
                i32.store offset=8
                local.get 5
                local.get 1
                i32.store offset=12
                br 1 (;@3;)
              end
              local.get 7
              i32.load offset=24
              local.set 11
              block ;; label = @4
                block ;; label = @5
                  local.get 1
                  local.get 7
                  i32.eq
                  br_if 0 (;@5;)
                  local.get 7
                  i32.load offset=8
                  local.tee 5
                  local.get 1
                  i32.store offset=12
                  local.get 1
                  local.get 5
                  i32.store offset=8
                  br 1 (;@4;)
                end
                block ;; label = @5
                  block ;; label = @6
                    block ;; label = @7
                      local.get 7
                      i32.load offset=20
                      local.tee 5
                      i32.eqz
                      br_if 0 (;@7;)
                      local.get 7
                      i32.const 20
                      i32.add
                      local.set 8
                      br 1 (;@6;)
                    end
                    local.get 7
                    i32.load offset=16
                    local.tee 5
                    i32.eqz
                    br_if 1 (;@5;)
                    local.get 7
                    i32.const 16
                    i32.add
                    local.set 8
                  end
                  loop ;; label = @6
                    local.get 8
                    local.set 12
                    local.get 5
                    local.tee 1
                    i32.const 20
                    i32.add
                    local.set 8
                    local.get 1
                    i32.load offset=20
                    local.tee 5
                    br_if 0 (;@6;)
                    local.get 1
                    i32.const 16
                    i32.add
                    local.set 8
                    local.get 1
                    i32.load offset=16
                    local.tee 5
                    br_if 0 (;@6;)
                  end
                  local.get 12
                  i32.const 0
                  i32.store
                  br 1 (;@4;)
                end
                i32.const 0
                local.set 1
              end
              local.get 11
              i32.eqz
              br_if 0 (;@3;)
              block ;; label = @4
                block ;; label = @5
                  local.get 7
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1048716
                  i32.add
                  local.get 7
                  i32.load offset=28
                  local.tee 8
                  i32.const 2
                  i32.shl
                  i32.add
                  local.tee 5
                  i32.load offset=304
                  i32.ne
                  br_if 0 (;@5;)
                  local.get 5
                  i32.const 304
                  i32.add
                  local.get 1
                  i32.store
                  local.get 1
                  br_if 1 (;@4;)
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1048716
                  i32.add
                  local.tee 1
                  local.get 1
                  i32.load offset=4
                  i32.const -2
                  local.get 8
                  i32.rotl
                  i32.and
                  i32.store offset=4
                  br 2 (;@3;)
                end
                block ;; label = @5
                  block ;; label = @6
                    local.get 11
                    i32.load offset=16
                    local.get 7
                    i32.ne
                    br_if 0 (;@6;)
                    local.get 11
                    local.get 1
                    i32.store offset=16
                    br 1 (;@5;)
                  end
                  local.get 11
                  local.get 1
                  i32.store offset=20
                end
                local.get 1
                i32.eqz
                br_if 1 (;@3;)
              end
              local.get 1
              local.get 11
              i32.store offset=24
              block ;; label = @4
                local.get 7
                i32.load offset=16
                local.tee 5
                i32.eqz
                br_if 0 (;@4;)
                local.get 1
                local.get 5
                i32.store offset=16
                local.get 5
                local.get 1
                i32.store offset=24
              end
              local.get 7
              i32.load offset=20
              local.tee 5
              i32.eqz
              br_if 0 (;@3;)
              local.get 1
              local.get 5
              i32.store offset=20
              local.get 5
              local.get 1
              i32.store offset=24
            end
            block ;; label = @3
              local.get 10
              i32.const 15
              i32.gt_u
              br_if 0 (;@3;)
              local.get 3
              local.get 4
              i32.const 1
              i32.and
              local.get 9
              i32.or
              i32.const 2
              i32.or
              i32.store
              local.get 6
              local.get 9
              i32.add
              local.tee 1
              local.get 1
              i32.load offset=4
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 0
              return
            end
            local.get 3
            local.get 2
            local.get 4
            i32.const 1
            i32.and
            i32.or
            i32.const 2
            i32.or
            i32.store
            local.get 6
            local.get 2
            i32.add
            local.tee 1
            local.get 10
            i32.const 3
            i32.or
            i32.store offset=4
            local.get 6
            local.get 9
            i32.add
            local.tee 2
            local.get 2
            i32.load offset=4
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 1
            local.get 10
            call $dispose_chunk
            local.get 0
            return
          end
          block ;; label = @2
            local.get 1
            call $dlmalloc
            local.tee 2
            br_if 0 (;@2;)
            i32.const 0
            return
          end
          block ;; label = @2
            i32.const -4
            i32.const -8
            local.get 3
            i32.load
            local.tee 5
            i32.const 3
            i32.and
            select
            local.get 5
            i32.const -8
            i32.and
            i32.add
            local.tee 5
            local.get 1
            local.get 5
            local.get 1
            i32.lt_u
            select
            local.tee 1
            i32.eqz
            br_if 0 (;@2;)
            local.get 2
            local.get 0
            local.get 1
            memory.copy
          end
          local.get 0
          call $dlfree
          local.get 2
          local.set 0
        end
        local.get 0
      )
      (func $dispose_chunk (;21;) (type 6) (param i32 i32)
        (local i32 i32 i32 i32 i32 i32 i32)
        local.get 0
        local.get 1
        i32.add
        local.set 2
        block ;; label = @1
          block ;; label = @2
            local.get 0
            i32.load offset=4
            local.tee 3
            i32.const 1
            i32.and
            br_if 0 (;@2;)
            local.get 3
            i32.const 2
            i32.and
            i32.eqz
            br_if 1 (;@1;)
            local.get 0
            i32.load
            local.tee 4
            local.get 1
            i32.add
            local.set 1
            block ;; label = @3
              block ;; label = @4
                block ;; label = @5
                  block ;; label = @6
                    local.get 0
                    local.get 4
                    i32.sub
                    local.tee 0
                    global.get $GOT.data.internal.__memory_base
                    i32.const 1048716
                    i32.add
                    i32.load offset=20
                    i32.eq
                    br_if 0 (;@6;)
                    local.get 0
                    i32.load offset=12
                    local.set 3
                    block ;; label = @7
                      local.get 4
                      i32.const 255
                      i32.gt_u
                      br_if 0 (;@7;)
                      local.get 3
                      local.get 0
                      i32.load offset=8
                      local.tee 5
                      i32.ne
                      br_if 2 (;@5;)
                      global.get $GOT.data.internal.__memory_base
                      i32.const 1048716
                      i32.add
                      local.tee 3
                      local.get 3
                      i32.load
                      i32.const -2
                      local.get 4
                      i32.const 3
                      i32.shr_u
                      i32.rotl
                      i32.and
                      i32.store
                      br 5 (;@2;)
                    end
                    local.get 0
                    i32.load offset=24
                    local.set 6
                    block ;; label = @7
                      local.get 3
                      local.get 0
                      i32.eq
                      br_if 0 (;@7;)
                      local.get 0
                      i32.load offset=8
                      local.tee 4
                      local.get 3
                      i32.store offset=12
                      local.get 3
                      local.get 4
                      i32.store offset=8
                      br 4 (;@3;)
                    end
                    block ;; label = @7
                      block ;; label = @8
                        local.get 0
                        i32.load offset=20
                        local.tee 4
                        i32.eqz
                        br_if 0 (;@8;)
                        local.get 0
                        i32.const 20
                        i32.add
                        local.set 5
                        br 1 (;@7;)
                      end
                      local.get 0
                      i32.load offset=16
                      local.tee 4
                      i32.eqz
                      br_if 3 (;@4;)
                      local.get 0
                      i32.const 16
                      i32.add
                      local.set 5
                    end
                    loop ;; label = @7
                      local.get 5
                      local.set 7
                      local.get 4
                      local.tee 3
                      i32.const 20
                      i32.add
                      local.set 5
                      local.get 3
                      i32.load offset=20
                      local.tee 4
                      br_if 0 (;@7;)
                      local.get 3
                      i32.const 16
                      i32.add
                      local.set 5
                      local.get 3
                      i32.load offset=16
                      local.tee 4
                      br_if 0 (;@7;)
                    end
                    local.get 7
                    i32.const 0
                    i32.store
                    br 3 (;@3;)
                  end
                  local.get 2
                  i32.load offset=4
                  local.tee 3
                  i32.const 3
                  i32.and
                  i32.const 3
                  i32.ne
                  br_if 3 (;@2;)
                  local.get 2
                  local.get 3
                  i32.const -2
                  i32.and
                  i32.store offset=4
                  local.get 2
                  local.get 1
                  i32.store
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1048716
                  i32.add
                  local.get 1
                  i32.store offset=8
                  local.get 0
                  local.get 1
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  return
                end
                local.get 3
                local.get 5
                i32.store offset=8
                local.get 5
                local.get 3
                i32.store offset=12
                br 2 (;@2;)
              end
              i32.const 0
              local.set 3
            end
            local.get 6
            i32.eqz
            br_if 0 (;@2;)
            block ;; label = @3
              block ;; label = @4
                local.get 0
                global.get $GOT.data.internal.__memory_base
                i32.const 1048716
                i32.add
                local.get 0
                i32.load offset=28
                local.tee 5
                i32.const 2
                i32.shl
                i32.add
                local.tee 4
                i32.load offset=304
                i32.ne
                br_if 0 (;@4;)
                local.get 4
                i32.const 304
                i32.add
                local.get 3
                i32.store
                local.get 3
                br_if 1 (;@3;)
                global.get $GOT.data.internal.__memory_base
                i32.const 1048716
                i32.add
                local.tee 3
                local.get 3
                i32.load offset=4
                i32.const -2
                local.get 5
                i32.rotl
                i32.and
                i32.store offset=4
                br 2 (;@2;)
              end
              block ;; label = @4
                block ;; label = @5
                  local.get 6
                  i32.load offset=16
                  local.get 0
                  i32.ne
                  br_if 0 (;@5;)
                  local.get 6
                  local.get 3
                  i32.store offset=16
                  br 1 (;@4;)
                end
                local.get 6
                local.get 3
                i32.store offset=20
              end
              local.get 3
              i32.eqz
              br_if 1 (;@2;)
            end
            local.get 3
            local.get 6
            i32.store offset=24
            block ;; label = @3
              local.get 0
              i32.load offset=16
              local.tee 4
              i32.eqz
              br_if 0 (;@3;)
              local.get 3
              local.get 4
              i32.store offset=16
              local.get 4
              local.get 3
              i32.store offset=24
            end
            local.get 0
            i32.load offset=20
            local.tee 4
            i32.eqz
            br_if 0 (;@2;)
            local.get 3
            local.get 4
            i32.store offset=20
            local.get 4
            local.get 3
            i32.store offset=24
          end
          block ;; label = @2
            block ;; label = @3
              block ;; label = @4
                block ;; label = @5
                  block ;; label = @6
                    local.get 2
                    i32.load offset=4
                    local.tee 4
                    i32.const 2
                    i32.and
                    br_if 0 (;@6;)
                    block ;; label = @7
                      local.get 2
                      global.get $GOT.data.internal.__memory_base
                      i32.const 1048716
                      i32.add
                      i32.load offset=24
                      i32.ne
                      br_if 0 (;@7;)
                      global.get $GOT.data.internal.__memory_base
                      i32.const 1048716
                      i32.add
                      local.tee 3
                      local.get 0
                      i32.store offset=24
                      local.get 3
                      local.get 3
                      i32.load offset=12
                      local.get 1
                      i32.add
                      local.tee 1
                      i32.store offset=12
                      local.get 0
                      local.get 1
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get 0
                      local.get 3
                      i32.load offset=20
                      i32.ne
                      br_if 6 (;@1;)
                      global.get $GOT.data.internal.__memory_base
                      i32.const 1048716
                      i32.add
                      local.tee 0
                      i32.const 0
                      i32.store offset=8
                      local.get 0
                      i32.const 0
                      i32.store offset=20
                      return
                    end
                    block ;; label = @7
                      local.get 2
                      global.get $GOT.data.internal.__memory_base
                      i32.const 1048716
                      i32.add
                      i32.load offset=20
                      local.tee 6
                      i32.ne
                      br_if 0 (;@7;)
                      global.get $GOT.data.internal.__memory_base
                      i32.const 1048716
                      i32.add
                      local.tee 3
                      local.get 0
                      i32.store offset=20
                      local.get 3
                      local.get 3
                      i32.load offset=8
                      local.get 1
                      i32.add
                      local.tee 1
                      i32.store offset=8
                      local.get 0
                      local.get 1
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get 0
                      local.get 1
                      i32.add
                      local.get 1
                      i32.store
                      return
                    end
                    local.get 4
                    i32.const -8
                    i32.and
                    local.get 1
                    i32.add
                    local.set 1
                    local.get 2
                    i32.load offset=12
                    local.set 3
                    block ;; label = @7
                      local.get 4
                      i32.const 255
                      i32.gt_u
                      br_if 0 (;@7;)
                      block ;; label = @8
                        local.get 3
                        local.get 2
                        i32.load offset=8
                        local.tee 5
                        i32.ne
                        br_if 0 (;@8;)
                        global.get $GOT.data.internal.__memory_base
                        i32.const 1048716
                        i32.add
                        local.tee 3
                        local.get 3
                        i32.load
                        i32.const -2
                        local.get 4
                        i32.const 3
                        i32.shr_u
                        i32.rotl
                        i32.and
                        i32.store
                        br 5 (;@3;)
                      end
                      local.get 3
                      local.get 5
                      i32.store offset=8
                      local.get 5
                      local.get 3
                      i32.store offset=12
                      br 4 (;@3;)
                    end
                    local.get 2
                    i32.load offset=24
                    local.set 8
                    block ;; label = @7
                      local.get 3
                      local.get 2
                      i32.eq
                      br_if 0 (;@7;)
                      local.get 2
                      i32.load offset=8
                      local.tee 4
                      local.get 3
                      i32.store offset=12
                      local.get 3
                      local.get 4
                      i32.store offset=8
                      br 3 (;@4;)
                    end
                    block ;; label = @7
                      block ;; label = @8
                        local.get 2
                        i32.load offset=20
                        local.tee 4
                        i32.eqz
                        br_if 0 (;@8;)
                        local.get 2
                        i32.const 20
                        i32.add
                        local.set 5
                        br 1 (;@7;)
                      end
                      local.get 2
                      i32.load offset=16
                      local.tee 4
                      i32.eqz
                      br_if 2 (;@5;)
                      local.get 2
                      i32.const 16
                      i32.add
                      local.set 5
                    end
                    loop ;; label = @7
                      local.get 5
                      local.set 7
                      local.get 4
                      local.tee 3
                      i32.const 20
                      i32.add
                      local.set 5
                      local.get 3
                      i32.load offset=20
                      local.tee 4
                      br_if 0 (;@7;)
                      local.get 3
                      i32.const 16
                      i32.add
                      local.set 5
                      local.get 3
                      i32.load offset=16
                      local.tee 4
                      br_if 0 (;@7;)
                    end
                    local.get 7
                    i32.const 0
                    i32.store
                    br 2 (;@4;)
                  end
                  local.get 2
                  local.get 4
                  i32.const -2
                  i32.and
                  i32.store offset=4
                  local.get 0
                  local.get 1
                  i32.add
                  local.get 1
                  i32.store
                  local.get 0
                  local.get 1
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  br 3 (;@2;)
                end
                i32.const 0
                local.set 3
              end
              local.get 8
              i32.eqz
              br_if 0 (;@3;)
              block ;; label = @4
                block ;; label = @5
                  local.get 2
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1048716
                  i32.add
                  local.get 2
                  i32.load offset=28
                  local.tee 5
                  i32.const 2
                  i32.shl
                  i32.add
                  local.tee 4
                  i32.load offset=304
                  i32.ne
                  br_if 0 (;@5;)
                  local.get 4
                  i32.const 304
                  i32.add
                  local.get 3
                  i32.store
                  local.get 3
                  br_if 1 (;@4;)
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1048716
                  i32.add
                  local.tee 3
                  local.get 3
                  i32.load offset=4
                  i32.const -2
                  local.get 5
                  i32.rotl
                  i32.and
                  i32.store offset=4
                  br 2 (;@3;)
                end
                block ;; label = @5
                  block ;; label = @6
                    local.get 8
                    i32.load offset=16
                    local.get 2
                    i32.ne
                    br_if 0 (;@6;)
                    local.get 8
                    local.get 3
                    i32.store offset=16
                    br 1 (;@5;)
                  end
                  local.get 8
                  local.get 3
                  i32.store offset=20
                end
                local.get 3
                i32.eqz
                br_if 1 (;@3;)
              end
              local.get 3
              local.get 8
              i32.store offset=24
              block ;; label = @4
                local.get 2
                i32.load offset=16
                local.tee 4
                i32.eqz
                br_if 0 (;@4;)
                local.get 3
                local.get 4
                i32.store offset=16
                local.get 4
                local.get 3
                i32.store offset=24
              end
              local.get 2
              i32.load offset=20
              local.tee 4
              i32.eqz
              br_if 0 (;@3;)
              local.get 3
              local.get 4
              i32.store offset=20
              local.get 4
              local.get 3
              i32.store offset=24
            end
            local.get 0
            local.get 1
            i32.add
            local.get 1
            i32.store
            local.get 0
            local.get 1
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 0
            local.get 6
            i32.ne
            br_if 0 (;@2;)
            global.get $GOT.data.internal.__memory_base
            i32.const 1048716
            i32.add
            local.get 1
            i32.store offset=8
            return
          end
          block ;; label = @2
            local.get 1
            i32.const 255
            i32.gt_u
            br_if 0 (;@2;)
            global.get $GOT.data.internal.__memory_base
            i32.const 1048716
            i32.add
            local.tee 4
            local.get 1
            i32.const 248
            i32.and
            i32.add
            i32.const 40
            i32.add
            local.set 3
            block ;; label = @3
              block ;; label = @4
                local.get 4
                i32.load
                local.tee 4
                i32.const 1
                local.get 1
                i32.const 3
                i32.shr_u
                i32.shl
                local.tee 1
                i32.and
                br_if 0 (;@4;)
                global.get $GOT.data.internal.__memory_base
                i32.const 1048716
                i32.add
                local.get 4
                local.get 1
                i32.or
                i32.store
                local.get 3
                local.set 1
                br 1 (;@3;)
              end
              local.get 3
              i32.load offset=8
              local.set 1
            end
            local.get 1
            local.get 0
            i32.store offset=12
            local.get 3
            local.get 0
            i32.store offset=8
            local.get 0
            local.get 3
            i32.store offset=12
            local.get 0
            local.get 1
            i32.store offset=8
            return
          end
          i32.const 31
          local.set 3
          block ;; label = @2
            local.get 1
            i32.const 16777215
            i32.gt_u
            br_if 0 (;@2;)
            local.get 1
            i32.const 38
            local.get 1
            i32.const 8
            i32.shr_u
            i32.clz
            local.tee 3
            i32.sub
            i32.shr_u
            i32.const 1
            i32.and
            local.get 3
            i32.const 1
            i32.shl
            i32.or
            i32.const 62
            i32.xor
            local.set 3
          end
          local.get 0
          local.get 3
          i32.store offset=28
          local.get 0
          i64.const 0
          i64.store offset=16 align=4
          global.get $GOT.data.internal.__memory_base
          i32.const 1048716
          i32.add
          local.tee 5
          local.get 3
          i32.const 2
          i32.shl
          i32.add
          i32.const 304
          i32.add
          local.set 4
          block ;; label = @2
            local.get 5
            i32.load offset=4
            local.tee 5
            i32.const 1
            local.get 3
            i32.shl
            local.tee 2
            i32.and
            br_if 0 (;@2;)
            local.get 4
            local.get 0
            i32.store
            global.get $GOT.data.internal.__memory_base
            i32.const 1048716
            i32.add
            local.get 5
            local.get 2
            i32.or
            i32.store offset=4
            local.get 0
            local.get 4
            i32.store offset=24
            local.get 0
            local.get 0
            i32.store offset=8
            local.get 0
            local.get 0
            i32.store offset=12
            return
          end
          local.get 1
          i32.const 0
          i32.const 25
          local.get 3
          i32.const 1
          i32.shr_u
          i32.sub
          local.get 3
          i32.const 31
          i32.eq
          select
          i32.shl
          local.set 3
          local.get 4
          i32.load
          local.set 5
          block ;; label = @2
            loop ;; label = @3
              local.get 5
              local.tee 4
              i32.load offset=4
              i32.const -8
              i32.and
              local.get 1
              i32.eq
              br_if 1 (;@2;)
              local.get 3
              i32.const 29
              i32.shr_u
              local.set 5
              local.get 3
              i32.const 1
              i32.shl
              local.set 3
              local.get 4
              local.get 5
              i32.const 4
              i32.and
              i32.add
              local.tee 2
              i32.load offset=16
              local.tee 5
              br_if 0 (;@3;)
            end
            local.get 2
            i32.const 16
            i32.add
            local.get 0
            i32.store
            local.get 0
            local.get 4
            i32.store offset=24
            local.get 0
            local.get 0
            i32.store offset=12
            local.get 0
            local.get 0
            i32.store offset=8
            return
          end
          local.get 4
          i32.load offset=8
          local.tee 1
          local.get 0
          i32.store offset=12
          local.get 4
          local.get 0
          i32.store offset=8
          local.get 0
          i32.const 0
          i32.store offset=24
          local.get 0
          local.get 4
          i32.store offset=12
          local.get 0
          local.get 1
          i32.store offset=8
        end
      )
      (func $posix_memalign (;22;) (type 4) (param i32 i32 i32) (result i32)
        (local i32 i32)
        block ;; label = @1
          block ;; label = @2
            block ;; label = @3
              local.get 1
              i32.const 16
              i32.ne
              br_if 0 (;@3;)
              local.get 2
              call $dlmalloc
              local.set 1
              br 1 (;@2;)
            end
            i32.const 28
            local.set 3
            local.get 1
            i32.const 3
            i32.and
            br_if 1 (;@1;)
            local.get 1
            i32.const 2
            i32.shr_u
            local.tee 4
            i32.eqz
            br_if 1 (;@1;)
            local.get 4
            i32.popcnt
            i32.const 1
            i32.gt_u
            br_if 1 (;@1;)
            block ;; label = @3
              local.get 2
              i32.const -64
              local.get 1
              i32.sub
              i32.le_u
              br_if 0 (;@3;)
              i32.const 48
              return
            end
            local.get 1
            i32.const 16
            local.get 1
            i32.const 16
            i32.gt_u
            select
            local.get 2
            call $internal_memalign
            local.set 1
          end
          block ;; label = @2
            local.get 1
            br_if 0 (;@2;)
            i32.const 48
            return
          end
          local.get 0
          local.get 1
          i32.store
          i32.const 0
          local.set 3
        end
        local.get 3
      )
      (func $internal_memalign (;23;) (type 1) (param i32 i32) (result i32)
        (local i32 i32 i32 i32 i32)
        block ;; label = @1
          block ;; label = @2
            local.get 0
            i32.const 16
            local.get 0
            i32.const 16
            i32.gt_u
            select
            local.tee 2
            local.get 2
            i32.const -1
            i32.add
            i32.and
            br_if 0 (;@2;)
            local.get 2
            local.set 0
            br 1 (;@1;)
          end
          i32.const 32
          local.set 3
          loop ;; label = @2
            local.get 3
            local.tee 0
            i32.const 1
            i32.shl
            local.set 3
            local.get 0
            local.get 2
            i32.lt_u
            br_if 0 (;@2;)
          end
        end
        block ;; label = @1
          local.get 1
          i32.const -64
          local.get 0
          i32.sub
          i32.lt_u
          br_if 0 (;@1;)
          global.get $GOT.data.internal.errno
          i32.const 48
          i32.store
          i32.const 0
          return
        end
        block ;; label = @1
          local.get 0
          i32.const 16
          local.get 1
          i32.const 19
          i32.add
          i32.const -16
          i32.and
          local.get 1
          i32.const 11
          i32.lt_u
          select
          local.tee 1
          i32.add
          i32.const 12
          i32.add
          call $dlmalloc
          local.tee 3
          br_if 0 (;@1;)
          i32.const 0
          return
        end
        local.get 3
        i32.const -8
        i32.add
        local.set 2
        block ;; label = @1
          block ;; label = @2
            local.get 0
            i32.const -1
            i32.add
            local.get 3
            i32.and
            br_if 0 (;@2;)
            local.get 2
            local.set 0
            br 1 (;@1;)
          end
          local.get 3
          i32.const -4
          i32.add
          local.tee 4
          i32.load
          local.tee 5
          i32.const -8
          i32.and
          local.get 3
          local.get 0
          i32.add
          i32.const -1
          i32.add
          i32.const 0
          local.get 0
          i32.sub
          i32.and
          i32.const -8
          i32.add
          local.tee 3
          i32.const 0
          local.get 0
          local.get 3
          local.get 2
          i32.sub
          i32.const 15
          i32.gt_u
          select
          i32.add
          local.tee 0
          local.get 2
          i32.sub
          local.tee 3
          i32.sub
          local.set 6
          block ;; label = @2
            local.get 5
            i32.const 3
            i32.and
            br_if 0 (;@2;)
            local.get 0
            local.get 6
            i32.store offset=4
            local.get 0
            local.get 2
            i32.load
            local.get 3
            i32.add
            i32.store
            br 1 (;@1;)
          end
          local.get 0
          local.get 6
          local.get 0
          i32.load offset=4
          i32.const 1
          i32.and
          i32.or
          i32.const 2
          i32.or
          i32.store offset=4
          local.get 0
          local.get 6
          i32.add
          local.tee 6
          local.get 6
          i32.load offset=4
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 4
          local.get 3
          local.get 4
          i32.load
          i32.const 1
          i32.and
          i32.or
          i32.const 2
          i32.or
          i32.store
          local.get 2
          local.get 3
          i32.add
          local.tee 6
          local.get 6
          i32.load offset=4
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 2
          local.get 3
          call $dispose_chunk
        end
        block ;; label = @1
          local.get 0
          i32.load offset=4
          local.tee 3
          i32.const 3
          i32.and
          i32.eqz
          br_if 0 (;@1;)
          local.get 3
          i32.const -8
          i32.and
          local.tee 2
          local.get 1
          i32.const 16
          i32.add
          i32.le_u
          br_if 0 (;@1;)
          local.get 0
          local.get 1
          local.get 3
          i32.const 1
          i32.and
          i32.or
          i32.const 2
          i32.or
          i32.store offset=4
          local.get 0
          local.get 1
          i32.add
          local.tee 3
          local.get 2
          local.get 1
          i32.sub
          local.tee 1
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 0
          local.get 2
          i32.add
          local.tee 2
          local.get 2
          i32.load offset=4
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 3
          local.get 1
          call $dispose_chunk
        end
        local.get 0
        i32.const 8
        i32.add
      )
      (func $__component_type_object_force_link_wasip2 (;24;) (type 0))
      (data $.data (;0;) (i32.const 1048576) "\01\00\00\00\02\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00")
      (@producers
        (language "Rust" "")
        (language "C11" "")
        (processed-by "rustc" "1.97.0-nightly (7c3c88f42 2026-05-14)")
        (processed-by "clang" "22.1.0-wasi-sdk (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)")
        (processed-by "wit-component" "0.245.1")
        (processed-by "wit-bindgen-rust" "0.57.1")
        (processed-by "wit-bindgen-c" "0.53.1")
      )
      (@custom "target_features" (after data) "\09+\0bbulk-memory+\0fbulk-memory-opt+\16call-indirect-overlong+\0eextended-const+\0amultivalue+\0fmutable-globals+\13nontrapping-fptoint+\0freference-types+\08sign-ext")
    )
    (core instance $main (;0;) (instantiate $main))
    (alias core export $main "memory" (core memory $memory (;0;)))
    (type (;0;) (func (param "x" u32) (param "y" u32) (result u32)))
    (alias core export $main "docs:adder/add@0.1.0#add" (core func $docs:adder/add@0.1.0#add (;0;)))
    (alias core export $main "cabi_realloc" (core func $cabi_realloc (;1;)))
    (func $add (;0;) (type 0) (canon lift (core func $docs:adder/add@0.1.0#add)))
    (component $docs:adder/add@0.1.0-shim-component (;0;)
      (type (;0;) (func (param "x" u32) (param "y" u32) (result u32)))
      (import "import-func-add" (func (;0;) (type 0)))
      (type (;1;) (func (param "x" u32) (param "y" u32) (result u32)))
      (export (;1;) "add" (func 0) (func (type 1)))
    )
    (instance $docs:adder/add@0.1.0-shim-instance (;0;) (instantiate $docs:adder/add@0.1.0-shim-component
        (with "import-func-add" (func $add))
      )
    )
    (export $docs:adder/add@0.1.0 (;1;) "docs:adder/add@0.1.0" (instance $docs:adder/add@0.1.0-shim-instance))
    (@producers
      (processed-by "wit-component" "0.246.2")
    )
  )
  (instance $adder (;0;) (instantiate 0))
  (alias export $adder "docs:adder/add@0.1.0" (instance (;1;)))
  (component (;1;)
    (type $ty-docs:adder/add@0.1.0 (;0;)
      (instance
        (type (;0;) (func (param "x" u32) (param "y" u32) (result u32)))
        (export (;0;) "add" (func (type 0)))
      )
    )
    (import "docs:adder/add@0.1.0" (instance $docs:adder/add@0.1.0 (;0;) (type $ty-docs:adder/add@0.1.0)))
    (core module $main (;0;)
      (type (;0;) (func (param i32 i32) (result i32)))
      (type (;1;) (func))
      (type (;2;) (func (param i32 i32 i32) (result i32)))
      (type (;3;) (func (param i32 i32 i32 i32) (result i32)))
      (type (;4;) (func (param i32) (result i32)))
      (type (;5;) (func (param i32)))
      (type (;6;) (func (param i32 i32)))
      (import "docs:adder/add@0.1.0" "add" (func $_RNvNvNtNtNtCs6s1jYZkrdQv_10calculator4docs5adder3add3add11wit_import0 (;0;) (type 0)))
      (table (;0;) 4 4 funcref)
      (memory (;0;) 17)
      (global $__stack_pointer (;0;) (mut i32) i32.const 1048576)
      (global $GOT.data.internal.__memory_base (;1;) i32 i32.const 0)
      (global $GOT.data.internal.errno (;2;) i32 i32.const 1048716)
      (global $GOT.data.internal.__heap_base (;3;) i32 i32.const 1049216)
      (global $GOT.data.internal.__heap_end (;4;) i32 i32.const 1114112)
      (export "memory" (memory 0))
      (export "docs:calculator/calculate@0.1.0#eval-expression" (func $docs:calculator/calculate@0.1.0#eval-expression))
      (export "cabi_realloc" (func $cabi_realloc))
      (elem (;0;) (i32.const 1) func $_RNvCs6s1jYZkrdQv_10calculator40___link_custom_section_describing_imports $cabi_realloc $_RNvNtCs29yq1xGkpr0_6wasip25proxy40___link_custom_section_describing_imports)
      (func $__wasm_call_ctors (;1;) (type 1))
      (func $_RNvCs6s1jYZkrdQv_10calculator40___link_custom_section_describing_imports (;2;) (type 1))
      (func $docs:calculator/calculate@0.1.0#eval-expression (;3;) (type 2) (param i32 i32 i32) (result i32)
        call $_RNvNtCsjnzt6jtcXzx_11wit_bindgen2rt14run_ctors_once
        local.get 1
        local.get 2
        call $_RNvNvNtNtNtCs6s1jYZkrdQv_10calculator4docs5adder3add3add11wit_import0
      )
      (func $_RNvCs9yhMa3bQ28w_7___rustc12___rust_alloc (;4;) (type 0) (param i32 i32) (result i32)
        local.get 0
        local.get 1
        call $_RNvCs9yhMa3bQ28w_7___rustc11___rdl_alloc
        return
      )
      (func $_RNvCs9yhMa3bQ28w_7___rustc14___rust_realloc (;5;) (type 3) (param i32 i32 i32 i32) (result i32)
        local.get 0
        local.get 1
        local.get 2
        local.get 3
        call $_RNvCs9yhMa3bQ28w_7___rustc13___rdl_realloc
        return
      )
      (func $_RNvCs9yhMa3bQ28w_7___rustc35___rust_no_alloc_shim_is_unstable_v2 (;6;) (type 1)
        return
      )
      (func $_RNvNtCsjnzt6jtcXzx_11wit_bindgen2rt14run_ctors_once (;7;) (type 1)
        (local i32)
        block ;; label = @1
          global.get $GOT.data.internal.__memory_base
          i32.const 1048712
          i32.add
          i32.load8_u
          br_if 0 (;@1;)
          global.get $GOT.data.internal.__memory_base
          local.set 0
          call $__wasm_call_ctors
          local.get 0
          i32.const 1048712
          i32.add
          i32.const 1
          i32.store8
        end
      )
      (func $_RNvCs9yhMa3bQ28w_7___rustc11___rdl_alloc (;8;) (type 0) (param i32 i32) (result i32)
        (local i32)
        global.get $__stack_pointer
        i32.const 16
        i32.sub
        local.tee 2
        global.set $__stack_pointer
        block ;; label = @1
          block ;; label = @2
            block ;; label = @3
              local.get 1
              i32.const 8
              i32.gt_u
              br_if 0 (;@3;)
              local.get 1
              local.get 0
              i32.le_u
              br_if 1 (;@2;)
            end
            local.get 2
            i32.const 0
            i32.store offset=12
            local.get 2
            i32.const 12
            i32.add
            local.get 1
            i32.const 4
            local.get 1
            i32.const 4
            i32.gt_u
            select
            local.get 0
            call $posix_memalign
            local.set 1
            i32.const 0
            local.get 2
            i32.load offset=12
            local.get 1
            select
            local.set 1
            br 1 (;@1;)
          end
          local.get 0
          call $malloc
          local.set 1
        end
        local.get 2
        i32.const 16
        i32.add
        global.set $__stack_pointer
        local.get 1
      )
      (func $_RNvCs9yhMa3bQ28w_7___rustc13___rdl_realloc (;9;) (type 3) (param i32 i32 i32 i32) (result i32)
        (local i32 i32)
        global.get $__stack_pointer
        i32.const 16
        i32.sub
        local.tee 4
        global.set $__stack_pointer
        block ;; label = @1
          block ;; label = @2
            block ;; label = @3
              local.get 2
              i32.const 8
              i32.gt_u
              br_if 0 (;@3;)
              local.get 2
              local.get 3
              i32.le_u
              br_if 1 (;@2;)
            end
            i32.const 0
            local.set 5
            local.get 4
            i32.const 0
            i32.store offset=12
            local.get 4
            i32.const 12
            i32.add
            local.get 2
            i32.const 4
            local.get 2
            i32.const 4
            i32.gt_u
            select
            local.get 3
            call $posix_memalign
            br_if 1 (;@1;)
            local.get 4
            i32.load offset=12
            local.tee 2
            i32.eqz
            br_if 1 (;@1;)
            block ;; label = @3
              local.get 3
              local.get 1
              local.get 3
              local.get 1
              i32.lt_u
              select
              local.tee 3
              i32.eqz
              br_if 0 (;@3;)
              local.get 2
              local.get 0
              local.get 3
              memory.copy
            end
            local.get 0
            call $free
            local.get 2
            local.set 5
            br 1 (;@1;)
          end
          local.get 0
          local.get 3
          call $realloc
          local.set 5
        end
        local.get 4
        i32.const 16
        i32.add
        global.set $__stack_pointer
        local.get 5
      )
      (func $_RNvNtNtNtCsbH2HoTk6zdg_3std3sys3pal4wasi14abort_internal (;10;) (type 1)
        call $abort
        unreachable
      )
      (func $cabi_realloc (;11;) (type 3) (param i32 i32 i32 i32) (result i32)
        block ;; label = @1
          block ;; label = @2
            block ;; label = @3
              local.get 1
              br_if 0 (;@3;)
              local.get 3
              i32.eqz
              br_if 2 (;@1;)
              call $_RNvCs9yhMa3bQ28w_7___rustc35___rust_no_alloc_shim_is_unstable_v2
              local.get 3
              local.get 2
              call $_RNvCs9yhMa3bQ28w_7___rustc12___rust_alloc
              local.tee 2
              i32.eqz
              br_if 1 (;@2;)
              br 2 (;@1;)
            end
            local.get 0
            local.get 1
            local.get 2
            local.get 3
            call $_RNvCs9yhMa3bQ28w_7___rustc14___rust_realloc
            local.tee 2
            br_if 1 (;@1;)
          end
          call $_RNvNtNtNtCsbH2HoTk6zdg_3std3sys3pal4wasi14abort_internal
          unreachable
        end
        local.get 2
      )
      (func $_RNvNtCs29yq1xGkpr0_6wasip25proxy40___link_custom_section_describing_imports (;12;) (type 1))
      (func $abort (;13;) (type 1)
        unreachable
      )
      (func $__component_type_object_force_link_wasip2_public_use_in_this_compilation_unit (;14;) (type 1)
        call $__component_type_object_force_link_wasip2
      )
      (func $sbrk (;15;) (type 4) (param i32) (result i32)
        block ;; label = @1
          local.get 0
          br_if 0 (;@1;)
          memory.size
          i32.const 16
          i32.shl
          return
        end
        block ;; label = @1
          local.get 0
          i32.const 65535
          i32.and
          br_if 0 (;@1;)
          local.get 0
          i32.const -1
          i32.le_s
          br_if 0 (;@1;)
          block ;; label = @2
            local.get 0
            i32.const 16
            i32.shr_u
            memory.grow
            local.tee 0
            i32.const -1
            i32.ne
            br_if 0 (;@2;)
            global.get $GOT.data.internal.errno
            i32.const 48
            i32.store
            i32.const -1
            return
          end
          local.get 0
          i32.const 16
          i32.shl
          return
        end
        call $abort
        unreachable
      )
      (func $malloc (;16;) (type 4) (param i32) (result i32)
        local.get 0
        call $dlmalloc
      )
      (func $dlmalloc (;17;) (type 4) (param i32) (result i32)
        (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
        global.get $__stack_pointer
        i32.const 16
        i32.sub
        local.tee 1
        global.set $__stack_pointer
        block ;; label = @1
          block ;; label = @2
            block ;; label = @3
              block ;; label = @4
                block ;; label = @5
                  block ;; label = @6
                    block ;; label = @7
                      block ;; label = @8
                        block ;; label = @9
                          block ;; label = @10
                            block ;; label = @11
                              block ;; label = @12
                                block ;; label = @13
                                  global.get $GOT.data.internal.__memory_base
                                  i32.const 1048720
                                  i32.add
                                  i32.load offset=24
                                  local.tee 2
                                  br_if 0 (;@13;)
                                  block ;; label = @14
                                    global.get $GOT.data.internal.__memory_base
                                    i32.const 1049192
                                    i32.add
                                    i32.load
                                    local.tee 3
                                    br_if 0 (;@14;)
                                    global.get $GOT.data.internal.__memory_base
                                    local.tee 4
                                    i32.const 1049192
                                    i32.add
                                    local.tee 5
                                    i32.const 0
                                    i32.store offset=20
                                    local.get 5
                                    i64.const -1
                                    i64.store offset=12 align=4
                                    local.get 5
                                    i64.const 281474976776192
                                    i64.store offset=4 align=4
                                    local.get 4
                                    i32.const 1048720
                                    i32.add
                                    i32.const 0
                                    i32.store offset=444
                                    local.get 5
                                    local.get 1
                                    i32.const 8
                                    i32.add
                                    i32.const -16
                                    i32.and
                                    i32.const 1431655768
                                    i32.xor
                                    local.tee 3
                                    i32.store
                                  end
                                  global.get $GOT.data.internal.__heap_base
                                  local.set 5
                                  global.get $GOT.data.internal.__heap_end
                                  local.get 5
                                  i32.lt_u
                                  br_if 1 (;@12;)
                                  global.get $GOT.data.internal.__heap_base
                                  local.set 5
                                  i32.const 0
                                  local.set 2
                                  global.get $GOT.data.internal.__heap_end
                                  local.get 5
                                  i32.sub
                                  i32.const 89
                                  i32.lt_u
                                  br_if 0 (;@13;)
                                  global.get $GOT.data.internal.__heap_base
                                  local.set 4
                                  global.get $GOT.data.internal.__heap_end
                                  local.set 6
                                  global.get $GOT.data.internal.__memory_base
                                  i32.const 1048720
                                  i32.add
                                  local.tee 5
                                  local.get 6
                                  local.get 4
                                  i32.sub
                                  local.tee 6
                                  i32.store offset=452
                                  local.get 5
                                  local.get 4
                                  i32.store offset=448
                                  local.get 5
                                  local.get 4
                                  i32.store offset=16
                                  local.get 5
                                  local.get 6
                                  i32.store offset=436
                                  local.get 5
                                  local.get 6
                                  i32.store offset=432
                                  local.get 5
                                  local.get 3
                                  i32.store offset=36
                                  local.get 5
                                  i32.const -1
                                  i32.store offset=32
                                  i32.const -256
                                  local.set 4
                                  loop ;; label = @14
                                    global.get $GOT.data.internal.__memory_base
                                    i32.const 1048720
                                    i32.add
                                    local.get 4
                                    i32.add
                                    local.tee 5
                                    i32.const 316
                                    i32.add
                                    local.get 5
                                    i32.const 304
                                    i32.add
                                    local.tee 3
                                    i32.store
                                    local.get 3
                                    local.get 5
                                    i32.const 296
                                    i32.add
                                    local.tee 6
                                    i32.store
                                    local.get 5
                                    i32.const 308
                                    i32.add
                                    local.get 6
                                    i32.store
                                    local.get 5
                                    i32.const 324
                                    i32.add
                                    local.get 5
                                    i32.const 312
                                    i32.add
                                    local.tee 6
                                    i32.store
                                    local.get 6
                                    local.get 3
                                    i32.store
                                    local.get 5
                                    i32.const 332
                                    i32.add
                                    local.get 5
                                    i32.const 320
                                    i32.add
                                    local.tee 3
                                    i32.store
                                    local.get 3
                                    local.get 6
                                    i32.store
                                    local.get 5
                                    i32.const 328
                                    i32.add
                                    local.get 3
                                    i32.store
                                    local.get 4
                                    i32.const 32
                                    i32.add
                                    local.tee 4
                                    br_if 0 (;@14;)
                                  end
                                  global.get $GOT.data.internal.__heap_end
                                  local.tee 3
                                  i32.const -52
                                  i32.add
                                  i32.const 56
                                  i32.store
                                  global.get $GOT.data.internal.__memory_base
                                  local.tee 4
                                  i32.const 1048720
                                  i32.add
                                  local.tee 5
                                  local.get 4
                                  i32.const 1049192
                                  i32.add
                                  i32.load offset=16
                                  i32.store offset=28
                                  local.get 5
                                  global.get $GOT.data.internal.__heap_base
                                  local.tee 4
                                  i32.const -8
                                  local.get 4
                                  i32.sub
                                  i32.const 15
                                  i32.and
                                  local.tee 6
                                  i32.add
                                  local.tee 2
                                  i32.store offset=24
                                  local.get 5
                                  local.get 3
                                  local.get 4
                                  i32.sub
                                  local.get 6
                                  i32.sub
                                  i32.const -56
                                  i32.add
                                  local.tee 4
                                  i32.store offset=12
                                  local.get 2
                                  local.get 4
                                  i32.const 1
                                  i32.or
                                  i32.store offset=4
                                end
                                block ;; label = @13
                                  block ;; label = @14
                                    local.get 0
                                    i32.const 236
                                    i32.gt_u
                                    br_if 0 (;@14;)
                                    block ;; label = @15
                                      global.get $GOT.data.internal.__memory_base
                                      i32.const 1048720
                                      i32.add
                                      i32.load
                                      local.tee 7
                                      i32.const 16
                                      local.get 0
                                      i32.const 19
                                      i32.add
                                      i32.const 496
                                      i32.and
                                      local.get 0
                                      i32.const 11
                                      i32.lt_u
                                      select
                                      local.tee 3
                                      i32.const 3
                                      i32.shr_u
                                      local.tee 4
                                      i32.shr_u
                                      local.tee 5
                                      i32.const 3
                                      i32.and
                                      i32.eqz
                                      br_if 0 (;@15;)
                                      block ;; label = @16
                                        block ;; label = @17
                                          global.get $GOT.data.internal.__memory_base
                                          i32.const 1048720
                                          i32.add
                                          local.get 5
                                          i32.const 1
                                          i32.and
                                          local.get 4
                                          i32.or
                                          i32.const 1
                                          i32.xor
                                          local.tee 0
                                          i32.const 3
                                          i32.shl
                                          local.tee 3
                                          i32.add
                                          local.tee 4
                                          i32.const 40
                                          i32.add
                                          local.tee 5
                                          local.get 4
                                          i32.load offset=48
                                          local.tee 4
                                          i32.load offset=8
                                          local.tee 6
                                          i32.ne
                                          br_if 0 (;@17;)
                                          global.get $GOT.data.internal.__memory_base
                                          i32.const 1048720
                                          i32.add
                                          local.get 7
                                          i32.const -2
                                          local.get 0
                                          i32.rotl
                                          i32.and
                                          i32.store
                                          br 1 (;@16;)
                                        end
                                        local.get 5
                                        local.get 6
                                        i32.store offset=8
                                        local.get 6
                                        local.get 5
                                        i32.store offset=12
                                      end
                                      local.get 4
                                      i32.const 8
                                      i32.add
                                      local.set 5
                                      local.get 4
                                      local.get 3
                                      i32.const 3
                                      i32.or
                                      i32.store offset=4
                                      local.get 4
                                      local.get 3
                                      i32.add
                                      local.tee 4
                                      local.get 4
                                      i32.load offset=4
                                      i32.const 1
                                      i32.or
                                      i32.store offset=4
                                      br 14 (;@1;)
                                    end
                                    local.get 3
                                    global.get $GOT.data.internal.__memory_base
                                    i32.const 1048720
                                    i32.add
                                    i32.load offset=8
                                    local.tee 8
                                    i32.le_u
                                    br_if 1 (;@13;)
                                    block ;; label = @15
                                      local.get 5
                                      i32.eqz
                                      br_if 0 (;@15;)
                                      block ;; label = @16
                                        block ;; label = @17
                                          global.get $GOT.data.internal.__memory_base
                                          i32.const 1048720
                                          i32.add
                                          local.get 5
                                          local.get 4
                                          i32.shl
                                          i32.const 2
                                          local.get 4
                                          i32.shl
                                          local.tee 5
                                          i32.const 0
                                          local.get 5
                                          i32.sub
                                          i32.or
                                          i32.and
                                          i32.ctz
                                          local.tee 9
                                          i32.const 3
                                          i32.shl
                                          local.tee 4
                                          i32.add
                                          local.tee 5
                                          i32.const 40
                                          i32.add
                                          local.tee 6
                                          local.get 5
                                          i32.load offset=48
                                          local.tee 5
                                          i32.load offset=8
                                          local.tee 0
                                          i32.ne
                                          br_if 0 (;@17;)
                                          global.get $GOT.data.internal.__memory_base
                                          i32.const 1048720
                                          i32.add
                                          local.get 7
                                          i32.const -2
                                          local.get 9
                                          i32.rotl
                                          i32.and
                                          local.tee 7
                                          i32.store
                                          br 1 (;@16;)
                                        end
                                        local.get 6
                                        local.get 0
                                        i32.store offset=8
                                        local.get 0
                                        local.get 6
                                        i32.store offset=12
                                      end
                                      local.get 5
                                      local.get 3
                                      i32.const 3
                                      i32.or
                                      i32.store offset=4
                                      local.get 5
                                      local.get 4
                                      i32.add
                                      local.get 4
                                      local.get 3
                                      i32.sub
                                      local.tee 6
                                      i32.store
                                      local.get 5
                                      local.get 3
                                      i32.add
                                      local.tee 0
                                      local.get 6
                                      i32.const 1
                                      i32.or
                                      i32.store offset=4
                                      block ;; label = @16
                                        local.get 8
                                        i32.eqz
                                        br_if 0 (;@16;)
                                        global.get $GOT.data.internal.__memory_base
                                        i32.const 1048720
                                        i32.add
                                        local.tee 4
                                        local.get 8
                                        i32.const -8
                                        i32.and
                                        i32.add
                                        i32.const 40
                                        i32.add
                                        local.set 3
                                        local.get 4
                                        i32.load offset=20
                                        local.set 4
                                        block ;; label = @17
                                          block ;; label = @18
                                            local.get 7
                                            i32.const 1
                                            local.get 8
                                            i32.const 3
                                            i32.shr_u
                                            i32.shl
                                            local.tee 9
                                            i32.and
                                            br_if 0 (;@18;)
                                            global.get $GOT.data.internal.__memory_base
                                            i32.const 1048720
                                            i32.add
                                            local.get 7
                                            local.get 9
                                            i32.or
                                            i32.store
                                            local.get 3
                                            local.set 9
                                            br 1 (;@17;)
                                          end
                                          local.get 3
                                          i32.load offset=8
                                          local.set 9
                                        end
                                        local.get 9
                                        local.get 4
                                        i32.store offset=12
                                        local.get 3
                                        local.get 4
                                        i32.store offset=8
                                        local.get 4
                                        local.get 3
                                        i32.store offset=12
                                        local.get 4
                                        local.get 9
                                        i32.store offset=8
                                      end
                                      local.get 5
                                      i32.const 8
                                      i32.add
                                      local.set 5
                                      global.get $GOT.data.internal.__memory_base
                                      i32.const 1048720
                                      i32.add
                                      local.tee 4
                                      local.get 0
                                      i32.store offset=20
                                      local.get 4
                                      local.get 6
                                      i32.store offset=8
                                      br 14 (;@1;)
                                    end
                                    global.get $GOT.data.internal.__memory_base
                                    i32.const 1048720
                                    i32.add
                                    i32.load offset=4
                                    local.tee 10
                                    i32.eqz
                                    br_if 1 (;@13;)
                                    global.get $GOT.data.internal.__memory_base
                                    i32.const 1048720
                                    i32.add
                                    local.get 10
                                    i32.ctz
                                    i32.const 2
                                    i32.shl
                                    i32.add
                                    i32.load offset=304
                                    local.tee 6
                                    i32.load offset=4
                                    i32.const -8
                                    i32.and
                                    local.get 3
                                    i32.sub
                                    local.set 4
                                    local.get 6
                                    local.set 0
                                    block ;; label = @15
                                      loop ;; label = @16
                                        block ;; label = @17
                                          local.get 6
                                          i32.load offset=16
                                          local.tee 5
                                          br_if 0 (;@17;)
                                          local.get 6
                                          i32.load offset=20
                                          local.tee 5
                                          i32.eqz
                                          br_if 2 (;@15;)
                                        end
                                        local.get 5
                                        i32.load offset=4
                                        i32.const -8
                                        i32.and
                                        local.get 3
                                        i32.sub
                                        local.tee 6
                                        local.get 4
                                        local.get 6
                                        local.get 4
                                        i32.lt_u
                                        local.tee 6
                                        select
                                        local.set 4
                                        local.get 5
                                        local.get 0
                                        local.get 6
                                        select
                                        local.set 0
                                        local.get 5
                                        local.set 6
                                        br 0 (;@16;)
                                      end
                                    end
                                    local.get 0
                                    i32.load offset=24
                                    local.set 2
                                    block ;; label = @15
                                      local.get 0
                                      i32.load offset=12
                                      local.tee 5
                                      local.get 0
                                      i32.eq
                                      br_if 0 (;@15;)
                                      local.get 0
                                      i32.load offset=8
                                      local.tee 6
                                      local.get 5
                                      i32.store offset=12
                                      local.get 5
                                      local.get 6
                                      i32.store offset=8
                                      br 13 (;@2;)
                                    end
                                    block ;; label = @15
                                      block ;; label = @16
                                        local.get 0
                                        i32.load offset=20
                                        local.tee 6
                                        i32.eqz
                                        br_if 0 (;@16;)
                                        local.get 0
                                        i32.const 20
                                        i32.add
                                        local.set 9
                                        br 1 (;@15;)
                                      end
                                      local.get 0
                                      i32.load offset=16
                                      local.tee 6
                                      i32.eqz
                                      br_if 4 (;@11;)
                                      local.get 0
                                      i32.const 16
                                      i32.add
                                      local.set 9
                                    end
                                    loop ;; label = @15
                                      local.get 9
                                      local.set 11
                                      local.get 6
                                      local.tee 5
                                      i32.const 20
                                      i32.add
                                      local.set 9
                                      local.get 5
                                      i32.load offset=20
                                      local.tee 6
                                      br_if 0 (;@15;)
                                      local.get 5
                                      i32.const 16
                                      i32.add
                                      local.set 9
                                      local.get 5
                                      i32.load offset=16
                                      local.tee 6
                                      br_if 0 (;@15;)
                                    end
                                    local.get 11
                                    i32.const 0
                                    i32.store
                                    br 12 (;@2;)
                                  end
                                  i32.const -1
                                  local.set 3
                                  local.get 0
                                  i32.const -65
                                  i32.gt_u
                                  br_if 0 (;@13;)
                                  local.get 0
                                  i32.const 19
                                  i32.add
                                  local.tee 4
                                  i32.const -16
                                  i32.and
                                  local.set 3
                                  global.get $GOT.data.internal.__memory_base
                                  i32.const 1048720
                                  i32.add
                                  i32.load offset=4
                                  local.tee 10
                                  i32.eqz
                                  br_if 0 (;@13;)
                                  i32.const 0
                                  local.set 5
                                  i32.const 31
                                  local.set 8
                                  block ;; label = @14
                                    local.get 0
                                    i32.const 16777196
                                    i32.gt_u
                                    br_if 0 (;@14;)
                                    local.get 3
                                    i32.const 38
                                    local.get 4
                                    i32.const 8
                                    i32.shr_u
                                    i32.clz
                                    local.tee 4
                                    i32.sub
                                    i32.shr_u
                                    i32.const 1
                                    i32.and
                                    local.get 4
                                    i32.const 1
                                    i32.shl
                                    i32.sub
                                    i32.const 62
                                    i32.add
                                    local.set 8
                                  end
                                  i32.const 0
                                  local.get 3
                                  i32.sub
                                  local.set 4
                                  block ;; label = @14
                                    block ;; label = @15
                                      block ;; label = @16
                                        block ;; label = @17
                                          global.get $GOT.data.internal.__memory_base
                                          i32.const 1048720
                                          i32.add
                                          local.get 8
                                          i32.const 2
                                          i32.shl
                                          i32.add
                                          i32.load offset=304
                                          local.tee 6
                                          br_if 0 (;@17;)
                                          i32.const 0
                                          local.set 9
                                          br 1 (;@16;)
                                        end
                                        i32.const 0
                                        local.set 5
                                        local.get 3
                                        i32.const 0
                                        i32.const 25
                                        local.get 8
                                        i32.const 1
                                        i32.shr_u
                                        i32.sub
                                        local.get 8
                                        i32.const 31
                                        i32.eq
                                        select
                                        i32.shl
                                        local.set 0
                                        i32.const 0
                                        local.set 9
                                        loop ;; label = @17
                                          block ;; label = @18
                                            local.get 6
                                            i32.load offset=4
                                            i32.const -8
                                            i32.and
                                            local.get 3
                                            i32.sub
                                            local.tee 7
                                            local.get 4
                                            i32.ge_u
                                            br_if 0 (;@18;)
                                            local.get 7
                                            local.set 4
                                            local.get 6
                                            local.set 9
                                            local.get 7
                                            br_if 0 (;@18;)
                                            i32.const 0
                                            local.set 4
                                            local.get 6
                                            local.set 9
                                            local.get 6
                                            local.set 5
                                            br 3 (;@15;)
                                          end
                                          local.get 5
                                          local.get 6
                                          i32.load offset=20
                                          local.tee 7
                                          local.get 7
                                          local.get 6
                                          local.get 0
                                          i32.const 29
                                          i32.shr_u
                                          i32.const 4
                                          i32.and
                                          i32.add
                                          i32.load offset=16
                                          local.tee 11
                                          i32.eq
                                          select
                                          local.get 5
                                          local.get 7
                                          select
                                          local.set 5
                                          local.get 0
                                          i32.const 1
                                          i32.shl
                                          local.set 0
                                          local.get 11
                                          local.set 6
                                          local.get 11
                                          br_if 0 (;@17;)
                                        end
                                      end
                                      block ;; label = @16
                                        local.get 5
                                        local.get 9
                                        i32.or
                                        br_if 0 (;@16;)
                                        i32.const 0
                                        local.set 9
                                        i32.const 2
                                        local.get 8
                                        i32.shl
                                        local.tee 5
                                        i32.const 0
                                        local.get 5
                                        i32.sub
                                        i32.or
                                        local.get 10
                                        i32.and
                                        local.tee 5
                                        i32.eqz
                                        br_if 3 (;@13;)
                                        global.get $GOT.data.internal.__memory_base
                                        i32.const 1048720
                                        i32.add
                                        local.get 5
                                        i32.ctz
                                        i32.const 2
                                        i32.shl
                                        i32.add
                                        i32.load offset=304
                                        local.set 5
                                      end
                                      local.get 5
                                      i32.eqz
                                      br_if 1 (;@14;)
                                    end
                                    loop ;; label = @15
                                      local.get 5
                                      i32.load offset=4
                                      i32.const -8
                                      i32.and
                                      local.get 3
                                      i32.sub
                                      local.tee 7
                                      local.get 4
                                      i32.lt_u
                                      local.set 0
                                      block ;; label = @16
                                        local.get 5
                                        i32.load offset=16
                                        local.tee 6
                                        br_if 0 (;@16;)
                                        local.get 5
                                        i32.load offset=20
                                        local.set 6
                                      end
                                      local.get 7
                                      local.get 4
                                      local.get 0
                                      select
                                      local.set 4
                                      local.get 5
                                      local.get 9
                                      local.get 0
                                      select
                                      local.set 9
                                      local.get 6
                                      local.set 5
                                      local.get 6
                                      br_if 0 (;@15;)
                                    end
                                  end
                                  local.get 9
                                  i32.eqz
                                  br_if 0 (;@13;)
                                  local.get 4
                                  global.get $GOT.data.internal.__memory_base
                                  i32.const 1048720
                                  i32.add
                                  i32.load offset=8
                                  local.get 3
                                  i32.sub
                                  i32.ge_u
                                  br_if 0 (;@13;)
                                  local.get 9
                                  i32.load offset=24
                                  local.set 11
                                  block ;; label = @14
                                    local.get 9
                                    i32.load offset=12
                                    local.tee 5
                                    local.get 9
                                    i32.eq
                                    br_if 0 (;@14;)
                                    local.get 9
                                    i32.load offset=8
                                    local.tee 6
                                    local.get 5
                                    i32.store offset=12
                                    local.get 5
                                    local.get 6
                                    i32.store offset=8
                                    br 11 (;@3;)
                                  end
                                  block ;; label = @14
                                    block ;; label = @15
                                      local.get 9
                                      i32.load offset=20
                                      local.tee 6
                                      i32.eqz
                                      br_if 0 (;@15;)
                                      local.get 9
                                      i32.const 20
                                      i32.add
                                      local.set 0
                                      br 1 (;@14;)
                                    end
                                    local.get 9
                                    i32.load offset=16
                                    local.tee 6
                                    i32.eqz
                                    br_if 4 (;@10;)
                                    local.get 9
                                    i32.const 16
                                    i32.add
                                    local.set 0
                                  end
                                  loop ;; label = @14
                                    local.get 0
                                    local.set 7
                                    local.get 6
                                    local.tee 5
                                    i32.const 20
                                    i32.add
                                    local.set 0
                                    local.get 5
                                    i32.load offset=20
                                    local.tee 6
                                    br_if 0 (;@14;)
                                    local.get 5
                                    i32.const 16
                                    i32.add
                                    local.set 0
                                    local.get 5
                                    i32.load offset=16
                                    local.tee 6
                                    br_if 0 (;@14;)
                                  end
                                  local.get 7
                                  i32.const 0
                                  i32.store
                                  br 10 (;@3;)
                                end
                                block ;; label = @13
                                  global.get $GOT.data.internal.__memory_base
                                  i32.const 1048720
                                  i32.add
                                  i32.load offset=8
                                  local.tee 5
                                  local.get 3
                                  i32.lt_u
                                  br_if 0 (;@13;)
                                  global.get $GOT.data.internal.__memory_base
                                  i32.const 1048720
                                  i32.add
                                  i32.load offset=20
                                  local.set 4
                                  block ;; label = @14
                                    block ;; label = @15
                                      local.get 5
                                      local.get 3
                                      i32.sub
                                      local.tee 6
                                      i32.const 16
                                      i32.lt_u
                                      br_if 0 (;@15;)
                                      local.get 4
                                      local.get 3
                                      i32.add
                                      local.tee 0
                                      local.get 6
                                      i32.const 1
                                      i32.or
                                      i32.store offset=4
                                      local.get 4
                                      local.get 5
                                      i32.add
                                      local.get 6
                                      i32.store
                                      local.get 4
                                      local.get 3
                                      i32.const 3
                                      i32.or
                                      i32.store offset=4
                                      br 1 (;@14;)
                                    end
                                    local.get 4
                                    local.get 5
                                    i32.const 3
                                    i32.or
                                    i32.store offset=4
                                    local.get 4
                                    local.get 5
                                    i32.add
                                    local.tee 5
                                    local.get 5
                                    i32.load offset=4
                                    i32.const 1
                                    i32.or
                                    i32.store offset=4
                                    i32.const 0
                                    local.set 6
                                    i32.const 0
                                    local.set 0
                                  end
                                  global.get $GOT.data.internal.__memory_base
                                  i32.const 1048720
                                  i32.add
                                  local.tee 5
                                  local.get 6
                                  i32.store offset=8
                                  local.get 5
                                  local.get 0
                                  i32.store offset=20
                                  local.get 4
                                  i32.const 8
                                  i32.add
                                  local.set 5
                                  br 12 (;@1;)
                                end
                                block ;; label = @13
                                  global.get $GOT.data.internal.__memory_base
                                  i32.const 1048720
                                  i32.add
                                  i32.load offset=12
                                  local.tee 0
                                  local.get 3
                                  i32.le_u
                                  br_if 0 (;@13;)
                                  local.get 2
                                  local.get 3
                                  i32.add
                                  local.tee 5
                                  local.get 0
                                  local.get 3
                                  i32.sub
                                  local.tee 4
                                  i32.const 1
                                  i32.or
                                  i32.store offset=4
                                  global.get $GOT.data.internal.__memory_base
                                  i32.const 1048720
                                  i32.add
                                  local.tee 6
                                  local.get 5
                                  i32.store offset=24
                                  local.get 6
                                  local.get 4
                                  i32.store offset=12
                                  local.get 2
                                  local.get 3
                                  i32.const 3
                                  i32.or
                                  i32.store offset=4
                                  local.get 2
                                  i32.const 8
                                  i32.add
                                  local.set 5
                                  br 12 (;@1;)
                                end
                                block ;; label = @13
                                  block ;; label = @14
                                    global.get $GOT.data.internal.__memory_base
                                    i32.const 1049192
                                    i32.add
                                    i32.load
                                    i32.eqz
                                    br_if 0 (;@14;)
                                    global.get $GOT.data.internal.__memory_base
                                    i32.const 1049192
                                    i32.add
                                    i32.load offset=8
                                    local.set 4
                                    br 1 (;@13;)
                                  end
                                  global.get $GOT.data.internal.__memory_base
                                  local.tee 4
                                  i32.const 1049192
                                  i32.add
                                  local.tee 5
                                  i32.const 0
                                  i32.store offset=20
                                  local.get 5
                                  i64.const -1
                                  i64.store offset=12 align=4
                                  local.get 5
                                  i64.const 281474976776192
                                  i64.store offset=4 align=4
                                  local.get 4
                                  i32.const 1048720
                                  i32.add
                                  i32.const 0
                                  i32.store offset=444
                                  local.get 5
                                  local.get 1
                                  i32.const 12
                                  i32.add
                                  i32.const -16
                                  i32.and
                                  i32.const 1431655768
                                  i32.xor
                                  i32.store
                                  i32.const 65536
                                  local.set 4
                                end
                                i32.const 0
                                local.set 5
                                block ;; label = @13
                                  local.get 4
                                  local.get 3
                                  i32.const 71
                                  i32.add
                                  local.tee 8
                                  i32.add
                                  local.tee 7
                                  i32.const 0
                                  local.get 4
                                  i32.sub
                                  local.tee 11
                                  i32.and
                                  local.tee 9
                                  local.get 3
                                  i32.gt_u
                                  br_if 0 (;@13;)
                                  global.get $GOT.data.internal.errno
                                  i32.const 48
                                  i32.store
                                  br 12 (;@1;)
                                end
                                block ;; label = @13
                                  global.get $GOT.data.internal.__memory_base
                                  i32.const 1048720
                                  i32.add
                                  i32.load offset=440
                                  local.tee 4
                                  i32.eqz
                                  br_if 0 (;@13;)
                                  block ;; label = @14
                                    global.get $GOT.data.internal.__memory_base
                                    i32.const 1048720
                                    i32.add
                                    i32.load offset=432
                                    local.tee 6
                                    local.get 9
                                    i32.add
                                    local.tee 10
                                    local.get 6
                                    i32.le_u
                                    br_if 0 (;@14;)
                                    local.get 10
                                    local.get 4
                                    i32.le_u
                                    br_if 1 (;@13;)
                                  end
                                  global.get $GOT.data.internal.errno
                                  i32.const 48
                                  i32.store
                                  br 12 (;@1;)
                                end
                                global.get $GOT.data.internal.__memory_base
                                i32.const 1048720
                                i32.add
                                i32.load8_u offset=444
                                i32.const 4
                                i32.and
                                br_if 5 (;@7;)
                                block ;; label = @13
                                  block ;; label = @14
                                    block ;; label = @15
                                      local.get 2
                                      i32.eqz
                                      br_if 0 (;@15;)
                                      global.get $GOT.data.internal.__memory_base
                                      i32.const 1048720
                                      i32.add
                                      i32.const 448
                                      i32.add
                                      local.set 4
                                      loop ;; label = @16
                                        block ;; label = @17
                                          local.get 2
                                          local.get 4
                                          i32.load
                                          local.tee 6
                                          i32.lt_u
                                          br_if 0 (;@17;)
                                          local.get 2
                                          local.get 6
                                          local.get 4
                                          i32.load offset=4
                                          i32.add
                                          i32.lt_u
                                          br_if 3 (;@14;)
                                        end
                                        local.get 4
                                        i32.load offset=8
                                        local.tee 4
                                        br_if 0 (;@16;)
                                      end
                                    end
                                    i32.const 0
                                    call $sbrk
                                    local.tee 7
                                    i32.const -1
                                    i32.eq
                                    br_if 6 (;@8;)
                                    local.get 9
                                    local.set 11
                                    block ;; label = @15
                                      global.get $GOT.data.internal.__memory_base
                                      i32.const 1049192
                                      i32.add
                                      i32.load offset=4
                                      local.tee 4
                                      i32.const -1
                                      i32.add
                                      local.tee 6
                                      local.get 7
                                      i32.and
                                      i32.eqz
                                      br_if 0 (;@15;)
                                      local.get 9
                                      local.get 7
                                      i32.sub
                                      local.get 6
                                      local.get 7
                                      i32.add
                                      i32.const 0
                                      local.get 4
                                      i32.sub
                                      i32.and
                                      i32.add
                                      local.set 11
                                    end
                                    global.get $GOT.data.internal.__memory_base
                                    local.set 4
                                    local.get 11
                                    local.get 3
                                    i32.le_u
                                    br_if 6 (;@8;)
                                    local.get 11
                                    i32.const 2147483646
                                    i32.gt_u
                                    br_if 6 (;@8;)
                                    local.get 4
                                    i32.const 1048720
                                    i32.add
                                    i32.load offset=432
                                    local.set 4
                                    block ;; label = @15
                                      global.get $GOT.data.internal.__memory_base
                                      i32.const 1048720
                                      i32.add
                                      i32.load offset=440
                                      local.tee 6
                                      i32.eqz
                                      br_if 0 (;@15;)
                                      local.get 4
                                      local.get 11
                                      i32.add
                                      local.tee 0
                                      local.get 4
                                      i32.le_u
                                      br_if 7 (;@8;)
                                      local.get 0
                                      local.get 6
                                      i32.gt_u
                                      br_if 7 (;@8;)
                                    end
                                    local.get 11
                                    call $sbrk
                                    local.tee 4
                                    local.get 7
                                    i32.ne
                                    br_if 1 (;@13;)
                                    br 8 (;@6;)
                                  end
                                  local.get 7
                                  local.get 0
                                  i32.sub
                                  local.get 11
                                  i32.and
                                  local.tee 11
                                  i32.const 2147483646
                                  i32.gt_u
                                  br_if 5 (;@8;)
                                  local.get 11
                                  call $sbrk
                                  local.tee 7
                                  local.get 4
                                  i32.load
                                  local.get 4
                                  i32.load offset=4
                                  i32.add
                                  i32.eq
                                  br_if 4 (;@9;)
                                  local.get 7
                                  local.set 4
                                end
                                block ;; label = @13
                                  local.get 11
                                  local.get 3
                                  i32.const 72
                                  i32.add
                                  i32.ge_u
                                  br_if 0 (;@13;)
                                  local.get 4
                                  i32.const -1
                                  i32.eq
                                  br_if 0 (;@13;)
                                  block ;; label = @14
                                    local.get 8
                                    local.get 11
                                    i32.sub
                                    global.get $GOT.data.internal.__memory_base
                                    i32.const 1049192
                                    i32.add
                                    i32.load offset=8
                                    local.tee 6
                                    i32.add
                                    i32.const 0
                                    local.get 6
                                    i32.sub
                                    i32.and
                                    local.tee 6
                                    i32.const 2147483646
                                    i32.le_u
                                    br_if 0 (;@14;)
                                    local.get 4
                                    local.set 7
                                    br 8 (;@6;)
                                  end
                                  block ;; label = @14
                                    local.get 6
                                    call $sbrk
                                    i32.const -1
                                    i32.eq
                                    br_if 0 (;@14;)
                                    local.get 6
                                    local.get 11
                                    i32.add
                                    local.set 11
                                    local.get 4
                                    local.set 7
                                    br 8 (;@6;)
                                  end
                                  i32.const 0
                                  local.get 11
                                  i32.sub
                                  call $sbrk
                                  drop
                                  br 5 (;@8;)
                                end
                                local.get 4
                                local.set 7
                                local.get 4
                                i32.const -1
                                i32.ne
                                br_if 6 (;@6;)
                                br 4 (;@8;)
                              end
                              unreachable
                            end
                            i32.const 0
                            local.set 5
                            br 8 (;@2;)
                          end
                          i32.const 0
                          local.set 5
                          br 6 (;@3;)
                        end
                        local.get 7
                        i32.const -1
                        i32.ne
                        br_if 2 (;@6;)
                      end
                      global.get $GOT.data.internal.__memory_base
                      i32.const 1048720
                      i32.add
                      local.tee 4
                      local.get 4
                      i32.load offset=444
                      i32.const 4
                      i32.or
                      i32.store offset=444
                    end
                    local.get 9
                    i32.const 2147483646
                    i32.gt_u
                    br_if 1 (;@5;)
                    local.get 9
                    call $sbrk
                    local.set 7
                    i32.const 0
                    call $sbrk
                    local.set 4
                    local.get 7
                    i32.const -1
                    i32.eq
                    br_if 1 (;@5;)
                    local.get 4
                    i32.const -1
                    i32.eq
                    br_if 1 (;@5;)
                    local.get 7
                    local.get 4
                    i32.ge_u
                    br_if 1 (;@5;)
                    local.get 4
                    local.get 7
                    i32.sub
                    local.tee 11
                    local.get 3
                    i32.const 56
                    i32.add
                    i32.le_u
                    br_if 1 (;@5;)
                  end
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1048720
                  i32.add
                  local.tee 4
                  local.get 4
                  i32.load offset=432
                  local.get 11
                  i32.add
                  local.tee 6
                  i32.store offset=432
                  block ;; label = @6
                    local.get 6
                    local.get 4
                    i32.load offset=436
                    i32.le_u
                    br_if 0 (;@6;)
                    global.get $GOT.data.internal.__memory_base
                    i32.const 1048720
                    i32.add
                    local.get 6
                    i32.store offset=436
                  end
                  block ;; label = @6
                    block ;; label = @7
                      block ;; label = @8
                        block ;; label = @9
                          global.get $GOT.data.internal.__memory_base
                          i32.const 1048720
                          i32.add
                          i32.load offset=24
                          local.tee 6
                          i32.eqz
                          br_if 0 (;@9;)
                          global.get $GOT.data.internal.__memory_base
                          i32.const 1048720
                          i32.add
                          i32.const 448
                          i32.add
                          local.set 4
                          loop ;; label = @10
                            local.get 7
                            local.get 4
                            i32.load
                            local.tee 0
                            local.get 4
                            i32.load offset=4
                            local.tee 9
                            i32.add
                            i32.eq
                            br_if 2 (;@8;)
                            local.get 4
                            i32.load offset=8
                            local.tee 4
                            br_if 0 (;@10;)
                            br 3 (;@7;)
                          end
                        end
                        block ;; label = @9
                          block ;; label = @10
                            global.get $GOT.data.internal.__memory_base
                            i32.const 1048720
                            i32.add
                            i32.load offset=16
                            local.tee 4
                            i32.eqz
                            br_if 0 (;@10;)
                            local.get 7
                            local.get 4
                            i32.ge_u
                            br_if 1 (;@9;)
                          end
                          global.get $GOT.data.internal.__memory_base
                          i32.const 1048720
                          i32.add
                          local.get 7
                          i32.store offset=16
                        end
                        global.get $GOT.data.internal.__memory_base
                        local.tee 6
                        i32.const 1048720
                        i32.add
                        local.tee 4
                        i32.const 0
                        i32.store offset=460
                        local.get 4
                        local.get 11
                        i32.store offset=452
                        local.get 4
                        local.get 7
                        i32.store offset=448
                        local.get 4
                        i32.const -1
                        i32.store offset=32
                        local.get 4
                        local.get 6
                        i32.const 1049192
                        i32.add
                        i32.load
                        i32.store offset=36
                        i32.const -256
                        local.set 6
                        loop ;; label = @9
                          global.get $GOT.data.internal.__memory_base
                          i32.const 1048720
                          i32.add
                          local.get 6
                          i32.add
                          local.tee 4
                          i32.const 316
                          i32.add
                          local.get 4
                          i32.const 304
                          i32.add
                          local.tee 0
                          i32.store
                          local.get 0
                          local.get 4
                          i32.const 296
                          i32.add
                          local.tee 9
                          i32.store
                          local.get 4
                          i32.const 308
                          i32.add
                          local.get 9
                          i32.store
                          local.get 4
                          i32.const 324
                          i32.add
                          local.get 4
                          i32.const 312
                          i32.add
                          local.tee 9
                          i32.store
                          local.get 9
                          local.get 0
                          i32.store
                          local.get 4
                          i32.const 332
                          i32.add
                          local.get 4
                          i32.const 320
                          i32.add
                          local.tee 0
                          i32.store
                          local.get 0
                          local.get 9
                          i32.store
                          local.get 4
                          i32.const 328
                          i32.add
                          local.get 0
                          i32.store
                          local.get 6
                          i32.const 32
                          i32.add
                          local.tee 6
                          br_if 0 (;@9;)
                        end
                        local.get 7
                        i32.const -8
                        local.get 7
                        i32.sub
                        i32.const 15
                        i32.and
                        local.tee 4
                        i32.add
                        local.tee 6
                        local.get 11
                        i32.const -56
                        i32.add
                        local.tee 0
                        local.get 4
                        i32.sub
                        local.tee 9
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        global.get $GOT.data.internal.__memory_base
                        local.tee 11
                        i32.const 1048720
                        i32.add
                        local.tee 4
                        local.get 11
                        i32.const 1049192
                        i32.add
                        i32.load offset=16
                        i32.store offset=28
                        local.get 4
                        local.get 9
                        i32.store offset=12
                        local.get 4
                        local.get 6
                        i32.store offset=24
                        local.get 7
                        local.get 0
                        i32.add
                        i32.const 56
                        i32.store offset=4
                        br 2 (;@6;)
                      end
                      local.get 6
                      local.get 7
                      i32.ge_u
                      br_if 0 (;@7;)
                      local.get 6
                      local.get 0
                      i32.lt_u
                      br_if 0 (;@7;)
                      local.get 4
                      i32.load offset=12
                      i32.const 8
                      i32.and
                      br_if 0 (;@7;)
                      local.get 6
                      i32.const -8
                      local.get 6
                      i32.sub
                      i32.const 15
                      i32.and
                      local.tee 7
                      i32.add
                      local.tee 2
                      global.get $GOT.data.internal.__memory_base
                      local.tee 8
                      i32.const 1048720
                      i32.add
                      local.tee 0
                      i32.load offset=12
                      local.get 11
                      i32.add
                      local.tee 10
                      local.get 7
                      i32.sub
                      local.tee 7
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get 4
                      local.get 9
                      local.get 11
                      i32.add
                      i32.store offset=4
                      local.get 0
                      local.get 8
                      i32.const 1049192
                      i32.add
                      i32.load offset=16
                      i32.store offset=28
                      local.get 0
                      local.get 2
                      i32.store offset=24
                      local.get 0
                      local.get 7
                      i32.store offset=12
                      local.get 6
                      local.get 10
                      i32.add
                      i32.const 56
                      i32.store offset=4
                      br 1 (;@6;)
                    end
                    block ;; label = @7
                      local.get 7
                      global.get $GOT.data.internal.__memory_base
                      i32.const 1048720
                      i32.add
                      i32.load offset=16
                      i32.ge_u
                      br_if 0 (;@7;)
                      global.get $GOT.data.internal.__memory_base
                      i32.const 1048720
                      i32.add
                      local.get 7
                      i32.store offset=16
                    end
                    local.get 7
                    local.get 11
                    i32.add
                    local.set 0
                    global.get $GOT.data.internal.__memory_base
                    i32.const 1048720
                    i32.add
                    i32.const 448
                    i32.add
                    local.set 4
                    block ;; label = @7
                      block ;; label = @8
                        loop ;; label = @9
                          local.get 4
                          i32.load
                          local.tee 9
                          local.get 0
                          i32.eq
                          br_if 1 (;@8;)
                          local.get 4
                          i32.load offset=8
                          local.tee 4
                          br_if 0 (;@9;)
                          br 2 (;@7;)
                        end
                      end
                      local.get 4
                      i32.load8_u offset=12
                      i32.const 8
                      i32.and
                      i32.eqz
                      br_if 3 (;@4;)
                    end
                    global.get $GOT.data.internal.__memory_base
                    i32.const 1048720
                    i32.add
                    i32.const 448
                    i32.add
                    local.set 4
                    block ;; label = @7
                      loop ;; label = @8
                        block ;; label = @9
                          local.get 6
                          local.get 4
                          i32.load
                          local.tee 0
                          i32.lt_u
                          br_if 0 (;@9;)
                          local.get 6
                          local.get 0
                          local.get 4
                          i32.load offset=4
                          i32.add
                          local.tee 0
                          i32.lt_u
                          br_if 2 (;@7;)
                        end
                        local.get 4
                        i32.load offset=8
                        local.set 4
                        br 0 (;@8;)
                      end
                    end
                    local.get 7
                    i32.const -8
                    local.get 7
                    i32.sub
                    i32.const 15
                    i32.and
                    local.tee 4
                    i32.add
                    local.tee 2
                    local.get 11
                    i32.const -56
                    i32.add
                    local.tee 9
                    local.get 4
                    i32.sub
                    local.tee 8
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    local.get 7
                    local.get 9
                    i32.add
                    i32.const 56
                    i32.store offset=4
                    local.get 6
                    local.get 0
                    i32.const 55
                    local.get 0
                    i32.sub
                    i32.const 15
                    i32.and
                    i32.add
                    i32.const -63
                    i32.add
                    local.tee 4
                    local.get 4
                    local.get 6
                    i32.const 16
                    i32.add
                    i32.lt_u
                    select
                    local.tee 9
                    i32.const 35
                    i32.store offset=4
                    global.get $GOT.data.internal.__memory_base
                    local.tee 10
                    i32.const 1048720
                    i32.add
                    local.tee 4
                    local.get 10
                    i32.const 1049192
                    i32.add
                    i32.load offset=16
                    i32.store offset=28
                    local.get 4
                    local.get 8
                    i32.store offset=12
                    local.get 4
                    local.get 2
                    i32.store offset=24
                    local.get 9
                    local.get 4
                    i64.load offset=456 align=4
                    i64.store offset=16 align=4
                    local.get 9
                    local.get 4
                    i64.load offset=448 align=4
                    i64.store offset=8 align=4
                    local.get 4
                    local.get 7
                    i32.store offset=448
                    local.get 4
                    i32.const 0
                    i32.store offset=460
                    local.get 4
                    local.get 9
                    i32.const 8
                    i32.add
                    i32.store offset=456
                    local.get 4
                    local.get 11
                    i32.store offset=452
                    local.get 9
                    i32.const 36
                    i32.add
                    local.set 4
                    loop ;; label = @7
                      local.get 4
                      i32.const 7
                      i32.store
                      local.get 4
                      i32.const 4
                      i32.add
                      local.tee 4
                      local.get 0
                      i32.lt_u
                      br_if 0 (;@7;)
                    end
                    local.get 9
                    local.get 6
                    i32.eq
                    br_if 0 (;@6;)
                    local.get 9
                    local.get 9
                    i32.load offset=4
                    i32.const -2
                    i32.and
                    i32.store offset=4
                    local.get 9
                    local.get 9
                    local.get 6
                    i32.sub
                    local.tee 7
                    i32.store
                    local.get 6
                    local.get 7
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    block ;; label = @7
                      block ;; label = @8
                        local.get 7
                        i32.const 255
                        i32.gt_u
                        br_if 0 (;@8;)
                        global.get $GOT.data.internal.__memory_base
                        i32.const 1048720
                        i32.add
                        local.tee 0
                        local.get 7
                        i32.const 248
                        i32.and
                        i32.add
                        i32.const 40
                        i32.add
                        local.set 4
                        block ;; label = @9
                          block ;; label = @10
                            local.get 0
                            i32.load
                            local.tee 0
                            i32.const 1
                            local.get 7
                            i32.const 3
                            i32.shr_u
                            i32.shl
                            local.tee 9
                            i32.and
                            br_if 0 (;@10;)
                            global.get $GOT.data.internal.__memory_base
                            i32.const 1048720
                            i32.add
                            local.get 0
                            local.get 9
                            i32.or
                            i32.store
                            local.get 4
                            local.set 0
                            br 1 (;@9;)
                          end
                          local.get 4
                          i32.load offset=8
                          local.set 0
                        end
                        local.get 0
                        local.get 6
                        i32.store offset=12
                        local.get 4
                        local.get 6
                        i32.store offset=8
                        i32.const 12
                        local.set 9
                        i32.const 8
                        local.set 7
                        br 1 (;@7;)
                      end
                      i32.const 31
                      local.set 4
                      block ;; label = @8
                        local.get 7
                        i32.const 16777215
                        i32.gt_u
                        br_if 0 (;@8;)
                        local.get 7
                        i32.const 38
                        local.get 7
                        i32.const 8
                        i32.shr_u
                        i32.clz
                        local.tee 4
                        i32.sub
                        i32.shr_u
                        i32.const 1
                        i32.and
                        local.get 4
                        i32.const 1
                        i32.shl
                        i32.or
                        i32.const 62
                        i32.xor
                        local.set 4
                      end
                      local.get 6
                      local.get 4
                      i32.store offset=28
                      local.get 6
                      i64.const 0
                      i64.store offset=16 align=4
                      global.get $GOT.data.internal.__memory_base
                      i32.const 1048720
                      i32.add
                      local.tee 9
                      local.get 4
                      i32.const 2
                      i32.shl
                      i32.add
                      i32.const 304
                      i32.add
                      local.set 0
                      block ;; label = @8
                        block ;; label = @9
                          block ;; label = @10
                            local.get 9
                            i32.load offset=4
                            local.tee 9
                            i32.const 1
                            local.get 4
                            i32.shl
                            local.tee 11
                            i32.and
                            br_if 0 (;@10;)
                            local.get 0
                            local.get 6
                            i32.store
                            global.get $GOT.data.internal.__memory_base
                            i32.const 1048720
                            i32.add
                            local.get 9
                            local.get 11
                            i32.or
                            i32.store offset=4
                            local.get 6
                            local.get 0
                            i32.store offset=24
                            br 1 (;@9;)
                          end
                          local.get 7
                          i32.const 0
                          i32.const 25
                          local.get 4
                          i32.const 1
                          i32.shr_u
                          i32.sub
                          local.get 4
                          i32.const 31
                          i32.eq
                          select
                          i32.shl
                          local.set 4
                          local.get 0
                          i32.load
                          local.set 9
                          loop ;; label = @10
                            local.get 9
                            local.tee 0
                            i32.load offset=4
                            i32.const -8
                            i32.and
                            local.get 7
                            i32.eq
                            br_if 2 (;@8;)
                            local.get 4
                            i32.const 29
                            i32.shr_u
                            local.set 9
                            local.get 4
                            i32.const 1
                            i32.shl
                            local.set 4
                            local.get 0
                            local.get 9
                            i32.const 4
                            i32.and
                            i32.add
                            local.tee 11
                            i32.load offset=16
                            local.tee 9
                            br_if 0 (;@10;)
                          end
                          local.get 11
                          i32.const 16
                          i32.add
                          local.get 6
                          i32.store
                          local.get 6
                          local.get 0
                          i32.store offset=24
                        end
                        i32.const 8
                        local.set 9
                        i32.const 12
                        local.set 7
                        local.get 6
                        local.set 0
                        local.get 6
                        local.set 4
                        br 1 (;@7;)
                      end
                      local.get 0
                      i32.load offset=8
                      local.set 4
                      local.get 0
                      local.get 6
                      i32.store offset=8
                      local.get 4
                      local.get 6
                      i32.store offset=12
                      local.get 6
                      local.get 4
                      i32.store offset=8
                      i32.const 0
                      local.set 4
                      i32.const 24
                      local.set 9
                      i32.const 12
                      local.set 7
                    end
                    local.get 6
                    local.get 7
                    i32.add
                    local.get 0
                    i32.store
                    local.get 6
                    local.get 9
                    i32.add
                    local.get 4
                    i32.store
                  end
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1048720
                  i32.add
                  i32.load offset=12
                  local.tee 4
                  local.get 3
                  i32.le_u
                  br_if 0 (;@5;)
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1048720
                  i32.add
                  local.tee 5
                  i32.load offset=24
                  local.tee 6
                  local.get 3
                  i32.add
                  local.tee 0
                  local.get 4
                  local.get 3
                  i32.sub
                  local.tee 4
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get 5
                  local.get 4
                  i32.store offset=12
                  local.get 5
                  local.get 0
                  i32.store offset=24
                  local.get 6
                  local.get 3
                  i32.const 3
                  i32.or
                  i32.store offset=4
                  local.get 6
                  i32.const 8
                  i32.add
                  local.set 5
                  br 4 (;@1;)
                end
                global.get $GOT.data.internal.errno
                i32.const 48
                i32.store
                br 3 (;@1;)
              end
              local.get 4
              local.get 7
              i32.store
              local.get 4
              local.get 4
              i32.load offset=4
              local.get 11
              i32.add
              i32.store offset=4
              local.get 7
              local.get 9
              local.get 3
              call $prepend_alloc
              local.set 5
              br 2 (;@1;)
            end
            block ;; label = @3
              local.get 11
              i32.eqz
              br_if 0 (;@3;)
              block ;; label = @4
                block ;; label = @5
                  local.get 9
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1048720
                  i32.add
                  local.get 9
                  i32.load offset=28
                  local.tee 0
                  i32.const 2
                  i32.shl
                  i32.add
                  local.tee 6
                  i32.load offset=304
                  i32.ne
                  br_if 0 (;@5;)
                  local.get 6
                  i32.const 304
                  i32.add
                  local.get 5
                  i32.store
                  local.get 5
                  br_if 1 (;@4;)
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1048720
                  i32.add
                  local.get 10
                  i32.const -2
                  local.get 0
                  i32.rotl
                  i32.and
                  local.tee 10
                  i32.store offset=4
                  br 2 (;@3;)
                end
                block ;; label = @5
                  block ;; label = @6
                    local.get 11
                    i32.load offset=16
                    local.get 9
                    i32.ne
                    br_if 0 (;@6;)
                    local.get 11
                    local.get 5
                    i32.store offset=16
                    br 1 (;@5;)
                  end
                  local.get 11
                  local.get 5
                  i32.store offset=20
                end
                local.get 5
                i32.eqz
                br_if 1 (;@3;)
              end
              local.get 5
              local.get 11
              i32.store offset=24
              block ;; label = @4
                local.get 9
                i32.load offset=16
                local.tee 6
                i32.eqz
                br_if 0 (;@4;)
                local.get 5
                local.get 6
                i32.store offset=16
                local.get 6
                local.get 5
                i32.store offset=24
              end
              local.get 9
              i32.load offset=20
              local.tee 6
              i32.eqz
              br_if 0 (;@3;)
              local.get 5
              local.get 6
              i32.store offset=20
              local.get 6
              local.get 5
              i32.store offset=24
            end
            block ;; label = @3
              block ;; label = @4
                local.get 4
                i32.const 15
                i32.gt_u
                br_if 0 (;@4;)
                local.get 9
                local.get 4
                local.get 3
                i32.or
                local.tee 5
                i32.const 3
                i32.or
                i32.store offset=4
                local.get 9
                local.get 5
                i32.add
                local.tee 5
                local.get 5
                i32.load offset=4
                i32.const 1
                i32.or
                i32.store offset=4
                br 1 (;@3;)
              end
              local.get 9
              local.get 3
              i32.add
              local.tee 0
              local.get 4
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 9
              local.get 3
              i32.const 3
              i32.or
              i32.store offset=4
              local.get 0
              local.get 4
              i32.add
              local.get 4
              i32.store
              block ;; label = @4
                local.get 4
                i32.const 255
                i32.gt_u
                br_if 0 (;@4;)
                global.get $GOT.data.internal.__memory_base
                i32.const 1048720
                i32.add
                local.tee 3
                local.get 4
                i32.const 248
                i32.and
                i32.add
                i32.const 40
                i32.add
                local.set 5
                block ;; label = @5
                  block ;; label = @6
                    local.get 3
                    i32.load
                    local.tee 3
                    i32.const 1
                    local.get 4
                    i32.const 3
                    i32.shr_u
                    i32.shl
                    local.tee 4
                    i32.and
                    br_if 0 (;@6;)
                    global.get $GOT.data.internal.__memory_base
                    i32.const 1048720
                    i32.add
                    local.get 3
                    local.get 4
                    i32.or
                    i32.store
                    local.get 5
                    local.set 4
                    br 1 (;@5;)
                  end
                  local.get 5
                  i32.load offset=8
                  local.set 4
                end
                local.get 4
                local.get 0
                i32.store offset=12
                local.get 5
                local.get 0
                i32.store offset=8
                local.get 0
                local.get 5
                i32.store offset=12
                local.get 0
                local.get 4
                i32.store offset=8
                br 1 (;@3;)
              end
              i32.const 31
              local.set 5
              block ;; label = @4
                local.get 4
                i32.const 16777215
                i32.gt_u
                br_if 0 (;@4;)
                local.get 4
                i32.const 38
                local.get 4
                i32.const 8
                i32.shr_u
                i32.clz
                local.tee 5
                i32.sub
                i32.shr_u
                i32.const 1
                i32.and
                local.get 5
                i32.const 1
                i32.shl
                i32.or
                i32.const 62
                i32.xor
                local.set 5
              end
              local.get 0
              local.get 5
              i32.store offset=28
              local.get 0
              i64.const 0
              i64.store offset=16 align=4
              global.get $GOT.data.internal.__memory_base
              i32.const 1048720
              i32.add
              local.get 5
              i32.const 2
              i32.shl
              i32.add
              i32.const 304
              i32.add
              local.set 3
              block ;; label = @4
                local.get 10
                i32.const 1
                local.get 5
                i32.shl
                local.tee 6
                i32.and
                br_if 0 (;@4;)
                local.get 3
                local.get 0
                i32.store
                global.get $GOT.data.internal.__memory_base
                i32.const 1048720
                i32.add
                local.get 10
                local.get 6
                i32.or
                i32.store offset=4
                local.get 0
                local.get 3
                i32.store offset=24
                local.get 0
                local.get 0
                i32.store offset=8
                local.get 0
                local.get 0
                i32.store offset=12
                br 1 (;@3;)
              end
              local.get 4
              i32.const 0
              i32.const 25
              local.get 5
              i32.const 1
              i32.shr_u
              i32.sub
              local.get 5
              i32.const 31
              i32.eq
              select
              i32.shl
              local.set 5
              local.get 3
              i32.load
              local.set 6
              block ;; label = @4
                loop ;; label = @5
                  local.get 6
                  local.tee 3
                  i32.load offset=4
                  i32.const -8
                  i32.and
                  local.get 4
                  i32.eq
                  br_if 1 (;@4;)
                  local.get 5
                  i32.const 29
                  i32.shr_u
                  local.set 6
                  local.get 5
                  i32.const 1
                  i32.shl
                  local.set 5
                  local.get 3
                  local.get 6
                  i32.const 4
                  i32.and
                  i32.add
                  local.tee 7
                  i32.load offset=16
                  local.tee 6
                  br_if 0 (;@5;)
                end
                local.get 7
                i32.const 16
                i32.add
                local.get 0
                i32.store
                local.get 0
                local.get 3
                i32.store offset=24
                local.get 0
                local.get 0
                i32.store offset=12
                local.get 0
                local.get 0
                i32.store offset=8
                br 1 (;@3;)
              end
              local.get 3
              i32.load offset=8
              local.tee 5
              local.get 0
              i32.store offset=12
              local.get 3
              local.get 0
              i32.store offset=8
              local.get 0
              i32.const 0
              i32.store offset=24
              local.get 0
              local.get 3
              i32.store offset=12
              local.get 0
              local.get 5
              i32.store offset=8
            end
            local.get 9
            i32.const 8
            i32.add
            local.set 5
            br 1 (;@1;)
          end
          block ;; label = @2
            local.get 2
            i32.eqz
            br_if 0 (;@2;)
            block ;; label = @3
              block ;; label = @4
                local.get 0
                global.get $GOT.data.internal.__memory_base
                i32.const 1048720
                i32.add
                local.get 0
                i32.load offset=28
                local.tee 9
                i32.const 2
                i32.shl
                i32.add
                local.tee 6
                i32.load offset=304
                i32.ne
                br_if 0 (;@4;)
                local.get 6
                i32.const 304
                i32.add
                local.get 5
                i32.store
                local.get 5
                br_if 1 (;@3;)
                global.get $GOT.data.internal.__memory_base
                i32.const 1048720
                i32.add
                local.get 10
                i32.const -2
                local.get 9
                i32.rotl
                i32.and
                i32.store offset=4
                br 2 (;@2;)
              end
              block ;; label = @4
                block ;; label = @5
                  local.get 2
                  i32.load offset=16
                  local.get 0
                  i32.ne
                  br_if 0 (;@5;)
                  local.get 2
                  local.get 5
                  i32.store offset=16
                  br 1 (;@4;)
                end
                local.get 2
                local.get 5
                i32.store offset=20
              end
              local.get 5
              i32.eqz
              br_if 1 (;@2;)
            end
            local.get 5
            local.get 2
            i32.store offset=24
            block ;; label = @3
              local.get 0
              i32.load offset=16
              local.tee 6
              i32.eqz
              br_if 0 (;@3;)
              local.get 5
              local.get 6
              i32.store offset=16
              local.get 6
              local.get 5
              i32.store offset=24
            end
            local.get 0
            i32.load offset=20
            local.tee 6
            i32.eqz
            br_if 0 (;@2;)
            local.get 5
            local.get 6
            i32.store offset=20
            local.get 6
            local.get 5
            i32.store offset=24
          end
          block ;; label = @2
            block ;; label = @3
              local.get 4
              i32.const 15
              i32.gt_u
              br_if 0 (;@3;)
              local.get 0
              local.get 4
              local.get 3
              i32.or
              local.tee 5
              i32.const 3
              i32.or
              i32.store offset=4
              local.get 0
              local.get 5
              i32.add
              local.tee 5
              local.get 5
              i32.load offset=4
              i32.const 1
              i32.or
              i32.store offset=4
              br 1 (;@2;)
            end
            local.get 0
            local.get 3
            i32.add
            local.tee 6
            local.get 4
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 0
            local.get 3
            i32.const 3
            i32.or
            i32.store offset=4
            local.get 6
            local.get 4
            i32.add
            local.get 4
            i32.store
            block ;; label = @3
              local.get 8
              i32.eqz
              br_if 0 (;@3;)
              global.get $GOT.data.internal.__memory_base
              i32.const 1048720
              i32.add
              local.tee 5
              local.get 8
              i32.const -8
              i32.and
              i32.add
              i32.const 40
              i32.add
              local.set 3
              local.get 5
              i32.load offset=20
              local.set 5
              block ;; label = @4
                block ;; label = @5
                  i32.const 1
                  local.get 8
                  i32.const 3
                  i32.shr_u
                  i32.shl
                  local.tee 9
                  local.get 7
                  i32.and
                  br_if 0 (;@5;)
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1048720
                  i32.add
                  local.get 9
                  local.get 7
                  i32.or
                  i32.store
                  local.get 3
                  local.set 9
                  br 1 (;@4;)
                end
                local.get 3
                i32.load offset=8
                local.set 9
              end
              local.get 9
              local.get 5
              i32.store offset=12
              local.get 3
              local.get 5
              i32.store offset=8
              local.get 5
              local.get 3
              i32.store offset=12
              local.get 5
              local.get 9
              i32.store offset=8
            end
            global.get $GOT.data.internal.__memory_base
            i32.const 1048720
            i32.add
            local.tee 5
            local.get 6
            i32.store offset=20
            local.get 5
            local.get 4
            i32.store offset=8
          end
          local.get 0
          i32.const 8
          i32.add
          local.set 5
        end
        local.get 1
        i32.const 16
        i32.add
        global.set $__stack_pointer
        local.get 5
      )
      (func $prepend_alloc (;18;) (type 2) (param i32 i32 i32) (result i32)
        (local i32 i32 i32 i32 i32 i32 i32)
        local.get 0
        i32.const -8
        local.get 0
        i32.sub
        i32.const 15
        i32.and
        i32.add
        local.tee 3
        local.get 2
        i32.const 3
        i32.or
        i32.store offset=4
        local.get 1
        i32.const -8
        local.get 1
        i32.sub
        i32.const 15
        i32.and
        i32.add
        local.tee 4
        local.get 3
        local.get 2
        i32.add
        local.tee 5
        i32.sub
        local.set 0
        block ;; label = @1
          block ;; label = @2
            local.get 4
            global.get $GOT.data.internal.__memory_base
            i32.const 1048720
            i32.add
            i32.load offset=24
            i32.ne
            br_if 0 (;@2;)
            global.get $GOT.data.internal.__memory_base
            i32.const 1048720
            i32.add
            local.tee 2
            local.get 5
            i32.store offset=24
            local.get 2
            local.get 2
            i32.load offset=12
            local.get 0
            i32.add
            local.tee 0
            i32.store offset=12
            local.get 5
            local.get 0
            i32.const 1
            i32.or
            i32.store offset=4
            br 1 (;@1;)
          end
          block ;; label = @2
            local.get 4
            global.get $GOT.data.internal.__memory_base
            i32.const 1048720
            i32.add
            i32.load offset=20
            i32.ne
            br_if 0 (;@2;)
            global.get $GOT.data.internal.__memory_base
            i32.const 1048720
            i32.add
            local.tee 1
            local.get 5
            i32.store offset=20
            local.get 1
            local.get 1
            i32.load offset=8
            local.get 0
            i32.add
            local.tee 2
            i32.store offset=8
            local.get 5
            local.get 2
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 5
            local.get 2
            i32.add
            local.get 2
            i32.store
            br 1 (;@1;)
          end
          block ;; label = @2
            local.get 4
            i32.load offset=4
            local.tee 1
            i32.const 3
            i32.and
            i32.const 1
            i32.ne
            br_if 0 (;@2;)
            local.get 1
            i32.const -8
            i32.and
            local.set 6
            local.get 4
            i32.load offset=12
            local.set 2
            block ;; label = @3
              block ;; label = @4
                local.get 1
                i32.const 255
                i32.gt_u
                br_if 0 (;@4;)
                block ;; label = @5
                  local.get 2
                  local.get 4
                  i32.load offset=8
                  local.tee 7
                  i32.ne
                  br_if 0 (;@5;)
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1048720
                  i32.add
                  local.tee 2
                  local.get 2
                  i32.load
                  i32.const -2
                  local.get 1
                  i32.const 3
                  i32.shr_u
                  i32.rotl
                  i32.and
                  i32.store
                  br 2 (;@3;)
                end
                local.get 2
                local.get 7
                i32.store offset=8
                local.get 7
                local.get 2
                i32.store offset=12
                br 1 (;@3;)
              end
              local.get 4
              i32.load offset=24
              local.set 8
              block ;; label = @4
                block ;; label = @5
                  local.get 2
                  local.get 4
                  i32.eq
                  br_if 0 (;@5;)
                  local.get 4
                  i32.load offset=8
                  local.tee 1
                  local.get 2
                  i32.store offset=12
                  local.get 2
                  local.get 1
                  i32.store offset=8
                  br 1 (;@4;)
                end
                block ;; label = @5
                  block ;; label = @6
                    block ;; label = @7
                      local.get 4
                      i32.load offset=20
                      local.tee 1
                      i32.eqz
                      br_if 0 (;@7;)
                      local.get 4
                      i32.const 20
                      i32.add
                      local.set 7
                      br 1 (;@6;)
                    end
                    local.get 4
                    i32.load offset=16
                    local.tee 1
                    i32.eqz
                    br_if 1 (;@5;)
                    local.get 4
                    i32.const 16
                    i32.add
                    local.set 7
                  end
                  loop ;; label = @6
                    local.get 7
                    local.set 9
                    local.get 1
                    local.tee 2
                    i32.const 20
                    i32.add
                    local.set 7
                    local.get 2
                    i32.load offset=20
                    local.tee 1
                    br_if 0 (;@6;)
                    local.get 2
                    i32.const 16
                    i32.add
                    local.set 7
                    local.get 2
                    i32.load offset=16
                    local.tee 1
                    br_if 0 (;@6;)
                  end
                  local.get 9
                  i32.const 0
                  i32.store
                  br 1 (;@4;)
                end
                i32.const 0
                local.set 2
              end
              local.get 8
              i32.eqz
              br_if 0 (;@3;)
              block ;; label = @4
                block ;; label = @5
                  local.get 4
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1048720
                  i32.add
                  local.get 4
                  i32.load offset=28
                  local.tee 7
                  i32.const 2
                  i32.shl
                  i32.add
                  local.tee 1
                  i32.load offset=304
                  i32.ne
                  br_if 0 (;@5;)
                  local.get 1
                  i32.const 304
                  i32.add
                  local.get 2
                  i32.store
                  local.get 2
                  br_if 1 (;@4;)
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1048720
                  i32.add
                  local.tee 2
                  local.get 2
                  i32.load offset=4
                  i32.const -2
                  local.get 7
                  i32.rotl
                  i32.and
                  i32.store offset=4
                  br 2 (;@3;)
                end
                block ;; label = @5
                  block ;; label = @6
                    local.get 8
                    i32.load offset=16
                    local.get 4
                    i32.ne
                    br_if 0 (;@6;)
                    local.get 8
                    local.get 2
                    i32.store offset=16
                    br 1 (;@5;)
                  end
                  local.get 8
                  local.get 2
                  i32.store offset=20
                end
                local.get 2
                i32.eqz
                br_if 1 (;@3;)
              end
              local.get 2
              local.get 8
              i32.store offset=24
              block ;; label = @4
                local.get 4
                i32.load offset=16
                local.tee 1
                i32.eqz
                br_if 0 (;@4;)
                local.get 2
                local.get 1
                i32.store offset=16
                local.get 1
                local.get 2
                i32.store offset=24
              end
              local.get 4
              i32.load offset=20
              local.tee 1
              i32.eqz
              br_if 0 (;@3;)
              local.get 2
              local.get 1
              i32.store offset=20
              local.get 1
              local.get 2
              i32.store offset=24
            end
            local.get 6
            local.get 0
            i32.add
            local.set 0
            local.get 4
            local.get 6
            i32.add
            local.tee 4
            i32.load offset=4
            local.set 1
          end
          local.get 4
          local.get 1
          i32.const -2
          i32.and
          i32.store offset=4
          local.get 5
          local.get 0
          i32.add
          local.get 0
          i32.store
          local.get 5
          local.get 0
          i32.const 1
          i32.or
          i32.store offset=4
          block ;; label = @2
            local.get 0
            i32.const 255
            i32.gt_u
            br_if 0 (;@2;)
            global.get $GOT.data.internal.__memory_base
            i32.const 1048720
            i32.add
            local.tee 1
            local.get 0
            i32.const 248
            i32.and
            i32.add
            i32.const 40
            i32.add
            local.set 2
            block ;; label = @3
              block ;; label = @4
                local.get 1
                i32.load
                local.tee 1
                i32.const 1
                local.get 0
                i32.const 3
                i32.shr_u
                i32.shl
                local.tee 0
                i32.and
                br_if 0 (;@4;)
                global.get $GOT.data.internal.__memory_base
                i32.const 1048720
                i32.add
                local.get 1
                local.get 0
                i32.or
                i32.store
                local.get 2
                local.set 0
                br 1 (;@3;)
              end
              local.get 2
              i32.load offset=8
              local.set 0
            end
            local.get 0
            local.get 5
            i32.store offset=12
            local.get 2
            local.get 5
            i32.store offset=8
            local.get 5
            local.get 2
            i32.store offset=12
            local.get 5
            local.get 0
            i32.store offset=8
            br 1 (;@1;)
          end
          i32.const 31
          local.set 2
          block ;; label = @2
            local.get 0
            i32.const 16777215
            i32.gt_u
            br_if 0 (;@2;)
            local.get 0
            i32.const 38
            local.get 0
            i32.const 8
            i32.shr_u
            i32.clz
            local.tee 2
            i32.sub
            i32.shr_u
            i32.const 1
            i32.and
            local.get 2
            i32.const 1
            i32.shl
            i32.or
            i32.const 62
            i32.xor
            local.set 2
          end
          local.get 5
          local.get 2
          i32.store offset=28
          local.get 5
          i64.const 0
          i64.store offset=16 align=4
          global.get $GOT.data.internal.__memory_base
          i32.const 1048720
          i32.add
          local.tee 7
          local.get 2
          i32.const 2
          i32.shl
          i32.add
          i32.const 304
          i32.add
          local.set 1
          block ;; label = @2
            local.get 7
            i32.load offset=4
            local.tee 7
            i32.const 1
            local.get 2
            i32.shl
            local.tee 4
            i32.and
            br_if 0 (;@2;)
            local.get 1
            local.get 5
            i32.store
            global.get $GOT.data.internal.__memory_base
            i32.const 1048720
            i32.add
            local.get 7
            local.get 4
            i32.or
            i32.store offset=4
            local.get 5
            local.get 1
            i32.store offset=24
            local.get 5
            local.get 5
            i32.store offset=8
            local.get 5
            local.get 5
            i32.store offset=12
            br 1 (;@1;)
          end
          local.get 0
          i32.const 0
          i32.const 25
          local.get 2
          i32.const 1
          i32.shr_u
          i32.sub
          local.get 2
          i32.const 31
          i32.eq
          select
          i32.shl
          local.set 2
          local.get 1
          i32.load
          local.set 7
          block ;; label = @2
            loop ;; label = @3
              local.get 7
              local.tee 1
              i32.load offset=4
              i32.const -8
              i32.and
              local.get 0
              i32.eq
              br_if 1 (;@2;)
              local.get 2
              i32.const 29
              i32.shr_u
              local.set 7
              local.get 2
              i32.const 1
              i32.shl
              local.set 2
              local.get 1
              local.get 7
              i32.const 4
              i32.and
              i32.add
              local.tee 4
              i32.load offset=16
              local.tee 7
              br_if 0 (;@3;)
            end
            local.get 4
            i32.const 16
            i32.add
            local.get 5
            i32.store
            local.get 5
            local.get 1
            i32.store offset=24
            local.get 5
            local.get 5
            i32.store offset=12
            local.get 5
            local.get 5
            i32.store offset=8
            br 1 (;@1;)
          end
          local.get 1
          i32.load offset=8
          local.tee 2
          local.get 5
          i32.store offset=12
          local.get 1
          local.get 5
          i32.store offset=8
          local.get 5
          i32.const 0
          i32.store offset=24
          local.get 5
          local.get 1
          i32.store offset=12
          local.get 5
          local.get 2
          i32.store offset=8
        end
        local.get 3
        i32.const 8
        i32.add
      )
      (func $free (;19;) (type 5) (param i32)
        local.get 0
        call $dlfree
      )
      (func $dlfree (;20;) (type 5) (param i32)
        (local i32 i32 i32 i32 i32 i32 i32 i32)
        block ;; label = @1
          local.get 0
          i32.eqz
          br_if 0 (;@1;)
          local.get 0
          i32.const -8
          i32.add
          local.tee 1
          local.get 0
          i32.const -4
          i32.add
          i32.load
          local.tee 2
          i32.const -8
          i32.and
          local.tee 0
          i32.add
          local.set 3
          global.get $GOT.data.internal.__memory_base
          local.set 4
          block ;; label = @2
            local.get 2
            i32.const 1
            i32.and
            br_if 0 (;@2;)
            local.get 2
            i32.const 2
            i32.and
            i32.eqz
            br_if 1 (;@1;)
            local.get 1
            local.get 1
            i32.load
            local.tee 5
            i32.sub
            local.tee 1
            local.get 4
            i32.const 1048720
            i32.add
            i32.load offset=16
            i32.lt_u
            br_if 1 (;@1;)
            local.get 5
            local.get 0
            i32.add
            local.set 0
            block ;; label = @3
              block ;; label = @4
                block ;; label = @5
                  block ;; label = @6
                    local.get 1
                    global.get $GOT.data.internal.__memory_base
                    i32.const 1048720
                    i32.add
                    i32.load offset=20
                    i32.eq
                    br_if 0 (;@6;)
                    local.get 1
                    i32.load offset=12
                    local.set 2
                    block ;; label = @7
                      local.get 5
                      i32.const 255
                      i32.gt_u
                      br_if 0 (;@7;)
                      local.get 2
                      local.get 1
                      i32.load offset=8
                      local.tee 4
                      i32.ne
                      br_if 2 (;@5;)
                      global.get $GOT.data.internal.__memory_base
                      i32.const 1048720
                      i32.add
                      local.tee 2
                      local.get 2
                      i32.load
                      i32.const -2
                      local.get 5
                      i32.const 3
                      i32.shr_u
                      i32.rotl
                      i32.and
                      i32.store
                      br 5 (;@2;)
                    end
                    local.get 1
                    i32.load offset=24
                    local.set 6
                    block ;; label = @7
                      local.get 2
                      local.get 1
                      i32.eq
                      br_if 0 (;@7;)
                      local.get 1
                      i32.load offset=8
                      local.tee 4
                      local.get 2
                      i32.store offset=12
                      local.get 2
                      local.get 4
                      i32.store offset=8
                      br 4 (;@3;)
                    end
                    block ;; label = @7
                      block ;; label = @8
                        local.get 1
                        i32.load offset=20
                        local.tee 4
                        i32.eqz
                        br_if 0 (;@8;)
                        local.get 1
                        i32.const 20
                        i32.add
                        local.set 5
                        br 1 (;@7;)
                      end
                      local.get 1
                      i32.load offset=16
                      local.tee 4
                      i32.eqz
                      br_if 3 (;@4;)
                      local.get 1
                      i32.const 16
                      i32.add
                      local.set 5
                    end
                    loop ;; label = @7
                      local.get 5
                      local.set 7
                      local.get 4
                      local.tee 2
                      i32.const 20
                      i32.add
                      local.set 5
                      local.get 2
                      i32.load offset=20
                      local.tee 4
                      br_if 0 (;@7;)
                      local.get 2
                      i32.const 16
                      i32.add
                      local.set 5
                      local.get 2
                      i32.load offset=16
                      local.tee 4
                      br_if 0 (;@7;)
                    end
                    local.get 7
                    i32.const 0
                    i32.store
                    br 3 (;@3;)
                  end
                  local.get 3
                  i32.load offset=4
                  local.tee 2
                  i32.const 3
                  i32.and
                  i32.const 3
                  i32.ne
                  br_if 3 (;@2;)
                  local.get 3
                  local.get 2
                  i32.const -2
                  i32.and
                  i32.store offset=4
                  local.get 3
                  local.get 0
                  i32.store
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1048720
                  i32.add
                  local.get 0
                  i32.store offset=8
                  local.get 1
                  local.get 0
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  return
                end
                local.get 2
                local.get 4
                i32.store offset=8
                local.get 4
                local.get 2
                i32.store offset=12
                br 2 (;@2;)
              end
              i32.const 0
              local.set 2
            end
            local.get 6
            i32.eqz
            br_if 0 (;@2;)
            block ;; label = @3
              block ;; label = @4
                local.get 1
                global.get $GOT.data.internal.__memory_base
                i32.const 1048720
                i32.add
                local.get 1
                i32.load offset=28
                local.tee 5
                i32.const 2
                i32.shl
                i32.add
                local.tee 4
                i32.load offset=304
                i32.ne
                br_if 0 (;@4;)
                local.get 4
                i32.const 304
                i32.add
                local.get 2
                i32.store
                local.get 2
                br_if 1 (;@3;)
                global.get $GOT.data.internal.__memory_base
                i32.const 1048720
                i32.add
                local.tee 2
                local.get 2
                i32.load offset=4
                i32.const -2
                local.get 5
                i32.rotl
                i32.and
                i32.store offset=4
                br 2 (;@2;)
              end
              block ;; label = @4
                block ;; label = @5
                  local.get 6
                  i32.load offset=16
                  local.get 1
                  i32.ne
                  br_if 0 (;@5;)
                  local.get 6
                  local.get 2
                  i32.store offset=16
                  br 1 (;@4;)
                end
                local.get 6
                local.get 2
                i32.store offset=20
              end
              local.get 2
              i32.eqz
              br_if 1 (;@2;)
            end
            local.get 2
            local.get 6
            i32.store offset=24
            block ;; label = @3
              local.get 1
              i32.load offset=16
              local.tee 4
              i32.eqz
              br_if 0 (;@3;)
              local.get 2
              local.get 4
              i32.store offset=16
              local.get 4
              local.get 2
              i32.store offset=24
            end
            local.get 1
            i32.load offset=20
            local.tee 4
            i32.eqz
            br_if 0 (;@2;)
            local.get 2
            local.get 4
            i32.store offset=20
            local.get 4
            local.get 2
            i32.store offset=24
          end
          local.get 1
          local.get 3
          i32.ge_u
          br_if 0 (;@1;)
          local.get 3
          i32.load offset=4
          local.tee 4
          i32.const 1
          i32.and
          i32.eqz
          br_if 0 (;@1;)
          block ;; label = @2
            block ;; label = @3
              block ;; label = @4
                block ;; label = @5
                  block ;; label = @6
                    local.get 4
                    i32.const 2
                    i32.and
                    br_if 0 (;@6;)
                    block ;; label = @7
                      local.get 3
                      global.get $GOT.data.internal.__memory_base
                      i32.const 1048720
                      i32.add
                      i32.load offset=24
                      i32.ne
                      br_if 0 (;@7;)
                      global.get $GOT.data.internal.__memory_base
                      i32.const 1048720
                      i32.add
                      local.tee 2
                      local.get 1
                      i32.store offset=24
                      local.get 2
                      local.get 2
                      i32.load offset=12
                      local.get 0
                      i32.add
                      local.tee 0
                      i32.store offset=12
                      local.get 1
                      local.get 0
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get 1
                      local.get 2
                      i32.load offset=20
                      i32.ne
                      br_if 6 (;@1;)
                      global.get $GOT.data.internal.__memory_base
                      i32.const 1048720
                      i32.add
                      local.tee 1
                      i32.const 0
                      i32.store offset=8
                      local.get 1
                      i32.const 0
                      i32.store offset=20
                      return
                    end
                    block ;; label = @7
                      local.get 3
                      global.get $GOT.data.internal.__memory_base
                      i32.const 1048720
                      i32.add
                      i32.load offset=20
                      local.tee 6
                      i32.ne
                      br_if 0 (;@7;)
                      global.get $GOT.data.internal.__memory_base
                      i32.const 1048720
                      i32.add
                      local.tee 2
                      local.get 1
                      i32.store offset=20
                      local.get 2
                      local.get 2
                      i32.load offset=8
                      local.get 0
                      i32.add
                      local.tee 0
                      i32.store offset=8
                      local.get 1
                      local.get 0
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get 1
                      local.get 0
                      i32.add
                      local.get 0
                      i32.store
                      return
                    end
                    local.get 4
                    i32.const -8
                    i32.and
                    local.get 0
                    i32.add
                    local.set 0
                    local.get 3
                    i32.load offset=12
                    local.set 2
                    block ;; label = @7
                      local.get 4
                      i32.const 255
                      i32.gt_u
                      br_if 0 (;@7;)
                      block ;; label = @8
                        local.get 2
                        local.get 3
                        i32.load offset=8
                        local.tee 5
                        i32.ne
                        br_if 0 (;@8;)
                        global.get $GOT.data.internal.__memory_base
                        i32.const 1048720
                        i32.add
                        local.tee 2
                        local.get 2
                        i32.load
                        i32.const -2
                        local.get 4
                        i32.const 3
                        i32.shr_u
                        i32.rotl
                        i32.and
                        i32.store
                        br 5 (;@3;)
                      end
                      local.get 2
                      local.get 5
                      i32.store offset=8
                      local.get 5
                      local.get 2
                      i32.store offset=12
                      br 4 (;@3;)
                    end
                    local.get 3
                    i32.load offset=24
                    local.set 8
                    block ;; label = @7
                      local.get 2
                      local.get 3
                      i32.eq
                      br_if 0 (;@7;)
                      local.get 3
                      i32.load offset=8
                      local.tee 4
                      local.get 2
                      i32.store offset=12
                      local.get 2
                      local.get 4
                      i32.store offset=8
                      br 3 (;@4;)
                    end
                    block ;; label = @7
                      block ;; label = @8
                        local.get 3
                        i32.load offset=20
                        local.tee 4
                        i32.eqz
                        br_if 0 (;@8;)
                        local.get 3
                        i32.const 20
                        i32.add
                        local.set 5
                        br 1 (;@7;)
                      end
                      local.get 3
                      i32.load offset=16
                      local.tee 4
                      i32.eqz
                      br_if 2 (;@5;)
                      local.get 3
                      i32.const 16
                      i32.add
                      local.set 5
                    end
                    loop ;; label = @7
                      local.get 5
                      local.set 7
                      local.get 4
                      local.tee 2
                      i32.const 20
                      i32.add
                      local.set 5
                      local.get 2
                      i32.load offset=20
                      local.tee 4
                      br_if 0 (;@7;)
                      local.get 2
                      i32.const 16
                      i32.add
                      local.set 5
                      local.get 2
                      i32.load offset=16
                      local.tee 4
                      br_if 0 (;@7;)
                    end
                    local.get 7
                    i32.const 0
                    i32.store
                    br 2 (;@4;)
                  end
                  local.get 3
                  local.get 4
                  i32.const -2
                  i32.and
                  i32.store offset=4
                  local.get 1
                  local.get 0
                  i32.add
                  local.get 0
                  i32.store
                  local.get 1
                  local.get 0
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  br 3 (;@2;)
                end
                i32.const 0
                local.set 2
              end
              local.get 8
              i32.eqz
              br_if 0 (;@3;)
              block ;; label = @4
                block ;; label = @5
                  local.get 3
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1048720
                  i32.add
                  local.get 3
                  i32.load offset=28
                  local.tee 5
                  i32.const 2
                  i32.shl
                  i32.add
                  local.tee 4
                  i32.load offset=304
                  i32.ne
                  br_if 0 (;@5;)
                  local.get 4
                  i32.const 304
                  i32.add
                  local.get 2
                  i32.store
                  local.get 2
                  br_if 1 (;@4;)
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1048720
                  i32.add
                  local.tee 2
                  local.get 2
                  i32.load offset=4
                  i32.const -2
                  local.get 5
                  i32.rotl
                  i32.and
                  i32.store offset=4
                  br 2 (;@3;)
                end
                block ;; label = @5
                  block ;; label = @6
                    local.get 8
                    i32.load offset=16
                    local.get 3
                    i32.ne
                    br_if 0 (;@6;)
                    local.get 8
                    local.get 2
                    i32.store offset=16
                    br 1 (;@5;)
                  end
                  local.get 8
                  local.get 2
                  i32.store offset=20
                end
                local.get 2
                i32.eqz
                br_if 1 (;@3;)
              end
              local.get 2
              local.get 8
              i32.store offset=24
              block ;; label = @4
                local.get 3
                i32.load offset=16
                local.tee 4
                i32.eqz
                br_if 0 (;@4;)
                local.get 2
                local.get 4
                i32.store offset=16
                local.get 4
                local.get 2
                i32.store offset=24
              end
              local.get 3
              i32.load offset=20
              local.tee 4
              i32.eqz
              br_if 0 (;@3;)
              local.get 2
              local.get 4
              i32.store offset=20
              local.get 4
              local.get 2
              i32.store offset=24
            end
            local.get 1
            local.get 0
            i32.add
            local.get 0
            i32.store
            local.get 1
            local.get 0
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 1
            local.get 6
            i32.ne
            br_if 0 (;@2;)
            global.get $GOT.data.internal.__memory_base
            i32.const 1048720
            i32.add
            local.get 0
            i32.store offset=8
            return
          end
          block ;; label = @2
            local.get 0
            i32.const 255
            i32.gt_u
            br_if 0 (;@2;)
            global.get $GOT.data.internal.__memory_base
            i32.const 1048720
            i32.add
            local.tee 4
            local.get 0
            i32.const 248
            i32.and
            i32.add
            i32.const 40
            i32.add
            local.set 2
            block ;; label = @3
              block ;; label = @4
                local.get 4
                i32.load
                local.tee 4
                i32.const 1
                local.get 0
                i32.const 3
                i32.shr_u
                i32.shl
                local.tee 0
                i32.and
                br_if 0 (;@4;)
                global.get $GOT.data.internal.__memory_base
                i32.const 1048720
                i32.add
                local.get 4
                local.get 0
                i32.or
                i32.store
                local.get 2
                local.set 0
                br 1 (;@3;)
              end
              local.get 2
              i32.load offset=8
              local.set 0
            end
            local.get 0
            local.get 1
            i32.store offset=12
            local.get 2
            local.get 1
            i32.store offset=8
            local.get 1
            local.get 2
            i32.store offset=12
            local.get 1
            local.get 0
            i32.store offset=8
            return
          end
          i32.const 31
          local.set 2
          block ;; label = @2
            local.get 0
            i32.const 16777215
            i32.gt_u
            br_if 0 (;@2;)
            local.get 0
            i32.const 38
            local.get 0
            i32.const 8
            i32.shr_u
            i32.clz
            local.tee 2
            i32.sub
            i32.shr_u
            i32.const 1
            i32.and
            local.get 2
            i32.const 1
            i32.shl
            i32.or
            i32.const 62
            i32.xor
            local.set 2
          end
          local.get 1
          local.get 2
          i32.store offset=28
          local.get 1
          i64.const 0
          i64.store offset=16 align=4
          global.get $GOT.data.internal.__memory_base
          i32.const 1048720
          i32.add
          local.tee 4
          local.get 2
          i32.const 2
          i32.shl
          i32.add
          i32.const 304
          i32.add
          local.set 5
          block ;; label = @2
            block ;; label = @3
              block ;; label = @4
                block ;; label = @5
                  local.get 4
                  i32.load offset=4
                  local.tee 4
                  i32.const 1
                  local.get 2
                  i32.shl
                  local.tee 3
                  i32.and
                  br_if 0 (;@5;)
                  local.get 5
                  local.get 1
                  i32.store
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1048720
                  i32.add
                  local.get 4
                  local.get 3
                  i32.or
                  i32.store offset=4
                  i32.const 8
                  local.set 0
                  i32.const 24
                  local.set 2
                  br 1 (;@4;)
                end
                local.get 0
                i32.const 0
                i32.const 25
                local.get 2
                i32.const 1
                i32.shr_u
                i32.sub
                local.get 2
                i32.const 31
                i32.eq
                select
                i32.shl
                local.set 2
                local.get 5
                i32.load
                local.set 5
                loop ;; label = @5
                  local.get 5
                  local.tee 4
                  i32.load offset=4
                  i32.const -8
                  i32.and
                  local.get 0
                  i32.eq
                  br_if 2 (;@3;)
                  local.get 2
                  i32.const 29
                  i32.shr_u
                  local.set 5
                  local.get 2
                  i32.const 1
                  i32.shl
                  local.set 2
                  local.get 4
                  local.get 5
                  i32.const 4
                  i32.and
                  i32.add
                  local.tee 3
                  i32.load offset=16
                  local.tee 5
                  br_if 0 (;@5;)
                end
                local.get 3
                i32.const 16
                i32.add
                local.get 1
                i32.store
                i32.const 8
                local.set 0
                i32.const 24
                local.set 2
                local.get 4
                local.set 5
              end
              local.get 1
              local.set 4
              local.get 1
              local.set 3
              br 1 (;@2;)
            end
            local.get 4
            i32.load offset=8
            local.tee 5
            local.get 1
            i32.store offset=12
            local.get 4
            local.get 1
            i32.store offset=8
            i32.const 0
            local.set 3
            i32.const 24
            local.set 0
            i32.const 8
            local.set 2
          end
          local.get 1
          local.get 2
          i32.add
          local.get 5
          i32.store
          local.get 1
          local.get 4
          i32.store offset=12
          local.get 1
          local.get 0
          i32.add
          local.get 3
          i32.store
          global.get $GOT.data.internal.__memory_base
          i32.const 1048720
          i32.add
          local.tee 1
          local.get 1
          i32.load offset=32
          i32.const -1
          i32.add
          local.tee 1
          i32.const -1
          local.get 1
          select
          i32.store offset=32
        end
      )
      (func $realloc (;21;) (type 0) (param i32 i32) (result i32)
        (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
        block ;; label = @1
          local.get 0
          br_if 0 (;@1;)
          local.get 1
          call $dlmalloc
          return
        end
        block ;; label = @1
          local.get 1
          i32.const -64
          i32.lt_u
          br_if 0 (;@1;)
          global.get $GOT.data.internal.errno
          i32.const 48
          i32.store
          i32.const 0
          return
        end
        i32.const 16
        local.get 1
        i32.const 19
        i32.add
        i32.const -16
        i32.and
        local.get 1
        i32.const 11
        i32.lt_u
        select
        local.set 2
        local.get 0
        i32.const -4
        i32.add
        local.tee 3
        i32.load
        local.tee 4
        i32.const -8
        i32.and
        local.set 5
        block ;; label = @1
          block ;; label = @2
            block ;; label = @3
              local.get 4
              i32.const 3
              i32.and
              br_if 0 (;@3;)
              local.get 2
              i32.const 256
              i32.lt_u
              br_if 1 (;@2;)
              local.get 5
              local.get 2
              i32.le_u
              br_if 1 (;@2;)
              local.get 5
              local.get 2
              i32.sub
              global.get $GOT.data.internal.__memory_base
              i32.const 1049192
              i32.add
              i32.load offset=8
              i32.const 1
              i32.shl
              i32.le_u
              br_if 2 (;@1;)
              br 1 (;@2;)
            end
            local.get 0
            i32.const -8
            i32.add
            local.tee 6
            local.get 5
            i32.add
            local.set 7
            block ;; label = @3
              local.get 5
              local.get 2
              i32.lt_u
              br_if 0 (;@3;)
              local.get 5
              local.get 2
              i32.sub
              local.tee 1
              i32.const 16
              i32.lt_u
              br_if 2 (;@1;)
              local.get 3
              local.get 2
              local.get 4
              i32.const 1
              i32.and
              i32.or
              i32.const 2
              i32.or
              i32.store
              local.get 6
              local.get 2
              i32.add
              local.tee 2
              local.get 1
              i32.const 3
              i32.or
              i32.store offset=4
              local.get 7
              local.get 7
              i32.load offset=4
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 2
              local.get 1
              call $dispose_chunk
              local.get 0
              return
            end
            local.get 7
            i32.load offset=4
            local.set 8
            block ;; label = @3
              local.get 7
              global.get $GOT.data.internal.__memory_base
              i32.const 1048720
              i32.add
              i32.load offset=24
              i32.ne
              br_if 0 (;@3;)
              global.get $GOT.data.internal.__memory_base
              i32.const 1048720
              i32.add
              i32.load offset=12
              local.get 5
              i32.add
              local.tee 5
              local.get 2
              i32.le_u
              br_if 1 (;@2;)
              local.get 3
              local.get 2
              local.get 4
              i32.const 1
              i32.and
              i32.or
              i32.const 2
              i32.or
              i32.store
              global.get $GOT.data.internal.__memory_base
              i32.const 1048720
              i32.add
              local.tee 1
              local.get 6
              local.get 2
              i32.add
              local.tee 4
              i32.store offset=24
              local.get 1
              local.get 5
              local.get 2
              i32.sub
              local.tee 2
              i32.store offset=12
              local.get 4
              local.get 2
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 0
              return
            end
            block ;; label = @3
              local.get 7
              global.get $GOT.data.internal.__memory_base
              i32.const 1048720
              i32.add
              i32.load offset=20
              i32.ne
              br_if 0 (;@3;)
              global.get $GOT.data.internal.__memory_base
              i32.const 1048720
              i32.add
              i32.load offset=8
              local.get 5
              i32.add
              local.tee 5
              local.get 2
              i32.lt_u
              br_if 1 (;@2;)
              block ;; label = @4
                block ;; label = @5
                  local.get 5
                  local.get 2
                  i32.sub
                  local.tee 1
                  i32.const 16
                  i32.lt_u
                  br_if 0 (;@5;)
                  local.get 3
                  local.get 2
                  local.get 4
                  i32.const 1
                  i32.and
                  i32.or
                  i32.const 2
                  i32.or
                  i32.store
                  local.get 6
                  local.get 2
                  i32.add
                  local.tee 2
                  local.get 1
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get 6
                  local.get 5
                  i32.add
                  local.tee 5
                  local.get 1
                  i32.store
                  local.get 5
                  local.get 5
                  i32.load offset=4
                  i32.const -2
                  i32.and
                  i32.store offset=4
                  br 1 (;@4;)
                end
                local.get 3
                local.get 4
                i32.const 1
                i32.and
                local.get 5
                i32.or
                i32.const 2
                i32.or
                i32.store
                local.get 6
                local.get 5
                i32.add
                local.tee 1
                local.get 1
                i32.load offset=4
                i32.const 1
                i32.or
                i32.store offset=4
                i32.const 0
                local.set 2
                i32.const 0
                local.set 1
              end
              global.get $GOT.data.internal.__memory_base
              i32.const 1048720
              i32.add
              local.tee 5
              local.get 2
              i32.store offset=20
              local.get 5
              local.get 1
              i32.store offset=8
              local.get 0
              return
            end
            local.get 8
            i32.const 2
            i32.and
            br_if 0 (;@2;)
            local.get 8
            i32.const -8
            i32.and
            local.get 5
            i32.add
            local.tee 9
            local.get 2
            i32.lt_u
            br_if 0 (;@2;)
            local.get 9
            local.get 2
            i32.sub
            local.set 10
            local.get 7
            i32.load offset=12
            local.set 1
            block ;; label = @3
              block ;; label = @4
                local.get 8
                i32.const 255
                i32.gt_u
                br_if 0 (;@4;)
                block ;; label = @5
                  local.get 1
                  local.get 7
                  i32.load offset=8
                  local.tee 5
                  i32.ne
                  br_if 0 (;@5;)
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1048720
                  i32.add
                  local.tee 1
                  local.get 1
                  i32.load
                  i32.const -2
                  local.get 8
                  i32.const 3
                  i32.shr_u
                  i32.rotl
                  i32.and
                  i32.store
                  br 2 (;@3;)
                end
                local.get 1
                local.get 5
                i32.store offset=8
                local.get 5
                local.get 1
                i32.store offset=12
                br 1 (;@3;)
              end
              local.get 7
              i32.load offset=24
              local.set 11
              block ;; label = @4
                block ;; label = @5
                  local.get 1
                  local.get 7
                  i32.eq
                  br_if 0 (;@5;)
                  local.get 7
                  i32.load offset=8
                  local.tee 5
                  local.get 1
                  i32.store offset=12
                  local.get 1
                  local.get 5
                  i32.store offset=8
                  br 1 (;@4;)
                end
                block ;; label = @5
                  block ;; label = @6
                    block ;; label = @7
                      local.get 7
                      i32.load offset=20
                      local.tee 5
                      i32.eqz
                      br_if 0 (;@7;)
                      local.get 7
                      i32.const 20
                      i32.add
                      local.set 8
                      br 1 (;@6;)
                    end
                    local.get 7
                    i32.load offset=16
                    local.tee 5
                    i32.eqz
                    br_if 1 (;@5;)
                    local.get 7
                    i32.const 16
                    i32.add
                    local.set 8
                  end
                  loop ;; label = @6
                    local.get 8
                    local.set 12
                    local.get 5
                    local.tee 1
                    i32.const 20
                    i32.add
                    local.set 8
                    local.get 1
                    i32.load offset=20
                    local.tee 5
                    br_if 0 (;@6;)
                    local.get 1
                    i32.const 16
                    i32.add
                    local.set 8
                    local.get 1
                    i32.load offset=16
                    local.tee 5
                    br_if 0 (;@6;)
                  end
                  local.get 12
                  i32.const 0
                  i32.store
                  br 1 (;@4;)
                end
                i32.const 0
                local.set 1
              end
              local.get 11
              i32.eqz
              br_if 0 (;@3;)
              block ;; label = @4
                block ;; label = @5
                  local.get 7
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1048720
                  i32.add
                  local.get 7
                  i32.load offset=28
                  local.tee 8
                  i32.const 2
                  i32.shl
                  i32.add
                  local.tee 5
                  i32.load offset=304
                  i32.ne
                  br_if 0 (;@5;)
                  local.get 5
                  i32.const 304
                  i32.add
                  local.get 1
                  i32.store
                  local.get 1
                  br_if 1 (;@4;)
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1048720
                  i32.add
                  local.tee 1
                  local.get 1
                  i32.load offset=4
                  i32.const -2
                  local.get 8
                  i32.rotl
                  i32.and
                  i32.store offset=4
                  br 2 (;@3;)
                end
                block ;; label = @5
                  block ;; label = @6
                    local.get 11
                    i32.load offset=16
                    local.get 7
                    i32.ne
                    br_if 0 (;@6;)
                    local.get 11
                    local.get 1
                    i32.store offset=16
                    br 1 (;@5;)
                  end
                  local.get 11
                  local.get 1
                  i32.store offset=20
                end
                local.get 1
                i32.eqz
                br_if 1 (;@3;)
              end
              local.get 1
              local.get 11
              i32.store offset=24
              block ;; label = @4
                local.get 7
                i32.load offset=16
                local.tee 5
                i32.eqz
                br_if 0 (;@4;)
                local.get 1
                local.get 5
                i32.store offset=16
                local.get 5
                local.get 1
                i32.store offset=24
              end
              local.get 7
              i32.load offset=20
              local.tee 5
              i32.eqz
              br_if 0 (;@3;)
              local.get 1
              local.get 5
              i32.store offset=20
              local.get 5
              local.get 1
              i32.store offset=24
            end
            block ;; label = @3
              local.get 10
              i32.const 15
              i32.gt_u
              br_if 0 (;@3;)
              local.get 3
              local.get 4
              i32.const 1
              i32.and
              local.get 9
              i32.or
              i32.const 2
              i32.or
              i32.store
              local.get 6
              local.get 9
              i32.add
              local.tee 1
              local.get 1
              i32.load offset=4
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 0
              return
            end
            local.get 3
            local.get 2
            local.get 4
            i32.const 1
            i32.and
            i32.or
            i32.const 2
            i32.or
            i32.store
            local.get 6
            local.get 2
            i32.add
            local.tee 1
            local.get 10
            i32.const 3
            i32.or
            i32.store offset=4
            local.get 6
            local.get 9
            i32.add
            local.tee 2
            local.get 2
            i32.load offset=4
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 1
            local.get 10
            call $dispose_chunk
            local.get 0
            return
          end
          block ;; label = @2
            local.get 1
            call $dlmalloc
            local.tee 2
            br_if 0 (;@2;)
            i32.const 0
            return
          end
          block ;; label = @2
            i32.const -4
            i32.const -8
            local.get 3
            i32.load
            local.tee 5
            i32.const 3
            i32.and
            select
            local.get 5
            i32.const -8
            i32.and
            i32.add
            local.tee 5
            local.get 1
            local.get 5
            local.get 1
            i32.lt_u
            select
            local.tee 1
            i32.eqz
            br_if 0 (;@2;)
            local.get 2
            local.get 0
            local.get 1
            memory.copy
          end
          local.get 0
          call $dlfree
          local.get 2
          local.set 0
        end
        local.get 0
      )
      (func $dispose_chunk (;22;) (type 6) (param i32 i32)
        (local i32 i32 i32 i32 i32 i32 i32)
        local.get 0
        local.get 1
        i32.add
        local.set 2
        block ;; label = @1
          block ;; label = @2
            local.get 0
            i32.load offset=4
            local.tee 3
            i32.const 1
            i32.and
            br_if 0 (;@2;)
            local.get 3
            i32.const 2
            i32.and
            i32.eqz
            br_if 1 (;@1;)
            local.get 0
            i32.load
            local.tee 4
            local.get 1
            i32.add
            local.set 1
            block ;; label = @3
              block ;; label = @4
                block ;; label = @5
                  block ;; label = @6
                    local.get 0
                    local.get 4
                    i32.sub
                    local.tee 0
                    global.get $GOT.data.internal.__memory_base
                    i32.const 1048720
                    i32.add
                    i32.load offset=20
                    i32.eq
                    br_if 0 (;@6;)
                    local.get 0
                    i32.load offset=12
                    local.set 3
                    block ;; label = @7
                      local.get 4
                      i32.const 255
                      i32.gt_u
                      br_if 0 (;@7;)
                      local.get 3
                      local.get 0
                      i32.load offset=8
                      local.tee 5
                      i32.ne
                      br_if 2 (;@5;)
                      global.get $GOT.data.internal.__memory_base
                      i32.const 1048720
                      i32.add
                      local.tee 3
                      local.get 3
                      i32.load
                      i32.const -2
                      local.get 4
                      i32.const 3
                      i32.shr_u
                      i32.rotl
                      i32.and
                      i32.store
                      br 5 (;@2;)
                    end
                    local.get 0
                    i32.load offset=24
                    local.set 6
                    block ;; label = @7
                      local.get 3
                      local.get 0
                      i32.eq
                      br_if 0 (;@7;)
                      local.get 0
                      i32.load offset=8
                      local.tee 4
                      local.get 3
                      i32.store offset=12
                      local.get 3
                      local.get 4
                      i32.store offset=8
                      br 4 (;@3;)
                    end
                    block ;; label = @7
                      block ;; label = @8
                        local.get 0
                        i32.load offset=20
                        local.tee 4
                        i32.eqz
                        br_if 0 (;@8;)
                        local.get 0
                        i32.const 20
                        i32.add
                        local.set 5
                        br 1 (;@7;)
                      end
                      local.get 0
                      i32.load offset=16
                      local.tee 4
                      i32.eqz
                      br_if 3 (;@4;)
                      local.get 0
                      i32.const 16
                      i32.add
                      local.set 5
                    end
                    loop ;; label = @7
                      local.get 5
                      local.set 7
                      local.get 4
                      local.tee 3
                      i32.const 20
                      i32.add
                      local.set 5
                      local.get 3
                      i32.load offset=20
                      local.tee 4
                      br_if 0 (;@7;)
                      local.get 3
                      i32.const 16
                      i32.add
                      local.set 5
                      local.get 3
                      i32.load offset=16
                      local.tee 4
                      br_if 0 (;@7;)
                    end
                    local.get 7
                    i32.const 0
                    i32.store
                    br 3 (;@3;)
                  end
                  local.get 2
                  i32.load offset=4
                  local.tee 3
                  i32.const 3
                  i32.and
                  i32.const 3
                  i32.ne
                  br_if 3 (;@2;)
                  local.get 2
                  local.get 3
                  i32.const -2
                  i32.and
                  i32.store offset=4
                  local.get 2
                  local.get 1
                  i32.store
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1048720
                  i32.add
                  local.get 1
                  i32.store offset=8
                  local.get 0
                  local.get 1
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  return
                end
                local.get 3
                local.get 5
                i32.store offset=8
                local.get 5
                local.get 3
                i32.store offset=12
                br 2 (;@2;)
              end
              i32.const 0
              local.set 3
            end
            local.get 6
            i32.eqz
            br_if 0 (;@2;)
            block ;; label = @3
              block ;; label = @4
                local.get 0
                global.get $GOT.data.internal.__memory_base
                i32.const 1048720
                i32.add
                local.get 0
                i32.load offset=28
                local.tee 5
                i32.const 2
                i32.shl
                i32.add
                local.tee 4
                i32.load offset=304
                i32.ne
                br_if 0 (;@4;)
                local.get 4
                i32.const 304
                i32.add
                local.get 3
                i32.store
                local.get 3
                br_if 1 (;@3;)
                global.get $GOT.data.internal.__memory_base
                i32.const 1048720
                i32.add
                local.tee 3
                local.get 3
                i32.load offset=4
                i32.const -2
                local.get 5
                i32.rotl
                i32.and
                i32.store offset=4
                br 2 (;@2;)
              end
              block ;; label = @4
                block ;; label = @5
                  local.get 6
                  i32.load offset=16
                  local.get 0
                  i32.ne
                  br_if 0 (;@5;)
                  local.get 6
                  local.get 3
                  i32.store offset=16
                  br 1 (;@4;)
                end
                local.get 6
                local.get 3
                i32.store offset=20
              end
              local.get 3
              i32.eqz
              br_if 1 (;@2;)
            end
            local.get 3
            local.get 6
            i32.store offset=24
            block ;; label = @3
              local.get 0
              i32.load offset=16
              local.tee 4
              i32.eqz
              br_if 0 (;@3;)
              local.get 3
              local.get 4
              i32.store offset=16
              local.get 4
              local.get 3
              i32.store offset=24
            end
            local.get 0
            i32.load offset=20
            local.tee 4
            i32.eqz
            br_if 0 (;@2;)
            local.get 3
            local.get 4
            i32.store offset=20
            local.get 4
            local.get 3
            i32.store offset=24
          end
          block ;; label = @2
            block ;; label = @3
              block ;; label = @4
                block ;; label = @5
                  block ;; label = @6
                    local.get 2
                    i32.load offset=4
                    local.tee 4
                    i32.const 2
                    i32.and
                    br_if 0 (;@6;)
                    block ;; label = @7
                      local.get 2
                      global.get $GOT.data.internal.__memory_base
                      i32.const 1048720
                      i32.add
                      i32.load offset=24
                      i32.ne
                      br_if 0 (;@7;)
                      global.get $GOT.data.internal.__memory_base
                      i32.const 1048720
                      i32.add
                      local.tee 3
                      local.get 0
                      i32.store offset=24
                      local.get 3
                      local.get 3
                      i32.load offset=12
                      local.get 1
                      i32.add
                      local.tee 1
                      i32.store offset=12
                      local.get 0
                      local.get 1
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get 0
                      local.get 3
                      i32.load offset=20
                      i32.ne
                      br_if 6 (;@1;)
                      global.get $GOT.data.internal.__memory_base
                      i32.const 1048720
                      i32.add
                      local.tee 0
                      i32.const 0
                      i32.store offset=8
                      local.get 0
                      i32.const 0
                      i32.store offset=20
                      return
                    end
                    block ;; label = @7
                      local.get 2
                      global.get $GOT.data.internal.__memory_base
                      i32.const 1048720
                      i32.add
                      i32.load offset=20
                      local.tee 6
                      i32.ne
                      br_if 0 (;@7;)
                      global.get $GOT.data.internal.__memory_base
                      i32.const 1048720
                      i32.add
                      local.tee 3
                      local.get 0
                      i32.store offset=20
                      local.get 3
                      local.get 3
                      i32.load offset=8
                      local.get 1
                      i32.add
                      local.tee 1
                      i32.store offset=8
                      local.get 0
                      local.get 1
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get 0
                      local.get 1
                      i32.add
                      local.get 1
                      i32.store
                      return
                    end
                    local.get 4
                    i32.const -8
                    i32.and
                    local.get 1
                    i32.add
                    local.set 1
                    local.get 2
                    i32.load offset=12
                    local.set 3
                    block ;; label = @7
                      local.get 4
                      i32.const 255
                      i32.gt_u
                      br_if 0 (;@7;)
                      block ;; label = @8
                        local.get 3
                        local.get 2
                        i32.load offset=8
                        local.tee 5
                        i32.ne
                        br_if 0 (;@8;)
                        global.get $GOT.data.internal.__memory_base
                        i32.const 1048720
                        i32.add
                        local.tee 3
                        local.get 3
                        i32.load
                        i32.const -2
                        local.get 4
                        i32.const 3
                        i32.shr_u
                        i32.rotl
                        i32.and
                        i32.store
                        br 5 (;@3;)
                      end
                      local.get 3
                      local.get 5
                      i32.store offset=8
                      local.get 5
                      local.get 3
                      i32.store offset=12
                      br 4 (;@3;)
                    end
                    local.get 2
                    i32.load offset=24
                    local.set 8
                    block ;; label = @7
                      local.get 3
                      local.get 2
                      i32.eq
                      br_if 0 (;@7;)
                      local.get 2
                      i32.load offset=8
                      local.tee 4
                      local.get 3
                      i32.store offset=12
                      local.get 3
                      local.get 4
                      i32.store offset=8
                      br 3 (;@4;)
                    end
                    block ;; label = @7
                      block ;; label = @8
                        local.get 2
                        i32.load offset=20
                        local.tee 4
                        i32.eqz
                        br_if 0 (;@8;)
                        local.get 2
                        i32.const 20
                        i32.add
                        local.set 5
                        br 1 (;@7;)
                      end
                      local.get 2
                      i32.load offset=16
                      local.tee 4
                      i32.eqz
                      br_if 2 (;@5;)
                      local.get 2
                      i32.const 16
                      i32.add
                      local.set 5
                    end
                    loop ;; label = @7
                      local.get 5
                      local.set 7
                      local.get 4
                      local.tee 3
                      i32.const 20
                      i32.add
                      local.set 5
                      local.get 3
                      i32.load offset=20
                      local.tee 4
                      br_if 0 (;@7;)
                      local.get 3
                      i32.const 16
                      i32.add
                      local.set 5
                      local.get 3
                      i32.load offset=16
                      local.tee 4
                      br_if 0 (;@7;)
                    end
                    local.get 7
                    i32.const 0
                    i32.store
                    br 2 (;@4;)
                  end
                  local.get 2
                  local.get 4
                  i32.const -2
                  i32.and
                  i32.store offset=4
                  local.get 0
                  local.get 1
                  i32.add
                  local.get 1
                  i32.store
                  local.get 0
                  local.get 1
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  br 3 (;@2;)
                end
                i32.const 0
                local.set 3
              end
              local.get 8
              i32.eqz
              br_if 0 (;@3;)
              block ;; label = @4
                block ;; label = @5
                  local.get 2
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1048720
                  i32.add
                  local.get 2
                  i32.load offset=28
                  local.tee 5
                  i32.const 2
                  i32.shl
                  i32.add
                  local.tee 4
                  i32.load offset=304
                  i32.ne
                  br_if 0 (;@5;)
                  local.get 4
                  i32.const 304
                  i32.add
                  local.get 3
                  i32.store
                  local.get 3
                  br_if 1 (;@4;)
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1048720
                  i32.add
                  local.tee 3
                  local.get 3
                  i32.load offset=4
                  i32.const -2
                  local.get 5
                  i32.rotl
                  i32.and
                  i32.store offset=4
                  br 2 (;@3;)
                end
                block ;; label = @5
                  block ;; label = @6
                    local.get 8
                    i32.load offset=16
                    local.get 2
                    i32.ne
                    br_if 0 (;@6;)
                    local.get 8
                    local.get 3
                    i32.store offset=16
                    br 1 (;@5;)
                  end
                  local.get 8
                  local.get 3
                  i32.store offset=20
                end
                local.get 3
                i32.eqz
                br_if 1 (;@3;)
              end
              local.get 3
              local.get 8
              i32.store offset=24
              block ;; label = @4
                local.get 2
                i32.load offset=16
                local.tee 4
                i32.eqz
                br_if 0 (;@4;)
                local.get 3
                local.get 4
                i32.store offset=16
                local.get 4
                local.get 3
                i32.store offset=24
              end
              local.get 2
              i32.load offset=20
              local.tee 4
              i32.eqz
              br_if 0 (;@3;)
              local.get 3
              local.get 4
              i32.store offset=20
              local.get 4
              local.get 3
              i32.store offset=24
            end
            local.get 0
            local.get 1
            i32.add
            local.get 1
            i32.store
            local.get 0
            local.get 1
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 0
            local.get 6
            i32.ne
            br_if 0 (;@2;)
            global.get $GOT.data.internal.__memory_base
            i32.const 1048720
            i32.add
            local.get 1
            i32.store offset=8
            return
          end
          block ;; label = @2
            local.get 1
            i32.const 255
            i32.gt_u
            br_if 0 (;@2;)
            global.get $GOT.data.internal.__memory_base
            i32.const 1048720
            i32.add
            local.tee 4
            local.get 1
            i32.const 248
            i32.and
            i32.add
            i32.const 40
            i32.add
            local.set 3
            block ;; label = @3
              block ;; label = @4
                local.get 4
                i32.load
                local.tee 4
                i32.const 1
                local.get 1
                i32.const 3
                i32.shr_u
                i32.shl
                local.tee 1
                i32.and
                br_if 0 (;@4;)
                global.get $GOT.data.internal.__memory_base
                i32.const 1048720
                i32.add
                local.get 4
                local.get 1
                i32.or
                i32.store
                local.get 3
                local.set 1
                br 1 (;@3;)
              end
              local.get 3
              i32.load offset=8
              local.set 1
            end
            local.get 1
            local.get 0
            i32.store offset=12
            local.get 3
            local.get 0
            i32.store offset=8
            local.get 0
            local.get 3
            i32.store offset=12
            local.get 0
            local.get 1
            i32.store offset=8
            return
          end
          i32.const 31
          local.set 3
          block ;; label = @2
            local.get 1
            i32.const 16777215
            i32.gt_u
            br_if 0 (;@2;)
            local.get 1
            i32.const 38
            local.get 1
            i32.const 8
            i32.shr_u
            i32.clz
            local.tee 3
            i32.sub
            i32.shr_u
            i32.const 1
            i32.and
            local.get 3
            i32.const 1
            i32.shl
            i32.or
            i32.const 62
            i32.xor
            local.set 3
          end
          local.get 0
          local.get 3
          i32.store offset=28
          local.get 0
          i64.const 0
          i64.store offset=16 align=4
          global.get $GOT.data.internal.__memory_base
          i32.const 1048720
          i32.add
          local.tee 5
          local.get 3
          i32.const 2
          i32.shl
          i32.add
          i32.const 304
          i32.add
          local.set 4
          block ;; label = @2
            local.get 5
            i32.load offset=4
            local.tee 5
            i32.const 1
            local.get 3
            i32.shl
            local.tee 2
            i32.and
            br_if 0 (;@2;)
            local.get 4
            local.get 0
            i32.store
            global.get $GOT.data.internal.__memory_base
            i32.const 1048720
            i32.add
            local.get 5
            local.get 2
            i32.or
            i32.store offset=4
            local.get 0
            local.get 4
            i32.store offset=24
            local.get 0
            local.get 0
            i32.store offset=8
            local.get 0
            local.get 0
            i32.store offset=12
            return
          end
          local.get 1
          i32.const 0
          i32.const 25
          local.get 3
          i32.const 1
          i32.shr_u
          i32.sub
          local.get 3
          i32.const 31
          i32.eq
          select
          i32.shl
          local.set 3
          local.get 4
          i32.load
          local.set 5
          block ;; label = @2
            loop ;; label = @3
              local.get 5
              local.tee 4
              i32.load offset=4
              i32.const -8
              i32.and
              local.get 1
              i32.eq
              br_if 1 (;@2;)
              local.get 3
              i32.const 29
              i32.shr_u
              local.set 5
              local.get 3
              i32.const 1
              i32.shl
              local.set 3
              local.get 4
              local.get 5
              i32.const 4
              i32.and
              i32.add
              local.tee 2
              i32.load offset=16
              local.tee 5
              br_if 0 (;@3;)
            end
            local.get 2
            i32.const 16
            i32.add
            local.get 0
            i32.store
            local.get 0
            local.get 4
            i32.store offset=24
            local.get 0
            local.get 0
            i32.store offset=12
            local.get 0
            local.get 0
            i32.store offset=8
            return
          end
          local.get 4
          i32.load offset=8
          local.tee 1
          local.get 0
          i32.store offset=12
          local.get 4
          local.get 0
          i32.store offset=8
          local.get 0
          i32.const 0
          i32.store offset=24
          local.get 0
          local.get 4
          i32.store offset=12
          local.get 0
          local.get 1
          i32.store offset=8
        end
      )
      (func $posix_memalign (;23;) (type 2) (param i32 i32 i32) (result i32)
        (local i32 i32)
        block ;; label = @1
          block ;; label = @2
            block ;; label = @3
              local.get 1
              i32.const 16
              i32.ne
              br_if 0 (;@3;)
              local.get 2
              call $dlmalloc
              local.set 1
              br 1 (;@2;)
            end
            i32.const 28
            local.set 3
            local.get 1
            i32.const 3
            i32.and
            br_if 1 (;@1;)
            local.get 1
            i32.const 2
            i32.shr_u
            local.tee 4
            i32.eqz
            br_if 1 (;@1;)
            local.get 4
            i32.popcnt
            i32.const 1
            i32.gt_u
            br_if 1 (;@1;)
            block ;; label = @3
              local.get 2
              i32.const -64
              local.get 1
              i32.sub
              i32.le_u
              br_if 0 (;@3;)
              i32.const 48
              return
            end
            local.get 1
            i32.const 16
            local.get 1
            i32.const 16
            i32.gt_u
            select
            local.get 2
            call $internal_memalign
            local.set 1
          end
          block ;; label = @2
            local.get 1
            br_if 0 (;@2;)
            i32.const 48
            return
          end
          local.get 0
          local.get 1
          i32.store
          i32.const 0
          local.set 3
        end
        local.get 3
      )
      (func $internal_memalign (;24;) (type 0) (param i32 i32) (result i32)
        (local i32 i32 i32 i32 i32)
        block ;; label = @1
          block ;; label = @2
            local.get 0
            i32.const 16
            local.get 0
            i32.const 16
            i32.gt_u
            select
            local.tee 2
            local.get 2
            i32.const -1
            i32.add
            i32.and
            br_if 0 (;@2;)
            local.get 2
            local.set 0
            br 1 (;@1;)
          end
          i32.const 32
          local.set 3
          loop ;; label = @2
            local.get 3
            local.tee 0
            i32.const 1
            i32.shl
            local.set 3
            local.get 0
            local.get 2
            i32.lt_u
            br_if 0 (;@2;)
          end
        end
        block ;; label = @1
          local.get 1
          i32.const -64
          local.get 0
          i32.sub
          i32.lt_u
          br_if 0 (;@1;)
          global.get $GOT.data.internal.errno
          i32.const 48
          i32.store
          i32.const 0
          return
        end
        block ;; label = @1
          local.get 0
          i32.const 16
          local.get 1
          i32.const 19
          i32.add
          i32.const -16
          i32.and
          local.get 1
          i32.const 11
          i32.lt_u
          select
          local.tee 1
          i32.add
          i32.const 12
          i32.add
          call $dlmalloc
          local.tee 3
          br_if 0 (;@1;)
          i32.const 0
          return
        end
        local.get 3
        i32.const -8
        i32.add
        local.set 2
        block ;; label = @1
          block ;; label = @2
            local.get 0
            i32.const -1
            i32.add
            local.get 3
            i32.and
            br_if 0 (;@2;)
            local.get 2
            local.set 0
            br 1 (;@1;)
          end
          local.get 3
          i32.const -4
          i32.add
          local.tee 4
          i32.load
          local.tee 5
          i32.const -8
          i32.and
          local.get 3
          local.get 0
          i32.add
          i32.const -1
          i32.add
          i32.const 0
          local.get 0
          i32.sub
          i32.and
          i32.const -8
          i32.add
          local.tee 3
          i32.const 0
          local.get 0
          local.get 3
          local.get 2
          i32.sub
          i32.const 15
          i32.gt_u
          select
          i32.add
          local.tee 0
          local.get 2
          i32.sub
          local.tee 3
          i32.sub
          local.set 6
          block ;; label = @2
            local.get 5
            i32.const 3
            i32.and
            br_if 0 (;@2;)
            local.get 0
            local.get 6
            i32.store offset=4
            local.get 0
            local.get 2
            i32.load
            local.get 3
            i32.add
            i32.store
            br 1 (;@1;)
          end
          local.get 0
          local.get 6
          local.get 0
          i32.load offset=4
          i32.const 1
          i32.and
          i32.or
          i32.const 2
          i32.or
          i32.store offset=4
          local.get 0
          local.get 6
          i32.add
          local.tee 6
          local.get 6
          i32.load offset=4
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 4
          local.get 3
          local.get 4
          i32.load
          i32.const 1
          i32.and
          i32.or
          i32.const 2
          i32.or
          i32.store
          local.get 2
          local.get 3
          i32.add
          local.tee 6
          local.get 6
          i32.load offset=4
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 2
          local.get 3
          call $dispose_chunk
        end
        block ;; label = @1
          local.get 0
          i32.load offset=4
          local.tee 3
          i32.const 3
          i32.and
          i32.eqz
          br_if 0 (;@1;)
          local.get 3
          i32.const -8
          i32.and
          local.tee 2
          local.get 1
          i32.const 16
          i32.add
          i32.le_u
          br_if 0 (;@1;)
          local.get 0
          local.get 1
          local.get 3
          i32.const 1
          i32.and
          i32.or
          i32.const 2
          i32.or
          i32.store offset=4
          local.get 0
          local.get 1
          i32.add
          local.tee 3
          local.get 2
          local.get 1
          i32.sub
          local.tee 1
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 0
          local.get 2
          i32.add
          local.tee 2
          local.get 2
          i32.load offset=4
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 3
          local.get 1
          call $dispose_chunk
        end
        local.get 0
        i32.const 8
        i32.add
      )
      (func $__component_type_object_force_link_wasip2 (;25;) (type 1))
      (data $.data (;0;) (i32.const 1048576) "\01\00\00\00\01\00\00\00\02\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00")
      (@producers
        (language "Rust" "")
        (language "C11" "")
        (processed-by "rustc" "1.97.0-nightly (7c3c88f42 2026-05-14)")
        (processed-by "clang" "22.1.0-wasi-sdk (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)")
        (processed-by "wit-component" "0.245.1")
        (processed-by "wit-bindgen-rust" "0.57.1")
        (processed-by "wit-bindgen-c" "0.53.1")
      )
      (@custom "target_features" (after data) "\09+\0bbulk-memory+\0fbulk-memory-opt+\16call-indirect-overlong+\0eextended-const+\0amultivalue+\0fmutable-globals+\13nontrapping-fptoint+\0freference-types+\08sign-ext")
    )
    (type (;1;) (enum "add"))
    (alias export $docs:adder/add@0.1.0 "add" (func $add (;0;)))
    (core func $add (;0;) (canon lower (func $add)))
    (core instance $docs:adder/add@0.1.0 (;0;)
      (export "add" (func $add))
    )
    (core instance $main (;1;) (instantiate $main
        (with "docs:adder/add@0.1.0" (instance $docs:adder/add@0.1.0))
      )
    )
    (alias core export $main "memory" (core memory $memory (;0;)))
    (type (;2;) (func (param "op" 1) (param "x" u32) (param "y" u32) (result u32)))
    (alias core export $main "docs:calculator/calculate@0.1.0#eval-expression" (core func $docs:calculator/calculate@0.1.0#eval-expression (;1;)))
    (alias core export $main "cabi_realloc" (core func $cabi_realloc (;2;)))
    (func $eval-expression (;1;) (type 2) (canon lift (core func $docs:calculator/calculate@0.1.0#eval-expression)))
    (component $docs:calculator/calculate@0.1.0-shim-component (;0;)
      (type (;0;) (enum "add"))
      (import "import-type-op" (type (;1;) (eq 0)))
      (type (;2;) (func (param "op" 1) (param "x" u32) (param "y" u32) (result u32)))
      (import "import-func-eval-expression" (func (;0;) (type 2)))
      (type (;3;) (enum "add"))
      (export (;4;) "op" (type 3))
      (type (;5;) (func (param "op" 4) (param "x" u32) (param "y" u32) (result u32)))
      (export (;1;) "eval-expression" (func 0) (func (type 5)))
    )
    (instance $docs:calculator/calculate@0.1.0-shim-instance (;1;) (instantiate $docs:calculator/calculate@0.1.0-shim-component
        (with "import-func-eval-expression" (func $eval-expression))
        (with "import-type-op" (type 1))
      )
    )
    (export $docs:calculator/calculate@0.1.0 (;2;) "docs:calculator/calculate@0.1.0" (instance $docs:calculator/calculate@0.1.0-shim-instance))
    (@producers
      (processed-by "wit-component" "0.246.2")
    )
  )
  (instance $calculator (;2;) (instantiate 1
      (with "docs:adder/add@0.1.0" (instance 1))
    )
  )
  (alias export $calculator "docs:calculator/calculate@0.1.0" (instance (;3;)))
  (export (;4;) "docs:calculator/calculate@0.1.0" (instance 3))
  (@producers
    (processed-by "wac-parser" "0.9.0")
  )
)
