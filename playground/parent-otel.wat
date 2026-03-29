(component
  (type $ty-wasi:otel/types@0.2.0-rc.1 (;0;)
    (instance
      (type (;0;) string)
      (export (;1;) "key" (type (eq 0)))
      (type (;2;) string)
      (export (;3;) "value" (type (eq 2)))
      (type (;4;) (record (field "key" 1) (field "value" 3)))
      (export (;5;) "key-value" (type (eq 4)))
      (type (;6;) (option string))
      (type (;7;) (list 5))
      (type (;8;) (record (field "name" string) (field "version" 6) (field "schema-url" 6) (field "attributes" 7)))
      (export (;9;) "instrumentation-scope" (type (eq 8)))
    )
  )
  (import "wasi:otel/types@0.2.0-rc.1" (instance $wasi:otel/types@0.2.0-rc.1 (;0;) (type $ty-wasi:otel/types@0.2.0-rc.1)))
  (type $ty-wasi:clocks/wall-clock@0.2.6 (;1;)
    (instance
      (type (;0;) (record (field "seconds" u64) (field "nanoseconds" u32)))
      (export (;1;) "datetime" (type (eq 0)))
      (type (;2;) (func (result 1)))
      (export (;0;) "now" (func (type 2)))
    )
  )
  (import "wasi:clocks/wall-clock@0.2.6" (instance $wasi:clocks/wall-clock@0.2.6 (;1;) (type $ty-wasi:clocks/wall-clock@0.2.6)))
  (alias export $wasi:clocks/wall-clock@0.2.6 "datetime" (type $datetime (;2;)))
  (alias export $wasi:otel/types@0.2.0-rc.1 "key-value" (type $key-value (;3;)))
  (alias export $wasi:otel/types@0.2.0-rc.1 "instrumentation-scope" (type $instrumentation-scope (;4;)))
  (type $ty-wasi:otel/tracing@0.2.0-rc.1 (;5;)
    (instance
      (type (;0;) string)
      (export (;1;) "trace-id" (type (eq 0)))
      (type (;2;) string)
      (export (;3;) "span-id" (type (eq 2)))
      (type (;4;) (flags "sampled"))
      (export (;5;) "trace-flags" (type (eq 4)))
      (type (;6;) (tuple string string))
      (type (;7;) (list 6))
      (export (;8;) "trace-state" (type (eq 7)))
      (type (;9;) (record (field "trace-id" 1) (field "span-id" 3) (field "trace-flags" 5) (field "is-remote" bool) (field "trace-state" 8)))
      (export (;10;) "span-context" (type (eq 9)))
      (type (;11;) (enum "client" "server" "producer" "consumer" "internal"))
      (export (;12;) "span-kind" (type (eq 11)))
      (alias outer 1 $datetime (type (;13;)))
      (export (;14;) "datetime" (type (eq 13)))
      (alias outer 1 $key-value (type (;15;)))
      (export (;16;) "key-value" (type (eq 15)))
      (type (;17;) (list 16))
      (type (;18;) (record (field "name" string) (field "time" 14) (field "attributes" 17)))
      (export (;19;) "event" (type (eq 18)))
      (type (;20;) (record (field "span-context" 10) (field "attributes" 17)))
      (export (;21;) "link" (type (eq 20)))
      (type (;22;) (variant (case "unset") (case "ok") (case "error" string)))
      (export (;23;) "status" (type (eq 22)))
      (alias outer 1 $instrumentation-scope (type (;24;)))
      (export (;25;) "instrumentation-scope" (type (eq 24)))
      (type (;26;) (list 19))
      (type (;27;) (list 21))
      (type (;28;) (record (field "span-context" 10) (field "parent-span-id" string) (field "span-kind" 12) (field "name" string) (field "start-time" 14) (field "end-time" 14) (field "attributes" 17) (field "events" 26) (field "links" 27) (field "status" 23) (field "instrumentation-scope" 25) (field "dropped-attributes" u32) (field "dropped-events" u32) (field "dropped-links" u32)))
      (export (;29;) "span-data" (type (eq 28)))
      (type (;30;) (func (param "context" 10)))
      (export (;0;) "on-start" (func (type 30)))
      (type (;31;) (func (param "span" 29)))
      (export (;1;) "on-end" (func (type 31)))
      (type (;32;) (func (result 10)))
      (export (;2;) "outer-span-context" (func (type 32)))
    )
  )
  (import "wasi:otel/tracing@0.2.0-rc.1" (instance $wasi:otel/tracing@0.2.0-rc.1 (;2;) (type $ty-wasi:otel/tracing@0.2.0-rc.1)))
  (type $ty-wasi:random/random@0.2.10 (;6;)
    (instance
      (type (;0;) (func (result u64)))
      (export (;0;) "get-random-u64" (func (type 0)))
    )
  )
  (import "wasi:random/random@0.2.10" (instance $wasi:random/random@0.2.10 (;3;) (type $ty-wasi:random/random@0.2.10)))
  (type $ty-nebula:playground/logging (;7;)
    (instance
      (type (;0;) (func (param "msg" string)))
      (export (;0;) "log" (func (type 0)))
    )
  )
  (import "nebula:playground/logging" (instance $nebula:playground/logging (;4;) (type $ty-nebula:playground/logging)))
  (type $ty-wasi:io/poll@0.2.6 (;8;)
    (instance
      (export (;0;) "pollable" (type (sub resource)))
      (type (;1;) (borrow 0))
      (type (;2;) (func (param "self" 1)))
      (export (;0;) "[method]pollable.block" (func (type 2)))
    )
  )
  (import "wasi:io/poll@0.2.6" (instance $wasi:io/poll@0.2.6 (;5;) (type $ty-wasi:io/poll@0.2.6)))
  (type $ty-wasi:io/error@0.2.6 (;9;)
    (instance
      (export (;0;) "error" (type (sub resource)))
    )
  )
  (import "wasi:io/error@0.2.6" (instance $wasi:io/error@0.2.6 (;6;) (type $ty-wasi:io/error@0.2.6)))
  (alias export $wasi:io/error@0.2.6 "error" (type $error (;10;)))
  (alias export $wasi:io/poll@0.2.6 "pollable" (type $pollable (;11;)))
  (type $ty-wasi:io/streams@0.2.6 (;12;)
    (instance
      (export (;0;) "input-stream" (type (sub resource)))
      (export (;1;) "output-stream" (type (sub resource)))
      (alias outer 1 $error (type (;2;)))
      (export (;3;) "error" (type (eq 2)))
      (type (;4;) (own 3))
      (type (;5;) (variant (case "last-operation-failed" 4) (case "closed")))
      (export (;6;) "stream-error" (type (eq 5)))
      (alias outer 1 $pollable (type (;7;)))
      (export (;8;) "pollable" (type (eq 7)))
      (type (;9;) (borrow 1))
      (type (;10;) (result u64 (error 6)))
      (type (;11;) (func (param "self" 9) (result 10)))
      (export (;0;) "[method]output-stream.check-write" (func (type 11)))
      (type (;12;) (list u8))
      (type (;13;) (result (error 6)))
      (type (;14;) (func (param "self" 9) (param "contents" 12) (result 13)))
      (export (;1;) "[method]output-stream.write" (func (type 14)))
      (type (;15;) (func (param "self" 9) (result 13)))
      (export (;2;) "[method]output-stream.blocking-flush" (func (type 15)))
      (type (;16;) (own 8))
      (type (;17;) (func (param "self" 9) (result 16)))
      (export (;3;) "[method]output-stream.subscribe" (func (type 17)))
    )
  )
  (import "wasi:io/streams@0.2.6" (instance $wasi:io/streams@0.2.6 (;7;) (type $ty-wasi:io/streams@0.2.6)))
  (type $ty-wasi:cli/environment@0.2.6 (;13;)
    (instance
      (type (;0;) (tuple string string))
      (type (;1;) (list 0))
      (type (;2;) (func (result 1)))
      (export (;0;) "get-environment" (func (type 2)))
    )
  )
  (import "wasi:cli/environment@0.2.6" (instance $wasi:cli/environment@0.2.6 (;8;) (type $ty-wasi:cli/environment@0.2.6)))
  (type $ty-wasi:cli/exit@0.2.6 (;14;)
    (instance
      (type (;0;) (result))
      (type (;1;) (func (param "status" 0)))
      (export (;0;) "exit" (func (type 1)))
    )
  )
  (import "wasi:cli/exit@0.2.6" (instance $wasi:cli/exit@0.2.6 (;9;) (type $ty-wasi:cli/exit@0.2.6)))
  (alias export $wasi:io/streams@0.2.6 "input-stream" (type $input-stream (;15;)))
  (type $ty-wasi:cli/stdin@0.2.6 (;16;)
    (instance
      (alias outer 1 $input-stream (type (;0;)))
      (export (;1;) "input-stream" (type (eq 0)))
      (type (;2;) (own 1))
      (type (;3;) (func (result 2)))
      (export (;0;) "get-stdin" (func (type 3)))
    )
  )
  (import "wasi:cli/stdin@0.2.6" (instance $wasi:cli/stdin@0.2.6 (;10;) (type $ty-wasi:cli/stdin@0.2.6)))
  (alias export $wasi:io/streams@0.2.6 "output-stream" (type $output-stream (;17;)))
  (type $ty-wasi:cli/stdout@0.2.6 (;18;)
    (instance
      (alias outer 1 $output-stream (type (;0;)))
      (export (;1;) "output-stream" (type (eq 0)))
      (type (;2;) (own 1))
      (type (;3;) (func (result 2)))
      (export (;0;) "get-stdout" (func (type 3)))
    )
  )
  (import "wasi:cli/stdout@0.2.6" (instance $wasi:cli/stdout@0.2.6 (;11;) (type $ty-wasi:cli/stdout@0.2.6)))
  (alias export $wasi:io/streams@0.2.6 "output-stream" (type $"#type19 output-stream" (@name "output-stream") (;19;)))
  (type $ty-wasi:cli/stderr@0.2.6 (;20;)
    (instance
      (alias outer 1 $"#type19 output-stream" (type (;0;)))
      (export (;1;) "output-stream" (type (eq 0)))
      (type (;2;) (own 1))
      (type (;3;) (func (result 2)))
      (export (;0;) "get-stderr" (func (type 3)))
    )
  )
  (import "wasi:cli/stderr@0.2.6" (instance $wasi:cli/stderr@0.2.6 (;12;) (type $ty-wasi:cli/stderr@0.2.6)))
  (type $ty-wasi:cli/terminal-input@0.2.6 (;21;)
    (instance
      (export (;0;) "terminal-input" (type (sub resource)))
    )
  )
  (import "wasi:cli/terminal-input@0.2.6" (instance $wasi:cli/terminal-input@0.2.6 (;13;) (type $ty-wasi:cli/terminal-input@0.2.6)))
  (type $ty-wasi:cli/terminal-output@0.2.6 (;22;)
    (instance
      (export (;0;) "terminal-output" (type (sub resource)))
    )
  )
  (import "wasi:cli/terminal-output@0.2.6" (instance $wasi:cli/terminal-output@0.2.6 (;14;) (type $ty-wasi:cli/terminal-output@0.2.6)))
  (alias export $wasi:cli/terminal-input@0.2.6 "terminal-input" (type $terminal-input (;23;)))
  (type $ty-wasi:cli/terminal-stdin@0.2.6 (;24;)
    (instance
      (alias outer 1 $terminal-input (type (;0;)))
      (export (;1;) "terminal-input" (type (eq 0)))
      (type (;2;) (own 1))
      (type (;3;) (option 2))
      (type (;4;) (func (result 3)))
      (export (;0;) "get-terminal-stdin" (func (type 4)))
    )
  )
  (import "wasi:cli/terminal-stdin@0.2.6" (instance $wasi:cli/terminal-stdin@0.2.6 (;15;) (type $ty-wasi:cli/terminal-stdin@0.2.6)))
  (alias export $wasi:cli/terminal-output@0.2.6 "terminal-output" (type $terminal-output (;25;)))
  (type $ty-wasi:cli/terminal-stdout@0.2.6 (;26;)
    (instance
      (alias outer 1 $terminal-output (type (;0;)))
      (export (;1;) "terminal-output" (type (eq 0)))
      (type (;2;) (own 1))
      (type (;3;) (option 2))
      (type (;4;) (func (result 3)))
      (export (;0;) "get-terminal-stdout" (func (type 4)))
    )
  )
  (import "wasi:cli/terminal-stdout@0.2.6" (instance $wasi:cli/terminal-stdout@0.2.6 (;16;) (type $ty-wasi:cli/terminal-stdout@0.2.6)))
  (alias export $wasi:cli/terminal-output@0.2.6 "terminal-output" (type $"#type27 terminal-output" (@name "terminal-output") (;27;)))
  (type $ty-wasi:cli/terminal-stderr@0.2.6 (;28;)
    (instance
      (alias outer 1 $"#type27 terminal-output" (type (;0;)))
      (export (;1;) "terminal-output" (type (eq 0)))
      (type (;2;) (own 1))
      (type (;3;) (option 2))
      (type (;4;) (func (result 3)))
      (export (;0;) "get-terminal-stderr" (func (type 4)))
    )
  )
  (import "wasi:cli/terminal-stderr@0.2.6" (instance $wasi:cli/terminal-stderr@0.2.6 (;17;) (type $ty-wasi:cli/terminal-stderr@0.2.6)))
  (core module $main (;0;)
    (type (;0;) (func (param i32)))
    (type (;1;) (func (param i32 i32)))
    (type (;2;) (func (param i32 i32 i32 i32)))
    (type (;3;) (func (param i32 i32 i32) (result i32)))
    (type (;4;) (func (param i32 i32) (result i32)))
    (type (;5;) (func (param i32 i32 i32 i32) (result i32)))
    (type (;6;) (func (result i64)))
    (type (;7;) (func (param i32 i32 i32 i32 i32 i32 i32 i32)))
    (type (;8;) (func (param i32) (result i32)))
    (type (;9;) (func (result i32)))
    (type (;10;) (func))
    (type (;11;) (func (param i32 i32 i32)))
    (type (;12;) (func (param i32 i32 i32 i32 i32 i32)))
    (type (;13;) (func (param i32 i32 i32 i32 i32)))
    (type (;14;) (func (param i32 i32 i32 i32 i32 i32) (result i32)))
    (type (;15;) (func (param i32 i32 i32 i32 i32) (result i32)))
    (import "wasi:otel/tracing@0.2.0-rc.1" "outer-span-context" (func $_RNvNvNtNtNtCseVMFSoU3xto_6parent4wasi4otel7tracing18outer_span_context11wit_import1 (;0;) (type 0)))
    (import "wasi:random/random@0.2.10" "get-random-u64" (func $_RNvNvNtNtNtCseVMFSoU3xto_6parent4wasi6random6random14get_random_u6411wit_import0 (;1;) (type 6)))
    (import "wasi:otel/tracing@0.2.0-rc.1" "on-start" (func $_RNvNvNtNtNtCseVMFSoU3xto_6parent4wasi4otel7tracing8on_start11wit_import8 (;2;) (type 7)))
    (import "nebula:playground/logging" "log" (func $_RNvNvNtNtNtCseVMFSoU3xto_6parent6nebula10playground7logging3log11wit_import1 (;3;) (type 1)))
    (import "wasi:clocks/wall-clock@0.2.0" "now" (func $_RNvNvNtNtNtCseVMFSoU3xto_6parent4wasi6clocks10wall_clock3now11wit_import1 (;4;) (type 0)))
    (import "wasi:otel/tracing@0.2.0-rc.1" "on-end" (func $_RNvNvNtNtNtCseVMFSoU3xto_6parent4wasi4otel7tracing6on_end12wit_import49 (;5;) (type 0)))
    (import "wasi:io/error@0.2.0" "[resource-drop]error" (func $__wasm_import_io_error_error_drop (;6;) (type 0)))
    (import "wasi:io/poll@0.2.0" "[resource-drop]pollable" (func $__wasm_import_poll_pollable_drop (;7;) (type 0)))
    (import "wasi:io/streams@0.2.0" "[resource-drop]input-stream" (func $__wasm_import_streams_input_stream_drop (;8;) (type 0)))
    (import "wasi:io/streams@0.2.0" "[resource-drop]output-stream" (func $__wasm_import_streams_output_stream_drop (;9;) (type 0)))
    (import "wasi:cli/terminal-input@0.2.0" "[resource-drop]terminal-input" (func $__wasm_import_terminal_input_terminal_input_drop (;10;) (type 0)))
    (import "wasi:cli/terminal-output@0.2.0" "[resource-drop]terminal-output" (func $__wasm_import_terminal_output_terminal_output_drop (;11;) (type 0)))
    (import "wasi:cli/environment@0.2.0" "get-environment" (func $__wasm_import_environment_get_environment (;12;) (type 0)))
    (import "wasi:cli/exit@0.2.0" "exit" (func $__wasm_import_exit_exit (;13;) (type 0)))
    (import "wasi:io/poll@0.2.0" "[method]pollable.block" (func $__wasm_import_poll_method_pollable_block (;14;) (type 0)))
    (import "wasi:io/streams@0.2.0" "[method]output-stream.check-write" (func $__wasm_import_streams_method_output_stream_check_write (;15;) (type 1)))
    (import "wasi:io/streams@0.2.0" "[method]output-stream.write" (func $__wasm_import_streams_method_output_stream_write (;16;) (type 2)))
    (import "wasi:io/streams@0.2.0" "[method]output-stream.blocking-flush" (func $__wasm_import_streams_method_output_stream_blocking_flush (;17;) (type 1)))
    (import "wasi:io/streams@0.2.0" "[method]output-stream.subscribe" (func $__wasm_import_streams_method_output_stream_subscribe (;18;) (type 8)))
    (import "wasi:cli/stdin@0.2.0" "get-stdin" (func $__wasm_import_stdin_get_stdin (;19;) (type 9)))
    (import "wasi:cli/stdout@0.2.0" "get-stdout" (func $__wasm_import_stdout_get_stdout (;20;) (type 9)))
    (import "wasi:cli/stderr@0.2.0" "get-stderr" (func $__wasm_import_stderr_get_stderr (;21;) (type 9)))
    (import "wasi:cli/terminal-stdin@0.2.0" "get-terminal-stdin" (func $__wasm_import_terminal_stdin_get_terminal_stdin (;22;) (type 0)))
    (import "wasi:cli/terminal-stdout@0.2.0" "get-terminal-stdout" (func $__wasm_import_terminal_stdout_get_terminal_stdout (;23;) (type 0)))
    (import "wasi:cli/terminal-stderr@0.2.0" "get-terminal-stderr" (func $__wasm_import_terminal_stderr_get_terminal_stderr (;24;) (type 0)))
    (table (;0;) 67 67 funcref)
    (memory (;0;) 17)
    (global $__stack_pointer (;0;) (mut i32) i32.const 1048576)
    (global $GOT.func.internal._RNvXsC_NtNtCs2GenDSTXHQd_4core3fmt3numyNtB7_8LowerHex3fmt (;1;) i32 i32.const 1)
    (global $GOT.data.internal.__memory_base (;2;) i32 i32.const 0)
    (global $GOT.data.internal._RNvNtCsfH5l96bTt9G_3std5alloc4HOOK (;3;) i32 i32.const 1051632)
    (global $GOT.func.internal._RNvNtCsfH5l96bTt9G_3std5alloc24default_alloc_error_hook (;4;) i32 i32.const 3)
    (global $GOT.data.internal._RNvNtCsfH5l96bTt9G_3std9panicking4HOOK (;5;) i32 i32.const 1051640)
    (global $GOT.data.internal.__table_base (;6;) i32 i32.const 1)
    (global $GOT.data.internal._RNvNtNtNtCsfH5l96bTt9G_3std6thread7current2id2ID (;7;) i32 i32.const 1051672)
    (global $GOT.func.internal._RNvXsd_NtNtNtCs2GenDSTXHQd_4core3fmt3num3impyNtB9_7Display3fmt (;8;) i32 i32.const 7)
    (global $GOT.func.internal._RNvXs8_NtNtNtCs2GenDSTXHQd_4core3fmt3num3impmNtB9_7Display3fmt (;9;) i32 i32.const 8)
    (global $GOT.func.internal._RNvXsi_NtNtNtCs2GenDSTXHQd_4core3fmt3num3impjNtB9_7Display3fmt (;10;) i32 i32.const 8)
    (global $GOT.data.internal._RNvNtNtCsfH5l96bTt9G_3std6thread7current7CURRENT (;11;) i32 i32.const 1051664)
    (global $GOT.data.internal._RNvNCNvNvNtNtNtCsfH5l96bTt9G_3std4sync4mpmc5waker17current_thread_id5DUMMY023___RUST_STD_INTERNAL_VAL (;12;) i32 i32.const 1050213)
    (global $GOT.func.internal._RNvXNvMNtNtCsfH5l96bTt9G_3std3sys9backtraceNtB5_13BacktraceLock5printNtB2_16DisplayBacktraceNtNtCs2GenDSTXHQd_4core3fmt7Display3fmt (;13;) i32 i32.const 10)
    (global $GOT.data.internal.errno (;14;) i32 i32.const 1051692)
    (global $GOT.data.internal._RNvNtNtCsfH5l96bTt9G_3std9panicking11panic_count18GLOBAL_PANIC_COUNT (;15;) i32 i32.const 1051668)
    (global $GOT.data.internal.__wasilibc_environ (;16;) i32 i32.const 1051428)
    (global $GOT.data.internal.__heap_base (;17;) i32 i32.const 1052224)
    (global $GOT.data.internal.__heap_end (;18;) i32 i32.const 1114112)
    (global $GOT.func.internal._RNvXs8_NtCs2GenDSTXHQd_4core3fmtNtB5_9ArgumentsNtB5_7Display3fmt (;19;) i32 i32.const 64)
    (export "memory" (memory 0))
    (export "nebula:playground/logging#log" (func $nebula:playground/logging#log))
    (export "cabi_realloc" (func $cabi_realloc))
    (elem (;0;) (i32.const 1) func $_RNvXsC_NtNtCs2GenDSTXHQd_4core3fmt3numyNtB7_8LowerHex3fmt $_RNvCseVMFSoU3xto_6parent40___link_custom_section_describing_imports $_RNvNtCsfH5l96bTt9G_3std5alloc24default_alloc_error_hook $_RNvXs1i_NtCs2GenDSTXHQd_4core3fmtReNtB6_7Display3fmtCsfH5l96bTt9G_3std $_RNvXs1i_NtCs2GenDSTXHQd_4core3fmtRNtNtNtB8_5panic8location8LocationNtB6_7Display3fmtCsfH5l96bTt9G_3std $_RNvXs1j_NtCs2GenDSTXHQd_4core3fmtQDNtNtB8_5panic12PanicPayloadEL_NtB6_7Display3fmtCsfH5l96bTt9G_3std $_RNvXsd_NtNtNtCs2GenDSTXHQd_4core3fmt3num3impyNtB9_7Display3fmt $_RNvXs8_NtNtNtCs2GenDSTXHQd_4core3fmt3num3impmNtB9_7Display3fmt $_RNvYNtNtNtNtCsfH5l96bTt9G_3std3sys5stdio4unix6StderrNtNtBa_2io5Write9write_fmtBa_ $_RNvXNvMNtNtCsfH5l96bTt9G_3std3sys9backtraceNtB5_13BacktraceLock5printNtB2_16DisplayBacktraceNtNtCs2GenDSTXHQd_4core3fmt7Display3fmt $cabi_realloc $_RNvXs1g_NtCs2GenDSTXHQd_4core3fmtRbNtB6_5Debug3fmtCsfH5l96bTt9G_3std $_RINvNtCs2GenDSTXHQd_4core3ptr13drop_in_placeINtNvNtCsfH5l96bTt9G_3std2io17default_write_fmt7AdapterINtNtBL_6cursor6CursorQShEEEBN_ $_RNvXNvNtCsfH5l96bTt9G_3std2io17default_write_fmtINtB2_7AdapterINtNtB4_6cursor6CursorQShEENtNtCs2GenDSTXHQd_4core3fmt5Write9write_strB6_ $_RNvYINtNvNtCsfH5l96bTt9G_3std2io17default_write_fmt7AdapterINtNtB7_6cursor6CursorQShEENtNtCs2GenDSTXHQd_4core3fmt5Write10write_charB9_ $_RNvYINtNvNtCsfH5l96bTt9G_3std2io17default_write_fmt7AdapterINtNtB7_6cursor6CursorQShEENtNtCs2GenDSTXHQd_4core3fmt5Write9write_fmtB9_ $_RNvXNvNtCsfH5l96bTt9G_3std2io17default_write_fmtINtB2_7AdapterINtNtCsblnovvQk4nh_5alloc3vec3VechEENtNtCs2GenDSTXHQd_4core3fmt5Write9write_strB6_ $_RNvYINtNvNtCsfH5l96bTt9G_3std2io17default_write_fmt7AdapterINtNtCsblnovvQk4nh_5alloc3vec3VechEENtNtCs2GenDSTXHQd_4core3fmt5Write10write_charB9_ $_RNvYINtNvNtCsfH5l96bTt9G_3std2io17default_write_fmt7AdapterINtNtCsblnovvQk4nh_5alloc3vec3VechEENtNtCs2GenDSTXHQd_4core3fmt5Write9write_fmtB9_ $_RNvXNvNtCsfH5l96bTt9G_3std2io17default_write_fmtINtB2_7AdapterNtNtNtNtB6_3sys5stdio4unix6StderrENtNtCs2GenDSTXHQd_4core3fmt5Write9write_strB6_ $_RNvYINtNvNtCsfH5l96bTt9G_3std2io17default_write_fmt7AdapterNtNtNtNtB9_3sys5stdio4unix6StderrENtNtCs2GenDSTXHQd_4core3fmt5Write10write_charB9_ $_RNvYINtNvNtCsfH5l96bTt9G_3std2io17default_write_fmt7AdapterNtNtNtNtB9_3sys5stdio4unix6StderrENtNtCs2GenDSTXHQd_4core3fmt5Write9write_fmtB9_ $_RINvNtCs2GenDSTXHQd_4core3ptr13drop_in_placeNtNtCsblnovvQk4nh_5alloc6string6StringECsfH5l96bTt9G_3std $_RNvXsZ_NtCsblnovvQk4nh_5alloc6stringNtB5_6StringNtNtCs2GenDSTXHQd_4core3fmt5Write9write_str $_RNvXsZ_NtCsblnovvQk4nh_5alloc6stringNtB5_6StringNtNtCs2GenDSTXHQd_4core3fmt5Write10write_char $_RNvYNtNtCsblnovvQk4nh_5alloc6string6StringNtNtCs2GenDSTXHQd_4core3fmt5Write9write_fmtCsfH5l96bTt9G_3std $_RNvXs2_NvNtCsfH5l96bTt9G_3std9panicking13panic_handlerNtB5_16StaticStrPayloadNtNtCs2GenDSTXHQd_4core3fmt7Display3fmt $_RNvXs1_NvNtCsfH5l96bTt9G_3std9panicking13panic_handlerNtB5_16StaticStrPayloadNtNtCs2GenDSTXHQd_4core5panic12PanicPayload8take_box $_RNvXs1_NvNtCsfH5l96bTt9G_3std9panicking13panic_handlerNtB5_16StaticStrPayloadNtNtCs2GenDSTXHQd_4core5panic12PanicPayload3get $_RNvXs1_NvNtCsfH5l96bTt9G_3std9panicking13panic_handlerNtB5_16StaticStrPayloadNtNtCs2GenDSTXHQd_4core5panic12PanicPayload6as_str $_RINvNtCs2GenDSTXHQd_4core3ptr13drop_in_placeNtNvNtCsfH5l96bTt9G_3std9panicking13panic_handler19FormatStringPayloadEBM_ $_RNvXs0_NvNtCsfH5l96bTt9G_3std9panicking13panic_handlerNtB5_19FormatStringPayloadNtNtCs2GenDSTXHQd_4core3fmt7Display3fmt $_RNvXs_NvNtCsfH5l96bTt9G_3std9panicking13panic_handlerNtB4_19FormatStringPayloadNtNtCs2GenDSTXHQd_4core5panic12PanicPayload8take_box $_RNvXs_NvNtCsfH5l96bTt9G_3std9panicking13panic_handlerNtB4_19FormatStringPayloadNtNtCs2GenDSTXHQd_4core5panic12PanicPayload3get $_RNvYINtNvNtCsfH5l96bTt9G_3std9panicking11begin_panic7PayloadReENtNtCs2GenDSTXHQd_4core5panic12PanicPayload6as_strB9_ $_RNvXs3_NtNtNtCsfH5l96bTt9G_3std3sys5stdio4unixNtB5_6StderrNtNtBb_2io5Write5write $_RNvXs3_NtNtNtCsfH5l96bTt9G_3std3sys5stdio4unixNtB5_6StderrNtNtBb_2io5Write14write_vectored $_RNvXs3_NtNtNtCsfH5l96bTt9G_3std3sys5stdio4unixNtB5_6StderrNtNtBb_2io5Write17is_write_vectored $_RNvXs3_NtNtNtCsfH5l96bTt9G_3std3sys5stdio4unixNtB5_6StderrNtNtBb_2io5Write5flush $_RNvYNtNtNtNtCsfH5l96bTt9G_3std3sys5stdio4unix6StderrNtNtBa_2io5Write9write_allBa_ $_RNvYNtNtNtNtCsfH5l96bTt9G_3std3sys5stdio4unix6StderrNtNtBa_2io5Write18write_all_vectoredBa_ $_RINvNtCs2GenDSTXHQd_4core3ptr13drop_in_placeINtNtCsblnovvQk4nh_5alloc3vec3VechEECsfH5l96bTt9G_3std $_RNvXs9_NtNtCsfH5l96bTt9G_3std2io5implsINtNtCsblnovvQk4nh_5alloc3vec3VechENtB7_5Write5writeB9_ $_RNvXs9_NtNtCsfH5l96bTt9G_3std2io5implsINtNtCsblnovvQk4nh_5alloc3vec3VechENtB7_5Write14write_vectoredB9_ $_RNvXs9_NtNtCsfH5l96bTt9G_3std2io5implsINtNtCsblnovvQk4nh_5alloc3vec3VechENtB7_5Write17is_write_vectoredB9_ $_RNvXs9_NtNtCsfH5l96bTt9G_3std2io5implsINtNtCsblnovvQk4nh_5alloc3vec3VechENtB7_5Write5flushB9_ $_RNvXs9_NtNtCsfH5l96bTt9G_3std2io5implsINtNtCsblnovvQk4nh_5alloc3vec3VechENtB7_5Write9write_allB9_ $_RNvXs9_NtNtCsfH5l96bTt9G_3std2io5implsINtNtCsblnovvQk4nh_5alloc3vec3VechENtB7_5Write18write_all_vectoredB9_ $_RNvYINtNtCsblnovvQk4nh_5alloc3vec3VechENtNtCsfH5l96bTt9G_3std2io5Write9write_fmtBF_ $_RNvXNtCs2GenDSTXHQd_4core3anyReNtB2_3Any7type_idCsfH5l96bTt9G_3std $_RNvXNtCs2GenDSTXHQd_4core3anyNtNtCsblnovvQk4nh_5alloc6string6StringNtB2_3Any7type_idCsfH5l96bTt9G_3std $_RNvNtCsiFskK82h3Dt_4wasi5proxy40___link_custom_section_describing_imports $stdio_free $stdio_get_read_stream $stdio_get_write_stream $stdio_fstat $stdio_fcntl_getfl $stdio_isatty $_RINvNtCs2GenDSTXHQd_4core3ptr13drop_in_placeNtNtCsblnovvQk4nh_5alloc6string6StringEBK_ $"#func191 _RNvXsZ_NtCsblnovvQk4nh_5alloc6stringNtB5_6StringNtNtCs2GenDSTXHQd_4core3fmt5Write9write_str" $"#func190 _RNvXsZ_NtCsblnovvQk4nh_5alloc6stringNtB5_6StringNtNtCs2GenDSTXHQd_4core3fmt5Write10write_char" $_RNvYNtNtCsblnovvQk4nh_5alloc6string6StringNtNtCs2GenDSTXHQd_4core3fmt5Write9write_fmtB6_ $_RNvXsK_NtCs2GenDSTXHQd_4core3fmtNtB5_5ErrorNtB5_5Debug3fmt $_RNvXs8_NtCs2GenDSTXHQd_4core3fmtNtB5_9ArgumentsNtB5_7Display3fmt $_RNvXs1g_NtCs2GenDSTXHQd_4core3fmtRDNtB6_5DebugEL_Bx_3fmtB8_ $_RNvXs1i_NtCs2GenDSTXHQd_4core3fmtReNtB6_7Display3fmtB8_)
    (func $__wasm_call_ctors (;25;) (type 10))
    (func $_RNvCseVMFSoU3xto_6parent40___link_custom_section_describing_imports (;26;) (type 10))
    (func $nebula:playground/logging#log (;27;) (type 1) (param i32 i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i64)
      global.get $__stack_pointer
      i32.const 288
      i32.sub
      local.tee 2
      global.set $__stack_pointer
      call $_RNvNtCs6ZiGUy2L6jq_11wit_bindgen2rt14run_ctors_once
      local.get 2
      i32.const 24
      i32.add
      call $_RNvNvNtNtNtCseVMFSoU3xto_6parent4wasi4otel7tracing18outer_span_context11wit_import1
      local.get 2
      i32.load offset=48
      local.tee 3
      i32.const 24
      i32.mul
      local.set 4
      i32.const 0
      local.set 5
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            local.get 3
            i32.const 89478485
            i32.gt_u
            br_if 0 (;@3;)
            local.get 2
            i32.load offset=44
            local.set 6
            local.get 2
            i32.load8_u offset=40
            local.set 7
            local.get 2
            i32.load offset=36
            local.set 8
            local.get 2
            i32.load offset=32
            local.set 9
            local.get 2
            i32.load offset=28
            local.set 10
            local.get 2
            i32.load offset=24
            local.set 11
            i32.const 0
            local.set 12
            block ;; label = @4
              block ;; label = @5
                local.get 4
                br_if 0 (;@5;)
                i32.const 4
                local.set 13
                i32.const 0
                local.set 14
                br 1 (;@4;)
              end
              call $_RNvCsgrkdPkmfNkI_7___rustc35___rust_no_alloc_shim_is_unstable_v2
              i32.const 4
              local.set 5
              local.get 4
              i32.const 4
              call $_RNvCsgrkdPkmfNkI_7___rustc12___rust_alloc
              local.tee 13
              i32.eqz
              br_if 1 (;@3;)
              local.get 3
              local.set 14
            end
            local.get 2
            i32.const 0
            i32.store offset=280
            local.get 2
            local.get 13
            i32.store offset=276
            local.get 2
            local.get 14
            i32.store offset=272
            block ;; label = @4
              local.get 3
              i32.eqz
              br_if 0 (;@4;)
              i32.const 0
              local.set 15
              local.get 6
              local.set 4
              i32.const 0
              local.set 12
              loop ;; label = @5
                local.get 4
                i32.const 12
                i32.add
                i32.load
                local.set 16
                local.get 4
                i32.const 8
                i32.add
                i32.load
                local.set 17
                local.get 4
                i32.const 4
                i32.add
                i32.load
                local.set 13
                local.get 4
                i32.load
                local.set 18
                block ;; label = @6
                  local.get 12
                  local.get 2
                  i32.load offset=272
                  i32.ne
                  br_if 0 (;@6;)
                  local.get 2
                  i32.const 272
                  i32.add
                  call $_RNvMs3_NtCsblnovvQk4nh_5alloc7raw_vecINtB5_6RawVecTNtNtB7_6string6StringBN_EE8grow_oneCsiFskK82h3Dt_4wasi
                end
                local.get 2
                i32.load offset=276
                local.get 15
                i32.add
                local.tee 5
                local.get 13
                i32.store
                local.get 5
                i32.const 20
                i32.add
                local.get 16
                i32.store
                local.get 5
                i32.const 16
                i32.add
                local.get 17
                i32.store
                local.get 5
                i32.const 12
                i32.add
                local.get 16
                i32.store
                local.get 5
                i32.const 8
                i32.add
                local.get 13
                i32.store
                local.get 5
                i32.const 4
                i32.add
                local.get 18
                i32.store
                local.get 2
                local.get 12
                i32.const 1
                i32.add
                local.tee 12
                i32.store offset=280
                local.get 4
                i32.const 16
                i32.add
                local.set 4
                local.get 15
                i32.const 24
                i32.add
                local.set 15
                local.get 3
                local.get 12
                i32.ne
                br_if 0 (;@5;)
              end
              local.get 6
              local.get 3
              i32.const 4
              i32.shl
              i32.const 4
              call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
              local.get 2
              i32.load offset=276
              local.set 13
              local.get 2
              i32.load offset=272
              local.set 14
              local.get 2
              i32.load offset=280
              local.set 12
            end
            local.get 2
            call $_RNvNvNtNtNtCseVMFSoU3xto_6parent4wasi6random6random14get_random_u6411wit_import0
            i64.store offset=272
            local.get 2
            global.get $GOT.func.internal._RNvXsC_NtNtCs2GenDSTXHQd_4core3fmt3numyNtB7_8LowerHex3fmt
            i64.extend_i32_u
            i64.const 32
            i64.shl
            local.get 2
            i32.const 272
            i32.add
            i64.extend_i32_u
            i64.or
            i64.store offset=24
            local.get 2
            i32.const 12
            i32.add
            global.get $GOT.data.internal.__memory_base
            i32.const 1048576
            i32.add
            local.get 2
            i32.const 24
            i32.add
            call $_RNvNvNtCsblnovvQk4nh_5alloc3fmt6format12format_inner
            local.get 2
            i32.load offset=12
            local.set 19
            local.get 2
            i32.load offset=16
            local.set 3
            local.get 2
            i32.load offset=20
            local.set 6
            local.get 2
            i32.const 24
            i32.add
            i32.const 4
            local.get 12
            i32.const 4
            i32.shl
            local.tee 20
            call $_RNvMs0_NtCs6ZiGUy2L6jq_11wit_bindgen2rtNtB5_7Cleanup3new
            local.get 2
            i32.load offset=24
            local.set 17
            local.get 2
            local.get 2
            i32.load offset=36
            i32.store offset=280
            local.get 2
            local.get 2
            i64.load offset=28 align=4
            i64.store offset=272
            local.get 12
            i32.const 24
            i32.mul
            local.set 21
            block ;; label = @4
              local.get 12
              i32.eqz
              br_if 0 (;@4;)
              local.get 21
              i32.const -24
              i32.add
              local.tee 5
              i32.const 24
              i32.div_u
              local.set 16
              i32.const 0
              local.set 15
              local.get 13
              local.set 4
              block ;; label = @5
                local.get 5
                i32.const 24
                i32.lt_u
                br_if 0 (;@5;)
                local.get 16
                i32.const 1
                i32.add
                local.tee 4
                i32.const 1
                i32.and
                local.set 18
                local.get 4
                i32.const 536870910
                i32.and
                local.set 16
                i32.const 0
                local.set 15
                local.get 17
                local.set 5
                local.get 13
                local.set 4
                loop ;; label = @6
                  local.get 5
                  local.get 4
                  i32.const 4
                  i32.add
                  i64.load align=4
                  i64.store align=4
                  local.get 5
                  i32.const 8
                  i32.add
                  local.get 4
                  i32.const 16
                  i32.add
                  i64.load align=4
                  i64.store align=4
                  local.get 5
                  i32.const 16
                  i32.add
                  local.get 4
                  i32.const 28
                  i32.add
                  i64.load align=4
                  i64.store align=4
                  local.get 5
                  i32.const 24
                  i32.add
                  local.get 4
                  i32.const 40
                  i32.add
                  i64.load align=4
                  i64.store align=4
                  local.get 5
                  i32.const 32
                  i32.add
                  local.set 5
                  local.get 4
                  i32.const 48
                  i32.add
                  local.set 4
                  local.get 16
                  local.get 15
                  i32.const 2
                  i32.add
                  local.tee 15
                  i32.ne
                  br_if 0 (;@6;)
                end
                local.get 18
                i32.eqz
                br_if 1 (;@4;)
              end
              local.get 17
              local.get 15
              i32.const 4
              i32.shl
              i32.add
              local.tee 5
              local.get 4
              i64.load offset=4 align=4
              i64.store align=4
              local.get 5
              local.get 4
              i64.load offset=16 align=4
              i64.store offset=8 align=4
            end
            local.get 11
            local.get 10
            local.get 3
            local.get 6
            local.get 7
            i32.const 0
            local.get 17
            local.get 12
            call $_RNvNvNtNtNtCseVMFSoU3xto_6parent4wasi4otel7tracing8on_start11wit_import8
            block ;; label = @4
              local.get 2
              i32.load offset=272
              i32.eqz
              br_if 0 (;@4;)
              local.get 2
              i32.const 272
              i32.add
              call $_RNvXs1_NtCs6ZiGUy2L6jq_11wit_bindgen2rtNtB5_7CleanupNtNtNtCs2GenDSTXHQd_4core3ops4drop4Drop4drop
            end
            local.get 0
            local.get 1
            call $_RNvNvNtNtNtCseVMFSoU3xto_6parent6nebula10playground7logging3log11wit_import1
            call $_RNvCsgrkdPkmfNkI_7___rustc35___rust_no_alloc_shim_is_unstable_v2
            i32.const 6
            i32.const 1
            call $_RNvCsgrkdPkmfNkI_7___rustc12___rust_alloc
            local.tee 17
            i32.eqz
            br_if 1 (;@2;)
            local.get 17
            global.get $GOT.data.internal.__memory_base
            i32.const 1048584
            i32.add
            local.tee 4
            i32.load16_u offset=4 align=1
            i32.store16 offset=4 align=1
            local.get 17
            local.get 4
            i32.load align=1
            i32.store align=1
            local.get 2
            i32.const 24
            i32.add
            call $_RNvNvNtNtNtCseVMFSoU3xto_6parent4wasi6clocks10wall_clock3now11wit_import1
            local.get 2
            i32.load offset=32
            local.set 22
            local.get 2
            i64.load offset=24
            local.set 23
            local.get 2
            i32.const 24
            i32.add
            call $_RNvNvNtNtNtCseVMFSoU3xto_6parent4wasi6clocks10wall_clock3now11wit_import1
            local.get 2
            i32.load offset=32
            local.set 24
            local.get 2
            i64.load offset=24
            local.set 25
            call $_RNvCsgrkdPkmfNkI_7___rustc35___rust_no_alloc_shim_is_unstable_v2
            i32.const 6
            i32.const 1
            call $_RNvCsgrkdPkmfNkI_7___rustc12___rust_alloc
            local.tee 18
            i32.eqz
            br_if 2 (;@1;)
            local.get 18
            global.get $GOT.data.internal.__memory_base
            i32.const 1048584
            i32.add
            local.tee 4
            i32.load16_u offset=4 align=1
            i32.store16 offset=4 align=1
            local.get 18
            local.get 4
            i32.load align=1
            i32.store align=1
            local.get 2
            local.get 6
            i32.store offset=36
            local.get 2
            local.get 11
            i32.store offset=24
            local.get 2
            local.get 10
            i32.store offset=28
            i32.const 0
            local.set 15
            local.get 2
            i32.const 0
            i32.store8 offset=41
            local.get 2
            local.get 7
            i32.store8 offset=40
            local.get 2
            local.get 3
            i32.store offset=32
            local.get 2
            i32.const 272
            i32.add
            i32.const 4
            local.get 20
            call $_RNvMs0_NtCs6ZiGUy2L6jq_11wit_bindgen2rtNtB5_7Cleanup3new
            local.get 2
            i32.load offset=272
            local.set 7
            local.get 2
            local.get 2
            i32.load offset=284
            i32.store offset=200
            local.get 2
            local.get 2
            i64.load offset=276 align=4
            i64.store offset=192
            block ;; label = @4
              local.get 12
              i32.eqz
              br_if 0 (;@4;)
              local.get 21
              i32.const -24
              i32.add
              local.tee 5
              i32.const 24
              i32.div_u
              local.set 16
              local.get 13
              local.set 4
              block ;; label = @5
                local.get 5
                i32.const 24
                i32.lt_u
                br_if 0 (;@5;)
                local.get 16
                i32.const 1
                i32.add
                local.tee 4
                i32.const 1
                i32.and
                local.set 6
                local.get 4
                i32.const 536870910
                i32.and
                local.set 16
                i32.const 0
                local.set 15
                local.get 7
                local.set 5
                local.get 13
                local.set 4
                loop ;; label = @6
                  local.get 5
                  local.get 4
                  i32.const 4
                  i32.add
                  i64.load align=4
                  i64.store align=4
                  local.get 5
                  i32.const 8
                  i32.add
                  local.get 4
                  i32.const 16
                  i32.add
                  i64.load align=4
                  i64.store align=4
                  local.get 5
                  i32.const 16
                  i32.add
                  local.get 4
                  i32.const 28
                  i32.add
                  i64.load align=4
                  i64.store align=4
                  local.get 5
                  i32.const 24
                  i32.add
                  local.get 4
                  i32.const 40
                  i32.add
                  i64.load align=4
                  i64.store align=4
                  local.get 5
                  i32.const 32
                  i32.add
                  local.set 5
                  local.get 4
                  i32.const 48
                  i32.add
                  local.set 4
                  local.get 16
                  local.get 15
                  i32.const 2
                  i32.add
                  local.tee 15
                  i32.ne
                  br_if 0 (;@6;)
                end
                local.get 6
                i32.eqz
                br_if 1 (;@4;)
              end
              local.get 7
              local.get 15
              i32.const 4
              i32.shl
              i32.add
              local.tee 5
              local.get 4
              i64.load offset=4 align=4
              i64.store align=4
              local.get 5
              local.get 4
              i64.load offset=16 align=4
              i64.store offset=8 align=4
            end
            local.get 2
            local.get 8
            i32.store offset=56
            local.get 2
            local.get 7
            i32.store offset=44
            local.get 2
            local.get 12
            i32.store offset=48
            local.get 2
            i32.const 6
            i32.store offset=68
            local.get 2
            i32.const 4
            i32.store8 offset=60
            local.get 2
            local.get 9
            i32.store offset=52
            local.get 2
            local.get 24
            i32.store offset=96
            local.get 2
            local.get 25
            i64.store offset=88
            local.get 2
            local.get 22
            i32.store offset=80
            local.get 2
            local.get 23
            i64.store offset=72
            local.get 2
            local.get 17
            i32.store offset=64
            local.get 2
            i32.const 272
            i32.add
            i32.const 4
            i32.const 0
            call $_RNvMs0_NtCs6ZiGUy2L6jq_11wit_bindgen2rtNtB5_7Cleanup3new
            local.get 2
            i32.load offset=272
            local.set 4
            local.get 2
            local.get 2
            i32.load offset=284
            i32.store offset=216
            local.get 2
            local.get 2
            i64.load offset=276 align=4
            i64.store offset=208
            local.get 2
            i32.const 0
            i32.store offset=108
            local.get 2
            local.get 4
            i32.store offset=104
            local.get 2
            i32.const 272
            i32.add
            i32.const 8
            i32.const 0
            call $_RNvMs0_NtCs6ZiGUy2L6jq_11wit_bindgen2rtNtB5_7Cleanup3new
            local.get 2
            i32.load offset=272
            local.set 4
            local.get 2
            local.get 2
            i32.load offset=284
            i32.store offset=232
            local.get 2
            local.get 2
            i64.load offset=276 align=4
            i64.store offset=224
            local.get 2
            i32.const 0
            i32.store offset=116
            local.get 2
            local.get 4
            i32.store offset=112
            local.get 2
            i32.const 272
            i32.add
            i32.const 4
            i32.const 0
            call $_RNvMs0_NtCs6ZiGUy2L6jq_11wit_bindgen2rtNtB5_7Cleanup3new
            local.get 2
            i32.load offset=272
            local.set 4
            local.get 2
            local.get 2
            i32.load offset=284
            i32.store offset=248
            local.get 2
            local.get 2
            i64.load offset=276 align=4
            i64.store offset=240
            local.get 2
            i32.const 0
            i32.store offset=124
            local.get 2
            i32.const 6
            i32.store offset=144
            local.get 2
            i32.const 1
            i32.store8 offset=128
            local.get 2
            i32.const 0
            i32.store8 offset=160
            local.get 2
            i32.const 0
            i32.store8 offset=148
            local.get 2
            local.get 18
            i32.store offset=140
            local.get 2
            local.get 4
            i32.store offset=120
            local.get 2
            i32.const 272
            i32.add
            i32.const 4
            i32.const 0
            call $_RNvMs0_NtCs6ZiGUy2L6jq_11wit_bindgen2rtNtB5_7Cleanup3new
            local.get 2
            i32.load offset=272
            local.set 4
            local.get 2
            local.get 2
            i32.load offset=284
            i32.store offset=264
            local.get 2
            local.get 2
            i64.load offset=276 align=4
            i64.store offset=256
            local.get 2
            i32.const 0
            i32.store offset=176
            local.get 2
            i32.const 0
            i32.store offset=188
            local.get 2
            i64.const 0
            i64.store offset=180 align=4
            local.get 2
            local.get 4
            i32.store offset=172
            local.get 2
            i32.const 24
            i32.add
            call $_RNvNvNtNtNtCseVMFSoU3xto_6parent4wasi4otel7tracing6on_end12wit_import49
            block ;; label = @4
              local.get 2
              i32.load offset=256
              i32.eqz
              br_if 0 (;@4;)
              local.get 2
              i32.const 256
              i32.add
              call $_RNvXs1_NtCs6ZiGUy2L6jq_11wit_bindgen2rtNtB5_7CleanupNtNtNtCs2GenDSTXHQd_4core3ops4drop4Drop4drop
            end
            block ;; label = @4
              local.get 2
              i32.load offset=240
              i32.eqz
              br_if 0 (;@4;)
              local.get 2
              i32.const 240
              i32.add
              call $_RNvXs1_NtCs6ZiGUy2L6jq_11wit_bindgen2rtNtB5_7CleanupNtNtNtCs2GenDSTXHQd_4core3ops4drop4Drop4drop
            end
            block ;; label = @4
              local.get 2
              i32.load offset=224
              i32.eqz
              br_if 0 (;@4;)
              local.get 2
              i32.const 224
              i32.add
              call $_RNvXs1_NtCs6ZiGUy2L6jq_11wit_bindgen2rtNtB5_7CleanupNtNtNtCs2GenDSTXHQd_4core3ops4drop4Drop4drop
            end
            block ;; label = @4
              local.get 2
              i32.load offset=208
              i32.eqz
              br_if 0 (;@4;)
              local.get 2
              i32.const 208
              i32.add
              call $_RNvXs1_NtCs6ZiGUy2L6jq_11wit_bindgen2rtNtB5_7CleanupNtNtNtCs2GenDSTXHQd_4core3ops4drop4Drop4drop
            end
            block ;; label = @4
              local.get 2
              i32.load offset=192
              i32.eqz
              br_if 0 (;@4;)
              local.get 2
              i32.const 192
              i32.add
              call $_RNvXs1_NtCs6ZiGUy2L6jq_11wit_bindgen2rtNtB5_7CleanupNtNtNtCs2GenDSTXHQd_4core3ops4drop4Drop4drop
            end
            block ;; label = @4
              local.get 10
              i32.eqz
              br_if 0 (;@4;)
              local.get 11
              local.get 10
              i32.const 1
              call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
            end
            block ;; label = @4
              local.get 19
              i32.eqz
              br_if 0 (;@4;)
              local.get 3
              local.get 19
              i32.const 1
              call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
            end
            block ;; label = @4
              local.get 12
              i32.eqz
              br_if 0 (;@4;)
              local.get 13
              local.set 4
              loop ;; label = @5
                block ;; label = @6
                  local.get 4
                  i32.load
                  local.tee 5
                  i32.eqz
                  br_if 0 (;@6;)
                  local.get 4
                  i32.const 4
                  i32.add
                  i32.load
                  local.get 5
                  i32.const 1
                  call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
                end
                block ;; label = @6
                  local.get 4
                  i32.const 12
                  i32.add
                  i32.load
                  local.tee 5
                  i32.eqz
                  br_if 0 (;@6;)
                  local.get 4
                  i32.const 16
                  i32.add
                  i32.load
                  local.get 5
                  i32.const 1
                  call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
                end
                local.get 4
                i32.const 24
                i32.add
                local.set 4
                local.get 12
                i32.const -1
                i32.add
                local.tee 12
                br_if 0 (;@5;)
              end
            end
            block ;; label = @4
              local.get 14
              i32.eqz
              br_if 0 (;@4;)
              local.get 13
              local.get 14
              i32.const 24
              i32.mul
              i32.const 4
              call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
            end
            block ;; label = @4
              local.get 8
              i32.eqz
              br_if 0 (;@4;)
              local.get 9
              local.get 8
              i32.const 1
              call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
            end
            local.get 17
            i32.const 6
            i32.const 1
            call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
            local.get 18
            i32.const 6
            i32.const 1
            call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
            block ;; label = @4
              local.get 1
              i32.eqz
              br_if 0 (;@4;)
              local.get 0
              local.get 1
              i32.const 1
              call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
            end
            local.get 2
            i32.const 288
            i32.add
            global.set $__stack_pointer
            return
          end
          local.get 5
          local.get 4
          call $_RNvNtCsblnovvQk4nh_5alloc7raw_vec12handle_error
          unreachable
        end
        i32.const 1
        i32.const 6
        call $_RNvNtCsblnovvQk4nh_5alloc7raw_vec12handle_error
        unreachable
      end
      i32.const 1
      i32.const 6
      call $_RNvNtCsblnovvQk4nh_5alloc7raw_vec12handle_error
      unreachable
    )
    (func $_RNvCsgrkdPkmfNkI_7___rustc12___rust_alloc (;28;) (type 4) (param i32 i32) (result i32)
      local.get 0
      local.get 1
      call $_RNvCsgrkdPkmfNkI_7___rustc11___rdl_alloc
      return
    )
    (func $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc (;29;) (type 11) (param i32 i32 i32)
      local.get 0
      local.get 1
      local.get 2
      call $_RNvCsgrkdPkmfNkI_7___rustc13___rdl_dealloc
      return
    )
    (func $_RNvCsgrkdPkmfNkI_7___rustc14___rust_realloc (;30;) (type 5) (param i32 i32 i32 i32) (result i32)
      local.get 0
      local.get 1
      local.get 2
      local.get 3
      call $_RNvCsgrkdPkmfNkI_7___rustc13___rdl_realloc
      return
    )
    (func $_RNvCsgrkdPkmfNkI_7___rustc35___rust_no_alloc_shim_is_unstable_v2 (;31;) (type 10)
      return
    )
    (func $_RNvMs0_NtCs6ZiGUy2L6jq_11wit_bindgen2rtNtB5_7Cleanup3new (;32;) (type 11) (param i32 i32 i32)
      (local i32)
      block ;; label = @1
        local.get 2
        br_if 0 (;@1;)
        local.get 0
        i64.const 0
        i64.store align=4
        return
      end
      call $_RNvCsgrkdPkmfNkI_7___rustc35___rust_no_alloc_shim_is_unstable_v2
      block ;; label = @1
        local.get 2
        local.get 1
        call $_RNvCsgrkdPkmfNkI_7___rustc12___rust_alloc
        local.tee 3
        i32.eqz
        br_if 0 (;@1;)
        local.get 0
        local.get 3
        i32.store offset=12
        local.get 0
        local.get 2
        i32.store offset=8
        local.get 0
        local.get 1
        i32.store offset=4
        local.get 0
        local.get 3
        i32.store
        return
      end
      local.get 1
      local.get 2
      call $_RNvNtCsblnovvQk4nh_5alloc5alloc18handle_alloc_error
      unreachable
    )
    (func $_RNvNtCs6ZiGUy2L6jq_11wit_bindgen2rt14run_ctors_once (;33;) (type 10)
      (local i32)
      block ;; label = @1
        global.get $GOT.data.internal.__memory_base
        i32.const 1051616
        i32.add
        i32.load8_u
        br_if 0 (;@1;)
        global.get $GOT.data.internal.__memory_base
        local.set 0
        call $__wasm_call_ctors
        local.get 0
        i32.const 1051616
        i32.add
        i32.const 1
        i32.store8
      end
    )
    (func $_RNvXs1_NtCs6ZiGUy2L6jq_11wit_bindgen2rtNtB5_7CleanupNtNtNtCs2GenDSTXHQd_4core3ops4drop4Drop4drop (;34;) (type 0) (param i32)
      local.get 0
      i32.load offset=8
      local.get 0
      i32.load offset=4
      local.get 0
      i32.load
      call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
    )
    (func $_RNvCsgrkdPkmfNkI_7___rustc18___rust_start_panic (;35;) (type 4) (param i32 i32) (result i32)
      call $_RNvCsgrkdPkmfNkI_7___rustc12___rust_abort
      unreachable
    )
    (func $_RINvNtCs2GenDSTXHQd_4core9panicking13assert_failedbbECsfH5l96bTt9G_3std (;36;) (type 12) (param i32 i32 i32 i32 i32 i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 6
      global.set $__stack_pointer
      local.get 6
      local.get 2
      i32.store offset=12
      local.get 6
      local.get 1
      i32.store offset=8
      local.get 0
      local.get 6
      i32.const 8
      i32.add
      global.get $GOT.data.internal.__memory_base
      i32.const 1050852
      i32.add
      local.tee 2
      local.get 6
      i32.const 12
      i32.add
      local.get 2
      local.get 3
      local.get 4
      local.get 5
      call $_RNvNtCs2GenDSTXHQd_4core9panicking19assert_failed_inner
      unreachable
    )
    (func $_RNvNvMNtNtCsfH5l96bTt9G_3std6thread2idNtB4_8ThreadId3new9exhausted (;37;) (type 10)
      (local i32)
      global.get $GOT.data.internal.__memory_base
      local.tee 0
      i32.const 1050404
      i32.add
      i32.const 111
      local.get 0
      i32.const 1051240
      i32.add
      call $_RNvNtCs2GenDSTXHQd_4core9panicking9panic_fmt
      unreachable
    )
    (func $_RINvNtCs2GenDSTXHQd_4core3ptr13drop_in_placeINtNtB4_6result6ResultuNtNtNtCsfH5l96bTt9G_3std2io5error5ErrorEEB19_ (;38;) (type 1) (param i32 i32)
      (local i32 i32)
      block ;; label = @1
        local.get 0
        i32.const 255
        i32.and
        i32.const 3
        i32.ne
        br_if 0 (;@1;)
        local.get 1
        i32.load
        local.set 2
        block ;; label = @2
          local.get 1
          i32.const 4
          i32.add
          i32.load
          local.tee 0
          i32.load
          local.tee 3
          i32.eqz
          br_if 0 (;@2;)
          local.get 2
          local.get 3
          call_indirect (type 0)
        end
        block ;; label = @2
          local.get 0
          i32.load offset=4
          local.tee 3
          i32.eqz
          br_if 0 (;@2;)
          local.get 2
          local.get 3
          local.get 0
          i32.load offset=8
          call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
        end
        local.get 1
        i32.const 12
        i32.const 4
        call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
      end
    )
    (func $_RINvNtCs2GenDSTXHQd_4core3ptr13drop_in_placeINtNtCsblnovvQk4nh_5alloc3vec3VechEECsfH5l96bTt9G_3std (;39;) (type 0) (param i32)
      (local i32)
      block ;; label = @1
        local.get 0
        i32.load
        local.tee 1
        i32.eqz
        br_if 0 (;@1;)
        local.get 0
        i32.load offset=4
        local.get 1
        i32.const 1
        call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
      end
    )
    (func $_RINvNtCs2GenDSTXHQd_4core3ptr13drop_in_placeINtNvNtCsfH5l96bTt9G_3std2io17default_write_fmt7AdapterINtNtBL_6cursor6CursorQShEEEBN_ (;40;) (type 0) (param i32)
      (local i32 i32 i32)
      block ;; label = @1
        local.get 0
        i32.load8_u
        i32.const 3
        i32.ne
        br_if 0 (;@1;)
        local.get 0
        i32.load offset=4
        local.tee 0
        i32.load
        local.set 1
        block ;; label = @2
          local.get 0
          i32.const 4
          i32.add
          i32.load
          local.tee 2
          i32.load
          local.tee 3
          i32.eqz
          br_if 0 (;@2;)
          local.get 1
          local.get 3
          call_indirect (type 0)
        end
        block ;; label = @2
          local.get 2
          i32.load offset=4
          local.tee 3
          i32.eqz
          br_if 0 (;@2;)
          local.get 1
          local.get 3
          local.get 2
          i32.load offset=8
          call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
        end
        local.get 0
        i32.const 12
        i32.const 4
        call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
      end
    )
    (func $_RINvNtCs2GenDSTXHQd_4core3ptr13drop_in_placeNtNtCsblnovvQk4nh_5alloc6string6StringECsfH5l96bTt9G_3std (;41;) (type 0) (param i32)
      (local i32)
      block ;; label = @1
        local.get 0
        i32.load
        local.tee 1
        i32.eqz
        br_if 0 (;@1;)
        local.get 0
        i32.load offset=4
        local.get 1
        i32.const 1
        call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
      end
    )
    (func $_RINvNtCs2GenDSTXHQd_4core3ptr13drop_in_placeNtNvNtCsfH5l96bTt9G_3std9panicking13panic_handler19FormatStringPayloadEBM_ (;42;) (type 0) (param i32)
      (local i32)
      block ;; label = @1
        local.get 0
        i32.load
        local.tee 1
        i32.const 1
        i32.lt_s
        br_if 0 (;@1;)
        local.get 0
        i32.load offset=4
        local.get 1
        i32.const 1
        call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
      end
    )
    (func $_RINvNvMs2_NtCsblnovvQk4nh_5alloc7raw_vecINtB8_11RawVecInnerpE7reserve21do_reserve_and_handleNtNtBa_5alloc6GlobalECsfH5l96bTt9G_3std (;43;) (type 13) (param i32 i32 i32 i32 i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 5
      global.set $__stack_pointer
      block ;; label = @1
        local.get 2
        local.get 1
        i32.add
        local.tee 1
        local.get 2
        i32.ge_u
        br_if 0 (;@1;)
        i32.const 0
        i32.const 0
        call $_RNvNtCsblnovvQk4nh_5alloc7raw_vec12handle_error
        unreachable
      end
      local.get 5
      i32.const 4
      i32.add
      local.get 0
      i32.load
      local.tee 2
      local.get 0
      i32.load offset=4
      local.get 1
      local.get 2
      i32.const 1
      i32.shl
      local.tee 2
      local.get 1
      local.get 2
      i32.gt_u
      select
      local.tee 2
      i32.const 8
      i32.const 4
      local.get 4
      i32.const 1
      i32.eq
      select
      local.tee 1
      local.get 2
      local.get 1
      i32.gt_u
      select
      local.tee 2
      local.get 3
      local.get 4
      call $_RNvMs4_NtCsblnovvQk4nh_5alloc7raw_vecNtB5_11RawVecInner11finish_growCsfH5l96bTt9G_3std
      block ;; label = @1
        local.get 5
        i32.load offset=4
        i32.const 1
        i32.ne
        br_if 0 (;@1;)
        local.get 5
        i32.load offset=8
        local.get 5
        i32.load offset=12
        call $_RNvNtCsblnovvQk4nh_5alloc7raw_vec12handle_error
        unreachable
      end
      local.get 5
      i32.load offset=8
      local.set 4
      local.get 0
      local.get 2
      i32.store
      local.get 0
      local.get 4
      i32.store offset=4
      local.get 5
      i32.const 16
      i32.add
      global.set $__stack_pointer
    )
    (func $_RNvMs4_NtCsblnovvQk4nh_5alloc7raw_vecNtB5_11RawVecInner11finish_growCsfH5l96bTt9G_3std (;44;) (type 12) (param i32 i32 i32 i32 i32 i32)
      (local i32 i32 i64)
      i32.const 1
      local.set 6
      i32.const 4
      local.set 7
      block ;; label = @1
        block ;; label = @2
          local.get 5
          i64.extend_i32_u
          local.get 3
          i64.extend_i32_u
          i64.mul
          local.tee 8
          i64.const 32
          i64.shr_u
          i32.wrap_i64
          i32.eqz
          br_if 0 (;@2;)
          i32.const 0
          local.set 3
          br 1 (;@1;)
        end
        block ;; label = @2
          local.get 8
          i32.wrap_i64
          local.tee 3
          i32.const -2147483648
          local.get 4
          i32.sub
          i32.le_u
          br_if 0 (;@2;)
          i32.const 0
          local.set 3
          br 1 (;@1;)
        end
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                local.get 1
                i32.eqz
                br_if 0 (;@5;)
                local.get 2
                local.get 5
                local.get 1
                i32.mul
                local.get 4
                local.get 3
                call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_realloc
                local.set 7
                br 1 (;@4;)
              end
              block ;; label = @5
                local.get 3
                br_if 0 (;@5;)
                local.get 4
                local.set 7
                br 2 (;@3;)
              end
              call $_RNvCsgrkdPkmfNkI_7___rustc35___rust_no_alloc_shim_is_unstable_v2
              local.get 3
              local.get 4
              call $_RNvCsgrkdPkmfNkI_7___rustc12___rust_alloc
              local.set 7
            end
            local.get 7
            br_if 0 (;@3;)
            local.get 0
            local.get 4
            i32.store offset=4
            br 1 (;@2;)
          end
          local.get 0
          local.get 7
          i32.store offset=4
          i32.const 0
          local.set 6
        end
        i32.const 8
        local.set 7
      end
      local.get 0
      local.get 7
      i32.add
      local.get 3
      i32.store
      local.get 0
      local.get 6
      i32.store
    )
    (func $_RINvNtNtCsfH5l96bTt9G_3std3sys9backtrace26___rust_end_short_backtraceNCNvNtB6_5alloc8rust_oom0zEB6_ (;45;) (type 0) (param i32)
      local.get 0
      call $_RNCNvNtCsfH5l96bTt9G_3std5alloc8rust_oom0B5_
      unreachable
    )
    (func $_RNCNvNtCsfH5l96bTt9G_3std5alloc8rust_oom0B5_ (;46;) (type 0) (param i32)
      (local i32 i32)
      global.get $GOT.data.internal._RNvNtCsfH5l96bTt9G_3std5alloc4HOOK
      i32.load
      local.set 1
      global.get $GOT.func.internal._RNvNtCsfH5l96bTt9G_3std5alloc24default_alloc_error_hook
      local.set 2
      local.get 0
      i32.load
      local.get 0
      i32.load offset=4
      local.get 1
      local.get 2
      local.get 1
      select
      call_indirect (type 1)
      call $_RNvNtCsfH5l96bTt9G_3std7process5abort
      unreachable
    )
    (func $_RINvNtNtCsfH5l96bTt9G_3std3sys9backtrace26___rust_end_short_backtraceNCNvNtB6_9panicking13panic_handler0zEB6_ (;47;) (type 0) (param i32)
      local.get 0
      call $_RNCNvNtCsfH5l96bTt9G_3std9panicking13panic_handler0B5_
      unreachable
    )
    (func $_RNCNvNtCsfH5l96bTt9G_3std9panicking13panic_handler0B5_ (;48;) (type 0) (param i32)
      (local i32 i32 i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 1
      global.set $__stack_pointer
      block ;; label = @1
        local.get 0
        i32.load
        local.tee 2
        i32.load offset=4
        local.tee 3
        i32.const 1
        i32.and
        i32.eqz
        br_if 0 (;@1;)
        local.get 2
        i32.load
        local.set 2
        local.get 1
        local.get 3
        i32.const 1
        i32.shr_u
        i32.store offset=4
        local.get 1
        local.get 2
        i32.store
        local.get 1
        global.get $GOT.data.internal.__memory_base
        i32.const 1051016
        i32.add
        local.get 0
        i32.load offset=4
        local.get 0
        i32.load offset=8
        local.tee 0
        i32.load8_u offset=8
        local.get 0
        i32.load8_u offset=9
        call $_RNvNtCsfH5l96bTt9G_3std9panicking15panic_with_hook
        unreachable
      end
      local.get 1
      i32.const -2147483648
      i32.store
      global.get $GOT.data.internal.__memory_base
      local.set 2
      local.get 1
      local.get 0
      i32.store offset=12
      local.get 1
      local.get 2
      i32.const 1051044
      i32.add
      local.get 0
      i32.load offset=4
      local.get 0
      i32.load offset=8
      local.tee 0
      i32.load8_u offset=8
      local.get 0
      i32.load8_u offset=9
      call $_RNvNtCsfH5l96bTt9G_3std9panicking15panic_with_hook
      unreachable
    )
    (func $_RINvNtNtNtCsfH5l96bTt9G_3std3sys7helpers14small_c_string24run_with_cstr_allocatingINtNtCs2GenDSTXHQd_4core6option6OptionNtNtNtB8_3ffi6os_str8OsStringEEB8_ (;49;) (type 11) (param i32 i32 i32)
      (local i32 i32 i32 i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 3
      global.set $__stack_pointer
      local.get 3
      local.get 1
      local.get 2
      call $_RNvXs_NvMs_NtNtCsblnovvQk4nh_5alloc3ffi5c_strNtB9_7CString3newRShNtB4_11SpecNewImpl13spec_new_impl
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            local.get 3
            i32.load
            local.tee 2
            i32.const -2147483648
            i32.ne
            br_if 0 (;@3;)
            local.get 3
            i32.load offset=8
            local.set 1
            block ;; label = @4
              block ;; label = @5
                local.get 3
                i32.load offset=4
                local.tee 4
                call $getenv
                local.tee 5
                br_if 0 (;@5;)
                local.get 0
                i32.const -2147483648
                i32.store
                br 1 (;@4;)
              end
              block ;; label = @5
                block ;; label = @6
                  local.get 5
                  call $strlen
                  local.tee 2
                  br_if 0 (;@6;)
                  i32.const 1
                  local.set 6
                  br 1 (;@5;)
                end
                call $_RNvCsgrkdPkmfNkI_7___rustc35___rust_no_alloc_shim_is_unstable_v2
                local.get 2
                i32.const 1
                call $_RNvCsgrkdPkmfNkI_7___rustc12___rust_alloc
                local.tee 6
                i32.eqz
                br_if 4 (;@1;)
                local.get 2
                i32.eqz
                br_if 0 (;@5;)
                local.get 6
                local.get 5
                local.get 2
                memory.copy
              end
              local.get 0
              local.get 2
              i32.store offset=8
              local.get 0
              local.get 6
              i32.store offset=4
              local.get 0
              local.get 2
              i32.store
            end
            local.get 4
            i32.const 0
            i32.store8
            local.get 1
            i32.eqz
            br_if 1 (;@2;)
            local.get 4
            local.get 1
            i32.const 1
            call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
            br 1 (;@2;)
          end
          local.get 0
          i32.const -2147483647
          i32.store
          local.get 0
          global.get $GOT.data.internal.__memory_base
          i32.const 1050968
          i32.add
          i64.load
          i64.store offset=4 align=4
          local.get 2
          i32.eqz
          br_if 0 (;@2;)
          local.get 3
          i32.load offset=4
          local.get 2
          i32.const 1
          call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
        end
        local.get 3
        i32.const 16
        i32.add
        global.set $__stack_pointer
        return
      end
      i32.const 1
      local.get 2
      call $_RNvNtCsblnovvQk4nh_5alloc7raw_vec12handle_error
      unreachable
    )
    (func $_RNvNtCsfH5l96bTt9G_3std9panicking15panic_with_hook (;50;) (type 13) (param i32 i32 i32 i32 i32)
      (local i32 i32 i32)
      global.get $__stack_pointer
      i32.const 80
      i32.sub
      local.tee 5
      global.set $__stack_pointer
      local.get 5
      local.get 1
      i32.store offset=32
      local.get 5
      local.get 0
      i32.store offset=28
      local.get 5
      local.get 2
      i32.store offset=36
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                i32.const 1
                call $_RNvNtNtCsfH5l96bTt9G_3std9panicking11panic_count8increase
                i32.const 255
                i32.and
                br_table 2 (;@3;) 1 (;@4;) 0 (;@5;) 1 (;@4;)
              end
              global.get $GOT.data.internal._RNvNtCsfH5l96bTt9G_3std9panicking4HOOK
              i32.load
              local.tee 6
              i32.const -1
              i32.gt_s
              br_if 2 (;@2;)
              local.get 5
              i32.const 56
              i32.add
              local.get 5
              i32.const 79
              i32.add
              global.get $GOT.data.internal.__memory_base
              i32.const 1050036
              i32.add
              i32.const 115
              call $_RNvYNtNtNtNtCsfH5l96bTt9G_3std3sys5stdio4unix6StderrNtNtBa_2io5Write9write_fmtBa_
              local.get 5
              i32.load8_u offset=56
              local.get 5
              i32.load offset=60
              call $_RINvNtCs2GenDSTXHQd_4core3ptr13drop_in_placeINtNtB4_6result6ResultuNtNtNtCsfH5l96bTt9G_3std2io5error5ErrorEEB19_
              br 3 (;@1;)
            end
            local.get 5
            local.get 0
            local.get 1
            i32.load offset=24
            call_indirect (type 1)
            local.get 5
            local.get 5
            i32.load offset=4
            i32.const 0
            local.get 5
            i32.load
            local.tee 1
            select
            i32.store offset=44
            local.get 5
            local.get 1
            i32.const 1
            local.get 1
            select
            i32.store offset=40
            local.get 5
            global.get $GOT.data.internal.__table_base
            local.tee 1
            i32.const 3
            i32.add
            i64.extend_i32_u
            i64.const 32
            i64.shl
            local.get 5
            i32.const 40
            i32.add
            i64.extend_i32_u
            i64.or
            i64.store offset=64
            local.get 5
            local.get 1
            i32.const 4
            i32.add
            i64.extend_i32_u
            i64.const 32
            i64.shl
            local.get 5
            i32.const 36
            i32.add
            i64.extend_i32_u
            i64.or
            i64.store offset=56
            local.get 5
            i32.const 48
            i32.add
            local.get 5
            i32.const 79
            i32.add
            global.get $GOT.data.internal.__memory_base
            i32.const 1049639
            i32.add
            local.get 5
            i32.const 56
            i32.add
            call $_RNvYNtNtNtNtCsfH5l96bTt9G_3std3sys5stdio4unix6StderrNtNtBa_2io5Write9write_fmtBa_
            local.get 5
            i32.load8_u offset=48
            local.get 5
            i32.load offset=52
            call $_RINvNtCs2GenDSTXHQd_4core3ptr13drop_in_placeINtNtB4_6result6ResultuNtNtNtCsfH5l96bTt9G_3std2io5error5ErrorEEB19_
            br 2 (;@1;)
          end
          local.get 5
          global.get $GOT.data.internal.__table_base
          local.tee 1
          i32.const 5
          i32.add
          i64.extend_i32_u
          i64.const 32
          i64.shl
          local.get 5
          i32.const 28
          i32.add
          i64.extend_i32_u
          i64.or
          i64.store offset=64
          local.get 5
          local.get 1
          i32.const 4
          i32.add
          i64.extend_i32_u
          i64.const 32
          i64.shl
          local.get 5
          i32.const 36
          i32.add
          i64.extend_i32_u
          i64.or
          i64.store offset=56
          local.get 5
          i32.const 48
          i32.add
          local.get 5
          i32.const 79
          i32.add
          global.get $GOT.data.internal.__memory_base
          i32.const 1049749
          i32.add
          local.get 5
          i32.const 56
          i32.add
          call $_RNvYNtNtNtNtCsfH5l96bTt9G_3std3sys5stdio4unix6StderrNtNtBa_2io5Write9write_fmtBa_
          local.get 5
          i32.load8_u offset=48
          local.get 5
          i32.load offset=52
          call $_RINvNtCs2GenDSTXHQd_4core3ptr13drop_in_placeINtNtB4_6result6ResultuNtNtNtCsfH5l96bTt9G_3std2io5error5ErrorEEB19_
          br 1 (;@1;)
        end
        global.get $GOT.data.internal._RNvNtCsfH5l96bTt9G_3std9panicking4HOOK
        local.tee 7
        local.get 6
        i32.const 1
        i32.add
        i32.store
        block ;; label = @2
          block ;; label = @3
            local.get 7
            i32.load offset=4
            i32.eqz
            br_if 0 (;@3;)
            local.get 5
            i32.const 16
            i32.add
            local.get 0
            local.get 1
            i32.load offset=20
            call_indirect (type 1)
            local.get 5
            local.get 4
            i32.store8 offset=69
            local.get 5
            local.get 3
            i32.store8 offset=68
            local.get 5
            local.get 2
            i32.store offset=64
            local.get 5
            local.get 5
            i64.load offset=16
            i64.store offset=56 align=4
            global.get $GOT.data.internal._RNvNtCsfH5l96bTt9G_3std9panicking4HOOK
            local.tee 2
            i32.load offset=4
            local.get 5
            i32.const 56
            i32.add
            local.get 2
            i32.load offset=8
            i32.load offset=20
            call_indirect (type 1)
            br 1 (;@2;)
          end
          local.get 5
          i32.const 8
          i32.add
          local.get 0
          local.get 1
          i32.load offset=20
          call_indirect (type 1)
          local.get 5
          local.get 4
          i32.store8 offset=69
          local.get 5
          local.get 3
          i32.store8 offset=68
          local.get 5
          local.get 2
          i32.store offset=64
          local.get 5
          local.get 5
          i64.load offset=8
          i64.store offset=56 align=4
          local.get 5
          i32.const 56
          i32.add
          call $_RNvNtCsfH5l96bTt9G_3std9panicking12default_hook
        end
        global.get $GOT.data.internal.__memory_base
        i32.const 1051628
        i32.add
        i32.const 0
        i32.store8
        global.get $GOT.data.internal._RNvNtCsfH5l96bTt9G_3std9panicking4HOOK
        local.tee 2
        local.get 2
        i32.load
        i32.const -1
        i32.add
        i32.store
        block ;; label = @2
          local.get 3
          br_if 0 (;@2;)
          local.get 5
          i32.const 56
          i32.add
          local.get 5
          i32.const 79
          i32.add
          global.get $GOT.data.internal.__memory_base
          i32.const 1050226
          i32.add
          i32.const 91
          call $_RNvYNtNtNtNtCsfH5l96bTt9G_3std3sys5stdio4unix6StderrNtNtBa_2io5Write9write_fmtBa_
          local.get 5
          i32.load8_u offset=56
          local.get 5
          i32.load offset=60
          call $_RINvNtCs2GenDSTXHQd_4core3ptr13drop_in_placeINtNtB4_6result6ResultuNtNtNtCsfH5l96bTt9G_3std2io5error5ErrorEEB19_
          br 1 (;@1;)
        end
        local.get 0
        local.get 1
        call $_RNvCsgrkdPkmfNkI_7___rustc10rust_panic
        unreachable
      end
      call $_RNvNtCsfH5l96bTt9G_3std7process5abort
      unreachable
    )
    (func $_RNCINvNtNtCsfH5l96bTt9G_3std6thread7current17with_current_nameNCNCNvNtB8_9panicking12default_hook00uE0B8_ (;51;) (type 1) (param i32 i32)
      (local i32 i32 i64 i64 i64 i64 i32 i32)
      global.get $__stack_pointer
      i32.const 592
      i32.sub
      local.tee 2
      global.set $__stack_pointer
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              local.get 1
              i32.eqz
              br_if 0 (;@4;)
              block ;; label = @5
                local.get 1
                i32.load
                local.tee 3
                i32.load offset=16
                local.tee 1
                i32.eqz
                br_if 0 (;@5;)
                local.get 3
                i32.const 20
                i32.add
                i32.load
                i32.const -1
                i32.add
                local.set 3
                br 4 (;@1;)
              end
              global.get $GOT.data.internal.__memory_base
              i32.const 1051656
              i32.add
              i64.load
              local.tee 4
              i64.eqz
              br_if 1 (;@3;)
              global.get $GOT.data.internal.__memory_base
              i32.const 1049911
              i32.add
              i32.const 0
              local.get 4
              local.get 3
              i64.load offset=8
              i64.eq
              select
              local.set 1
              i32.const 4
              local.set 3
              br 3 (;@1;)
            end
            global.get $GOT.data.internal.__memory_base
            i32.const 1051656
            i32.add
            i64.load
            local.tee 4
            i64.const 0
            i64.ne
            br_if 1 (;@2;)
          end
          i32.const 0
          local.set 1
          br 1 (;@1;)
        end
        global.get $GOT.data.internal.__memory_base
        i32.const 1049911
        i32.add
        i32.const 0
        global.get $GOT.data.internal._RNvNtNtNtCsfH5l96bTt9G_3std6thread7current2id2ID
        i64.load
        local.get 4
        i64.eq
        select
        local.set 1
        i32.const 4
        local.set 3
      end
      local.get 2
      local.get 3
      i32.const 9
      local.get 1
      select
      i32.store offset=12
      local.get 2
      local.get 1
      global.get $GOT.data.internal.__memory_base
      i32.const 1049915
      i32.add
      local.get 1
      select
      i32.store offset=8
      block ;; label = @1
        block ;; label = @2
          global.get $GOT.data.internal._RNvNtNtNtCsfH5l96bTt9G_3std6thread7current2id2ID
          i64.load
          local.tee 5
          i64.const 0
          i64.ne
          br_if 0 (;@2;)
          global.get $GOT.data.internal.__memory_base
          i32.const 1051680
          i32.add
          i64.load
          local.set 4
          loop ;; label = @3
            local.get 4
            i64.const -1
            i64.eq
            br_if 2 (;@1;)
            global.get $GOT.data.internal.__memory_base
            i32.const 1051680
            i32.add
            local.tee 1
            local.get 4
            i64.const 1
            i64.add
            local.tee 5
            local.get 1
            i64.load
            local.tee 6
            local.get 6
            local.get 4
            i64.eq
            local.tee 1
            select
            i64.store
            local.get 6
            local.set 4
            local.get 1
            i32.eqz
            br_if 0 (;@3;)
          end
          global.get $GOT.data.internal._RNvNtNtNtCsfH5l96bTt9G_3std6thread7current2id2ID
          local.get 5
          i64.store
        end
        local.get 2
        local.get 5
        i64.store offset=16
        local.get 2
        i32.const 24
        i32.add
        i32.const 0
        i32.const 512
        memory.fill
        local.get 2
        i64.const 0
        i64.store offset=544
        local.get 2
        i32.const 512
        i32.store offset=540
        global.get $GOT.data.internal.__table_base
        local.set 1
        local.get 0
        i64.load32_u offset=4
        local.set 4
        local.get 2
        local.get 2
        i32.const 24
        i32.add
        i32.store offset=536
        local.get 0
        i64.load32_u
        local.set 6
        local.get 2
        local.get 4
        local.get 1
        i32.const 3
        i32.add
        i64.extend_i32_u
        i64.const 32
        i64.shl
        local.tee 5
        i64.or
        local.tee 4
        i64.store offset=584
        local.get 2
        local.get 6
        local.get 1
        i32.const 4
        i32.add
        i64.extend_i32_u
        i64.const 32
        i64.shl
        i64.or
        local.tee 6
        i64.store offset=576
        local.get 2
        global.get $GOT.func.internal._RNvXsd_NtNtNtCs2GenDSTXHQd_4core3fmt3num3impyNtB9_7Display3fmt
        i64.extend_i32_u
        i64.const 32
        i64.shl
        local.get 2
        i32.const 16
        i32.add
        i64.extend_i32_u
        i64.or
        local.tee 7
        i64.store offset=568
        local.get 2
        local.get 5
        local.get 2
        i32.const 8
        i32.add
        i64.extend_i32_u
        i64.or
        local.tee 5
        i64.store offset=560
        local.get 2
        i32.const 552
        i32.add
        local.get 2
        i32.const 536
        i32.add
        global.get $GOT.data.internal.__memory_base
        i32.const 1049710
        i32.add
        local.get 2
        i32.const 560
        i32.add
        call $_RNvYINtNtNtCsfH5l96bTt9G_3std2io6cursor6CursorQShENtB7_5Write9write_fmtB9_
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              local.get 2
              i32.load8_u offset=552
              local.tee 1
              i32.const 4
              i32.ne
              br_if 0 (;@4;)
              local.get 2
              i32.load offset=544
              local.tee 1
              i32.const 513
              i32.lt_u
              br_if 1 (;@3;)
              i32.const 0
              local.get 1
              i32.const 512
              global.get $GOT.data.internal.__memory_base
              i32.const 1050976
              i32.add
              call $_RNvNtNtCs2GenDSTXHQd_4core5slice5index16slice_index_fail
              unreachable
            end
            block ;; label = @4
              local.get 1
              i32.const 3
              i32.ne
              br_if 0 (;@4;)
              local.get 2
              i32.load offset=556
              local.tee 1
              i32.load
              local.set 8
              block ;; label = @5
                local.get 1
                i32.const 4
                i32.add
                i32.load
                local.tee 3
                i32.load
                local.tee 9
                i32.eqz
                br_if 0 (;@5;)
                local.get 8
                local.get 9
                call_indirect (type 0)
              end
              block ;; label = @5
                local.get 3
                i32.load offset=4
                local.tee 9
                i32.eqz
                br_if 0 (;@5;)
                local.get 8
                local.get 9
                local.get 3
                i32.load offset=8
                call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
              end
              local.get 1
              i32.const 12
              i32.const 4
              call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
            end
            local.get 0
            i32.load offset=12
            i32.const 36
            i32.add
            i32.load
            local.set 1
            local.get 0
            i32.load offset=8
            local.set 0
            local.get 2
            local.get 4
            i64.store offset=584
            local.get 2
            local.get 6
            i64.store offset=576
            local.get 2
            local.get 7
            i64.store offset=568
            local.get 2
            local.get 5
            i64.store offset=560
            local.get 2
            i32.const 552
            i32.add
            local.get 0
            global.get $GOT.data.internal.__memory_base
            i32.const 1049710
            i32.add
            local.get 2
            i32.const 560
            i32.add
            local.get 1
            call_indirect (type 2)
            local.get 2
            i32.load8_u offset=552
            i32.const 3
            i32.ne
            br_if 1 (;@2;)
            local.get 2
            i32.load offset=556
            local.tee 1
            i32.load
            local.set 3
            block ;; label = @4
              local.get 1
              i32.const 4
              i32.add
              i32.load
              local.tee 0
              i32.load
              local.tee 8
              i32.eqz
              br_if 0 (;@4;)
              local.get 3
              local.get 8
              call_indirect (type 0)
            end
            block ;; label = @4
              local.get 0
              i32.load offset=4
              local.tee 8
              i32.eqz
              br_if 0 (;@4;)
              local.get 3
              local.get 8
              local.get 0
              i32.load offset=8
              call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
            end
            local.get 1
            i32.const 12
            i32.const 4
            call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
            br 1 (;@2;)
          end
          local.get 2
          i32.const 560
          i32.add
          local.get 0
          i32.load offset=8
          local.get 2
          i32.const 24
          i32.add
          local.get 1
          local.get 0
          i32.load offset=12
          i32.load offset=28
          call_indirect (type 2)
          local.get 2
          i32.load8_u offset=560
          i32.const 3
          i32.ne
          br_if 0 (;@2;)
          local.get 2
          i32.load offset=564
          local.tee 1
          i32.load
          local.set 3
          block ;; label = @3
            local.get 1
            i32.const 4
            i32.add
            i32.load
            local.tee 0
            i32.load
            local.tee 8
            i32.eqz
            br_if 0 (;@3;)
            local.get 3
            local.get 8
            call_indirect (type 0)
          end
          block ;; label = @3
            local.get 0
            i32.load offset=4
            local.tee 8
            i32.eqz
            br_if 0 (;@3;)
            local.get 3
            local.get 8
            local.get 0
            i32.load offset=8
            call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
          end
          local.get 1
          i32.const 12
          i32.const 4
          call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
        end
        local.get 2
        i32.const 592
        i32.add
        global.set $__stack_pointer
        return
      end
      call $_RNvNvMNtNtCsfH5l96bTt9G_3std6thread2idNtB4_8ThreadId3new9exhausted
      unreachable
    )
    (func $_RNvXs1i_NtCs2GenDSTXHQd_4core3fmtReNtB6_7Display3fmtCsfH5l96bTt9G_3std (;52;) (type 4) (param i32 i32) (result i32)
      local.get 0
      i32.load
      local.get 0
      i32.load offset=4
      local.get 1
      call $_RNvXsi_NtCs2GenDSTXHQd_4core3fmteNtB5_7Display3fmt
    )
    (func $_RNvXs1i_NtCs2GenDSTXHQd_4core3fmtRNtNtNtB8_5panic8location8LocationNtB6_7Display3fmtCsfH5l96bTt9G_3std (;53;) (type 4) (param i32 i32) (result i32)
      (local i32 i32 i32 i64)
      global.get $__stack_pointer
      i32.const 32
      i32.sub
      local.tee 2
      global.set $__stack_pointer
      local.get 1
      i32.load offset=4
      local.set 3
      local.get 1
      i32.load
      local.set 4
      local.get 2
      local.get 0
      i32.load
      local.tee 1
      i64.load align=4
      i64.store align=4
      local.get 2
      global.get $GOT.func.internal._RNvXs8_NtNtNtCs2GenDSTXHQd_4core3fmt3num3impmNtB9_7Display3fmt
      i64.extend_i32_u
      i64.const 32
      i64.shl
      local.tee 5
      local.get 1
      i32.const 12
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=24
      local.get 2
      local.get 5
      local.get 1
      i32.const 8
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=16
      local.get 2
      global.get $GOT.data.internal.__table_base
      i32.const 3
      i32.add
      i64.extend_i32_u
      i64.const 32
      i64.shl
      local.get 2
      i64.extend_i32_u
      i64.or
      i64.store offset=8
      local.get 4
      local.get 3
      global.get $GOT.data.internal.__memory_base
      i32.const 1048590
      i32.add
      local.get 2
      i32.const 8
      i32.add
      call $_RNvNtCs2GenDSTXHQd_4core3fmt5write
      local.set 1
      local.get 2
      i32.const 32
      i32.add
      global.set $__stack_pointer
      local.get 1
    )
    (func $_RNvYINtNtNtCsfH5l96bTt9G_3std2io6cursor6CursorQShENtB7_5Write9write_fmtB9_ (;54;) (type 2) (param i32 i32 i32 i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 4
      global.set $__stack_pointer
      local.get 0
      i32.const 4
      i32.store8
      local.get 4
      local.get 1
      i32.store offset=8
      local.get 4
      local.get 0
      i64.load align=4
      i64.store
      local.get 4
      global.get $GOT.data.internal.__memory_base
      i32.const 1050868
      i32.add
      local.get 2
      local.get 3
      call $_RNvNtCs2GenDSTXHQd_4core3fmt5write
      local.set 1
      local.get 4
      i32.load8_u
      local.set 3
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            local.get 1
            i32.eqz
            br_if 0 (;@3;)
            local.get 3
            i32.const 255
            i32.and
            i32.const 4
            i32.ne
            br_if 1 (;@2;)
            global.get $GOT.data.internal.__memory_base
            local.tee 4
            i32.const 1049783
            i32.add
            i32.const 173
            local.get 4
            i32.const 1050892
            i32.add
            call $_RNvNtCs2GenDSTXHQd_4core9panicking9panic_fmt
            unreachable
          end
          local.get 3
          i32.const 255
          i32.and
          i32.const 3
          i32.ne
          br_if 1 (;@1;)
          local.get 4
          i32.load offset=4
          local.tee 0
          i32.load
          local.set 3
          block ;; label = @3
            local.get 0
            i32.const 4
            i32.add
            i32.load
            local.tee 1
            i32.load
            local.tee 2
            i32.eqz
            br_if 0 (;@3;)
            local.get 3
            local.get 2
            call_indirect (type 0)
          end
          block ;; label = @3
            local.get 1
            i32.load offset=4
            local.tee 2
            i32.eqz
            br_if 0 (;@3;)
            local.get 3
            local.get 2
            local.get 1
            i32.load offset=8
            call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
          end
          local.get 0
          i32.const 12
          i32.const 4
          call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
          br 1 (;@1;)
        end
        local.get 0
        local.get 4
        i64.load
        i64.store align=4
      end
      local.get 4
      i32.const 16
      i32.add
      global.set $__stack_pointer
    )
    (func $_RNvNtCsfH5l96bTt9G_3std5alloc24default_alloc_error_hook (;55;) (type 1) (param i32 i32)
      (local i32 i32 i32 i64)
      global.get $__stack_pointer
      i32.const 32
      i32.sub
      local.tee 2
      global.set $__stack_pointer
      global.get $GOT.data.internal.__memory_base
      i32.const 1051688
      i32.add
      local.tee 3
      i32.load8_u
      local.set 4
      local.get 3
      i32.const 1
      i32.store8
      global.get $GOT.func.internal._RNvXsi_NtNtNtCs2GenDSTXHQd_4core3fmt3num3impjNtB9_7Display3fmt
      i64.extend_i32_u
      i64.const 32
      i64.shl
      local.set 5
      block ;; label = @1
        block ;; label = @2
          local.get 4
          br_if 0 (;@2;)
          local.get 2
          local.get 1
          i32.store offset=12
          local.get 2
          local.get 5
          local.get 2
          i32.const 12
          i32.add
          i64.extend_i32_u
          i64.or
          i64.store offset=16
          local.get 2
          i32.const 4
          i32.add
          local.get 2
          i32.const 31
          i32.add
          global.get $GOT.data.internal.__memory_base
          i32.const 1049600
          i32.add
          local.get 2
          i32.const 16
          i32.add
          call $_RNvYNtNtNtNtCsfH5l96bTt9G_3std3sys5stdio4unix6StderrNtNtBa_2io5Write9write_fmtBa_
          local.get 2
          i32.load8_u offset=4
          local.get 2
          i32.load offset=8
          call $_RINvNtCs2GenDSTXHQd_4core3ptr13drop_in_placeINtNtB4_6result6ResultuNtNtNtCsfH5l96bTt9G_3std2io5error5ErrorEEB19_
          call $_RNvNtNtCsfH5l96bTt9G_3std3sys9backtrace4lock
          local.set 1
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                block ;; label = @6
                  call $_RNvNtCsfH5l96bTt9G_3std5panic19get_backtrace_style
                  i32.const 255
                  i32.and
                  br_table 0 (;@6;) 1 (;@5;) 2 (;@4;) 3 (;@3;) 0 (;@6;)
                end
                local.get 2
                i32.const 16
                i32.add
                local.get 2
                i32.const 31
                i32.add
                global.get $GOT.data.internal.__table_base
                i32.const 8
                i32.add
                i32.const 0
                call $_RNvMNtNtCsfH5l96bTt9G_3std3sys9backtraceNtB2_13BacktraceLock5print
                local.get 2
                i32.load8_u offset=16
                local.get 2
                i32.load offset=20
                call $_RINvNtCs2GenDSTXHQd_4core3ptr13drop_in_placeINtNtB4_6result6ResultuNtNtNtCsfH5l96bTt9G_3std2io5error5ErrorEEB19_
                br 2 (;@3;)
              end
              local.get 2
              i32.const 16
              i32.add
              local.get 2
              i32.const 31
              i32.add
              global.get $GOT.data.internal.__table_base
              i32.const 8
              i32.add
              i32.const 1
              call $_RNvMNtNtCsfH5l96bTt9G_3std3sys9backtraceNtB2_13BacktraceLock5print
              local.get 2
              i32.load8_u offset=16
              local.get 2
              i32.load offset=20
              call $_RINvNtCs2GenDSTXHQd_4core3ptr13drop_in_placeINtNtB4_6result6ResultuNtNtNtCsfH5l96bTt9G_3std2io5error5ErrorEEB19_
              br 1 (;@3;)
            end
            local.get 2
            i32.const 16
            i32.add
            local.get 2
            i32.const 31
            i32.add
            global.get $GOT.data.internal.__memory_base
            i32.const 1049924
            i32.add
            i32.const 157
            call $_RNvYNtNtNtNtCsfH5l96bTt9G_3std3sys5stdio4unix6StderrNtNtBa_2io5Write9write_fmtBa_
            local.get 2
            i32.load8_u offset=16
            local.get 2
            i32.load offset=20
            call $_RINvNtCs2GenDSTXHQd_4core3ptr13drop_in_placeINtNtB4_6result6ResultuNtNtNtCsfH5l96bTt9G_3std2io5error5ErrorEEB19_
          end
          local.get 1
          i32.const 0
          i32.store8
          br 1 (;@1;)
        end
        local.get 2
        local.get 1
        i32.store offset=12
        local.get 2
        local.get 5
        local.get 2
        i32.const 12
        i32.add
        i64.extend_i32_u
        i64.or
        i64.store offset=16
        local.get 2
        i32.const 4
        i32.add
        local.get 2
        i32.const 31
        i32.add
        global.get $GOT.data.internal.__memory_base
        i32.const 1049436
        i32.add
        local.get 2
        i32.const 16
        i32.add
        call $_RNvYNtNtNtNtCsfH5l96bTt9G_3std3sys5stdio4unix6StderrNtNtBa_2io5Write9write_fmtBa_
        local.get 2
        i32.load8_u offset=4
        local.get 2
        i32.load offset=8
        call $_RINvNtCs2GenDSTXHQd_4core3ptr13drop_in_placeINtNtB4_6result6ResultuNtNtNtCsfH5l96bTt9G_3std2io5error5ErrorEEB19_
      end
      local.get 2
      i32.const 32
      i32.add
      global.set $__stack_pointer
    )
    (func $_RNvNtCsfH5l96bTt9G_3std7process5abort (;56;) (type 10)
      call $_RNvNtNtNtNtCsfH5l96bTt9G_3std3sys3pal4wasi7helpers14abort_internal
      unreachable
    )
    (func $_RNCNvNtCsfH5l96bTt9G_3std9panicking12default_hook0B5_ (;57;) (type 11) (param i32 i32 i32)
      (local i32 i32 i64 i32)
      global.get $__stack_pointer
      i32.const 32
      i32.sub
      local.tee 3
      global.set $__stack_pointer
      call $_RNvNtNtCsfH5l96bTt9G_3std3sys9backtrace4lock
      local.set 4
      local.get 0
      i64.load align=4
      local.set 5
      local.get 3
      local.get 2
      i32.store offset=24
      local.get 3
      local.get 1
      i32.store offset=20
      local.get 3
      local.get 5
      i64.store offset=12 align=4
      block ;; label = @1
        block ;; label = @2
          global.get $GOT.data.internal._RNvNtNtCsfH5l96bTt9G_3std6thread7current7CURRENT
          i32.load
          local.tee 6
          i32.const 2
          i32.gt_u
          br_if 0 (;@2;)
          local.get 3
          i32.const 12
          i32.add
          i32.const 0
          call $_RNCINvNtNtCsfH5l96bTt9G_3std6thread7current17with_current_nameNCNCNvNtB8_9panicking12default_hook00uE0B8_
          br 1 (;@1;)
        end
        local.get 3
        local.get 6
        i32.const -8
        i32.add
        i32.store offset=28
        local.get 3
        i32.const 12
        i32.add
        local.get 3
        i32.const 28
        i32.add
        call $_RNCINvNtNtCsfH5l96bTt9G_3std6thread7current17with_current_nameNCNCNvNtB8_9panicking12default_hook00uE0B8_
      end
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              local.get 0
              i32.load offset=8
              i32.load8_u
              br_table 0 (;@4;) 1 (;@3;) 2 (;@2;) 3 (;@1;) 0 (;@4;)
            end
            local.get 3
            i32.const 12
            i32.add
            local.get 1
            local.get 2
            i32.load offset=36
            i32.const 0
            call $_RNvMNtNtCsfH5l96bTt9G_3std3sys9backtraceNtB2_13BacktraceLock5print
            local.get 3
            i32.load8_u offset=12
            local.get 3
            i32.load offset=16
            call $_RINvNtCs2GenDSTXHQd_4core3ptr13drop_in_placeINtNtB4_6result6ResultuNtNtNtCsfH5l96bTt9G_3std2io5error5ErrorEEB19_
            br 2 (;@1;)
          end
          local.get 3
          i32.const 12
          i32.add
          local.get 1
          local.get 2
          i32.load offset=36
          i32.const 1
          call $_RNvMNtNtCsfH5l96bTt9G_3std3sys9backtraceNtB2_13BacktraceLock5print
          local.get 3
          i32.load8_u offset=12
          local.get 3
          i32.load offset=16
          call $_RINvNtCs2GenDSTXHQd_4core3ptr13drop_in_placeINtNtB4_6result6ResultuNtNtNtCsfH5l96bTt9G_3std2io5error5ErrorEEB19_
          br 1 (;@1;)
        end
        global.get $GOT.data.internal.__memory_base
        i32.const 1051136
        i32.add
        local.tee 0
        i32.load8_u
        local.set 6
        local.get 0
        i32.const 0
        i32.store8
        local.get 6
        i32.eqz
        br_if 0 (;@1;)
        local.get 3
        i32.const 12
        i32.add
        local.get 1
        global.get $GOT.data.internal.__memory_base
        i32.const 1049924
        i32.add
        i32.const 157
        local.get 2
        i32.load offset=36
        call_indirect (type 2)
        local.get 3
        i32.load8_u offset=12
        local.get 3
        i32.load offset=16
        call $_RINvNtCs2GenDSTXHQd_4core3ptr13drop_in_placeINtNtB4_6result6ResultuNtNtNtCsfH5l96bTt9G_3std2io5error5ErrorEEB19_
      end
      local.get 4
      i32.const 0
      i32.store8
      local.get 3
      i32.const 32
      i32.add
      global.set $__stack_pointer
    )
    (func $_RNvNtNtCsfH5l96bTt9G_3std3sys9backtrace4lock (;58;) (type 9) (result i32)
      (local i32 i32 i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 0
      global.set $__stack_pointer
      global.get $GOT.data.internal.__memory_base
      i32.const 1051689
      i32.add
      local.tee 1
      i32.load8_u
      local.set 2
      local.get 1
      i32.const 1
      i32.store8
      local.get 0
      local.get 2
      i32.store8 offset=15
      block ;; label = @1
        local.get 2
        i32.const 1
        i32.ne
        br_if 0 (;@1;)
        global.get $GOT.data.internal.__memory_base
        local.set 2
        i32.const 0
        local.get 0
        i32.const 15
        i32.add
        global.get $GOT.data.internal._RNvNCNvNvNtNtNtCsfH5l96bTt9G_3std4sync4mpmc5waker17current_thread_id5DUMMY023___RUST_STD_INTERNAL_VAL
        local.get 2
        i32.const 1050107
        i32.add
        i32.const 65
        local.get 2
        i32.const 1051072
        i32.add
        call $_RINvNtCs2GenDSTXHQd_4core9panicking13assert_failedbbECsfH5l96bTt9G_3std
        unreachable
      end
      global.get $GOT.data.internal.__memory_base
      local.set 2
      local.get 0
      i32.const 16
      i32.add
      global.set $__stack_pointer
      local.get 2
      i32.const 1051689
      i32.add
    )
    (func $_RNvMNtNtCsfH5l96bTt9G_3std3sys9backtraceNtB2_13BacktraceLock5print (;59;) (type 2) (param i32 i32 i32 i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 4
      global.set $__stack_pointer
      local.get 4
      local.get 3
      i32.store8 offset=7
      local.get 4
      global.get $GOT.func.internal._RNvXNvMNtNtCsfH5l96bTt9G_3std3sys9backtraceNtB5_13BacktraceLock5printNtB2_16DisplayBacktraceNtNtCs2GenDSTXHQd_4core3fmt7Display3fmt
      i64.extend_i32_u
      i64.const 32
      i64.shl
      local.get 4
      i32.const 7
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=8
      local.get 0
      local.get 1
      global.get $GOT.data.internal.__memory_base
      i32.const 1048868
      i32.add
      local.get 4
      i32.const 8
      i32.add
      local.get 2
      call_indirect (type 2)
      local.get 4
      i32.const 16
      i32.add
      global.set $__stack_pointer
    )
    (func $_RNvNtCsfH5l96bTt9G_3std9panicking12default_hook (;60;) (type 0) (param i32)
      (local i32 i32 i32)
      global.get $__stack_pointer
      i32.const 48
      i32.sub
      local.tee 1
      global.set $__stack_pointer
      i32.const 3
      local.set 2
      block ;; label = @1
        local.get 0
        i32.load8_u offset=13
        br_if 0 (;@1;)
        i32.const 1
        local.set 2
        global.get $GOT.data.internal.__memory_base
        i32.const 1051624
        i32.add
        i32.load
        i32.const 1
        i32.gt_u
        br_if 0 (;@1;)
        call $_RNvNtCsfH5l96bTt9G_3std5panic19get_backtrace_style
        i32.const 255
        i32.and
        local.set 2
      end
      local.get 1
      local.get 2
      i32.store8 offset=11
      local.get 1
      local.get 0
      i32.load offset=8
      i32.store offset=12
      local.get 1
      local.get 0
      i32.load
      local.get 0
      i32.load offset=4
      call $_RNvNtCsfH5l96bTt9G_3std9panicking14payload_as_str
      local.get 1
      local.get 1
      i64.load
      i64.store offset=16 align=4
      global.get $GOT.data.internal.__memory_base
      i32.const 1051652
      i32.add
      i32.load8_u
      local.set 0
      local.get 1
      local.get 1
      i32.const 11
      i32.add
      i32.store offset=32
      local.get 1
      local.get 1
      i32.const 16
      i32.add
      i32.store offset=28
      local.get 1
      local.get 1
      i32.const 12
      i32.add
      i32.store offset=24
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            local.get 0
            i32.eqz
            br_if 0 (;@3;)
            global.get $GOT.data.internal.__memory_base
            local.tee 0
            i32.const 1051652
            i32.add
            i32.const 1
            i32.store8
            local.get 0
            i32.const 1051620
            i32.add
            local.tee 2
            i32.load
            local.set 0
            local.get 2
            i32.const 0
            i32.store
            local.get 0
            br_if 1 (;@2;)
          end
          local.get 1
          i32.const 24
          i32.add
          local.get 1
          i32.const 47
          i32.add
          global.get $GOT.data.internal.__memory_base
          i32.const 1051140
          i32.add
          call $_RNCNvNtCsfH5l96bTt9G_3std9panicking12default_hook0B5_
          br 1 (;@1;)
        end
        global.get $GOT.data.internal.__memory_base
        local.set 2
        local.get 1
        i32.const 24
        i32.add
        local.get 0
        i32.const 8
        i32.add
        call $_RNvMs5_NtNtNtCsfH5l96bTt9G_3std4sync6poison5mutexINtB5_5MutexINtNtCsblnovvQk4nh_5alloc3vec3VechEE4lockBb_
        local.tee 3
        i32.const 4
        i32.add
        local.get 2
        i32.const 1051180
        i32.add
        call $_RNCNvNtCsfH5l96bTt9G_3std9panicking12default_hook0B5_
        local.get 3
        i32.const 0
        i32.store8
        local.get 2
        i32.const 1051652
        i32.add
        i32.const 1
        i32.store8
        local.get 2
        i32.const 1051620
        i32.add
        local.tee 3
        i32.load
        local.set 2
        local.get 3
        local.get 0
        i32.store
        local.get 1
        local.get 2
        i32.store offset=40
        local.get 1
        i32.const 1
        i32.store offset=36
        local.get 2
        i32.eqz
        br_if 0 (;@1;)
        local.get 2
        local.get 2
        i32.load
        local.tee 0
        i32.const -1
        i32.add
        i32.store
        local.get 0
        i32.const 1
        i32.ne
        br_if 0 (;@1;)
        local.get 1
        i32.const 36
        i32.add
        i32.const 4
        i32.add
        call $_RNvMsn_NtCsblnovvQk4nh_5alloc4syncINtB5_3ArcINtNtNtNtCsfH5l96bTt9G_3std4sync6poison5mutex5MutexINtNtB7_3vec3VechEEE9drop_slowBP_
      end
      local.get 1
      i32.const 48
      i32.add
      global.set $__stack_pointer
    )
    (func $_RNvCsgrkdPkmfNkI_7___rustc10rust_panic (;61;) (type 1) (param i32 i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 32
      i32.sub
      local.tee 2
      global.set $__stack_pointer
      local.get 2
      local.get 0
      local.get 1
      call $_RNvCsgrkdPkmfNkI_7___rustc18___rust_start_panic
      i32.store offset=4
      local.get 2
      global.get $GOT.func.internal._RNvXs8_NtNtNtCs2GenDSTXHQd_4core3fmt3num3impmNtB9_7Display3fmt
      i64.extend_i32_u
      i64.const 32
      i64.shl
      local.get 2
      i32.const 4
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=16
      local.get 2
      i32.const 8
      i32.add
      local.get 2
      i32.const 31
      i32.add
      global.get $GOT.data.internal.__memory_base
      i32.const 1049532
      i32.add
      local.get 2
      i32.const 16
      i32.add
      call $_RNvYNtNtNtNtCsfH5l96bTt9G_3std3sys5stdio4unix6StderrNtNtBa_2io5Write9write_fmtBa_
      local.get 2
      i32.load8_u offset=8
      local.get 2
      i32.load offset=12
      call $_RINvNtCs2GenDSTXHQd_4core3ptr13drop_in_placeINtNtB4_6result6ResultuNtNtNtCsfH5l96bTt9G_3std2io5error5ErrorEEB19_
      call $_RNvNtCsfH5l96bTt9G_3std7process5abort
      unreachable
    )
    (func $_RNvYNtNtNtNtCsfH5l96bTt9G_3std3sys5stdio4unix6StderrNtNtBa_2io5Write9write_fmtBa_ (;62;) (type 2) (param i32 i32 i32 i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 4
      global.set $__stack_pointer
      local.get 0
      i32.const 4
      i32.store8
      local.get 4
      local.get 1
      i32.store offset=8
      local.get 4
      local.get 0
      i64.load align=4
      i64.store
      local.get 4
      global.get $GOT.data.internal.__memory_base
      i32.const 1050932
      i32.add
      local.get 2
      local.get 3
      call $_RNvNtCs2GenDSTXHQd_4core3fmt5write
      local.set 1
      local.get 4
      i32.load8_u
      local.set 3
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            local.get 1
            i32.eqz
            br_if 0 (;@3;)
            local.get 3
            i32.const 255
            i32.and
            i32.const 4
            i32.ne
            br_if 1 (;@2;)
            global.get $GOT.data.internal.__memory_base
            local.tee 4
            i32.const 1049783
            i32.add
            i32.const 173
            local.get 4
            i32.const 1050892
            i32.add
            call $_RNvNtCs2GenDSTXHQd_4core9panicking9panic_fmt
            unreachable
          end
          local.get 3
          i32.const 255
          i32.and
          i32.const 3
          i32.ne
          br_if 1 (;@1;)
          local.get 4
          i32.load offset=4
          local.tee 0
          i32.load
          local.set 3
          block ;; label = @3
            local.get 0
            i32.const 4
            i32.add
            i32.load
            local.tee 1
            i32.load
            local.tee 2
            i32.eqz
            br_if 0 (;@3;)
            local.get 3
            local.get 2
            call_indirect (type 0)
          end
          block ;; label = @3
            local.get 1
            i32.load offset=4
            local.tee 2
            i32.eqz
            br_if 0 (;@3;)
            local.get 3
            local.get 2
            local.get 1
            i32.load offset=8
            call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
          end
          local.get 0
          i32.const 12
          i32.const 4
          call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
          br 1 (;@1;)
        end
        local.get 0
        local.get 4
        i64.load
        i64.store align=4
      end
      local.get 4
      i32.const 16
      i32.add
      global.set $__stack_pointer
    )
    (func $_RNvCsgrkdPkmfNkI_7___rustc11___rdl_alloc (;63;) (type 4) (param i32 i32) (result i32)
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
    (func $_RNvCsgrkdPkmfNkI_7___rustc12___rust_abort (;64;) (type 10)
      call $_RNvNtCsfH5l96bTt9G_3std7process5abort
      unreachable
    )
    (func $_RNvCsgrkdPkmfNkI_7___rustc13___rdl_dealloc (;65;) (type 11) (param i32 i32 i32)
      local.get 0
      call $free
    )
    (func $_RNvCsgrkdPkmfNkI_7___rustc13___rdl_realloc (;66;) (type 5) (param i32 i32 i32 i32) (result i32)
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
    (func $_RNvCsgrkdPkmfNkI_7___rustc17rust_begin_unwind (;67;) (type 0) (param i32)
      (local i32 i64)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 1
      global.set $__stack_pointer
      local.get 0
      i64.load align=4
      local.set 2
      local.get 1
      local.get 0
      i32.store offset=12
      local.get 1
      local.get 2
      i64.store offset=4 align=4
      local.get 1
      i32.const 4
      i32.add
      call $_RINvNtNtCsfH5l96bTt9G_3std3sys9backtrace26___rust_end_short_backtraceNCNvNtB6_9panicking13panic_handler0zEB6_
      unreachable
    )
    (func $_RNvCsgrkdPkmfNkI_7___rustc26___rust_alloc_error_handler (;68;) (type 1) (param i32 i32)
      local.get 1
      local.get 0
      call $_RNvNtCsfH5l96bTt9G_3std5alloc8rust_oom
      unreachable
    )
    (func $_RNvNtCsfH5l96bTt9G_3std5alloc8rust_oom (;69;) (type 1) (param i32 i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 2
      global.set $__stack_pointer
      local.get 2
      local.get 1
      i32.store offset=12
      local.get 2
      local.get 0
      i32.store offset=8
      local.get 2
      i32.const 8
      i32.add
      call $_RINvNtNtCsfH5l96bTt9G_3std3sys9backtrace26___rust_end_short_backtraceNCNvNtB6_5alloc8rust_oom0zEB6_
      unreachable
    )
    (func $_RNvXNvMNtNtCsfH5l96bTt9G_3std3sys9backtraceNtB5_13BacktraceLock5printNtB2_16DisplayBacktraceNtNtCs2GenDSTXHQd_4core3fmt7Display3fmt (;70;) (type 4) (param i32 i32) (result i32)
      (local i32 i32 i32 i64 i32 i32 i32 i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 2
      global.set $__stack_pointer
      local.get 1
      i32.load offset=4
      local.set 3
      local.get 1
      i32.load
      local.set 4
      local.get 0
      i32.load8_u
      local.set 0
      local.get 2
      i32.const 4
      i32.add
      call $_RNvNtCsfH5l96bTt9G_3std3env11current_dir
      local.get 2
      i64.load offset=8 align=4
      local.set 5
      block ;; label = @1
        local.get 2
        i32.load offset=4
        local.tee 1
        i32.const -2147483648
        i32.ne
        br_if 0 (;@1;)
        local.get 5
        i64.const 255
        i64.and
        i64.const 3
        i64.ne
        br_if 0 (;@1;)
        local.get 5
        i64.const 32
        i64.shr_u
        i32.wrap_i64
        local.tee 6
        i32.load
        local.set 7
        block ;; label = @2
          local.get 6
          i32.const 4
          i32.add
          i32.load
          local.tee 8
          i32.load
          local.tee 9
          i32.eqz
          br_if 0 (;@2;)
          local.get 7
          local.get 9
          call_indirect (type 0)
        end
        block ;; label = @2
          local.get 8
          i32.load offset=4
          local.tee 9
          i32.eqz
          br_if 0 (;@2;)
          local.get 7
          local.get 9
          local.get 8
          i32.load offset=8
          call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
        end
        local.get 6
        i32.const 12
        i32.const 4
        call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
      end
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              local.get 4
              global.get $GOT.data.internal.__memory_base
              i32.const 1050299
              i32.add
              i32.const 17
              local.get 3
              i32.load offset=12
              local.tee 3
              call_indirect (type 3)
              br_if 0 (;@4;)
              local.get 0
              i32.const 1
              i32.and
              br_if 1 (;@3;)
              local.get 4
              global.get $GOT.data.internal.__memory_base
              i32.const 1050316
              i32.add
              i32.const 88
              local.get 3
              call_indirect (type 3)
              i32.eqz
              br_if 1 (;@3;)
            end
            i32.const 1
            local.set 4
            local.get 1
            i32.const 0
            i32.gt_s
            br_if 1 (;@2;)
            br 2 (;@1;)
          end
          i32.const 0
          local.set 4
          local.get 1
          i32.const 0
          i32.le_s
          br_if 1 (;@1;)
        end
        local.get 5
        i32.wrap_i64
        local.get 1
        i32.const 1
        call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
      end
      local.get 2
      i32.const 16
      i32.add
      global.set $__stack_pointer
      local.get 4
    )
    (func $_RNvNtCsfH5l96bTt9G_3std3env7__var_os (;71;) (type 11) (param i32 i32 i32)
      (local i32 i32 i32)
      global.get $__stack_pointer
      i32.const 416
      i32.sub
      local.tee 3
      global.set $__stack_pointer
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            local.get 2
            i32.const 383
            i32.gt_u
            br_if 0 (;@3;)
            block ;; label = @4
              local.get 2
              i32.eqz
              br_if 0 (;@4;)
              local.get 3
              i32.const 20
              i32.add
              local.get 1
              local.get 2
              memory.copy
            end
            local.get 3
            i32.const 20
            i32.add
            local.get 2
            i32.add
            i32.const 0
            i32.store8
            local.get 3
            i32.const 404
            i32.add
            local.get 3
            i32.const 20
            i32.add
            local.get 2
            i32.const 1
            i32.add
            call $_RNvMs3_NtNtCs2GenDSTXHQd_4core3ffi5c_strNtB5_4CStr19from_bytes_with_nul
            block ;; label = @4
              local.get 3
              i32.load offset=404
              i32.const 1
              i32.ne
              br_if 0 (;@4;)
              local.get 3
              global.get $GOT.data.internal.__memory_base
              i32.const 1050968
              i32.add
              i64.load
              i64.store offset=12 align=4
              i32.const -2147483647
              local.set 2
              br 2 (;@2;)
            end
            block ;; label = @4
              local.get 3
              i32.load offset=408
              call $getenv
              local.tee 1
              br_if 0 (;@4;)
              i32.const -2147483648
              local.set 2
              br 2 (;@2;)
            end
            block ;; label = @4
              block ;; label = @5
                local.get 1
                call $strlen
                local.tee 2
                br_if 0 (;@5;)
                i32.const 1
                local.set 4
                br 1 (;@4;)
              end
              call $_RNvCsgrkdPkmfNkI_7___rustc35___rust_no_alloc_shim_is_unstable_v2
              local.get 2
              i32.const 1
              call $_RNvCsgrkdPkmfNkI_7___rustc12___rust_alloc
              local.tee 4
              i32.eqz
              br_if 3 (;@1;)
              local.get 2
              i32.eqz
              br_if 0 (;@4;)
              local.get 4
              local.get 1
              local.get 2
              memory.copy
            end
            local.get 3
            local.get 2
            i32.store offset=16
            local.get 3
            local.get 4
            i32.store offset=12
            br 1 (;@2;)
          end
          local.get 3
          i32.const 8
          i32.add
          local.get 1
          local.get 2
          call $_RINvNtNtNtCsfH5l96bTt9G_3std3sys7helpers14small_c_string24run_with_cstr_allocatingINtNtCs2GenDSTXHQd_4core6option6OptionNtNtNtB8_3ffi6os_str8OsStringEEB8_
          local.get 3
          i32.load offset=8
          local.set 2
        end
        block ;; label = @2
          block ;; label = @3
            local.get 2
            i32.const -2147483647
            i32.eq
            br_if 0 (;@3;)
            local.get 0
            local.get 3
            i64.load offset=12 align=4
            i64.store offset=4 align=4
            local.get 0
            local.get 2
            i32.store
            br 1 (;@2;)
          end
          block ;; label = @3
            local.get 3
            i32.load8_u offset=12
            i32.const 3
            i32.ne
            br_if 0 (;@3;)
            local.get 3
            i32.load offset=16
            local.tee 2
            i32.load
            local.set 4
            block ;; label = @4
              local.get 2
              i32.const 4
              i32.add
              i32.load
              local.tee 1
              i32.load
              local.tee 5
              i32.eqz
              br_if 0 (;@4;)
              local.get 4
              local.get 5
              call_indirect (type 0)
            end
            block ;; label = @4
              local.get 1
              i32.load offset=4
              local.tee 5
              i32.eqz
              br_if 0 (;@4;)
              local.get 4
              local.get 5
              local.get 1
              i32.load offset=8
              call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
            end
            local.get 2
            i32.const 12
            i32.const 4
            call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
          end
          local.get 0
          i32.const -2147483648
          i32.store
        end
        local.get 3
        i32.const 416
        i32.add
        global.set $__stack_pointer
        return
      end
      i32.const 1
      local.get 2
      call $_RNvNtCsblnovvQk4nh_5alloc7raw_vec12handle_error
      unreachable
    )
    (func $_RNvMs5_NtNtNtCsfH5l96bTt9G_3std4sync6poison5mutexINtB5_5MutexINtNtCsblnovvQk4nh_5alloc3vec3VechEE4lockBb_ (;72;) (type 8) (param i32) (result i32)
      (local i32 i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 1
      global.set $__stack_pointer
      local.get 0
      i32.load8_u
      local.set 2
      local.get 0
      i32.const 1
      i32.store8
      local.get 1
      local.get 2
      i32.store8 offset=15
      block ;; label = @1
        local.get 2
        i32.const 1
        i32.ne
        br_if 0 (;@1;)
        global.get $GOT.data.internal.__memory_base
        local.set 0
        i32.const 0
        local.get 1
        i32.const 15
        i32.add
        global.get $GOT.data.internal._RNvNCNvNvNtNtNtCsfH5l96bTt9G_3std4sync4mpmc5waker17current_thread_id5DUMMY023___RUST_STD_INTERNAL_VAL
        local.get 0
        i32.const 1050107
        i32.add
        i32.const 65
        local.get 0
        i32.const 1051072
        i32.add
        call $_RINvNtCs2GenDSTXHQd_4core9panicking13assert_failedbbECsfH5l96bTt9G_3std
        unreachable
      end
      local.get 1
      i32.const 16
      i32.add
      global.set $__stack_pointer
      local.get 0
    )
    (func $_RNvMsn_NtCsblnovvQk4nh_5alloc4syncINtB5_3ArcINtNtNtNtCsfH5l96bTt9G_3std4sync6poison5mutex5MutexINtNtB7_3vec3VechEEE9drop_slowBP_ (;73;) (type 0) (param i32)
      (local i32)
      block ;; label = @1
        local.get 0
        i32.load
        local.tee 0
        i32.const 12
        i32.add
        i32.load
        local.tee 1
        i32.eqz
        br_if 0 (;@1;)
        local.get 0
        i32.const 16
        i32.add
        i32.load
        local.get 1
        i32.const 1
        call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
      end
      block ;; label = @1
        local.get 0
        i32.const -1
        i32.eq
        br_if 0 (;@1;)
        local.get 0
        local.get 0
        i32.load offset=4
        local.tee 1
        i32.const -1
        i32.add
        i32.store offset=4
        local.get 1
        i32.const 1
        i32.ne
        br_if 0 (;@1;)
        local.get 0
        i32.const 24
        i32.const 4
        call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
      end
    )
    (func $_RNvNtCsfH5l96bTt9G_3std3env11current_dir (;74;) (type 0) (param i32)
      (local i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 1
      global.set $__stack_pointer
      call $_RNvCsgrkdPkmfNkI_7___rustc35___rust_no_alloc_shim_is_unstable_v2
      i32.const 512
      local.set 2
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              i32.const 512
              i32.const 1
              call $_RNvCsgrkdPkmfNkI_7___rustc12___rust_alloc
              local.tee 3
              i32.eqz
              br_if 0 (;@4;)
              local.get 1
              local.get 3
              i32.store offset=8
              local.get 1
              i32.const 512
              i32.store offset=4
              block ;; label = @5
                block ;; label = @6
                  block ;; label = @7
                    local.get 3
                    i32.const 512
                    call $getcwd
                    br_if 0 (;@7;)
                    i32.const 512
                    local.set 2
                    loop ;; label = @8
                      global.get $GOT.data.internal.errno
                      i32.load
                      local.tee 4
                      i32.const 68
                      i32.ne
                      br_if 2 (;@6;)
                      local.get 1
                      local.get 2
                      i32.store offset=12
                      local.get 1
                      i32.const 4
                      i32.add
                      local.get 2
                      i32.const 1
                      i32.const 1
                      i32.const 1
                      call $_RINvNvMs2_NtCsblnovvQk4nh_5alloc7raw_vecINtB8_11RawVecInnerpE7reserve21do_reserve_and_handleNtNtBa_5alloc6GlobalECsfH5l96bTt9G_3std
                      local.get 1
                      i32.load offset=8
                      local.tee 3
                      local.get 1
                      i32.load offset=4
                      local.tee 2
                      call $getcwd
                      i32.eqz
                      br_if 0 (;@8;)
                    end
                  end
                  local.get 1
                  local.get 3
                  call $strlen
                  local.tee 4
                  i32.store offset=12
                  local.get 2
                  local.get 4
                  i32.le_u
                  br_if 4 (;@2;)
                  local.get 4
                  br_if 1 (;@5;)
                  i32.const 1
                  local.set 5
                  local.get 3
                  local.get 2
                  i32.const 1
                  call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
                  br 3 (;@3;)
                end
                local.get 0
                local.get 4
                i32.store offset=8
                local.get 0
                i64.const 2147483648
                i64.store align=4
                local.get 2
                i32.eqz
                br_if 4 (;@1;)
                local.get 3
                local.get 2
                i32.const 1
                call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
                br 4 (;@1;)
              end
              local.get 3
              local.get 2
              i32.const 1
              local.get 4
              call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_realloc
              local.tee 5
              br_if 1 (;@3;)
              i32.const 1
              local.get 4
              call $_RNvNtCsblnovvQk4nh_5alloc7raw_vec12handle_error
              unreachable
            end
            i32.const 1
            i32.const 512
            call $_RNvNtCsblnovvQk4nh_5alloc7raw_vec12handle_error
            unreachable
          end
          local.get 1
          local.get 4
          i32.store offset=4
          local.get 1
          local.get 5
          i32.store offset=8
        end
        local.get 0
        local.get 1
        i32.load offset=12
        i32.store offset=8
        local.get 0
        local.get 1
        i64.load offset=4 align=4
        i64.store align=4
      end
      local.get 1
      i32.const 16
      i32.add
      global.set $__stack_pointer
    )
    (func $_RNvNtCsfH5l96bTt9G_3std5panic19get_backtrace_style (;75;) (type 9) (result i32)
      (local i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 0
      global.set $__stack_pointer
      i32.const 3
      local.set 1
      block ;; label = @1
        global.get $GOT.data.internal.__memory_base
        i32.const 1051636
        i32.add
        i32.load8_u
        i32.const -1
        i32.add
        local.tee 2
        i32.const 255
        i32.and
        i32.const 3
        i32.lt_u
        br_if 0 (;@1;)
        local.get 0
        i32.const 4
        i32.add
        global.get $GOT.data.internal.__memory_base
        i32.const 1050093
        i32.add
        i32.const 14
        call $_RNvNtCsfH5l96bTt9G_3std3env7__var_os
        block ;; label = @2
          block ;; label = @3
            local.get 0
            i32.load offset=4
            local.tee 3
            i32.const -2147483648
            i32.ne
            br_if 0 (;@3;)
            i32.const 2
            local.set 2
            br 1 (;@2;)
          end
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                block ;; label = @6
                  local.get 0
                  i32.load offset=12
                  i32.const -1
                  i32.add
                  br_table 0 (;@6;) 2 (;@4;) 2 (;@4;) 1 (;@5;) 2 (;@4;)
                end
                local.get 0
                i32.load offset=8
                local.tee 4
                i32.load8_u
                i32.const 48
                i32.ne
                br_if 1 (;@4;)
                i32.const 3
                local.set 1
                i32.const 2
                local.set 2
                local.get 3
                br_if 2 (;@3;)
                br 3 (;@2;)
              end
              local.get 0
              i32.load offset=8
              local.tee 4
              i32.load align=1
              i32.const 1819047270
              i32.ne
              br_if 0 (;@4;)
              i32.const 2
              local.set 1
              i32.const 1
              local.set 2
              local.get 3
              br_if 1 (;@3;)
              br 2 (;@2;)
            end
            i32.const 1
            local.set 1
            i32.const 0
            local.set 2
            local.get 3
            i32.eqz
            br_if 1 (;@2;)
            local.get 0
            i32.load offset=8
            local.set 4
          end
          local.get 4
          local.get 3
          i32.const 1
          call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
        end
        global.get $GOT.data.internal.__memory_base
        i32.const 1051636
        i32.add
        local.tee 3
        local.get 3
        i32.load8_u
        local.tee 3
        local.get 1
        local.get 3
        select
        i32.store8
        local.get 3
        i32.eqz
        br_if 0 (;@1;)
        i32.const 3
        local.set 2
        local.get 3
        i32.const 4
        i32.ge_u
        br_if 0 (;@1;)
        i32.const 33619971
        local.get 3
        i32.const 3
        i32.shl
        i32.const 248
        i32.and
        i32.shr_u
        local.set 2
      end
      local.get 0
      i32.const 16
      i32.add
      global.set $__stack_pointer
      local.get 2
    )
    (func $_RNvNtNtNtNtCsfH5l96bTt9G_3std3sys3pal4wasi7helpers14abort_internal (;76;) (type 10)
      call $abort
      unreachable
    )
    (func $_RNvNtCsfH5l96bTt9G_3std9panicking14payload_as_str (;77;) (type 11) (param i32 i32 i32)
      (local i32 i32 i32 i64 i64)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 3
      global.set $__stack_pointer
      local.get 3
      local.get 1
      local.get 2
      i32.load offset=12
      local.tee 4
      call_indirect (type 1)
      i32.const 4
      local.set 2
      local.get 1
      local.set 5
      block ;; label = @1
        block ;; label = @2
          local.get 3
          i64.load
          i64.const 7199936582794304877
          i64.xor
          local.get 3
          i64.load offset=8
          i64.const -5076933981314334344
          i64.xor
          i64.or
          i64.eqz
          br_if 0 (;@2;)
          local.get 3
          local.get 1
          local.get 4
          call_indirect (type 1)
          local.get 3
          i64.load offset=8
          local.set 6
          local.get 3
          i64.load
          local.set 7
          global.get $GOT.data.internal.__memory_base
          local.set 2
          block ;; label = @3
            local.get 7
            i64.const 2547926133226083000
            i64.xor
            local.get 6
            i64.const -891466178338560190
            i64.xor
            i64.or
            i64.const 0
            i64.eq
            br_if 0 (;@3;)
            local.get 2
            i32.const 1050214
            i32.add
            local.set 1
            i32.const 12
            local.set 2
            br 2 (;@1;)
          end
          local.get 1
          i32.const 4
          i32.add
          local.set 5
          i32.const 8
          local.set 2
        end
        local.get 1
        local.get 2
        i32.add
        i32.load
        local.set 2
        local.get 5
        i32.load
        local.set 1
      end
      local.get 0
      local.get 2
      i32.store offset=4
      local.get 0
      local.get 1
      i32.store
      local.get 3
      i32.const 16
      i32.add
      global.set $__stack_pointer
    )
    (func $_RNvNtNtCsfH5l96bTt9G_3std9panicking11panic_count8increase (;78;) (type 8) (param i32) (result i32)
      (local i32 i32)
      global.get $GOT.data.internal._RNvNtNtCsfH5l96bTt9G_3std9panicking11panic_count18GLOBAL_PANIC_COUNT
      local.tee 1
      local.get 1
      i32.load
      local.tee 2
      i32.const 1
      i32.add
      i32.store
      i32.const 0
      local.set 1
      block ;; label = @1
        local.get 2
        i32.const 0
        i32.lt_s
        br_if 0 (;@1;)
        i32.const 1
        local.set 1
        global.get $GOT.data.internal.__memory_base
        i32.const 1051628
        i32.add
        i32.load8_u
        br_if 0 (;@1;)
        global.get $GOT.data.internal.__memory_base
        local.tee 1
        i32.const 1051628
        i32.add
        local.get 0
        i32.store8
        local.get 1
        i32.const 1051624
        i32.add
        local.tee 1
        local.get 1
        i32.load
        i32.const 1
        i32.add
        i32.store
        i32.const 2
        local.set 1
      end
      local.get 1
    )
    (func $_RNvXs1j_NtCs2GenDSTXHQd_4core3fmtQDNtNtB8_5panic12PanicPayloadEL_NtB6_7Display3fmtCsfH5l96bTt9G_3std (;79;) (type 4) (param i32 i32) (result i32)
      local.get 0
      i32.load
      local.get 1
      local.get 0
      i32.load offset=4
      i32.load offset=12
      call_indirect (type 4)
    )
    (func $_RNvYINtNtCsblnovvQk4nh_5alloc3vec3VechENtNtCsfH5l96bTt9G_3std2io5Write9write_fmtBF_ (;80;) (type 2) (param i32 i32 i32 i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 4
      global.set $__stack_pointer
      local.get 0
      i32.const 4
      i32.store8
      local.get 4
      local.get 1
      i32.store offset=8
      local.get 4
      local.get 0
      i64.load align=4
      i64.store
      local.get 4
      global.get $GOT.data.internal.__memory_base
      i32.const 1050908
      i32.add
      local.get 2
      local.get 3
      call $_RNvNtCs2GenDSTXHQd_4core3fmt5write
      local.set 1
      local.get 4
      i32.load8_u
      local.set 3
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            local.get 1
            i32.eqz
            br_if 0 (;@3;)
            local.get 3
            i32.const 255
            i32.and
            i32.const 4
            i32.ne
            br_if 1 (;@2;)
            global.get $GOT.data.internal.__memory_base
            local.tee 4
            i32.const 1049783
            i32.add
            i32.const 173
            local.get 4
            i32.const 1050892
            i32.add
            call $_RNvNtCs2GenDSTXHQd_4core9panicking9panic_fmt
            unreachable
          end
          local.get 3
          i32.const 255
          i32.and
          i32.const 3
          i32.ne
          br_if 1 (;@1;)
          local.get 4
          i32.load offset=4
          local.tee 0
          i32.load
          local.set 3
          block ;; label = @3
            local.get 0
            i32.const 4
            i32.add
            i32.load
            local.tee 1
            i32.load
            local.tee 2
            i32.eqz
            br_if 0 (;@3;)
            local.get 3
            local.get 2
            call_indirect (type 0)
          end
          block ;; label = @3
            local.get 1
            i32.load offset=4
            local.tee 2
            i32.eqz
            br_if 0 (;@3;)
            local.get 3
            local.get 2
            local.get 1
            i32.load offset=8
            call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
          end
          local.get 0
          i32.const 12
          i32.const 4
          call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
          br 1 (;@1;)
        end
        local.get 0
        local.get 4
        i64.load
        i64.store align=4
      end
      local.get 4
      i32.const 16
      i32.add
      global.set $__stack_pointer
    )
    (func $_RNvXNtCs2GenDSTXHQd_4core3anyNtNtCsblnovvQk4nh_5alloc6string6StringNtB2_3Any7type_idCsfH5l96bTt9G_3std (;81;) (type 1) (param i32 i32)
      (local i32)
      local.get 0
      global.get $GOT.data.internal.__memory_base
      i32.const 1050020
      i32.add
      local.tee 2
      i64.load offset=8 align=4
      i64.store offset=8 align=4
      local.get 0
      local.get 2
      i64.load align=4
      i64.store align=4
    )
    (func $_RNvXNtCs2GenDSTXHQd_4core3anyReNtB2_3Any7type_idCsfH5l96bTt9G_3std (;82;) (type 1) (param i32 i32)
      (local i32)
      local.get 0
      global.get $GOT.data.internal.__memory_base
      i32.const 1050004
      i32.add
      local.tee 2
      i64.load offset=8 align=4
      i64.store offset=8 align=4
      local.get 0
      local.get 2
      i64.load align=4
      i64.store align=4
    )
    (func $_RNvXNvNtCsfH5l96bTt9G_3std2io17default_write_fmtINtB2_7AdapterINtNtB4_6cursor6CursorQShEENtNtCs2GenDSTXHQd_4core3fmt5Write9write_strB6_ (;83;) (type 3) (param i32 i32 i32) (result i32)
      (local i32 i32 i32 i64 i32 i32 i64)
      i32.const 0
      local.set 3
      block ;; label = @1
        i32.const 0
        local.get 0
        i32.load offset=8
        local.tee 4
        i32.load offset=4
        local.tee 5
        local.get 4
        i64.load offset=8
        local.tee 6
        i64.const 4294967295
        local.get 6
        i64.const 4294967295
        i64.lt_u
        select
        i32.wrap_i64
        i32.sub
        local.tee 7
        local.get 7
        local.get 5
        i32.gt_u
        select
        local.tee 7
        local.get 2
        local.get 7
        local.get 2
        i32.lt_u
        select
        local.tee 8
        i32.eqz
        br_if 0 (;@1;)
        local.get 4
        i32.load
        local.get 6
        local.get 5
        i64.extend_i32_u
        local.tee 9
        local.get 6
        local.get 9
        i64.lt_u
        select
        i32.wrap_i64
        i32.add
        local.get 1
        local.get 8
        memory.copy
      end
      local.get 4
      local.get 6
      local.get 8
      i64.extend_i32_u
      i64.add
      i64.store offset=8
      block ;; label = @1
        local.get 7
        local.get 2
        i32.ge_u
        br_if 0 (;@1;)
        global.get $GOT.data.internal.__memory_base
        i32.const 1051232
        i32.add
        i64.load
        local.tee 6
        i64.const 255
        i64.and
        i64.const 4
        i64.eq
        br_if 0 (;@1;)
        block ;; label = @2
          local.get 0
          i32.load8_u
          i32.const 3
          i32.ne
          br_if 0 (;@2;)
          local.get 0
          i32.load offset=4
          local.tee 2
          i32.load
          local.set 7
          block ;; label = @3
            local.get 2
            i32.const 4
            i32.add
            i32.load
            local.tee 4
            i32.load
            local.tee 5
            i32.eqz
            br_if 0 (;@3;)
            local.get 7
            local.get 5
            call_indirect (type 0)
          end
          block ;; label = @3
            local.get 4
            i32.load offset=4
            local.tee 5
            i32.eqz
            br_if 0 (;@3;)
            local.get 7
            local.get 5
            local.get 4
            i32.load offset=8
            call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
          end
          local.get 2
          i32.const 12
          i32.const 4
          call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
        end
        local.get 0
        local.get 6
        i64.store align=4
        i32.const 1
        local.set 3
      end
      local.get 3
    )
    (func $_RNvXNvNtCsfH5l96bTt9G_3std2io17default_write_fmtINtB2_7AdapterINtNtCsblnovvQk4nh_5alloc3vec3VechEENtNtCs2GenDSTXHQd_4core3fmt5Write9write_strB6_ (;84;) (type 3) (param i32 i32 i32) (result i32)
      (local i32)
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            local.get 2
            local.get 0
            i32.load offset=8
            local.tee 0
            i32.load
            local.get 0
            i32.load offset=8
            local.tee 3
            i32.sub
            i32.le_u
            br_if 0 (;@3;)
            local.get 0
            local.get 3
            local.get 2
            i32.const 1
            i32.const 1
            call $_RINvNvMs2_NtCsblnovvQk4nh_5alloc7raw_vecINtB8_11RawVecInnerpE7reserve21do_reserve_and_handleNtNtBa_5alloc6GlobalECsfH5l96bTt9G_3std
            local.get 0
            i32.load offset=8
            local.set 3
            br 1 (;@2;)
          end
          local.get 2
          i32.eqz
          br_if 1 (;@1;)
        end
        local.get 2
        i32.eqz
        br_if 0 (;@1;)
        local.get 0
        i32.load offset=4
        local.get 3
        i32.add
        local.get 1
        local.get 2
        memory.copy
      end
      local.get 0
      local.get 3
      local.get 2
      i32.add
      i32.store offset=8
      i32.const 0
    )
    (func $_RNvXNvNtCsfH5l96bTt9G_3std2io17default_write_fmtINtB2_7AdapterNtNtNtNtB6_3sys5stdio4unix6StderrENtNtCs2GenDSTXHQd_4core3fmt5Write9write_strB6_ (;85;) (type 3) (param i32 i32 i32) (result i32)
      (local i32 i32 i32 i64)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 3
      global.set $__stack_pointer
      block ;; label = @1
        block ;; label = @2
          local.get 2
          br_if 0 (;@2;)
          i32.const 0
          local.set 4
          br 1 (;@1;)
        end
        block ;; label = @2
          block ;; label = @3
            loop ;; label = @4
              block ;; label = @5
                block ;; label = @6
                  i32.const 2
                  local.get 1
                  local.get 2
                  call $write
                  local.tee 4
                  i32.const -1
                  i32.ne
                  br_if 0 (;@6;)
                  local.get 3
                  i32.const 0
                  i32.store8 offset=11
                  local.get 3
                  i32.const 0
                  i32.store16 offset=9 align=1
                  local.get 3
                  i32.const 0
                  i32.store8 offset=8
                  local.get 3
                  global.get $GOT.data.internal.errno
                  i32.load
                  local.tee 4
                  i32.store offset=12
                  local.get 4
                  i32.const 27
                  i32.eq
                  br_if 1 (;@5;)
                  local.get 3
                  i32.const 8
                  i32.add
                  local.set 4
                  br 4 (;@2;)
                end
                local.get 3
                local.get 4
                i32.store offset=12
                local.get 3
                i32.const 4
                i32.store8 offset=8
                global.get $GOT.data.internal.__memory_base
                local.set 5
                block ;; label = @6
                  local.get 4
                  br_if 0 (;@6;)
                  local.get 5
                  i32.const 1051232
                  i32.add
                  local.set 4
                  br 4 (;@2;)
                end
                local.get 2
                local.get 4
                i32.lt_u
                br_if 2 (;@3;)
                local.get 1
                local.get 4
                i32.add
                local.set 1
                local.get 2
                local.get 4
                i32.sub
                local.set 2
              end
              local.get 2
              br_if 0 (;@4;)
            end
            i32.const 0
            local.set 4
            br 2 (;@1;)
          end
          local.get 4
          local.get 2
          local.get 2
          global.get $GOT.data.internal.__memory_base
          i32.const 1051288
          i32.add
          call $_RNvNtNtCs2GenDSTXHQd_4core5slice5index16slice_index_fail
          unreachable
        end
        block ;; label = @2
          local.get 4
          i64.load
          local.tee 6
          i64.const 255
          i64.and
          i64.const 4
          i64.ne
          br_if 0 (;@2;)
          i32.const 0
          local.set 4
          br 1 (;@1;)
        end
        block ;; label = @2
          local.get 0
          i32.load8_u
          i32.const 3
          i32.ne
          br_if 0 (;@2;)
          local.get 0
          i32.load offset=4
          local.tee 4
          i32.load
          local.set 1
          block ;; label = @3
            local.get 4
            i32.const 4
            i32.add
            i32.load
            local.tee 2
            i32.load
            local.tee 5
            i32.eqz
            br_if 0 (;@3;)
            local.get 1
            local.get 5
            call_indirect (type 0)
          end
          block ;; label = @3
            local.get 2
            i32.load offset=4
            local.tee 5
            i32.eqz
            br_if 0 (;@3;)
            local.get 1
            local.get 5
            local.get 2
            i32.load offset=8
            call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
          end
          local.get 4
          i32.const 12
          i32.const 4
          call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
        end
        local.get 0
        local.get 6
        i64.store align=4
        i32.const 1
        local.set 4
      end
      local.get 3
      i32.const 16
      i32.add
      global.set $__stack_pointer
      local.get 4
    )
    (func $_RNvYNtNtNtNtCsfH5l96bTt9G_3std3sys5stdio4unix6StderrNtNtBa_2io5Write18write_all_vectoredBa_ (;86;) (type 2) (param i32 i32 i32 i32)
      (local i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 4
      global.set $__stack_pointer
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            local.get 3
            i32.eqz
            br_if 0 (;@3;)
            local.get 2
            i32.const 4
            i32.add
            local.set 5
            local.get 3
            i32.const 3
            i32.shl
            local.tee 6
            i32.const -8
            i32.add
            i32.const 3
            i32.shr_u
            i32.const 1
            i32.add
            local.set 7
            i32.const 0
            local.set 8
            block ;; label = @4
              loop ;; label = @5
                local.get 5
                i32.load
                br_if 1 (;@4;)
                local.get 5
                i32.const 8
                i32.add
                local.set 5
                local.get 8
                i32.const 1
                i32.add
                local.set 8
                local.get 6
                i32.const -8
                i32.add
                local.tee 6
                br_if 0 (;@5;)
              end
              local.get 7
              local.set 8
            end
            block ;; label = @4
              block ;; label = @5
                block ;; label = @6
                  local.get 3
                  local.get 8
                  i32.lt_u
                  br_if 0 (;@6;)
                  local.get 3
                  local.get 8
                  i32.eq
                  br_if 3 (;@3;)
                  local.get 3
                  local.get 8
                  i32.sub
                  local.set 7
                  local.get 2
                  local.get 8
                  i32.const 3
                  i32.shl
                  i32.add
                  local.set 9
                  loop ;; label = @7
                    block ;; label = @8
                      i32.const 2
                      local.get 9
                      local.get 7
                      i32.const 16
                      local.get 7
                      i32.const 16
                      i32.lt_u
                      select
                      call $writev
                      local.tee 5
                      i32.const -1
                      i32.ne
                      br_if 0 (;@8;)
                      local.get 4
                      i32.const 0
                      i32.store8 offset=11
                      local.get 4
                      i32.const 0
                      i32.store16 offset=9 align=1
                      local.get 4
                      i32.const 0
                      i32.store8 offset=8
                      local.get 4
                      global.get $GOT.data.internal.errno
                      i32.load
                      local.tee 5
                      i32.store offset=12
                      local.get 5
                      i32.const 27
                      i32.eq
                      br_if 1 (;@7;)
                      local.get 4
                      i32.const 8
                      i32.add
                      local.set 5
                      br 6 (;@2;)
                    end
                    local.get 4
                    local.get 5
                    i32.store offset=12
                    local.get 4
                    i32.const 4
                    i32.store8 offset=8
                    global.get $GOT.data.internal.__memory_base
                    local.set 8
                    block ;; label = @8
                      local.get 5
                      br_if 0 (;@8;)
                      local.get 8
                      i32.const 1051232
                      i32.add
                      local.set 5
                      br 6 (;@2;)
                    end
                    local.get 9
                    i32.const 4
                    i32.add
                    local.set 8
                    local.get 7
                    i32.const 3
                    i32.shl
                    local.tee 3
                    i32.const -8
                    i32.add
                    i32.const 3
                    i32.shr_u
                    i32.const 1
                    i32.add
                    local.set 10
                    i32.const 0
                    local.set 6
                    block ;; label = @8
                      loop ;; label = @9
                        local.get 5
                        local.get 8
                        i32.load
                        local.tee 2
                        i32.lt_u
                        br_if 1 (;@8;)
                        local.get 8
                        i32.const 8
                        i32.add
                        local.set 8
                        local.get 6
                        i32.const 1
                        i32.add
                        local.set 6
                        local.get 5
                        local.get 2
                        i32.sub
                        local.set 5
                        local.get 3
                        i32.const -8
                        i32.add
                        local.tee 3
                        br_if 0 (;@9;)
                      end
                      local.get 10
                      local.set 6
                    end
                    local.get 7
                    local.get 6
                    i32.lt_u
                    br_if 2 (;@5;)
                    block ;; label = @8
                      local.get 7
                      local.get 6
                      i32.ne
                      br_if 0 (;@8;)
                      local.get 5
                      i32.eqz
                      br_if 5 (;@3;)
                      global.get $GOT.data.internal.__memory_base
                      local.tee 5
                      i32.const 1050139
                      i32.add
                      i32.const 79
                      local.get 5
                      i32.const 1051088
                      i32.add
                      call $_RNvNtCs2GenDSTXHQd_4core9panicking9panic_fmt
                      unreachable
                    end
                    local.get 9
                    local.get 6
                    i32.const 3
                    i32.shl
                    i32.add
                    local.tee 9
                    i32.load offset=4
                    local.tee 8
                    local.get 5
                    i32.lt_u
                    br_if 3 (;@4;)
                    local.get 7
                    local.get 6
                    i32.sub
                    local.set 7
                    local.get 9
                    local.get 8
                    local.get 5
                    i32.sub
                    i32.store offset=4
                    local.get 9
                    local.get 9
                    i32.load
                    local.get 5
                    i32.add
                    i32.store
                    local.get 4
                    i32.load8_u offset=8
                    local.tee 5
                    i32.const 4
                    i32.eq
                    br_if 0 (;@7;)
                    local.get 5
                    i32.const 3
                    i32.ne
                    br_if 0 (;@7;)
                    local.get 4
                    i32.load offset=12
                    local.tee 5
                    i32.load
                    local.set 6
                    block ;; label = @8
                      local.get 5
                      i32.const 4
                      i32.add
                      i32.load
                      local.tee 8
                      i32.load
                      local.tee 3
                      i32.eqz
                      br_if 0 (;@8;)
                      local.get 6
                      local.get 3
                      call_indirect (type 0)
                    end
                    block ;; label = @8
                      local.get 8
                      i32.load offset=4
                      local.tee 3
                      i32.eqz
                      br_if 0 (;@8;)
                      local.get 6
                      local.get 3
                      local.get 8
                      i32.load offset=8
                      call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
                    end
                    local.get 5
                    i32.const 12
                    i32.const 4
                    call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
                    br 0 (;@7;)
                  end
                end
                local.get 8
                local.get 3
                local.get 3
                global.get $GOT.data.internal.__memory_base
                i32.const 1051120
                i32.add
                call $_RNvNtNtCs2GenDSTXHQd_4core5slice5index16slice_index_fail
                unreachable
              end
              local.get 6
              local.get 7
              local.get 7
              global.get $GOT.data.internal.__memory_base
              i32.const 1051120
              i32.add
              call $_RNvNtNtCs2GenDSTXHQd_4core5slice5index16slice_index_fail
              unreachable
            end
            global.get $GOT.data.internal.__memory_base
            local.tee 5
            i32.const 1050178
            i32.add
            i32.const 71
            local.get 5
            i32.const 1051104
            i32.add
            call $_RNvNtCs2GenDSTXHQd_4core9panicking9panic_fmt
            unreachable
          end
          local.get 0
          i32.const 4
          i32.store8
          br 1 (;@1;)
        end
        local.get 0
        local.get 5
        i64.load
        i64.store align=4
      end
      local.get 4
      i32.const 16
      i32.add
      global.set $__stack_pointer
    )
    (func $_RNvXs0_NvNtCsfH5l96bTt9G_3std9panicking13panic_handlerNtB5_19FormatStringPayloadNtNtCs2GenDSTXHQd_4core3fmt7Display3fmt (;87;) (type 4) (param i32 i32) (result i32)
      block ;; label = @1
        local.get 0
        i32.load
        i32.const -2147483648
        i32.eq
        br_if 0 (;@1;)
        local.get 1
        local.get 0
        i32.load offset=4
        local.get 0
        i32.load offset=8
        call $_RNvMsa_NtCs2GenDSTXHQd_4core3fmtNtB5_9Formatter9write_str
        return
      end
      local.get 1
      i32.load
      local.get 1
      i32.load offset=4
      local.get 0
      i32.load offset=12
      i32.load
      local.tee 0
      i32.load
      local.get 0
      i32.load offset=4
      call $_RNvNtCs2GenDSTXHQd_4core3fmt5write
    )
    (func $_RNvXs1_NvNtCsfH5l96bTt9G_3std9panicking13panic_handlerNtB5_16StaticStrPayloadNtNtCs2GenDSTXHQd_4core5panic12PanicPayload3get (;88;) (type 1) (param i32 i32)
      local.get 0
      global.get $GOT.data.internal.__memory_base
      i32.const 1051256
      i32.add
      i32.store offset=4
      local.get 0
      local.get 1
      i32.store
    )
    (func $_RNvXs1_NvNtCsfH5l96bTt9G_3std9panicking13panic_handlerNtB5_16StaticStrPayloadNtNtCs2GenDSTXHQd_4core5panic12PanicPayload6as_str (;89;) (type 1) (param i32 i32)
      local.get 0
      local.get 1
      i64.load align=4
      i64.store
    )
    (func $_RNvXs1_NvNtCsfH5l96bTt9G_3std9panicking13panic_handlerNtB5_16StaticStrPayloadNtNtCs2GenDSTXHQd_4core5panic12PanicPayload8take_box (;90;) (type 1) (param i32 i32)
      (local i32 i32)
      local.get 1
      i32.load offset=4
      local.set 2
      local.get 1
      i32.load
      local.set 3
      call $_RNvCsgrkdPkmfNkI_7___rustc35___rust_no_alloc_shim_is_unstable_v2
      block ;; label = @1
        i32.const 8
        i32.const 4
        call $_RNvCsgrkdPkmfNkI_7___rustc12___rust_alloc
        local.tee 1
        br_if 0 (;@1;)
        i32.const 4
        i32.const 8
        call $_RNvNtCsblnovvQk4nh_5alloc5alloc18handle_alloc_error
        unreachable
      end
      local.get 1
      local.get 2
      i32.store offset=4
      local.get 1
      local.get 3
      i32.store
      local.get 0
      global.get $GOT.data.internal.__memory_base
      i32.const 1051256
      i32.add
      i32.store offset=4
      local.get 0
      local.get 1
      i32.store
    )
    (func $_RNvXs1g_NtCs2GenDSTXHQd_4core3fmtRbNtB6_5Debug3fmtCsfH5l96bTt9G_3std (;91;) (type 4) (param i32 i32) (result i32)
      local.get 0
      i32.load
      local.get 1
      call $_RNvXsg_NtCs2GenDSTXHQd_4core3fmtbNtB5_7Display3fmt
    )
    (func $_RNvXs2_NvNtCsfH5l96bTt9G_3std9panicking13panic_handlerNtB5_16StaticStrPayloadNtNtCs2GenDSTXHQd_4core3fmt7Display3fmt (;92;) (type 4) (param i32 i32) (result i32)
      local.get 1
      local.get 0
      i32.load
      local.get 0
      i32.load offset=4
      call $_RNvMsa_NtCs2GenDSTXHQd_4core3fmtNtB5_9Formatter9write_str
    )
    (func $_RNvXs3_NtNtNtCsfH5l96bTt9G_3std3sys5stdio4unixNtB5_6StderrNtNtBb_2io5Write14write_vectored (;93;) (type 2) (param i32 i32 i32 i32)
      (local i32)
      i32.const 4
      local.set 4
      block ;; label = @1
        i32.const 2
        local.get 2
        local.get 3
        i32.const 16
        local.get 3
        i32.const 16
        i32.lt_u
        select
        call $writev
        local.tee 3
        i32.const -1
        i32.ne
        br_if 0 (;@1;)
        i32.const 0
        local.set 4
        local.get 0
        i32.const 0
        i32.store16 offset=1 align=1
        local.get 0
        i32.const 3
        i32.add
        i32.const 0
        i32.store8
        global.get $GOT.data.internal.errno
        i32.load
        local.set 3
      end
      local.get 0
      local.get 3
      i32.store offset=4
      local.get 0
      local.get 4
      i32.store8
    )
    (func $_RNvXs3_NtNtNtCsfH5l96bTt9G_3std3sys5stdio4unixNtB5_6StderrNtNtBb_2io5Write17is_write_vectored (;94;) (type 8) (param i32) (result i32)
      i32.const 1
    )
    (func $_RNvXs3_NtNtNtCsfH5l96bTt9G_3std3sys5stdio4unixNtB5_6StderrNtNtBb_2io5Write5flush (;95;) (type 1) (param i32 i32)
      local.get 0
      i32.const 4
      i32.store8
    )
    (func $_RNvXs3_NtNtNtCsfH5l96bTt9G_3std3sys5stdio4unixNtB5_6StderrNtNtBb_2io5Write5write (;96;) (type 2) (param i32 i32 i32 i32)
      (local i32)
      i32.const 4
      local.set 4
      block ;; label = @1
        i32.const 2
        local.get 2
        local.get 3
        call $write
        local.tee 3
        i32.const -1
        i32.ne
        br_if 0 (;@1;)
        i32.const 0
        local.set 4
        local.get 0
        i32.const 0
        i32.store16 offset=1 align=1
        local.get 0
        i32.const 3
        i32.add
        i32.const 0
        i32.store8
        global.get $GOT.data.internal.errno
        i32.load
        local.set 3
      end
      local.get 0
      local.get 3
      i32.store offset=4
      local.get 0
      local.get 4
      i32.store8
    )
    (func $_RNvXs9_NtNtCsfH5l96bTt9G_3std2io5implsINtNtCsblnovvQk4nh_5alloc3vec3VechENtB7_5Write14write_vectoredB9_ (;97;) (type 2) (param i32 i32 i32 i32)
      (local i32 i32 i32 i32 i32)
      block ;; label = @1
        block ;; label = @2
          local.get 3
          br_if 0 (;@2;)
          i32.const 0
          local.set 4
          br 1 (;@1;)
        end
        local.get 3
        i32.const 3
        i32.and
        local.set 5
        i32.const 0
        local.set 6
        i32.const 0
        local.set 4
        block ;; label = @2
          block ;; label = @3
            local.get 3
            i32.const 4
            i32.lt_u
            br_if 0 (;@3;)
            local.get 2
            i32.const 28
            i32.add
            local.set 7
            local.get 3
            i32.const 268435452
            i32.and
            local.set 8
            i32.const 0
            local.set 4
            i32.const 0
            local.set 6
            loop ;; label = @4
              local.get 7
              i32.load
              local.get 7
              i32.const -8
              i32.add
              i32.load
              local.get 7
              i32.const -16
              i32.add
              i32.load
              local.get 7
              i32.const -24
              i32.add
              i32.load
              local.get 4
              i32.add
              i32.add
              i32.add
              i32.add
              local.set 4
              local.get 7
              i32.const 32
              i32.add
              local.set 7
              local.get 8
              local.get 6
              i32.const 4
              i32.add
              local.tee 6
              i32.ne
              br_if 0 (;@4;)
            end
            local.get 5
            i32.eqz
            br_if 1 (;@2;)
          end
          local.get 6
          i32.const 3
          i32.shl
          local.get 2
          i32.add
          i32.const 4
          i32.add
          local.set 7
          loop ;; label = @3
            local.get 7
            i32.load
            local.get 4
            i32.add
            local.set 4
            local.get 7
            i32.const 8
            i32.add
            local.set 7
            local.get 5
            i32.const -1
            i32.add
            local.tee 5
            br_if 0 (;@3;)
          end
        end
        local.get 3
        i32.const 3
        i32.shl
        local.set 7
        block ;; label = @2
          local.get 4
          local.get 1
          i32.load
          local.get 1
          i32.load offset=8
          local.tee 5
          i32.sub
          i32.le_u
          br_if 0 (;@2;)
          local.get 1
          local.get 5
          local.get 4
          i32.const 1
          i32.const 1
          call $_RINvNvMs2_NtCsblnovvQk4nh_5alloc7raw_vecINtB8_11RawVecInnerpE7reserve21do_reserve_and_handleNtNtBa_5alloc6GlobalECsfH5l96bTt9G_3std
        end
        local.get 2
        local.get 7
        i32.add
        local.set 8
        local.get 1
        i32.load offset=8
        local.set 5
        loop ;; label = @2
          local.get 2
          i32.load
          local.set 6
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                local.get 2
                i32.const 4
                i32.add
                i32.load
                local.tee 7
                local.get 1
                i32.load
                local.get 5
                i32.sub
                i32.le_u
                br_if 0 (;@5;)
                local.get 1
                local.get 5
                local.get 7
                i32.const 1
                i32.const 1
                call $_RINvNvMs2_NtCsblnovvQk4nh_5alloc7raw_vecINtB8_11RawVecInnerpE7reserve21do_reserve_and_handleNtNtBa_5alloc6GlobalECsfH5l96bTt9G_3std
                local.get 1
                i32.load offset=8
                local.set 5
                br 1 (;@4;)
              end
              local.get 7
              i32.eqz
              br_if 1 (;@3;)
            end
            local.get 7
            i32.eqz
            br_if 0 (;@3;)
            local.get 1
            i32.load offset=4
            local.get 5
            i32.add
            local.get 6
            local.get 7
            memory.copy
          end
          local.get 1
          local.get 5
          local.get 7
          i32.add
          local.tee 5
          i32.store offset=8
          local.get 2
          i32.const 8
          i32.add
          local.tee 2
          local.get 8
          i32.ne
          br_if 0 (;@2;)
        end
      end
      local.get 0
      i32.const 4
      i32.store8
      local.get 0
      local.get 4
      i32.store offset=4
    )
    (func $_RNvXs9_NtNtCsfH5l96bTt9G_3std2io5implsINtNtCsblnovvQk4nh_5alloc3vec3VechENtB7_5Write17is_write_vectoredB9_ (;98;) (type 8) (param i32) (result i32)
      i32.const 1
    )
    (func $_RNvXs9_NtNtCsfH5l96bTt9G_3std2io5implsINtNtCsblnovvQk4nh_5alloc3vec3VechENtB7_5Write18write_all_vectoredB9_ (;99;) (type 2) (param i32 i32 i32 i32)
      (local i32 i32 i32 i32 i32)
      block ;; label = @1
        local.get 3
        i32.eqz
        br_if 0 (;@1;)
        local.get 3
        i32.const 3
        i32.and
        local.set 4
        i32.const 0
        local.set 5
        i32.const 0
        local.set 6
        block ;; label = @2
          block ;; label = @3
            local.get 3
            i32.const 4
            i32.lt_u
            br_if 0 (;@3;)
            local.get 2
            i32.const 28
            i32.add
            local.set 7
            local.get 3
            i32.const 268435452
            i32.and
            local.set 8
            i32.const 0
            local.set 5
            i32.const 0
            local.set 6
            loop ;; label = @4
              local.get 7
              i32.load
              local.get 7
              i32.const -8
              i32.add
              i32.load
              local.get 7
              i32.const -16
              i32.add
              i32.load
              local.get 7
              i32.const -24
              i32.add
              i32.load
              local.get 6
              i32.add
              i32.add
              i32.add
              i32.add
              local.set 6
              local.get 7
              i32.const 32
              i32.add
              local.set 7
              local.get 8
              local.get 5
              i32.const 4
              i32.add
              local.tee 5
              i32.ne
              br_if 0 (;@4;)
            end
            local.get 4
            i32.eqz
            br_if 1 (;@2;)
          end
          local.get 5
          i32.const 3
          i32.shl
          local.get 2
          i32.add
          i32.const 4
          i32.add
          local.set 7
          loop ;; label = @3
            local.get 7
            i32.load
            local.get 6
            i32.add
            local.set 6
            local.get 7
            i32.const 8
            i32.add
            local.set 7
            local.get 4
            i32.const -1
            i32.add
            local.tee 4
            br_if 0 (;@3;)
          end
        end
        local.get 3
        i32.const 3
        i32.shl
        local.set 7
        block ;; label = @2
          local.get 6
          local.get 1
          i32.load
          local.get 1
          i32.load offset=8
          local.tee 4
          i32.sub
          i32.le_u
          br_if 0 (;@2;)
          local.get 1
          local.get 4
          local.get 6
          i32.const 1
          i32.const 1
          call $_RINvNvMs2_NtCsblnovvQk4nh_5alloc7raw_vecINtB8_11RawVecInnerpE7reserve21do_reserve_and_handleNtNtBa_5alloc6GlobalECsfH5l96bTt9G_3std
          local.get 1
          i32.load offset=8
          local.set 4
        end
        local.get 2
        local.get 7
        i32.add
        local.set 5
        loop ;; label = @2
          local.get 2
          i32.load
          local.set 6
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                local.get 2
                i32.const 4
                i32.add
                i32.load
                local.tee 7
                local.get 1
                i32.load
                local.get 4
                i32.sub
                i32.le_u
                br_if 0 (;@5;)
                local.get 1
                local.get 4
                local.get 7
                i32.const 1
                i32.const 1
                call $_RINvNvMs2_NtCsblnovvQk4nh_5alloc7raw_vecINtB8_11RawVecInnerpE7reserve21do_reserve_and_handleNtNtBa_5alloc6GlobalECsfH5l96bTt9G_3std
                local.get 1
                i32.load offset=8
                local.set 4
                br 1 (;@4;)
              end
              local.get 7
              i32.eqz
              br_if 1 (;@3;)
            end
            local.get 7
            i32.eqz
            br_if 0 (;@3;)
            local.get 1
            i32.load offset=4
            local.get 4
            i32.add
            local.get 6
            local.get 7
            memory.copy
          end
          local.get 1
          local.get 4
          local.get 7
          i32.add
          local.tee 4
          i32.store offset=8
          local.get 2
          i32.const 8
          i32.add
          local.tee 2
          local.get 5
          i32.ne
          br_if 0 (;@2;)
        end
      end
      local.get 0
      i32.const 4
      i32.store8
    )
    (func $_RNvXs9_NtNtCsfH5l96bTt9G_3std2io5implsINtNtCsblnovvQk4nh_5alloc3vec3VechENtB7_5Write5flushB9_ (;100;) (type 1) (param i32 i32)
      local.get 0
      i32.const 4
      i32.store8
    )
    (func $_RNvXs9_NtNtCsfH5l96bTt9G_3std2io5implsINtNtCsblnovvQk4nh_5alloc3vec3VechENtB7_5Write5writeB9_ (;101;) (type 2) (param i32 i32 i32 i32)
      (local i32)
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            local.get 3
            local.get 1
            i32.load
            local.get 1
            i32.load offset=8
            local.tee 4
            i32.sub
            i32.le_u
            br_if 0 (;@3;)
            local.get 1
            local.get 4
            local.get 3
            i32.const 1
            i32.const 1
            call $_RINvNvMs2_NtCsblnovvQk4nh_5alloc7raw_vecINtB8_11RawVecInnerpE7reserve21do_reserve_and_handleNtNtBa_5alloc6GlobalECsfH5l96bTt9G_3std
            local.get 1
            i32.load offset=8
            local.set 4
            br 1 (;@2;)
          end
          local.get 3
          i32.eqz
          br_if 1 (;@1;)
        end
        local.get 3
        i32.eqz
        br_if 0 (;@1;)
        local.get 1
        i32.load offset=4
        local.get 4
        i32.add
        local.get 2
        local.get 3
        memory.copy
      end
      local.get 0
      local.get 3
      i32.store offset=4
      local.get 0
      i32.const 4
      i32.store8
      local.get 1
      local.get 4
      local.get 3
      i32.add
      i32.store offset=8
    )
    (func $_RNvXs9_NtNtCsfH5l96bTt9G_3std2io5implsINtNtCsblnovvQk4nh_5alloc3vec3VechENtB7_5Write9write_allB9_ (;102;) (type 2) (param i32 i32 i32 i32)
      (local i32)
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            local.get 3
            local.get 1
            i32.load
            local.get 1
            i32.load offset=8
            local.tee 4
            i32.sub
            i32.le_u
            br_if 0 (;@3;)
            local.get 1
            local.get 4
            local.get 3
            i32.const 1
            i32.const 1
            call $_RINvNvMs2_NtCsblnovvQk4nh_5alloc7raw_vecINtB8_11RawVecInnerpE7reserve21do_reserve_and_handleNtNtBa_5alloc6GlobalECsfH5l96bTt9G_3std
            local.get 1
            i32.load offset=8
            local.set 4
            br 1 (;@2;)
          end
          local.get 3
          i32.eqz
          br_if 1 (;@1;)
        end
        local.get 3
        i32.eqz
        br_if 0 (;@1;)
        local.get 1
        i32.load offset=4
        local.get 4
        i32.add
        local.get 2
        local.get 3
        memory.copy
      end
      local.get 0
      i32.const 4
      i32.store8
      local.get 1
      local.get 4
      local.get 3
      i32.add
      i32.store offset=8
    )
    (func $_RNvXsZ_NtCsblnovvQk4nh_5alloc6stringNtB5_6StringNtNtCs2GenDSTXHQd_4core3fmt5Write10write_char (;103;) (type 4) (param i32 i32) (result i32)
      (local i32 i32 i32 i32 i32 i32)
      local.get 0
      i32.load offset=8
      local.set 2
      block ;; label = @1
        block ;; label = @2
          local.get 1
          i32.const 128
          i32.ge_u
          br_if 0 (;@2;)
          i32.const 1
          local.set 3
          br 1 (;@1;)
        end
        block ;; label = @2
          local.get 1
          i32.const 2048
          i32.ge_u
          br_if 0 (;@2;)
          i32.const 2
          local.set 3
          br 1 (;@1;)
        end
        i32.const 3
        i32.const 4
        local.get 1
        i32.const 65536
        i32.lt_u
        select
        local.set 3
      end
      local.get 2
      local.set 4
      block ;; label = @1
        local.get 3
        local.get 0
        i32.load
        local.get 2
        i32.sub
        i32.le_u
        br_if 0 (;@1;)
        local.get 0
        local.get 2
        local.get 3
        i32.const 1
        i32.const 1
        call $_RINvNvMs2_NtCsblnovvQk4nh_5alloc7raw_vecINtB8_11RawVecInnerpE7reserve21do_reserve_and_handleNtNtBa_5alloc6GlobalECsfH5l96bTt9G_3std
        local.get 0
        i32.load offset=8
        local.set 4
      end
      local.get 0
      i32.load offset=4
      local.get 4
      i32.add
      local.set 4
      block ;; label = @1
        block ;; label = @2
          local.get 1
          i32.const 128
          i32.lt_u
          br_if 0 (;@2;)
          local.get 1
          i32.const 63
          i32.and
          i32.const -128
          i32.or
          local.set 5
          local.get 1
          i32.const 6
          i32.shr_u
          local.set 6
          block ;; label = @3
            local.get 1
            i32.const 2048
            i32.ge_u
            br_if 0 (;@3;)
            local.get 4
            local.get 5
            i32.store8 offset=1
            local.get 4
            local.get 6
            i32.const 192
            i32.or
            i32.store8
            br 2 (;@1;)
          end
          local.get 1
          i32.const 12
          i32.shr_u
          local.set 7
          local.get 6
          i32.const 63
          i32.and
          i32.const -128
          i32.or
          local.set 6
          block ;; label = @3
            local.get 1
            i32.const 65535
            i32.gt_u
            br_if 0 (;@3;)
            local.get 4
            local.get 5
            i32.store8 offset=2
            local.get 4
            local.get 6
            i32.store8 offset=1
            local.get 4
            local.get 7
            i32.const 224
            i32.or
            i32.store8
            br 2 (;@1;)
          end
          local.get 4
          local.get 5
          i32.store8 offset=3
          local.get 4
          local.get 6
          i32.store8 offset=2
          local.get 4
          local.get 7
          i32.const 63
          i32.and
          i32.const -128
          i32.or
          i32.store8 offset=1
          local.get 4
          local.get 1
          i32.const 18
          i32.shr_u
          i32.const -16
          i32.or
          i32.store8
          br 1 (;@1;)
        end
        local.get 4
        local.get 1
        i32.store8
      end
      local.get 0
      local.get 3
      local.get 2
      i32.add
      i32.store offset=8
      i32.const 0
    )
    (func $_RNvXsZ_NtCsblnovvQk4nh_5alloc6stringNtB5_6StringNtNtCs2GenDSTXHQd_4core3fmt5Write9write_str (;104;) (type 3) (param i32 i32 i32) (result i32)
      (local i32)
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            local.get 2
            local.get 0
            i32.load
            local.get 0
            i32.load offset=8
            local.tee 3
            i32.sub
            i32.le_u
            br_if 0 (;@3;)
            local.get 0
            local.get 3
            local.get 2
            i32.const 1
            i32.const 1
            call $_RINvNvMs2_NtCsblnovvQk4nh_5alloc7raw_vecINtB8_11RawVecInnerpE7reserve21do_reserve_and_handleNtNtBa_5alloc6GlobalECsfH5l96bTt9G_3std
            local.get 0
            i32.load offset=8
            local.set 3
            br 1 (;@2;)
          end
          local.get 2
          i32.eqz
          br_if 1 (;@1;)
        end
        local.get 2
        i32.eqz
        br_if 0 (;@1;)
        local.get 0
        i32.load offset=4
        local.get 3
        i32.add
        local.get 1
        local.get 2
        memory.copy
      end
      local.get 0
      local.get 3
      local.get 2
      i32.add
      i32.store offset=8
      i32.const 0
    )
    (func $_RNvXs_NvNtCsfH5l96bTt9G_3std9panicking13panic_handlerNtB4_19FormatStringPayloadNtNtCs2GenDSTXHQd_4core5panic12PanicPayload3get (;105;) (type 1) (param i32 i32)
      (local i32 i32 i64)
      global.get $__stack_pointer
      i32.const 32
      i32.sub
      local.tee 2
      global.set $__stack_pointer
      block ;; label = @1
        local.get 1
        i32.load
        i32.const -2147483648
        i32.ne
        br_if 0 (;@1;)
        local.get 1
        i32.load offset=12
        local.set 3
        local.get 2
        i32.const 0
        i32.store offset=28
        local.get 2
        i64.const 4294967296
        i64.store offset=20 align=4
        local.get 2
        i32.const 20
        i32.add
        global.get $GOT.data.internal.__memory_base
        i32.const 1050992
        i32.add
        local.get 3
        i32.load
        local.tee 3
        i32.load
        local.get 3
        i32.load offset=4
        call $_RNvNtCs2GenDSTXHQd_4core3fmt5write
        drop
        local.get 2
        local.get 2
        i32.load offset=28
        local.tee 3
        i32.store offset=16
        local.get 2
        local.get 2
        i64.load offset=20 align=4
        local.tee 4
        i64.store offset=8
        local.get 1
        local.get 3
        i32.store offset=8
        local.get 1
        local.get 4
        i64.store align=4
      end
      local.get 0
      local.get 1
      i32.store
      local.get 0
      global.get $GOT.data.internal.__memory_base
      i32.const 1051272
      i32.add
      i32.store offset=4
      local.get 2
      i32.const 32
      i32.add
      global.set $__stack_pointer
    )
    (func $_RNvXs_NvNtCsfH5l96bTt9G_3std9panicking13panic_handlerNtB4_19FormatStringPayloadNtNtCs2GenDSTXHQd_4core5panic12PanicPayload8take_box (;106;) (type 1) (param i32 i32)
      (local i32 i32 i64)
      global.get $__stack_pointer
      i32.const 48
      i32.sub
      local.tee 2
      global.set $__stack_pointer
      block ;; label = @1
        local.get 1
        i32.load
        i32.const -2147483648
        i32.ne
        br_if 0 (;@1;)
        local.get 1
        i32.load offset=12
        local.set 3
        local.get 2
        i32.const 0
        i32.store offset=44
        local.get 2
        i64.const 4294967296
        i64.store offset=36 align=4
        local.get 2
        i32.const 36
        i32.add
        global.get $GOT.data.internal.__memory_base
        i32.const 1050992
        i32.add
        local.get 3
        i32.load
        local.tee 3
        i32.load
        local.get 3
        i32.load offset=4
        call $_RNvNtCs2GenDSTXHQd_4core3fmt5write
        drop
        local.get 2
        local.get 2
        i32.load offset=44
        local.tee 3
        i32.store offset=32
        local.get 2
        local.get 2
        i64.load offset=36 align=4
        local.tee 4
        i64.store offset=24
        local.get 1
        local.get 3
        i32.store offset=8
        local.get 1
        local.get 4
        i64.store align=4
      end
      local.get 1
      i32.load offset=8
      local.set 3
      local.get 1
      i32.const 0
      i32.store offset=8
      local.get 1
      i64.load align=4
      local.set 4
      local.get 1
      i64.const 4294967296
      i64.store align=4
      local.get 2
      local.get 3
      i32.store offset=16
      local.get 2
      local.get 4
      i64.store offset=8
      call $_RNvCsgrkdPkmfNkI_7___rustc35___rust_no_alloc_shim_is_unstable_v2
      block ;; label = @1
        i32.const 12
        i32.const 4
        call $_RNvCsgrkdPkmfNkI_7___rustc12___rust_alloc
        local.tee 1
        br_if 0 (;@1;)
        i32.const 4
        i32.const 12
        call $_RNvNtCsblnovvQk4nh_5alloc5alloc18handle_alloc_error
        unreachable
      end
      local.get 1
      local.get 2
      i32.load offset=16
      i32.store offset=8
      local.get 1
      local.get 2
      i64.load offset=8
      i64.store align=4
      local.get 0
      global.get $GOT.data.internal.__memory_base
      i32.const 1051272
      i32.add
      i32.store offset=4
      local.get 0
      local.get 1
      i32.store
      local.get 2
      i32.const 48
      i32.add
      global.set $__stack_pointer
    )
    (func $_RNvYINtNvNtCsfH5l96bTt9G_3std2io17default_write_fmt7AdapterINtNtB7_6cursor6CursorQShEENtNtCs2GenDSTXHQd_4core3fmt5Write10write_charB9_ (;107;) (type 4) (param i32 i32) (result i32)
      (local i32 i32 i32 i32 i32 i64 i32 i64)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 2
      global.set $__stack_pointer
      local.get 2
      i32.const 0
      i32.store offset=12
      block ;; label = @1
        block ;; label = @2
          local.get 1
          i32.const 128
          i32.lt_u
          br_if 0 (;@2;)
          local.get 1
          i32.const 63
          i32.and
          i32.const -128
          i32.or
          local.set 3
          local.get 1
          i32.const 6
          i32.shr_u
          local.set 4
          block ;; label = @3
            local.get 1
            i32.const 2048
            i32.ge_u
            br_if 0 (;@3;)
            local.get 2
            local.get 3
            i32.store8 offset=13
            local.get 2
            local.get 4
            i32.const 192
            i32.or
            i32.store8 offset=12
            i32.const 2
            local.set 1
            br 2 (;@1;)
          end
          local.get 1
          i32.const 12
          i32.shr_u
          local.set 5
          local.get 4
          i32.const 63
          i32.and
          i32.const -128
          i32.or
          local.set 4
          block ;; label = @3
            local.get 1
            i32.const 65535
            i32.gt_u
            br_if 0 (;@3;)
            local.get 2
            local.get 3
            i32.store8 offset=14
            local.get 2
            local.get 4
            i32.store8 offset=13
            local.get 2
            local.get 5
            i32.const 224
            i32.or
            i32.store8 offset=12
            i32.const 3
            local.set 1
            br 2 (;@1;)
          end
          local.get 2
          local.get 3
          i32.store8 offset=15
          local.get 2
          local.get 4
          i32.store8 offset=14
          local.get 2
          local.get 5
          i32.const 63
          i32.and
          i32.const -128
          i32.or
          i32.store8 offset=13
          local.get 2
          local.get 1
          i32.const 18
          i32.shr_u
          i32.const -16
          i32.or
          i32.store8 offset=12
          i32.const 4
          local.set 1
          br 1 (;@1;)
        end
        local.get 2
        local.get 1
        i32.store8 offset=12
        i32.const 1
        local.set 1
      end
      i32.const 0
      local.set 6
      block ;; label = @1
        i32.const 0
        local.get 0
        i32.load offset=8
        local.tee 3
        i32.load offset=4
        local.tee 5
        local.get 3
        i64.load offset=8
        local.tee 7
        i64.const 4294967295
        local.get 7
        i64.const 4294967295
        i64.lt_u
        select
        i32.wrap_i64
        i32.sub
        local.tee 4
        local.get 4
        local.get 5
        i32.gt_u
        select
        local.tee 4
        local.get 1
        local.get 4
        local.get 1
        i32.lt_u
        select
        local.tee 8
        i32.eqz
        br_if 0 (;@1;)
        local.get 3
        i32.load
        local.get 7
        local.get 5
        i64.extend_i32_u
        local.tee 9
        local.get 7
        local.get 9
        i64.lt_u
        select
        i32.wrap_i64
        i32.add
        local.get 2
        i32.const 12
        i32.add
        local.get 8
        memory.copy
      end
      local.get 3
      local.get 7
      local.get 8
      i64.extend_i32_u
      i64.add
      i64.store offset=8
      block ;; label = @1
        local.get 4
        local.get 1
        i32.ge_u
        br_if 0 (;@1;)
        global.get $GOT.data.internal.__memory_base
        i32.const 1051232
        i32.add
        i64.load
        local.tee 7
        i64.const 255
        i64.and
        i64.const 4
        i64.eq
        br_if 0 (;@1;)
        block ;; label = @2
          local.get 0
          i32.load8_u
          i32.const 3
          i32.ne
          br_if 0 (;@2;)
          local.get 0
          i32.load offset=4
          local.tee 1
          i32.load
          local.set 4
          block ;; label = @3
            local.get 1
            i32.const 4
            i32.add
            i32.load
            local.tee 3
            i32.load
            local.tee 5
            i32.eqz
            br_if 0 (;@3;)
            local.get 4
            local.get 5
            call_indirect (type 0)
          end
          block ;; label = @3
            local.get 3
            i32.load offset=4
            local.tee 5
            i32.eqz
            br_if 0 (;@3;)
            local.get 4
            local.get 5
            local.get 3
            i32.load offset=8
            call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
          end
          local.get 1
          i32.const 12
          i32.const 4
          call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
        end
        local.get 0
        local.get 7
        i64.store align=4
        i32.const 1
        local.set 6
      end
      local.get 2
      i32.const 16
      i32.add
      global.set $__stack_pointer
      local.get 6
    )
    (func $_RNvYINtNvNtCsfH5l96bTt9G_3std2io17default_write_fmt7AdapterINtNtB7_6cursor6CursorQShEENtNtCs2GenDSTXHQd_4core3fmt5Write9write_fmtB9_ (;108;) (type 3) (param i32 i32 i32) (result i32)
      local.get 0
      global.get $GOT.data.internal.__memory_base
      i32.const 1050868
      i32.add
      local.get 1
      local.get 2
      call $_RNvNtCs2GenDSTXHQd_4core3fmt5write
    )
    (func $_RNvYINtNvNtCsfH5l96bTt9G_3std2io17default_write_fmt7AdapterINtNtCsblnovvQk4nh_5alloc3vec3VechEENtNtCs2GenDSTXHQd_4core3fmt5Write10write_charB9_ (;109;) (type 4) (param i32 i32) (result i32)
      (local i32 i32 i32 i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 2
      global.set $__stack_pointer
      local.get 2
      i32.const 0
      i32.store offset=12
      block ;; label = @1
        block ;; label = @2
          local.get 1
          i32.const 128
          i32.lt_u
          br_if 0 (;@2;)
          local.get 1
          i32.const 63
          i32.and
          i32.const -128
          i32.or
          local.set 3
          local.get 1
          i32.const 6
          i32.shr_u
          local.set 4
          block ;; label = @3
            local.get 1
            i32.const 2048
            i32.ge_u
            br_if 0 (;@3;)
            local.get 2
            local.get 3
            i32.store8 offset=13
            local.get 2
            local.get 4
            i32.const 192
            i32.or
            i32.store8 offset=12
            i32.const 2
            local.set 1
            br 2 (;@1;)
          end
          local.get 1
          i32.const 12
          i32.shr_u
          local.set 5
          local.get 4
          i32.const 63
          i32.and
          i32.const -128
          i32.or
          local.set 4
          block ;; label = @3
            local.get 1
            i32.const 65535
            i32.gt_u
            br_if 0 (;@3;)
            local.get 2
            local.get 3
            i32.store8 offset=14
            local.get 2
            local.get 4
            i32.store8 offset=13
            local.get 2
            local.get 5
            i32.const 224
            i32.or
            i32.store8 offset=12
            i32.const 3
            local.set 1
            br 2 (;@1;)
          end
          local.get 2
          local.get 3
          i32.store8 offset=15
          local.get 2
          local.get 4
          i32.store8 offset=14
          local.get 2
          local.get 5
          i32.const 63
          i32.and
          i32.const -128
          i32.or
          i32.store8 offset=13
          local.get 2
          local.get 1
          i32.const 18
          i32.shr_u
          i32.const -16
          i32.or
          i32.store8 offset=12
          i32.const 4
          local.set 1
          br 1 (;@1;)
        end
        local.get 2
        local.get 1
        i32.store8 offset=12
        i32.const 1
        local.set 1
      end
      block ;; label = @1
        local.get 1
        local.get 0
        i32.load offset=8
        local.tee 0
        i32.load
        local.get 0
        i32.load offset=8
        local.tee 3
        i32.sub
        i32.le_u
        br_if 0 (;@1;)
        local.get 0
        local.get 3
        local.get 1
        i32.const 1
        i32.const 1
        call $_RINvNvMs2_NtCsblnovvQk4nh_5alloc7raw_vecINtB8_11RawVecInnerpE7reserve21do_reserve_and_handleNtNtBa_5alloc6GlobalECsfH5l96bTt9G_3std
        local.get 0
        i32.load offset=8
        local.set 3
      end
      block ;; label = @1
        local.get 1
        i32.eqz
        br_if 0 (;@1;)
        local.get 0
        i32.load offset=4
        local.get 3
        i32.add
        local.get 2
        i32.const 12
        i32.add
        local.get 1
        memory.copy
      end
      local.get 0
      local.get 3
      local.get 1
      i32.add
      i32.store offset=8
      local.get 2
      i32.const 16
      i32.add
      global.set $__stack_pointer
      i32.const 0
    )
    (func $_RNvYINtNvNtCsfH5l96bTt9G_3std2io17default_write_fmt7AdapterINtNtCsblnovvQk4nh_5alloc3vec3VechEENtNtCs2GenDSTXHQd_4core3fmt5Write9write_fmtB9_ (;110;) (type 3) (param i32 i32 i32) (result i32)
      local.get 0
      global.get $GOT.data.internal.__memory_base
      i32.const 1050908
      i32.add
      local.get 1
      local.get 2
      call $_RNvNtCs2GenDSTXHQd_4core3fmt5write
    )
    (func $_RNvYINtNvNtCsfH5l96bTt9G_3std2io17default_write_fmt7AdapterNtNtNtNtB9_3sys5stdio4unix6StderrENtNtCs2GenDSTXHQd_4core3fmt5Write10write_charB9_ (;111;) (type 4) (param i32 i32) (result i32)
      (local i32 i32 i32 i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 2
      global.set $__stack_pointer
      local.get 2
      i32.const 0
      i32.store offset=12
      block ;; label = @1
        block ;; label = @2
          local.get 1
          i32.const 128
          i32.lt_u
          br_if 0 (;@2;)
          local.get 1
          i32.const 63
          i32.and
          i32.const -128
          i32.or
          local.set 3
          local.get 1
          i32.const 6
          i32.shr_u
          local.set 4
          block ;; label = @3
            local.get 1
            i32.const 2048
            i32.ge_u
            br_if 0 (;@3;)
            local.get 2
            local.get 3
            i32.store8 offset=13
            local.get 2
            local.get 4
            i32.const 192
            i32.or
            i32.store8 offset=12
            i32.const 2
            local.set 1
            br 2 (;@1;)
          end
          local.get 1
          i32.const 12
          i32.shr_u
          local.set 5
          local.get 4
          i32.const 63
          i32.and
          i32.const -128
          i32.or
          local.set 4
          block ;; label = @3
            local.get 1
            i32.const 65535
            i32.gt_u
            br_if 0 (;@3;)
            local.get 2
            local.get 3
            i32.store8 offset=14
            local.get 2
            local.get 4
            i32.store8 offset=13
            local.get 2
            local.get 5
            i32.const 224
            i32.or
            i32.store8 offset=12
            i32.const 3
            local.set 1
            br 2 (;@1;)
          end
          local.get 2
          local.get 3
          i32.store8 offset=15
          local.get 2
          local.get 4
          i32.store8 offset=14
          local.get 2
          local.get 5
          i32.const 63
          i32.and
          i32.const -128
          i32.or
          i32.store8 offset=13
          local.get 2
          local.get 1
          i32.const 18
          i32.shr_u
          i32.const -16
          i32.or
          i32.store8 offset=12
          i32.const 4
          local.set 1
          br 1 (;@1;)
        end
        local.get 2
        local.get 1
        i32.store8 offset=12
        i32.const 1
        local.set 1
      end
      local.get 0
      local.get 2
      i32.const 12
      i32.add
      local.get 1
      call $_RNvXNvNtCsfH5l96bTt9G_3std2io17default_write_fmtINtB2_7AdapterNtNtNtNtB6_3sys5stdio4unix6StderrENtNtCs2GenDSTXHQd_4core3fmt5Write9write_strB6_
      local.set 1
      local.get 2
      i32.const 16
      i32.add
      global.set $__stack_pointer
      local.get 1
    )
    (func $_RNvYINtNvNtCsfH5l96bTt9G_3std2io17default_write_fmt7AdapterNtNtNtNtB9_3sys5stdio4unix6StderrENtNtCs2GenDSTXHQd_4core3fmt5Write9write_fmtB9_ (;112;) (type 3) (param i32 i32 i32) (result i32)
      local.get 0
      global.get $GOT.data.internal.__memory_base
      i32.const 1050932
      i32.add
      local.get 1
      local.get 2
      call $_RNvNtCs2GenDSTXHQd_4core3fmt5write
    )
    (func $_RNvYINtNvNtCsfH5l96bTt9G_3std9panicking11begin_panic7PayloadReENtNtCs2GenDSTXHQd_4core5panic12PanicPayload6as_strB9_ (;113;) (type 1) (param i32 i32)
      local.get 0
      i32.const 0
      i32.store
    )
    (func $_RNvYNtNtCsblnovvQk4nh_5alloc6string6StringNtNtCs2GenDSTXHQd_4core3fmt5Write9write_fmtCsfH5l96bTt9G_3std (;114;) (type 3) (param i32 i32 i32) (result i32)
      local.get 0
      global.get $GOT.data.internal.__memory_base
      i32.const 1050992
      i32.add
      local.get 1
      local.get 2
      call $_RNvNtCs2GenDSTXHQd_4core3fmt5write
    )
    (func $_RNvYNtNtNtNtCsfH5l96bTt9G_3std3sys5stdio4unix6StderrNtNtBa_2io5Write9write_allBa_ (;115;) (type 2) (param i32 i32 i32 i32)
      (local i32 i32 i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 4
      global.set $__stack_pointer
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            local.get 3
            i32.eqz
            br_if 0 (;@3;)
            loop ;; label = @4
              block ;; label = @5
                block ;; label = @6
                  block ;; label = @7
                    block ;; label = @8
                      i32.const 2
                      local.get 2
                      local.get 3
                      call $write
                      local.tee 5
                      i32.const -1
                      i32.ne
                      br_if 0 (;@8;)
                      local.get 4
                      i32.const 0
                      i32.store8 offset=11
                      local.get 4
                      i32.const 0
                      i32.store16 offset=9 align=1
                      local.get 4
                      i32.const 0
                      i32.store8 offset=8
                      local.get 4
                      global.get $GOT.data.internal.errno
                      i32.load
                      local.tee 5
                      i32.store offset=12
                      local.get 5
                      i32.const 27
                      i32.eq
                      br_if 3 (;@5;)
                      local.get 4
                      i32.const 8
                      i32.add
                      local.set 5
                      br 1 (;@7;)
                    end
                    local.get 4
                    local.get 5
                    i32.store offset=12
                    local.get 4
                    i32.const 4
                    i32.store8 offset=8
                    global.get $GOT.data.internal.__memory_base
                    local.set 6
                    local.get 5
                    br_if 1 (;@6;)
                    local.get 6
                    i32.const 1051232
                    i32.add
                    local.set 5
                  end
                  local.get 0
                  local.get 5
                  i64.load
                  i64.store align=4
                  br 5 (;@1;)
                end
                local.get 3
                local.get 5
                i32.lt_u
                br_if 3 (;@2;)
                local.get 2
                local.get 5
                i32.add
                local.set 2
                local.get 3
                local.get 5
                i32.sub
                local.set 3
              end
              local.get 3
              br_if 0 (;@4;)
            end
          end
          local.get 0
          i32.const 4
          i32.store8
          br 1 (;@1;)
        end
        local.get 5
        local.get 3
        local.get 3
        global.get $GOT.data.internal.__memory_base
        i32.const 1051288
        i32.add
        call $_RNvNtNtCs2GenDSTXHQd_4core5slice5index16slice_index_fail
        unreachable
      end
      local.get 4
      i32.const 16
      i32.add
      global.set $__stack_pointer
    )
    (func $cabi_realloc (;116;) (type 5) (param i32 i32 i32 i32) (result i32)
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            local.get 1
            br_if 0 (;@3;)
            local.get 3
            i32.eqz
            br_if 2 (;@1;)
            call $_RNvCsgrkdPkmfNkI_7___rustc35___rust_no_alloc_shim_is_unstable_v2
            local.get 3
            local.get 2
            call $_RNvCsgrkdPkmfNkI_7___rustc12___rust_alloc
            local.tee 2
            i32.eqz
            br_if 1 (;@2;)
            br 2 (;@1;)
          end
          local.get 0
          local.get 1
          local.get 2
          local.get 3
          call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_realloc
          local.tee 2
          br_if 1 (;@1;)
        end
        call $_RNvNtNtNtNtCsfH5l96bTt9G_3std3sys3pal4wasi7helpers14abort_internal
        unreachable
      end
      local.get 2
    )
    (func $_RNvMs4_NtCsblnovvQk4nh_5alloc7raw_vecNtB5_11RawVecInner14grow_amortizedCsiFskK82h3Dt_4wasi (;117;) (type 2) (param i32 i32 i32 i32)
      (local i32 i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 4
      global.set $__stack_pointer
      local.get 4
      i32.const 4
      i32.add
      local.get 1
      i32.load
      local.tee 5
      local.get 1
      i32.load offset=4
      local.get 2
      i32.const 1
      i32.add
      local.tee 2
      local.get 5
      i32.const 1
      i32.shl
      local.tee 5
      local.get 2
      local.get 5
      i32.gt_u
      select
      local.tee 2
      i32.const 4
      local.get 2
      i32.const 4
      i32.gt_u
      select
      local.tee 2
      local.get 3
      call $_RNvMs4_NtCsblnovvQk4nh_5alloc7raw_vecNtB5_11RawVecInner11finish_growCsiFskK82h3Dt_4wasi
      block ;; label = @1
        block ;; label = @2
          local.get 4
          i32.load offset=4
          i32.eqz
          br_if 0 (;@2;)
          local.get 4
          i32.load offset=12
          local.set 1
          local.get 4
          i32.load offset=8
          local.set 2
          br 1 (;@1;)
        end
        local.get 4
        i32.load offset=8
        local.set 3
        local.get 1
        local.get 2
        i32.store
        local.get 1
        local.get 3
        i32.store offset=4
        i32.const -2147483647
        local.set 2
      end
      local.get 0
      local.get 1
      i32.store offset=4
      local.get 0
      local.get 2
      i32.store
      local.get 4
      i32.const 16
      i32.add
      global.set $__stack_pointer
    )
    (func $_RNvMs3_NtCsblnovvQk4nh_5alloc7raw_vecINtB5_6RawVecTNtNtB7_6string6StringBN_EE8grow_oneCsiFskK82h3Dt_4wasi (;118;) (type 0) (param i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 1
      global.set $__stack_pointer
      local.get 1
      i32.const 8
      i32.add
      local.get 0
      local.get 0
      i32.load
      i32.const 24
      call $_RNvMs4_NtCsblnovvQk4nh_5alloc7raw_vecNtB5_11RawVecInner14grow_amortizedCsiFskK82h3Dt_4wasi
      block ;; label = @1
        local.get 1
        i32.load offset=8
        local.tee 0
        i32.const -2147483647
        i32.eq
        br_if 0 (;@1;)
        local.get 0
        local.get 1
        i32.load offset=12
        call $_RNvNtCsblnovvQk4nh_5alloc7raw_vec12handle_error
        unreachable
      end
      local.get 1
      i32.const 16
      i32.add
      global.set $__stack_pointer
    )
    (func $_RNvMs4_NtCsblnovvQk4nh_5alloc7raw_vecNtB5_11RawVecInner11finish_growCsiFskK82h3Dt_4wasi (;119;) (type 13) (param i32 i32 i32 i32 i32)
      (local i32 i32 i64)
      i32.const 1
      local.set 5
      i32.const 4
      local.set 6
      block ;; label = @1
        block ;; label = @2
          local.get 4
          i64.extend_i32_u
          local.get 3
          i64.extend_i32_u
          i64.mul
          local.tee 7
          i64.const 32
          i64.shr_u
          i32.wrap_i64
          i32.eqz
          br_if 0 (;@2;)
          i32.const 0
          local.set 3
          br 1 (;@1;)
        end
        block ;; label = @2
          local.get 7
          i32.wrap_i64
          local.tee 3
          i32.const 2147483644
          i32.le_u
          br_if 0 (;@2;)
          i32.const 0
          local.set 3
          br 1 (;@1;)
        end
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                local.get 1
                i32.eqz
                br_if 0 (;@5;)
                local.get 2
                local.get 4
                local.get 1
                i32.mul
                i32.const 4
                local.get 3
                call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_realloc
                local.set 6
                br 1 (;@4;)
              end
              block ;; label = @5
                local.get 3
                br_if 0 (;@5;)
                i32.const 4
                local.set 6
                br 2 (;@3;)
              end
              call $_RNvCsgrkdPkmfNkI_7___rustc35___rust_no_alloc_shim_is_unstable_v2
              local.get 3
              i32.const 4
              call $_RNvCsgrkdPkmfNkI_7___rustc12___rust_alloc
              local.set 6
            end
            local.get 6
            br_if 0 (;@3;)
            local.get 0
            i32.const 4
            i32.store offset=4
            br 1 (;@2;)
          end
          local.get 0
          local.get 6
          i32.store offset=4
          i32.const 0
          local.set 5
        end
        i32.const 8
        local.set 6
      end
      local.get 0
      local.get 6
      i32.add
      local.get 3
      i32.store
      local.get 0
      local.get 5
      i32.store
    )
    (func $_RNvNtCsiFskK82h3Dt_4wasi5proxy40___link_custom_section_describing_imports (;120;) (type 10))
    (func $writev (;121;) (type 3) (param i32 i32 i32) (result i32)
      (local i32)
      block ;; label = @1
        local.get 2
        i32.const 0
        i32.lt_s
        br_if 0 (;@1;)
        block ;; label = @2
          local.get 2
          i32.eqz
          br_if 0 (;@2;)
          loop ;; label = @3
            block ;; label = @4
              local.get 1
              i32.const 4
              i32.add
              i32.load
              local.tee 3
              i32.eqz
              br_if 0 (;@4;)
              local.get 0
              local.get 1
              i32.load
              local.get 3
              call $write
              return
            end
            local.get 1
            i32.const 8
            i32.add
            local.set 1
            local.get 2
            i32.const -1
            i32.add
            local.tee 2
            br_if 0 (;@3;)
          end
        end
        local.get 0
        i32.const 0
        i32.const 0
        call $write
        return
      end
      global.get $GOT.data.internal.errno
      i32.const 28
      i32.store
      i32.const -1
    )
    (func $write (;122;) (type 3) (param i32 i32 i32) (result i32)
      (local i32 i64 i64)
      global.get $__stack_pointer
      i32.const 48
      i32.sub
      local.tee 3
      global.set $__stack_pointer
      block ;; label = @1
        block ;; label = @2
          local.get 0
          local.get 3
          i32.const 44
          i32.add
          local.get 3
          i32.const 36
          i32.add
          local.get 3
          i32.const 40
          i32.add
          call $__wasilibc_write_stream
          i32.const 0
          i32.ge_s
          br_if 0 (;@2;)
          i32.const -1
          local.set 0
          br 1 (;@1;)
        end
        local.get 3
        i64.const 0
        i64.store offset=24
        loop ;; label = @2
          block ;; label = @3
            local.get 3
            i32.load offset=44
            local.get 3
            i32.const 24
            i32.add
            local.get 3
            i32.const 16
            i32.add
            call $streams_method_output_stream_check_write
            br_if 0 (;@3;)
            i32.const 64
            local.set 0
            block ;; label = @4
              local.get 3
              i32.load8_u offset=16
              i32.const 1
              i32.eq
              br_if 0 (;@4;)
              local.get 3
              i32.load offset=20
              call $io_error_error_drop_own
              i32.const 29
              local.set 0
            end
            global.get $GOT.data.internal.errno
            local.get 0
            i32.store
            i32.const -1
            local.set 0
            br 2 (;@1;)
          end
          block ;; label = @3
            local.get 3
            i64.load offset=24
            local.tee 4
            i64.const 0
            i64.ne
            br_if 0 (;@3;)
            local.get 3
            i32.load offset=40
            call $poll_method_pollable_block
            local.get 3
            i64.load offset=24
            local.tee 4
            i64.eqz
            br_if 1 (;@2;)
          end
        end
        local.get 3
        local.get 1
        i32.store offset=8
        local.get 3
        local.get 4
        local.get 2
        i64.extend_i32_u
        local.tee 5
        local.get 4
        local.get 5
        i64.lt_u
        select
        i64.store32 offset=12
        block ;; label = @2
          local.get 3
          i32.load offset=44
          local.get 3
          i32.const 8
          i32.add
          local.get 3
          i32.const 16
          i32.add
          call $streams_method_output_stream_write
          br_if 0 (;@2;)
          i32.const 64
          local.set 0
          block ;; label = @3
            local.get 3
            i32.load8_u offset=16
            i32.const 1
            i32.eq
            br_if 0 (;@3;)
            local.get 3
            i32.load offset=20
            call $io_error_error_drop_own
            i32.const 29
            local.set 0
          end
          global.get $GOT.data.internal.errno
          local.get 0
          i32.store
          i32.const -1
          local.set 0
          br 1 (;@1;)
        end
        block ;; label = @2
          local.get 3
          i32.load offset=44
          local.get 3
          i32.const 16
          i32.add
          call $streams_method_output_stream_blocking_flush
          br_if 0 (;@2;)
          i32.const 64
          local.set 0
          block ;; label = @3
            local.get 3
            i32.load8_u offset=16
            i32.const 1
            i32.eq
            br_if 0 (;@3;)
            local.get 3
            i32.load offset=20
            call $io_error_error_drop_own
            i32.const 29
            local.set 0
          end
          global.get $GOT.data.internal.errno
          local.get 0
          i32.store
          i32.const -1
          local.set 0
          br 1 (;@1;)
        end
        local.get 3
        i32.load offset=12
        local.set 0
        local.get 3
        i32.load offset=36
        local.tee 2
        i32.eqz
        br_if 0 (;@1;)
        local.get 2
        local.get 2
        i64.load
        local.get 0
        i64.extend_i32_u
        i64.add
        i64.store
      end
      local.get 3
      i32.const 48
      i32.add
      global.set $__stack_pointer
      local.get 0
    )
    (func $_Exit (;123;) (type 0) (param i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 1
      global.set $__stack_pointer
      local.get 1
      local.get 0
      i32.const 0
      i32.ne
      i32.store8 offset=15
      local.get 1
      i32.const 15
      i32.add
      call $exit_exit
      unreachable
    )
    (func $__wasilibc_ensure_environ (;124;) (type 10)
      block ;; label = @1
        global.get $GOT.data.internal.__memory_base
        i32.const 1051428
        i32.add
        i32.load
        i32.const -1
        i32.ne
        br_if 0 (;@1;)
        call $__wasilibc_initialize_environ
      end
    )
    (func $__wasilibc_initialize_environ (;125;) (type 10)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 0
      global.set $__stack_pointer
      global.get $GOT.data.internal.__memory_base
      local.set 1
      local.get 0
      i32.const 8
      i32.add
      call $environment_get_environment
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            local.get 0
            i32.load offset=12
            local.tee 2
            br_if 0 (;@3;)
            local.get 1
            i32.const 1051696
            i32.add
            local.set 3
            br 1 (;@2;)
          end
          local.get 2
          i32.const 1
          i32.add
          local.tee 1
          i32.eqz
          br_if 1 (;@1;)
          local.get 1
          i32.const 4
          call $calloc
          local.set 3
          local.get 0
          i32.load offset=8
          local.set 1
          local.get 3
          local.set 4
          i32.const 0
          local.set 5
          loop ;; label = @3
            local.get 1
            i32.const 8
            i32.add
            i32.load
            local.set 6
            local.get 1
            i32.load
            local.set 7
            local.get 4
            local.get 1
            i32.const 12
            i32.add
            i32.load
            local.tee 8
            local.get 1
            i32.const 4
            i32.add
            i32.load
            local.tee 9
            i32.add
            local.tee 10
            i32.const 2
            i32.add
            call $malloc
            local.tee 11
            i32.store
            block ;; label = @4
              local.get 11
              br_if 0 (;@4;)
              block ;; label = @5
                local.get 5
                i32.eqz
                br_if 0 (;@5;)
                local.get 3
                local.set 1
                loop ;; label = @6
                  local.get 1
                  i32.load
                  call $free
                  local.get 1
                  i32.const 4
                  i32.add
                  local.set 1
                  local.get 5
                  i32.const -1
                  i32.add
                  local.tee 5
                  br_if 0 (;@6;)
                end
              end
              local.get 3
              call $free
              br 3 (;@1;)
            end
            block ;; label = @4
              local.get 9
              i32.eqz
              br_if 0 (;@4;)
              local.get 11
              local.get 7
              local.get 9
              memory.copy
            end
            local.get 11
            local.get 9
            i32.add
            local.tee 9
            i32.const 61
            i32.store8
            block ;; label = @4
              local.get 8
              i32.eqz
              br_if 0 (;@4;)
              local.get 9
              i32.const 1
              i32.add
              local.get 6
              local.get 8
              memory.copy
            end
            local.get 11
            local.get 10
            i32.add
            i32.const 1
            i32.add
            i32.const 0
            i32.store8
            local.get 1
            i32.const 16
            i32.add
            local.set 1
            local.get 4
            i32.const 4
            i32.add
            local.set 4
            local.get 2
            local.get 5
            i32.const 1
            i32.add
            local.tee 5
            i32.ne
            br_if 0 (;@3;)
          end
          local.get 0
          i32.const 8
          i32.add
          call $wasip2_list_tuple2_string_string_free
        end
        global.get $GOT.data.internal.__memory_base
        i32.const 1051428
        i32.add
        local.get 3
        i32.store
        local.get 0
        i32.const 16
        i32.add
        global.set $__stack_pointer
        return
      end
      local.get 0
      i32.const 8
      i32.add
      call $wasip2_list_tuple2_string_string_free
      i32.const 70
      call $_Exit
      unreachable
    )
    (func $abort (;126;) (type 10)
      unreachable
    )
    (func $getcwd (;127;) (type 4) (param i32 i32) (result i32)
      (local i32)
      global.get $GOT.data.internal.__memory_base
      i32.const 1051432
      i32.add
      i32.load
      local.set 2
      block ;; label = @1
        block ;; label = @2
          local.get 0
          br_if 0 (;@2;)
          local.get 2
          call $strdup
          local.tee 0
          br_if 1 (;@1;)
          global.get $GOT.data.internal.errno
          i32.const 48
          i32.store
          i32.const 0
          return
        end
        block ;; label = @2
          local.get 1
          local.get 2
          call $strlen
          i32.const 1
          i32.add
          i32.ge_u
          br_if 0 (;@2;)
          global.get $GOT.data.internal.errno
          i32.const 68
          i32.store
          i32.const 0
          return
        end
        local.get 0
        local.get 2
        call $strcpy
        local.set 0
      end
      local.get 0
    )
    (func $descriptor_table_insert (;128;) (type 8) (param i32) (result i32)
      (local i32 i32 i32 i64 i32)
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            global.get $GOT.data.internal.__memory_base
            i32.const 1051700
            i32.add
            i32.load8_u
            br_if 0 (;@3;)
            global.get $GOT.data.internal.__memory_base
            i32.const 1051700
            i32.add
            i32.const 1
            i32.store8
            call $__wasilibc_init_stdio
            i32.const -1
            i32.gt_s
            br_if 0 (;@3;)
            local.get 0
            i32.load
            local.set 1
            local.get 0
            i32.load offset=4
            local.set 2
            br 1 (;@2;)
          end
          global.get $GOT.data.internal.__memory_base
          local.set 3
          local.get 0
          i64.load align=4
          local.tee 4
          i64.const 32
          i64.shr_u
          i32.wrap_i64
          local.set 2
          local.get 4
          i32.wrap_i64
          local.set 1
          block ;; label = @3
            block ;; label = @4
              local.get 3
              i32.const 1051708
              i32.add
              i32.load
              local.tee 0
              local.get 3
              i32.const 1051712
              i32.add
              i32.load
              i32.ne
              br_if 0 (;@4;)
              global.get $GOT.data.internal.__memory_base
              local.tee 5
              i32.const 1051704
              i32.add
              i32.load
              local.set 3
              block ;; label = @5
                local.get 0
                local.get 5
                i32.const 1051716
                i32.add
                i32.load
                i32.ne
                br_if 0 (;@5;)
                local.get 3
                local.get 0
                i32.const 1
                i32.shl
                i32.const 8
                local.get 0
                select
                local.tee 5
                i32.const 12
                i32.mul
                call $realloc
                local.tee 3
                i32.eqz
                br_if 2 (;@3;)
                global.get $GOT.data.internal.__memory_base
                local.tee 0
                i32.const 1051716
                i32.add
                local.get 5
                i32.store
                local.get 0
                i32.const 1051704
                i32.add
                local.get 3
                i32.store
                local.get 0
                i32.const 1051712
                i32.add
                i32.load
                local.set 0
              end
              local.get 3
              local.get 0
              i32.const 12
              i32.mul
              i32.add
              local.tee 3
              local.get 0
              i32.const 1
              i32.add
              i32.store offset=4
              local.get 3
              i32.const 0
              i32.store8
              global.get $GOT.data.internal.__memory_base
              local.tee 0
              i32.const 1051712
              i32.add
              local.tee 3
              local.get 3
              i32.load
              i32.const 1
              i32.add
              i32.store
              local.get 0
              i32.const 1051708
              i32.add
              i32.load
              local.set 0
            end
            global.get $GOT.data.internal.__memory_base
            local.tee 5
            i32.const 1051704
            i32.add
            i32.load
            local.get 0
            i32.const 12
            i32.mul
            i32.add
            local.tee 3
            i32.const 1
            i32.store8
            local.get 5
            i32.const 1051708
            i32.add
            local.get 3
            i32.load offset=4
            i32.store
            local.get 3
            local.get 4
            i64.store offset=4 align=4
            local.get 0
            i32.const -1
            i32.gt_s
            br_if 2 (;@1;)
            br 1 (;@2;)
          end
          global.get $GOT.data.internal.errno
          i32.const 48
          i32.store
        end
        local.get 1
        local.get 2
        i32.load
        call_indirect (type 0)
        i32.const -1
        local.set 0
      end
      local.get 0
    )
    (func $descriptor_table_get_ref (;129;) (type 8) (param i32) (result i32)
      (local i32)
      block ;; label = @1
        block ;; label = @2
          global.get $GOT.data.internal.__memory_base
          i32.const 1051700
          i32.add
          i32.load8_u
          br_if 0 (;@2;)
          global.get $GOT.data.internal.__memory_base
          i32.const 1051700
          i32.add
          i32.const 1
          i32.store8
          i32.const 0
          local.set 1
          call $__wasilibc_init_stdio
          i32.const 0
          i32.lt_s
          br_if 1 (;@1;)
        end
        global.get $GOT.data.internal.__memory_base
        local.set 1
        block ;; label = @2
          block ;; label = @3
            local.get 0
            i32.const 0
            i32.lt_s
            br_if 0 (;@3;)
            local.get 0
            local.get 1
            i32.const 1051712
            i32.add
            i32.load
            i32.lt_u
            br_if 1 (;@2;)
          end
          global.get $GOT.data.internal.errno
          i32.const 8
          i32.store
          i32.const 0
          return
        end
        block ;; label = @2
          global.get $GOT.data.internal.__memory_base
          i32.const 1051704
          i32.add
          i32.load
          local.get 0
          i32.const 12
          i32.mul
          i32.add
          local.tee 0
          i32.load8_u
          br_if 0 (;@2;)
          global.get $GOT.data.internal.errno
          i32.const 8
          i32.store
          i32.const 0
          return
        end
        local.get 0
        i32.const 4
        i32.add
        local.set 1
      end
      local.get 1
    )
    (func $wasip2_list_tuple2_string_string_free (;130;) (type 0) (param i32)
      (local i32 i32)
      block ;; label = @1
        local.get 0
        i32.load offset=4
        local.tee 1
        i32.eqz
        br_if 0 (;@1;)
        local.get 0
        i32.load
        local.tee 2
        local.set 0
        loop ;; label = @2
          block ;; label = @3
            local.get 0
            i32.const 4
            i32.add
            i32.load
            i32.eqz
            br_if 0 (;@3;)
            local.get 0
            i32.load
            call $free
          end
          local.get 0
          i64.const 0
          i64.store align=4
          block ;; label = @3
            local.get 0
            i32.const 12
            i32.add
            i32.load
            i32.eqz
            br_if 0 (;@3;)
            local.get 0
            i32.const 8
            i32.add
            i32.load
            call $free
          end
          local.get 0
          i32.const 8
          i32.add
          i64.const 0
          i64.store align=4
          local.get 0
          i32.const 16
          i32.add
          local.set 0
          local.get 1
          i32.const -1
          i32.add
          local.tee 1
          br_if 0 (;@2;)
        end
        local.get 2
        call $free
      end
    )
    (func $io_error_error_drop_own (;131;) (type 0) (param i32)
      local.get 0
      call $__wasm_import_io_error_error_drop
    )
    (func $poll_pollable_drop_own (;132;) (type 0) (param i32)
      local.get 0
      call $__wasm_import_poll_pollable_drop
    )
    (func $poll_borrow_pollable (;133;) (type 8) (param i32) (result i32)
      local.get 0
    )
    (func $streams_input_stream_drop_own (;134;) (type 0) (param i32)
      local.get 0
      call $__wasm_import_streams_input_stream_drop
    )
    (func $streams_borrow_input_stream (;135;) (type 8) (param i32) (result i32)
      local.get 0
    )
    (func $streams_output_stream_drop_own (;136;) (type 0) (param i32)
      local.get 0
      call $__wasm_import_streams_output_stream_drop
    )
    (func $streams_borrow_output_stream (;137;) (type 8) (param i32) (result i32)
      local.get 0
    )
    (func $terminal_input_terminal_input_drop_own (;138;) (type 0) (param i32)
      local.get 0
      call $__wasm_import_terminal_input_terminal_input_drop
    )
    (func $terminal_output_terminal_output_drop_own (;139;) (type 0) (param i32)
      local.get 0
      call $__wasm_import_terminal_output_terminal_output_drop
    )
    (func $environment_get_environment (;140;) (type 0) (param i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 1
      global.set $__stack_pointer
      local.get 1
      i32.const 8
      i32.add
      call $__wasm_import_environment_get_environment
      local.get 0
      local.get 1
      i64.load offset=8 align=4
      i64.store align=4
      local.get 1
      i32.const 16
      i32.add
      global.set $__stack_pointer
    )
    (func $exit_exit (;141;) (type 0) (param i32)
      local.get 0
      i32.load8_u
      call $__wasm_import_exit_exit
      unreachable
    )
    (func $poll_method_pollable_block (;142;) (type 0) (param i32)
      local.get 0
      call $__wasm_import_poll_method_pollable_block
    )
    (func $streams_method_output_stream_check_write (;143;) (type 3) (param i32 i32 i32) (result i32)
      (local i32 i64)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 3
      global.set $__stack_pointer
      local.get 0
      local.get 3
      call $__wasm_import_streams_method_output_stream_check_write
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              local.get 3
              i32.load8_u
              br_table 0 (;@4;) 2 (;@2;) 1 (;@3;)
            end
            local.get 3
            i64.load offset=8
            local.set 4
          end
          local.get 1
          local.get 4
          i64.store
          i32.const 1
          local.set 0
          br 1 (;@1;)
        end
        local.get 2
        local.get 3
        i64.load32_u offset=12
        i64.const 32
        i64.shl
        i64.const 0
        local.get 3
        i64.load8_u offset=8
        local.tee 4
        i64.eqz
        select
        local.get 4
        i64.or
        i64.store align=4
        i32.const 0
        local.set 0
      end
      local.get 3
      i32.const 16
      i32.add
      global.set $__stack_pointer
      local.get 0
    )
    (func $streams_method_output_stream_write (;144;) (type 3) (param i32 i32 i32) (result i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 3
      global.set $__stack_pointer
      local.get 0
      local.get 1
      i32.load
      local.get 1
      i32.load offset=4
      local.get 3
      i32.const 4
      i32.add
      call $__wasm_import_streams_method_output_stream_write
      block ;; label = @1
        local.get 3
        i32.load8_u offset=4
        i32.const 1
        i32.ne
        local.tee 1
        br_if 0 (;@1;)
        local.get 2
        local.get 3
        i32.load offset=12
        i32.store offset=4
        local.get 2
        local.get 3
        i32.load8_u offset=8
        i32.store8
      end
      local.get 3
      i32.const 16
      i32.add
      global.set $__stack_pointer
      local.get 1
    )
    (func $streams_method_output_stream_blocking_flush (;145;) (type 4) (param i32 i32) (result i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 2
      global.set $__stack_pointer
      local.get 0
      local.get 2
      i32.const 4
      i32.add
      call $__wasm_import_streams_method_output_stream_blocking_flush
      block ;; label = @1
        local.get 2
        i32.load8_u offset=4
        i32.const 1
        i32.ne
        local.tee 0
        br_if 0 (;@1;)
        local.get 1
        local.get 2
        i32.load offset=12
        i32.store offset=4
        local.get 1
        local.get 2
        i32.load8_u offset=8
        i32.store8
      end
      local.get 2
      i32.const 16
      i32.add
      global.set $__stack_pointer
      local.get 0
    )
    (func $streams_method_output_stream_subscribe (;146;) (type 8) (param i32) (result i32)
      local.get 0
      call $__wasm_import_streams_method_output_stream_subscribe
    )
    (func $stdin_get_stdin (;147;) (type 9) (result i32)
      call $__wasm_import_stdin_get_stdin
    )
    (func $stdout_get_stdout (;148;) (type 9) (result i32)
      call $__wasm_import_stdout_get_stdout
    )
    (func $stderr_get_stderr (;149;) (type 9) (result i32)
      call $__wasm_import_stderr_get_stderr
    )
    (func $terminal_stdin_get_terminal_stdin (;150;) (type 8) (param i32) (result i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 1
      global.set $__stack_pointer
      local.get 1
      i32.const 8
      i32.add
      call $__wasm_import_terminal_stdin_get_terminal_stdin
      local.get 0
      local.get 1
      i32.load offset=12
      i32.store
      local.get 1
      i32.load8_u offset=8
      local.set 0
      local.get 1
      i32.const 16
      i32.add
      global.set $__stack_pointer
      local.get 0
      i32.const 1
      i32.eq
    )
    (func $terminal_stdout_get_terminal_stdout (;151;) (type 8) (param i32) (result i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 1
      global.set $__stack_pointer
      local.get 1
      i32.const 8
      i32.add
      call $__wasm_import_terminal_stdout_get_terminal_stdout
      local.get 0
      local.get 1
      i32.load offset=12
      i32.store
      local.get 1
      i32.load8_u offset=8
      local.set 0
      local.get 1
      i32.const 16
      i32.add
      global.set $__stack_pointer
      local.get 0
      i32.const 1
      i32.eq
    )
    (func $terminal_stderr_get_terminal_stderr (;152;) (type 8) (param i32) (result i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 1
      global.set $__stack_pointer
      local.get 1
      i32.const 8
      i32.add
      call $__wasm_import_terminal_stderr_get_terminal_stderr
      local.get 0
      local.get 1
      i32.load offset=12
      i32.store
      local.get 1
      i32.load8_u offset=8
      local.set 0
      local.get 1
      i32.const 16
      i32.add
      global.set $__stack_pointer
      local.get 0
      i32.const 1
      i32.eq
    )
    (func $__component_type_object_force_link_wasip2_public_use_in_this_compilation_unit (;153;) (type 10)
      call $__component_type_object_force_link_wasip2
    )
    (func $__wasilibc_write_stream (;154;) (type 5) (param i32 i32 i32 i32) (result i32)
      (local i32 i32 i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 4
      global.set $__stack_pointer
      i32.const -1
      local.set 5
      block ;; label = @1
        local.get 0
        call $descriptor_table_get_ref
        local.tee 0
        i32.eqz
        br_if 0 (;@1;)
        block ;; label = @2
          local.get 0
          i32.load offset=4
          i32.load offset=8
          local.tee 6
          br_if 0 (;@2;)
          global.get $GOT.data.internal.errno
          i32.const 58
          i32.store
          br 1 (;@1;)
        end
        i32.const 0
        local.set 5
        block ;; label = @2
          local.get 0
          i32.load
          local.get 1
          local.get 2
          local.get 4
          i32.const 12
          i32.add
          local.get 6
          call_indirect (type 5)
          i32.const 0
          i32.ge_s
          br_if 0 (;@2;)
          i32.const -1
          local.set 5
          br 1 (;@1;)
        end
        local.get 3
        i32.eqz
        br_if 0 (;@1;)
        block ;; label = @2
          local.get 4
          i32.load offset=12
          local.tee 2
          i32.load
          local.tee 0
          br_if 0 (;@2;)
          local.get 2
          local.get 1
          i32.load
          call $streams_method_output_stream_subscribe
          i32.store
          local.get 4
          i32.load offset=12
          i32.load
          local.set 0
        end
        local.get 3
        local.get 0
        call $poll_borrow_pollable
        i32.store
      end
      local.get 4
      i32.const 16
      i32.add
      global.set $__stack_pointer
      local.get 5
    )
    (func $__wasilibc_init_stdio (;155;) (type 9) (result i32)
      (local i32 i32 i32)
      global.get $__stack_pointer
      i32.const 32
      i32.sub
      local.tee 0
      global.set $__stack_pointer
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            i32.const 1
            i32.const 20
            call $calloc
            local.tee 1
            br_if 0 (;@3;)
            global.get $GOT.data.internal.errno
            i32.const 48
            i32.store
            br 1 (;@2;)
          end
          local.get 0
          local.get 1
          i32.store offset=24
          local.get 0
          global.get $GOT.data.internal.__memory_base
          i32.const 1051436
          i32.add
          i32.store offset=28
          local.get 0
          local.get 0
          i64.load offset=24 align=4
          i64.store offset=16
          i32.const -1
          local.set 1
          local.get 0
          i32.const 16
          i32.add
          call $descriptor_table_insert
          i32.const 0
          i32.lt_s
          br_if 1 (;@1;)
          block ;; label = @3
            i32.const 1
            i32.const 20
            call $calloc
            local.tee 2
            br_if 0 (;@3;)
            global.get $GOT.data.internal.errno
            i32.const 48
            i32.store
            br 2 (;@1;)
          end
          local.get 2
          i32.const 1
          i32.store
          local.get 0
          local.get 2
          i32.store offset=24
          local.get 0
          global.get $GOT.data.internal.__memory_base
          i32.const 1051436
          i32.add
          i32.store offset=28
          local.get 0
          local.get 0
          i64.load offset=24 align=4
          i64.store offset=8
          local.get 0
          i32.const 8
          i32.add
          call $descriptor_table_insert
          i32.const 0
          i32.lt_s
          br_if 1 (;@1;)
          block ;; label = @3
            i32.const 1
            i32.const 20
            call $calloc
            local.tee 1
            br_if 0 (;@3;)
            global.get $GOT.data.internal.errno
            i32.const 48
            i32.store
            br 1 (;@2;)
          end
          local.get 1
          i32.const 2
          i32.store
          local.get 0
          local.get 1
          i32.store offset=24
          local.get 0
          global.get $GOT.data.internal.__memory_base
          i32.const 1051436
          i32.add
          i32.store offset=28
          local.get 0
          local.get 0
          i64.load offset=24 align=4
          i64.store
          i32.const 0
          local.set 1
          local.get 0
          call $descriptor_table_insert
          i32.const -1
          i32.gt_s
          br_if 1 (;@1;)
        end
        i32.const -1
        local.set 1
      end
      local.get 0
      i32.const 32
      i32.add
      global.set $__stack_pointer
      local.get 1
    )
    (func $stdio_free (;156;) (type 0) (param i32)
      (local i32)
      block ;; label = @1
        local.get 0
        i32.load offset=12
        local.tee 1
        i32.eqz
        br_if 0 (;@1;)
        local.get 1
        call $poll_pollable_drop_own
      end
      block ;; label = @1
        local.get 0
        i32.load offset=16
        local.tee 1
        i32.eqz
        br_if 0 (;@1;)
        local.get 1
        call $poll_pollable_drop_own
      end
      block ;; label = @1
        local.get 0
        i32.load offset=4
        local.tee 1
        i32.eqz
        br_if 0 (;@1;)
        local.get 1
        call $streams_input_stream_drop_own
      end
      block ;; label = @1
        local.get 0
        i32.load offset=8
        local.tee 1
        i32.eqz
        br_if 0 (;@1;)
        local.get 1
        call $streams_output_stream_drop_own
      end
      local.get 0
      call $free
    )
    (func $stdio_get_read_stream (;157;) (type 5) (param i32 i32 i32 i32) (result i32)
      (local i32)
      block ;; label = @1
        local.get 0
        i32.load
        i32.eqz
        br_if 0 (;@1;)
        global.get $GOT.data.internal.errno
        i32.const 58
        i32.store
        i32.const -1
        return
      end
      block ;; label = @1
        local.get 0
        i32.load offset=4
        local.tee 4
        br_if 0 (;@1;)
        local.get 0
        call $stdin_get_stdin
        local.tee 4
        i32.store offset=4
      end
      local.get 1
      local.get 4
      call $streams_borrow_input_stream
      i32.store
      block ;; label = @1
        local.get 2
        i32.eqz
        br_if 0 (;@1;)
        local.get 2
        i32.const 0
        i32.store
      end
      block ;; label = @1
        local.get 3
        i32.eqz
        br_if 0 (;@1;)
        local.get 3
        local.get 0
        i32.const 12
        i32.add
        i32.store
      end
      i32.const 0
    )
    (func $stdio_get_write_stream (;158;) (type 5) (param i32 i32 i32 i32) (result i32)
      (local i32)
      block ;; label = @1
        local.get 0
        i32.load offset=8
        local.tee 4
        br_if 0 (;@1;)
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                local.get 0
                i32.load
                i32.const -1
                i32.add
                br_table 2 (;@3;) 0 (;@5;) 1 (;@4;)
              end
              call $stderr_get_stderr
              local.set 4
              br 2 (;@2;)
            end
            global.get $GOT.data.internal.errno
            i32.const 58
            i32.store
            i32.const -1
            return
          end
          call $stdout_get_stdout
          local.set 4
        end
        local.get 0
        local.get 4
        i32.store offset=8
      end
      local.get 1
      local.get 4
      call $streams_borrow_output_stream
      i32.store
      block ;; label = @1
        local.get 2
        i32.eqz
        br_if 0 (;@1;)
        local.get 2
        i32.const 0
        i32.store
      end
      block ;; label = @1
        local.get 3
        i32.eqz
        br_if 0 (;@1;)
        local.get 3
        local.get 0
        i32.const 16
        i32.add
        i32.store
      end
      i32.const 0
    )
    (func $stdio_fstat (;159;) (type 4) (param i32 i32) (result i32)
      block ;; label = @1
        i32.const 144
        i32.eqz
        br_if 0 (;@1;)
        local.get 1
        i32.const 0
        i32.const 144
        memory.fill
      end
      i32.const 0
    )
    (func $stdio_fcntl_getfl (;160;) (type 8) (param i32) (result i32)
      i32.const 268435456
      i32.const 67108864
      local.get 0
      i32.load
      select
    )
    (func $stdio_isatty (;161;) (type 8) (param i32) (result i32)
      (local i32)
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
                local.get 0
                i32.load
                br_table 0 (;@5;) 1 (;@4;) 2 (;@3;) 3 (;@2;)
              end
              local.get 1
              i32.const 12
              i32.add
              call $terminal_stdin_get_terminal_stdin
              i32.eqz
              br_if 2 (;@2;)
              local.get 1
              i32.load offset=12
              call $terminal_input_terminal_input_drop_own
              i32.const 1
              local.set 0
              br 3 (;@1;)
            end
            local.get 1
            i32.const 8
            i32.add
            call $terminal_stdout_get_terminal_stdout
            i32.eqz
            br_if 1 (;@2;)
            local.get 1
            i32.load offset=8
            call $terminal_output_terminal_output_drop_own
            i32.const 1
            local.set 0
            br 2 (;@1;)
          end
          local.get 1
          i32.const 4
          i32.add
          call $terminal_stderr_get_terminal_stderr
          i32.eqz
          br_if 0 (;@2;)
          local.get 1
          i32.load offset=4
          call $terminal_output_terminal_output_drop_own
          i32.const 1
          local.set 0
          br 1 (;@1;)
        end
        global.get $GOT.data.internal.errno
        i32.const 59
        i32.store
        i32.const 0
        local.set 0
      end
      local.get 1
      i32.const 16
      i32.add
      global.set $__stack_pointer
      local.get 0
    )
    (func $getenv (;162;) (type 8) (param i32) (result i32)
      (local i32 i32 i32 i32)
      call $__wasilibc_ensure_environ
      i32.const 0
      local.set 1
      block ;; label = @1
        local.get 0
        i32.const 61
        call $__strchrnul
        local.tee 2
        local.get 0
        i32.eq
        br_if 0 (;@1;)
        local.get 0
        local.get 2
        local.get 0
        i32.sub
        local.tee 3
        i32.add
        i32.load8_u
        local.set 2
        global.get $GOT.data.internal.__wasilibc_environ
        local.set 4
        local.get 2
        br_if 0 (;@1;)
        local.get 4
        i32.load
        local.tee 4
        i32.eqz
        br_if 0 (;@1;)
        local.get 4
        i32.load
        local.tee 2
        i32.eqz
        br_if 0 (;@1;)
        local.get 4
        i32.const 4
        i32.add
        local.set 4
        block ;; label = @2
          loop ;; label = @3
            block ;; label = @4
              local.get 0
              local.get 2
              local.get 3
              call $strncmp
              br_if 0 (;@4;)
              local.get 2
              local.get 3
              i32.add
              local.tee 2
              i32.load8_u
              i32.const 61
              i32.eq
              br_if 2 (;@2;)
            end
            local.get 4
            i32.load
            local.set 2
            local.get 4
            i32.const 4
            i32.add
            local.set 4
            local.get 2
            br_if 0 (;@3;)
            br 2 (;@1;)
          end
        end
        local.get 2
        i32.const 1
        i32.add
        local.set 1
      end
      local.get 1
    )
    (func $__strchrnul (;163;) (type 4) (param i32 i32) (result i32)
      (local i32 i32 i32)
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              local.get 1
              i32.const 255
              i32.and
              local.tee 2
              i32.eqz
              br_if 0 (;@4;)
              local.get 0
              i32.const 3
              i32.and
              i32.eqz
              br_if 2 (;@2;)
              block ;; label = @5
                local.get 0
                i32.load8_u
                local.tee 3
                br_if 0 (;@5;)
                local.get 0
                return
              end
              local.get 3
              local.get 1
              i32.const 255
              i32.and
              i32.ne
              br_if 1 (;@3;)
              local.get 0
              return
            end
            local.get 0
            local.get 0
            call $strlen
            i32.add
            return
          end
          block ;; label = @3
            local.get 0
            i32.const 1
            i32.add
            local.tee 3
            i32.const 3
            i32.and
            br_if 0 (;@3;)
            local.get 3
            local.set 0
            br 1 (;@2;)
          end
          local.get 3
          i32.load8_u
          local.tee 4
          i32.eqz
          br_if 1 (;@1;)
          local.get 4
          local.get 1
          i32.const 255
          i32.and
          i32.eq
          br_if 1 (;@1;)
          block ;; label = @3
            local.get 0
            i32.const 2
            i32.add
            local.tee 3
            i32.const 3
            i32.and
            br_if 0 (;@3;)
            local.get 3
            local.set 0
            br 1 (;@2;)
          end
          local.get 3
          i32.load8_u
          local.tee 4
          i32.eqz
          br_if 1 (;@1;)
          local.get 4
          local.get 1
          i32.const 255
          i32.and
          i32.eq
          br_if 1 (;@1;)
          block ;; label = @3
            local.get 0
            i32.const 3
            i32.add
            local.tee 3
            i32.const 3
            i32.and
            br_if 0 (;@3;)
            local.get 3
            local.set 0
            br 1 (;@2;)
          end
          local.get 3
          i32.load8_u
          local.tee 4
          i32.eqz
          br_if 1 (;@1;)
          local.get 4
          local.get 1
          i32.const 255
          i32.and
          i32.eq
          br_if 1 (;@1;)
          local.get 0
          i32.const 4
          i32.add
          local.set 0
        end
        block ;; label = @2
          i32.const 16843008
          local.get 0
          i32.load
          local.tee 3
          i32.sub
          local.get 3
          i32.or
          i32.const -2139062144
          i32.and
          i32.const -2139062144
          i32.ne
          br_if 0 (;@2;)
          local.get 2
          i32.const 16843009
          i32.mul
          local.set 2
          loop ;; label = @3
            i32.const 16843008
            local.get 3
            local.get 2
            i32.xor
            local.tee 3
            i32.sub
            local.get 3
            i32.or
            i32.const -2139062144
            i32.and
            i32.const -2139062144
            i32.ne
            br_if 1 (;@2;)
            i32.const 16843008
            local.get 0
            i32.const 4
            i32.add
            local.tee 0
            i32.load
            local.tee 3
            i32.sub
            local.get 3
            i32.or
            i32.const -2139062144
            i32.and
            i32.const -2139062144
            i32.eq
            br_if 0 (;@3;)
          end
        end
        local.get 0
        i32.const -1
        i32.add
        local.set 3
        loop ;; label = @2
          local.get 3
          i32.const 1
          i32.add
          local.tee 3
          i32.load8_u
          local.tee 0
          i32.eqz
          br_if 1 (;@1;)
          local.get 0
          local.get 1
          i32.const 255
          i32.and
          i32.ne
          br_if 0 (;@2;)
        end
      end
      local.get 3
    )
    (func $__stpcpy (;164;) (type 4) (param i32 i32) (result i32)
      (local i32 i32)
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            local.get 1
            local.get 0
            i32.xor
            i32.const 3
            i32.and
            i32.eqz
            br_if 0 (;@3;)
            local.get 1
            i32.load8_u
            local.set 2
            br 1 (;@2;)
          end
          block ;; label = @3
            local.get 1
            i32.const 3
            i32.and
            i32.eqz
            br_if 0 (;@3;)
            local.get 0
            local.get 1
            i32.load8_u
            local.tee 2
            i32.store8
            block ;; label = @4
              local.get 2
              br_if 0 (;@4;)
              local.get 0
              return
            end
            local.get 0
            i32.const 1
            i32.add
            local.set 3
            block ;; label = @4
              local.get 1
              i32.const 1
              i32.add
              local.tee 2
              i32.const 3
              i32.and
              br_if 0 (;@4;)
              local.get 3
              local.set 0
              local.get 2
              local.set 1
              br 1 (;@3;)
            end
            local.get 3
            local.get 2
            i32.load8_u
            local.tee 2
            i32.store8
            local.get 2
            i32.eqz
            br_if 2 (;@1;)
            local.get 0
            i32.const 2
            i32.add
            local.set 3
            block ;; label = @4
              local.get 1
              i32.const 2
              i32.add
              local.tee 2
              i32.const 3
              i32.and
              br_if 0 (;@4;)
              local.get 3
              local.set 0
              local.get 2
              local.set 1
              br 1 (;@3;)
            end
            local.get 3
            local.get 2
            i32.load8_u
            local.tee 2
            i32.store8
            local.get 2
            i32.eqz
            br_if 2 (;@1;)
            local.get 0
            i32.const 3
            i32.add
            local.set 3
            block ;; label = @4
              local.get 1
              i32.const 3
              i32.add
              local.tee 2
              i32.const 3
              i32.and
              br_if 0 (;@4;)
              local.get 3
              local.set 0
              local.get 2
              local.set 1
              br 1 (;@3;)
            end
            local.get 3
            local.get 2
            i32.load8_u
            local.tee 2
            i32.store8
            local.get 2
            i32.eqz
            br_if 2 (;@1;)
            local.get 0
            i32.const 4
            i32.add
            local.set 0
            local.get 1
            i32.const 4
            i32.add
            local.set 1
          end
          i32.const 16843008
          local.get 1
          i32.load
          local.tee 2
          i32.sub
          local.get 2
          i32.or
          i32.const -2139062144
          i32.and
          i32.const -2139062144
          i32.ne
          br_if 0 (;@2;)
          loop ;; label = @3
            local.get 0
            local.get 2
            i32.store
            local.get 0
            i32.const 4
            i32.add
            local.set 0
            i32.const 16843008
            local.get 1
            i32.const 4
            i32.add
            local.tee 1
            i32.load
            local.tee 2
            i32.sub
            local.get 2
            i32.or
            i32.const -2139062144
            i32.and
            i32.const -2139062144
            i32.eq
            br_if 0 (;@3;)
          end
        end
        local.get 0
        local.get 2
        i32.store8
        block ;; label = @2
          local.get 2
          i32.const 255
          i32.and
          br_if 0 (;@2;)
          local.get 0
          return
        end
        local.get 1
        i32.const 1
        i32.add
        local.set 2
        local.get 0
        local.set 3
        loop ;; label = @2
          local.get 3
          i32.const 1
          i32.add
          local.tee 3
          local.get 2
          i32.load8_u
          local.tee 0
          i32.store8
          local.get 2
          i32.const 1
          i32.add
          local.set 2
          local.get 0
          br_if 0 (;@2;)
        end
      end
      local.get 3
    )
    (func $strcpy (;165;) (type 4) (param i32 i32) (result i32)
      local.get 0
      local.get 1
      call $__stpcpy
      drop
      local.get 0
    )
    (func $strdup (;166;) (type 8) (param i32) (result i32)
      (local i32 i32)
      block ;; label = @1
        local.get 0
        call $strlen
        i32.const 1
        i32.add
        local.tee 1
        call $malloc
        local.tee 2
        i32.eqz
        br_if 0 (;@1;)
        local.get 1
        i32.eqz
        br_if 0 (;@1;)
        local.get 2
        local.get 0
        local.get 1
        memory.copy
      end
      local.get 2
    )
    (func $strlen (;167;) (type 8) (param i32) (result i32)
      (local i32 i32 i32)
      local.get 0
      local.set 1
      block ;; label = @1
        block ;; label = @2
          local.get 0
          i32.const 3
          i32.and
          i32.eqz
          br_if 0 (;@2;)
          block ;; label = @3
            local.get 0
            i32.load8_u
            br_if 0 (;@3;)
            local.get 0
            local.get 0
            i32.sub
            return
          end
          local.get 0
          i32.const 1
          i32.add
          local.tee 1
          i32.const 3
          i32.and
          i32.eqz
          br_if 0 (;@2;)
          local.get 1
          i32.load8_u
          i32.eqz
          br_if 1 (;@1;)
          local.get 0
          i32.const 2
          i32.add
          local.tee 1
          i32.const 3
          i32.and
          i32.eqz
          br_if 0 (;@2;)
          local.get 1
          i32.load8_u
          i32.eqz
          br_if 1 (;@1;)
          local.get 0
          i32.const 3
          i32.add
          local.tee 1
          i32.const 3
          i32.and
          i32.eqz
          br_if 0 (;@2;)
          local.get 1
          i32.load8_u
          i32.eqz
          br_if 1 (;@1;)
          local.get 0
          i32.const 4
          i32.add
          local.tee 1
          i32.const 3
          i32.and
          br_if 1 (;@1;)
        end
        local.get 1
        i32.const -4
        i32.add
        local.set 2
        local.get 1
        i32.const -5
        i32.add
        local.set 1
        loop ;; label = @2
          local.get 1
          i32.const 4
          i32.add
          local.set 1
          i32.const 16843008
          local.get 2
          i32.const 4
          i32.add
          local.tee 2
          i32.load
          local.tee 3
          i32.sub
          local.get 3
          i32.or
          i32.const -2139062144
          i32.and
          i32.const -2139062144
          i32.eq
          br_if 0 (;@2;)
        end
        loop ;; label = @2
          local.get 1
          i32.const 1
          i32.add
          local.set 1
          local.get 2
          i32.load8_u
          local.set 3
          local.get 2
          i32.const 1
          i32.add
          local.set 2
          local.get 3
          br_if 0 (;@2;)
        end
      end
      local.get 1
      local.get 0
      i32.sub
    )
    (func $strncmp (;168;) (type 3) (param i32 i32 i32) (result i32)
      (local i32 i32)
      block ;; label = @1
        local.get 2
        br_if 0 (;@1;)
        i32.const 0
        return
      end
      block ;; label = @1
        block ;; label = @2
          local.get 0
          i32.load8_u
          local.tee 3
          br_if 0 (;@2;)
          i32.const 0
          local.set 3
          br 1 (;@1;)
        end
        local.get 0
        i32.const 1
        i32.add
        local.set 0
        local.get 2
        i32.const -1
        i32.add
        local.set 2
        block ;; label = @2
          loop ;; label = @3
            local.get 3
            i32.const 255
            i32.and
            local.get 1
            i32.load8_u
            local.tee 4
            i32.ne
            br_if 1 (;@2;)
            local.get 4
            i32.eqz
            br_if 1 (;@2;)
            local.get 2
            i32.const 0
            i32.eq
            br_if 1 (;@2;)
            local.get 2
            i32.const -1
            i32.add
            local.set 2
            local.get 1
            i32.const 1
            i32.add
            local.set 1
            local.get 0
            i32.load8_u
            local.set 3
            local.get 0
            i32.const 1
            i32.add
            local.set 0
            local.get 3
            br_if 0 (;@3;)
          end
          i32.const 0
          local.set 3
        end
        local.get 3
        i32.const 255
        i32.and
        local.set 3
      end
      local.get 3
      local.get 1
      i32.load8_u
      i32.sub
    )
    (func $sbrk (;169;) (type 8) (param i32) (result i32)
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
    (func $malloc (;170;) (type 8) (param i32) (result i32)
      local.get 0
      call $dlmalloc
    )
    (func $dlmalloc (;171;) (type 8) (param i32) (result i32)
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
                                i32.const 1051720
                                i32.add
                                i32.load offset=24
                                local.tee 2
                                br_if 0 (;@13;)
                                block ;; label = @14
                                  global.get $GOT.data.internal.__memory_base
                                  i32.const 1052192
                                  i32.add
                                  i32.load
                                  local.tee 3
                                  br_if 0 (;@14;)
                                  global.get $GOT.data.internal.__memory_base
                                  local.tee 4
                                  i32.const 1052192
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
                                  i32.const 1051720
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
                                i32.const 1051720
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
                                i32.const 0
                                local.set 4
                                loop ;; label = @14
                                  global.get $GOT.data.internal.__memory_base
                                  i32.const 1051720
                                  i32.add
                                  local.get 4
                                  i32.add
                                  local.tee 5
                                  i32.const 60
                                  i32.add
                                  local.get 5
                                  i32.const 48
                                  i32.add
                                  local.tee 3
                                  i32.store
                                  local.get 3
                                  local.get 5
                                  i32.const 40
                                  i32.add
                                  local.tee 6
                                  i32.store
                                  local.get 5
                                  i32.const 52
                                  i32.add
                                  local.get 6
                                  i32.store
                                  local.get 5
                                  i32.const 68
                                  i32.add
                                  local.get 5
                                  i32.const 56
                                  i32.add
                                  local.tee 6
                                  i32.store
                                  local.get 6
                                  local.get 3
                                  i32.store
                                  local.get 5
                                  i32.const 76
                                  i32.add
                                  local.get 5
                                  i32.const 64
                                  i32.add
                                  local.tee 3
                                  i32.store
                                  local.get 3
                                  local.get 6
                                  i32.store
                                  local.get 5
                                  i32.const 72
                                  i32.add
                                  local.get 3
                                  i32.store
                                  local.get 4
                                  i32.const 32
                                  i32.add
                                  local.tee 4
                                  i32.const 256
                                  i32.ne
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
                                i32.const 1051720
                                i32.add
                                local.tee 5
                                local.get 4
                                i32.const 1052192
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
                                    i32.const 1051720
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
                                        i32.const 1051720
                                        i32.add
                                        local.get 5
                                        i32.const 1
                                        i32.and
                                        local.get 4
                                        i32.or
                                        i32.const 1
                                        i32.xor
                                        local.tee 3
                                        i32.const 3
                                        i32.shl
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
                                        i32.const 1051720
                                        i32.add
                                        local.get 7
                                        i32.const -2
                                        local.get 3
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
                                    i32.shl
                                    local.tee 3
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
                                  i32.const 1051720
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
                                        i32.const 1051720
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
                                        local.tee 4
                                        i32.const 3
                                        i32.shl
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
                                        i32.const 1051720
                                        i32.add
                                        local.get 7
                                        i32.const -2
                                        local.get 4
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
                                    i32.const 3
                                    i32.shl
                                    local.tee 4
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
                                      i32.const 1051720
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
                                          i32.const 1051720
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
                                    i32.const 1051720
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
                                  i32.const 1051720
                                  i32.add
                                  i32.load offset=4
                                  local.tee 10
                                  i32.eqz
                                  br_if 1 (;@13;)
                                  global.get $GOT.data.internal.__memory_base
                                  i32.const 1051720
                                  i32.add
                                  local.get 10
                                  i32.ctz
                                  i32.const 2
                                  i32.shl
                                  i32.add
                                  i32.load offset=304
                                  local.tee 0
                                  i32.load offset=4
                                  i32.const -8
                                  i32.and
                                  local.get 3
                                  i32.sub
                                  local.set 4
                                  local.get 0
                                  local.set 6
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
                                i32.const 1051720
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
                                        i32.const 1051720
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
                                      i32.const 1051720
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
                                i32.const 1051720
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
                                i32.const 1051720
                                i32.add
                                i32.load offset=8
                                local.tee 5
                                local.get 3
                                i32.lt_u
                                br_if 0 (;@13;)
                                global.get $GOT.data.internal.__memory_base
                                i32.const 1051720
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
                                  local.set 0
                                  i32.const 0
                                  local.set 6
                                end
                                global.get $GOT.data.internal.__memory_base
                                i32.const 1051720
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
                                i32.const 1051720
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
                                i32.const 1051720
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
                                  i32.const 1052192
                                  i32.add
                                  i32.load
                                  i32.eqz
                                  br_if 0 (;@14;)
                                  global.get $GOT.data.internal.__memory_base
                                  i32.const 1052192
                                  i32.add
                                  i32.load offset=8
                                  local.set 4
                                  br 1 (;@13;)
                                end
                                global.get $GOT.data.internal.__memory_base
                                local.tee 4
                                i32.const 1052192
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
                                i32.const 1051720
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
                                i32.const 1051720
                                i32.add
                                i32.load offset=440
                                local.tee 4
                                i32.eqz
                                br_if 0 (;@13;)
                                block ;; label = @14
                                  global.get $GOT.data.internal.__memory_base
                                  i32.const 1051720
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
                              i32.const 1051720
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
                                    i32.const 1051720
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
                                    i32.const 1052192
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
                                  i32.const 1051720
                                  i32.add
                                  i32.load offset=432
                                  local.set 4
                                  block ;; label = @15
                                    global.get $GOT.data.internal.__memory_base
                                    i32.const 1051720
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
                                  i32.const 1052192
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
                    i32.const 1051720
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
                i32.const 1051720
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
                  i32.const 1051720
                  i32.add
                  local.get 6
                  i32.store offset=436
                end
                block ;; label = @6
                  block ;; label = @7
                    block ;; label = @8
                      block ;; label = @9
                        global.get $GOT.data.internal.__memory_base
                        i32.const 1051720
                        i32.add
                        i32.load offset=24
                        local.tee 6
                        i32.eqz
                        br_if 0 (;@9;)
                        global.get $GOT.data.internal.__memory_base
                        i32.const 1051720
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
                          i32.const 1051720
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
                        i32.const 1051720
                        i32.add
                        local.get 7
                        i32.store offset=16
                      end
                      i32.const 0
                      local.set 6
                      global.get $GOT.data.internal.__memory_base
                      local.tee 0
                      i32.const 1051720
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
                      local.get 0
                      i32.const 1052192
                      i32.add
                      i32.load
                      i32.store offset=36
                      loop ;; label = @9
                        global.get $GOT.data.internal.__memory_base
                        i32.const 1051720
                        i32.add
                        local.get 6
                        i32.add
                        local.tee 4
                        i32.const 60
                        i32.add
                        local.get 4
                        i32.const 48
                        i32.add
                        local.tee 0
                        i32.store
                        local.get 0
                        local.get 4
                        i32.const 40
                        i32.add
                        local.tee 9
                        i32.store
                        local.get 4
                        i32.const 52
                        i32.add
                        local.get 9
                        i32.store
                        local.get 4
                        i32.const 68
                        i32.add
                        local.get 4
                        i32.const 56
                        i32.add
                        local.tee 9
                        i32.store
                        local.get 9
                        local.get 0
                        i32.store
                        local.get 4
                        i32.const 76
                        i32.add
                        local.get 4
                        i32.const 64
                        i32.add
                        local.tee 0
                        i32.store
                        local.get 0
                        local.get 9
                        i32.store
                        local.get 4
                        i32.const 72
                        i32.add
                        local.get 0
                        i32.store
                        local.get 6
                        i32.const 32
                        i32.add
                        local.tee 6
                        i32.const 256
                        i32.ne
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
                      i32.const 1051720
                      i32.add
                      local.tee 4
                      local.get 11
                      i32.const 1052192
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
                    i32.const 1051720
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
                    i32.const 1052192
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
                    i32.const 1051720
                    i32.add
                    i32.load offset=16
                    i32.ge_u
                    br_if 0 (;@7;)
                    global.get $GOT.data.internal.__memory_base
                    i32.const 1051720
                    i32.add
                    local.get 7
                    i32.store offset=16
                  end
                  local.get 7
                  local.get 11
                  i32.add
                  local.set 0
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1051720
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
                  i32.const 1051720
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
                  i32.const 1051720
                  i32.add
                  local.tee 4
                  local.get 10
                  i32.const 1052192
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
                  i32.const 16
                  i32.add
                  local.get 4
                  i32.const 456
                  i32.add
                  local.tee 2
                  i64.load align=4
                  i64.store align=4
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
                  local.get 2
                  local.get 9
                  i32.const 8
                  i32.add
                  i32.store
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
                      i32.const 1051720
                      i32.add
                      local.tee 0
                      local.get 7
                      i32.const -8
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
                          i32.const 1051720
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
                      i32.sub
                      i32.const 62
                      i32.add
                      local.set 4
                    end
                    local.get 6
                    local.get 4
                    i32.store offset=28
                    local.get 6
                    i64.const 0
                    i64.store offset=16 align=4
                    global.get $GOT.data.internal.__memory_base
                    i32.const 1051720
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
                          i32.const 1051720
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
                i32.const 1051720
                i32.add
                i32.load offset=12
                local.tee 4
                local.get 3
                i32.le_u
                br_if 0 (;@5;)
                global.get $GOT.data.internal.__memory_base
                i32.const 1051720
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
                i32.const 1051720
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
                i32.const 1051720
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
              i32.const 1051720
              i32.add
              local.tee 3
              local.get 4
              i32.const -8
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
                  i32.const 1051720
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
              i32.sub
              i32.const 62
              i32.add
              local.set 5
            end
            local.get 0
            local.get 5
            i32.store offset=28
            local.get 0
            i64.const 0
            i64.store offset=16 align=4
            global.get $GOT.data.internal.__memory_base
            i32.const 1051720
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
              i32.const 1051720
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
              i32.const 1051720
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
              i32.const 1051720
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
            i32.const 1051720
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
                i32.const 1051720
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
          i32.const 1051720
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
    (func $prepend_alloc (;172;) (type 3) (param i32 i32 i32) (result i32)
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
          i32.const 1051720
          i32.add
          i32.load offset=24
          i32.ne
          br_if 0 (;@2;)
          global.get $GOT.data.internal.__memory_base
          i32.const 1051720
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
          i32.const 1051720
          i32.add
          i32.load offset=20
          i32.ne
          br_if 0 (;@2;)
          global.get $GOT.data.internal.__memory_base
          i32.const 1051720
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
                i32.const 1051720
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
                i32.const 1051720
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
                i32.const 1051720
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
          i32.const 1051720
          i32.add
          local.tee 1
          local.get 0
          i32.const -8
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
              i32.const 1051720
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
          i32.sub
          i32.const 62
          i32.add
          local.set 2
        end
        local.get 5
        local.get 2
        i32.store offset=28
        local.get 5
        i64.const 0
        i64.store offset=16 align=4
        global.get $GOT.data.internal.__memory_base
        i32.const 1051720
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
          i32.const 1051720
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
    (func $free (;173;) (type 0) (param i32)
      local.get 0
      call $dlfree
    )
    (func $dlfree (;174;) (type 0) (param i32)
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
          i32.const 1051720
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
                  i32.const 1051720
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
                    i32.const 1051720
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
                i32.const 1051720
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
              i32.const 1051720
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
              i32.const 1051720
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
                    i32.const 1051720
                    i32.add
                    i32.load offset=24
                    i32.ne
                    br_if 0 (;@7;)
                    global.get $GOT.data.internal.__memory_base
                    i32.const 1051720
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
                    i32.const 1051720
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
                    i32.const 1051720
                    i32.add
                    i32.load offset=20
                    local.tee 6
                    i32.ne
                    br_if 0 (;@7;)
                    global.get $GOT.data.internal.__memory_base
                    i32.const 1051720
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
                      i32.const 1051720
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
                i32.const 1051720
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
                i32.const 1051720
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
          i32.const 1051720
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
          i32.const 1051720
          i32.add
          local.tee 4
          local.get 0
          i32.const -8
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
              i32.const 1051720
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
          i32.sub
          i32.const 62
          i32.add
          local.set 2
        end
        local.get 1
        local.get 2
        i32.store offset=28
        local.get 1
        i64.const 0
        i64.store offset=16 align=4
        global.get $GOT.data.internal.__memory_base
        i32.const 1051720
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
                i32.const 1051720
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
        i32.const 1051720
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
    (func $calloc (;175;) (type 4) (param i32 i32) (result i32)
      (local i32 i64)
      block ;; label = @1
        block ;; label = @2
          local.get 0
          br_if 0 (;@2;)
          i32.const 0
          local.set 2
          br 1 (;@1;)
        end
        local.get 0
        i64.extend_i32_u
        local.get 1
        i64.extend_i32_u
        i64.mul
        local.tee 3
        i32.wrap_i64
        local.set 2
        local.get 1
        local.get 0
        i32.or
        i32.const 65536
        i32.lt_u
        br_if 0 (;@1;)
        i32.const -1
        local.get 2
        local.get 3
        i64.const 32
        i64.shr_u
        i32.wrap_i64
        i32.const 0
        i32.ne
        select
        local.set 2
      end
      block ;; label = @1
        local.get 2
        call $dlmalloc
        local.tee 0
        i32.eqz
        br_if 0 (;@1;)
        local.get 0
        i32.const -4
        i32.add
        i32.load8_u
        i32.const 3
        i32.and
        i32.eqz
        br_if 0 (;@1;)
        local.get 2
        i32.eqz
        br_if 0 (;@1;)
        local.get 0
        i32.const 0
        local.get 2
        memory.fill
      end
      local.get 0
    )
    (func $realloc (;176;) (type 4) (param i32 i32) (result i32)
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
            i32.const 1052192
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
            i32.const 1051720
            i32.add
            i32.load offset=24
            i32.ne
            br_if 0 (;@3;)
            global.get $GOT.data.internal.__memory_base
            i32.const 1051720
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
            i32.const 1051720
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
            i32.const 1051720
            i32.add
            i32.load offset=20
            i32.ne
            br_if 0 (;@3;)
            global.get $GOT.data.internal.__memory_base
            i32.const 1051720
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
              local.set 1
              i32.const 0
              local.set 2
            end
            global.get $GOT.data.internal.__memory_base
            i32.const 1051720
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
                i32.const 1051720
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
                i32.const 1051720
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
                i32.const 1051720
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
    (func $dispose_chunk (;177;) (type 1) (param i32 i32)
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
                  i32.const 1051720
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
                    i32.const 1051720
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
                i32.const 1051720
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
              i32.const 1051720
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
              i32.const 1051720
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
                    i32.const 1051720
                    i32.add
                    i32.load offset=24
                    i32.ne
                    br_if 0 (;@7;)
                    global.get $GOT.data.internal.__memory_base
                    i32.const 1051720
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
                    i32.const 1051720
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
                    i32.const 1051720
                    i32.add
                    i32.load offset=20
                    local.tee 6
                    i32.ne
                    br_if 0 (;@7;)
                    global.get $GOT.data.internal.__memory_base
                    i32.const 1051720
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
                      i32.const 1051720
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
                i32.const 1051720
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
                i32.const 1051720
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
          i32.const 1051720
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
          i32.const 1051720
          i32.add
          local.tee 4
          local.get 1
          i32.const -8
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
              i32.const 1051720
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
          i32.sub
          i32.const 62
          i32.add
          local.set 3
        end
        local.get 0
        local.get 3
        i32.store offset=28
        local.get 0
        i64.const 0
        i64.store offset=16 align=4
        global.get $GOT.data.internal.__memory_base
        i32.const 1051720
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
          i32.const 1051720
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
    (func $posix_memalign (;178;) (type 3) (param i32 i32 i32) (result i32)
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
          i32.const 4
          i32.lt_u
          br_if 1 (;@1;)
          local.get 1
          i32.const 3
          i32.and
          br_if 1 (;@1;)
          local.get 1
          i32.const 2
          i32.shr_u
          local.tee 4
          local.get 4
          i32.const -1
          i32.add
          i32.and
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
    (func $internal_memalign (;179;) (type 4) (param i32 i32) (result i32)
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
    (func $__component_type_object_force_link_wasip2 (;180;) (type 10))
    (func $_RINvNtCs2GenDSTXHQd_4core3ptr13drop_in_placeNtNtCsblnovvQk4nh_5alloc6string6StringEBK_ (;181;) (type 0) (param i32)
      (local i32)
      block ;; label = @1
        local.get 0
        i32.load
        local.tee 1
        i32.eqz
        br_if 0 (;@1;)
        local.get 0
        i32.load offset=4
        local.get 1
        i32.const 1
        call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
      end
    )
    (func $_RINvNvMs2_NtCsblnovvQk4nh_5alloc7raw_vecINtB8_11RawVecInnerpE7reserve21do_reserve_and_handleNtNtBa_5alloc6GlobalEBa_ (;182;) (type 11) (param i32 i32 i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 3
      global.set $__stack_pointer
      block ;; label = @1
        local.get 2
        local.get 1
        i32.add
        local.tee 1
        local.get 2
        i32.ge_u
        br_if 0 (;@1;)
        i32.const 0
        i32.const 0
        call $_RNvNtCsblnovvQk4nh_5alloc7raw_vec12handle_error
        unreachable
      end
      local.get 3
      i32.const 4
      i32.add
      local.get 0
      i32.load
      local.tee 2
      local.get 0
      i32.load offset=4
      local.get 1
      local.get 2
      i32.const 1
      i32.shl
      local.tee 2
      local.get 1
      local.get 2
      i32.gt_u
      select
      local.tee 2
      i32.const 8
      local.get 2
      i32.const 8
      i32.gt_u
      select
      local.tee 2
      call $_RNvMs4_NtCsblnovvQk4nh_5alloc7raw_vecNtB5_11RawVecInner11finish_growB7_
      block ;; label = @1
        local.get 3
        i32.load offset=4
        i32.const 1
        i32.ne
        br_if 0 (;@1;)
        local.get 3
        i32.load offset=8
        local.get 3
        i32.load offset=12
        call $_RNvNtCsblnovvQk4nh_5alloc7raw_vec12handle_error
        unreachable
      end
      local.get 3
      i32.load offset=8
      local.set 1
      local.get 0
      local.get 2
      i32.store
      local.get 0
      local.get 1
      i32.store offset=4
      local.get 3
      i32.const 16
      i32.add
      global.set $__stack_pointer
    )
    (func $_RNvNtCsblnovvQk4nh_5alloc7raw_vec12handle_error (;183;) (type 1) (param i32 i32)
      block ;; label = @1
        local.get 0
        i32.eqz
        br_if 0 (;@1;)
        local.get 0
        local.get 1
        call $_RNvNtCsblnovvQk4nh_5alloc5alloc18handle_alloc_error
        unreachable
      end
      call $_RNvNtCsblnovvQk4nh_5alloc7raw_vec17capacity_overflow
      unreachable
    )
    (func $_RNvMs4_NtCsblnovvQk4nh_5alloc7raw_vecNtB5_11RawVecInner11finish_growB7_ (;184;) (type 2) (param i32 i32 i32 i32)
      block ;; label = @1
        block ;; label = @2
          local.get 3
          i32.const 0
          i32.ge_s
          br_if 0 (;@2;)
          i32.const 1
          local.set 1
          i32.const 4
          local.set 2
          i32.const 0
          local.set 3
          br 1 (;@1;)
        end
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                local.get 1
                i32.eqz
                br_if 0 (;@5;)
                local.get 2
                local.get 1
                i32.const 1
                local.get 3
                call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_realloc
                local.set 1
                br 1 (;@4;)
              end
              block ;; label = @5
                local.get 3
                br_if 0 (;@5;)
                i32.const 1
                local.set 1
                br 2 (;@3;)
              end
              call $_RNvCsgrkdPkmfNkI_7___rustc35___rust_no_alloc_shim_is_unstable_v2
              local.get 3
              i32.const 1
              call $_RNvCsgrkdPkmfNkI_7___rustc12___rust_alloc
              local.set 1
            end
            local.get 1
            br_if 0 (;@3;)
            i32.const 1
            local.set 1
            local.get 0
            i32.const 1
            i32.store offset=4
            br 1 (;@2;)
          end
          local.get 0
          local.get 1
          i32.store offset=4
          i32.const 0
          local.set 1
        end
        i32.const 8
        local.set 2
      end
      local.get 0
      local.get 2
      i32.add
      local.get 3
      i32.store
      local.get 0
      local.get 1
      i32.store
    )
    (func $_RNvNtCsblnovvQk4nh_5alloc5alloc18handle_alloc_error (;185;) (type 1) (param i32 i32)
      local.get 1
      local.get 0
      call $_RNvCsgrkdPkmfNkI_7___rustc26___rust_alloc_error_handler
      unreachable
    )
    (func $_RNvMs_NtNtCsblnovvQk4nh_5alloc3ffi5c_strNtB4_7CString19__from_vec_unchecked (;186;) (type 1) (param i32 i32)
      (local i32 i32 i32 i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 2
      global.set $__stack_pointer
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            local.get 1
            i32.load
            local.tee 3
            local.get 1
            i32.load offset=8
            local.tee 4
            i32.ne
            br_if 0 (;@3;)
            local.get 2
            i32.const 4
            i32.add
            local.get 4
            local.get 1
            i32.load offset=4
            local.get 4
            i32.const 1
            i32.add
            local.tee 3
            call $_RNvMs4_NtCsblnovvQk4nh_5alloc7raw_vecNtB5_11RawVecInner11finish_growB7_
            local.get 2
            i32.load offset=4
            i32.const 1
            i32.eq
            br_if 1 (;@2;)
            local.get 1
            local.get 2
            i32.load offset=8
            i32.store offset=4
          end
          local.get 1
          i32.load offset=4
          local.tee 5
          local.get 4
          i32.add
          i32.const 0
          i32.store8
          block ;; label = @3
            block ;; label = @4
              local.get 3
              local.get 4
              i32.const 1
              i32.add
              local.tee 1
              i32.gt_u
              br_if 0 (;@4;)
              local.get 5
              local.set 4
              br 1 (;@3;)
            end
            block ;; label = @4
              local.get 1
              br_if 0 (;@4;)
              i32.const 1
              local.set 4
              local.get 5
              local.get 3
              i32.const 1
              call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_dealloc
              br 1 (;@3;)
            end
            local.get 5
            local.get 3
            i32.const 1
            local.get 1
            call $_RNvCsgrkdPkmfNkI_7___rustc14___rust_realloc
            local.tee 4
            i32.eqz
            br_if 2 (;@1;)
          end
          local.get 0
          local.get 1
          i32.store offset=4
          local.get 0
          local.get 4
          i32.store
          local.get 2
          i32.const 16
          i32.add
          global.set $__stack_pointer
          return
        end
        local.get 2
        i32.load offset=8
        local.get 2
        i32.load offset=12
        call $_RNvNtCsblnovvQk4nh_5alloc7raw_vec12handle_error
        unreachable
      end
      i32.const 1
      local.get 1
      call $_RNvNtCsblnovvQk4nh_5alloc7raw_vec12handle_error
      unreachable
    )
    (func $_RNvNtCsblnovvQk4nh_5alloc7raw_vec17capacity_overflow (;187;) (type 10)
      (local i32)
      global.get $GOT.data.internal.__memory_base
      local.tee 0
      i32.const 1050459
      i32.add
      i32.const 35
      local.get 0
      i32.const 1051532
      i32.add
      call $_RNvNtCs2GenDSTXHQd_4core9panicking9panic_fmt
      unreachable
    )
    (func $_RNvNvNtCsblnovvQk4nh_5alloc3fmt6format12format_inner (;188;) (type 11) (param i32 i32 i32)
      (local i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 3
      global.set $__stack_pointer
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                block ;; label = @6
                  block ;; label = @7
                    local.get 2
                    i32.const 1
                    i32.and
                    i32.eqz
                    br_if 0 (;@7;)
                    local.get 2
                    i32.const 1
                    i32.shr_u
                    local.set 4
                    br 1 (;@6;)
                  end
                  local.get 1
                  i32.load8_u
                  local.tee 4
                  i32.eqz
                  br_if 1 (;@5;)
                  i32.const 0
                  local.set 5
                  local.get 1
                  local.set 6
                  i32.const 0
                  local.set 7
                  loop ;; label = @7
                    local.get 6
                    i32.const 1
                    i32.add
                    local.set 6
                    block ;; label = @8
                      block ;; label = @9
                        local.get 4
                        i32.extend8_s
                        i32.const -1
                        i32.gt_s
                        br_if 0 (;@9;)
                        block ;; label = @10
                          local.get 4
                          i32.const 255
                          i32.and
                          i32.const 128
                          i32.ne
                          br_if 0 (;@10;)
                          local.get 5
                          local.get 6
                          i32.load16_u align=1
                          local.tee 4
                          i32.add
                          local.set 5
                          local.get 6
                          local.get 4
                          i32.add
                          i32.const 2
                          i32.add
                          local.set 6
                          br 2 (;@8;)
                        end
                        local.get 6
                        local.get 4
                        i32.const 3
                        i32.and
                        i32.const 8
                        i32.rotr
                        local.tee 8
                        i32.const 5
                        i32.shl
                        i32.const 1073741824
                        i32.and
                        local.get 8
                        i32.const 7
                        i32.shl
                        i32.or
                        i32.const 29
                        i32.shr_u
                        i32.add
                        local.get 4
                        i32.const 1
                        i32.shr_u
                        i32.const 2
                        i32.and
                        i32.add
                        local.get 4
                        i32.const 2
                        i32.shr_u
                        i32.const 2
                        i32.and
                        i32.add
                        local.set 6
                        local.get 5
                        i32.eqz
                        local.get 7
                        i32.or
                        local.set 7
                        br 1 (;@8;)
                      end
                      local.get 6
                      local.get 4
                      i32.const 255
                      i32.and
                      local.tee 4
                      i32.add
                      local.set 6
                      local.get 5
                      local.get 4
                      i32.add
                      local.set 5
                    end
                    local.get 6
                    i32.load8_u
                    local.tee 4
                    br_if 0 (;@7;)
                  end
                  i32.const 0
                  local.set 4
                  local.get 7
                  local.get 5
                  i32.const 16
                  i32.lt_u
                  i32.and
                  br_if 0 (;@6;)
                  i32.const 0
                  local.set 7
                  local.get 5
                  i32.const 1
                  i32.shl
                  local.tee 4
                  i32.const 0
                  i32.lt_s
                  br_if 4 (;@2;)
                end
                local.get 4
                br_if 1 (;@4;)
              end
              i32.const 1
              local.set 6
              i32.const 0
              local.set 4
              br 1 (;@3;)
            end
            call $_RNvCsgrkdPkmfNkI_7___rustc35___rust_no_alloc_shim_is_unstable_v2
            i32.const 1
            local.set 7
            local.get 4
            i32.const 1
            call $_RNvCsgrkdPkmfNkI_7___rustc12___rust_alloc
            local.tee 6
            i32.eqz
            br_if 1 (;@2;)
          end
          local.get 3
          i32.const 0
          i32.store offset=8
          local.get 3
          local.get 6
          i32.store offset=4
          local.get 3
          local.get 4
          i32.store
          local.get 3
          global.get $GOT.data.internal.__memory_base
          i32.const 1051548
          i32.add
          local.get 1
          local.get 2
          call $_RNvNtCs2GenDSTXHQd_4core3fmt5write
          i32.eqz
          br_if 1 (;@1;)
          global.get $GOT.data.internal.__memory_base
          local.tee 4
          i32.const 1050476
          i32.add
          i32.const 86
          local.get 3
          i32.const 15
          i32.add
          local.get 4
          i32.const 1051572
          i32.add
          local.get 4
          i32.const 1051588
          i32.add
          call $_RNvNtCs2GenDSTXHQd_4core6result13unwrap_failed
          unreachable
        end
        local.get 7
        local.get 4
        call $_RNvNtCsblnovvQk4nh_5alloc7raw_vec12handle_error
        unreachable
      end
      local.get 0
      local.get 3
      i32.load offset=8
      i32.store offset=8
      local.get 0
      local.get 3
      i64.load align=4
      i64.store align=4
      local.get 3
      i32.const 16
      i32.add
      global.set $__stack_pointer
    )
    (func $_RNvXsK_NtCs2GenDSTXHQd_4core3fmtNtB5_5ErrorNtB5_5Debug3fmt (;189;) (type 4) (param i32 i32) (result i32)
      local.get 1
      global.get $GOT.data.internal.__memory_base
      i32.const 1050562
      i32.add
      i32.const 5
      call $_RNvMsa_NtCs2GenDSTXHQd_4core3fmtNtB5_9Formatter9write_str
    )
    (func $"#func190 _RNvXsZ_NtCsblnovvQk4nh_5alloc6stringNtB5_6StringNtNtCs2GenDSTXHQd_4core3fmt5Write10write_char" (@name "_RNvXsZ_NtCsblnovvQk4nh_5alloc6stringNtB5_6StringNtNtCs2GenDSTXHQd_4core3fmt5Write10write_char") (;190;) (type 4) (param i32 i32) (result i32)
      (local i32 i32 i32 i32 i32 i32)
      local.get 0
      i32.load offset=8
      local.set 2
      block ;; label = @1
        block ;; label = @2
          local.get 1
          i32.const 128
          i32.ge_u
          br_if 0 (;@2;)
          i32.const 1
          local.set 3
          br 1 (;@1;)
        end
        block ;; label = @2
          local.get 1
          i32.const 2048
          i32.ge_u
          br_if 0 (;@2;)
          i32.const 2
          local.set 3
          br 1 (;@1;)
        end
        i32.const 3
        i32.const 4
        local.get 1
        i32.const 65536
        i32.lt_u
        select
        local.set 3
      end
      local.get 2
      local.set 4
      block ;; label = @1
        local.get 3
        local.get 0
        i32.load
        local.get 2
        i32.sub
        i32.le_u
        br_if 0 (;@1;)
        local.get 0
        local.get 2
        local.get 3
        call $_RINvNvMs2_NtCsblnovvQk4nh_5alloc7raw_vecINtB8_11RawVecInnerpE7reserve21do_reserve_and_handleNtNtBa_5alloc6GlobalEBa_
        local.get 0
        i32.load offset=8
        local.set 4
      end
      local.get 0
      i32.load offset=4
      local.get 4
      i32.add
      local.set 4
      block ;; label = @1
        block ;; label = @2
          local.get 1
          i32.const 128
          i32.lt_u
          br_if 0 (;@2;)
          local.get 1
          i32.const 63
          i32.and
          i32.const -128
          i32.or
          local.set 5
          local.get 1
          i32.const 6
          i32.shr_u
          local.set 6
          block ;; label = @3
            local.get 1
            i32.const 2048
            i32.ge_u
            br_if 0 (;@3;)
            local.get 4
            local.get 5
            i32.store8 offset=1
            local.get 4
            local.get 6
            i32.const 192
            i32.or
            i32.store8
            br 2 (;@1;)
          end
          local.get 1
          i32.const 12
          i32.shr_u
          local.set 7
          local.get 6
          i32.const 63
          i32.and
          i32.const -128
          i32.or
          local.set 6
          block ;; label = @3
            local.get 1
            i32.const 65535
            i32.gt_u
            br_if 0 (;@3;)
            local.get 4
            local.get 5
            i32.store8 offset=2
            local.get 4
            local.get 6
            i32.store8 offset=1
            local.get 4
            local.get 7
            i32.const 224
            i32.or
            i32.store8
            br 2 (;@1;)
          end
          local.get 4
          local.get 5
          i32.store8 offset=3
          local.get 4
          local.get 6
          i32.store8 offset=2
          local.get 4
          local.get 7
          i32.const 63
          i32.and
          i32.const -128
          i32.or
          i32.store8 offset=1
          local.get 4
          local.get 1
          i32.const 18
          i32.shr_u
          i32.const -16
          i32.or
          i32.store8
          br 1 (;@1;)
        end
        local.get 4
        local.get 1
        i32.store8
      end
      local.get 0
      local.get 3
      local.get 2
      i32.add
      i32.store offset=8
      i32.const 0
    )
    (func $"#func191 _RNvXsZ_NtCsblnovvQk4nh_5alloc6stringNtB5_6StringNtNtCs2GenDSTXHQd_4core3fmt5Write9write_str" (@name "_RNvXsZ_NtCsblnovvQk4nh_5alloc6stringNtB5_6StringNtNtCs2GenDSTXHQd_4core3fmt5Write9write_str") (;191;) (type 3) (param i32 i32 i32) (result i32)
      (local i32)
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            local.get 2
            local.get 0
            i32.load
            local.get 0
            i32.load offset=8
            local.tee 3
            i32.sub
            i32.le_u
            br_if 0 (;@3;)
            local.get 0
            local.get 3
            local.get 2
            call $_RINvNvMs2_NtCsblnovvQk4nh_5alloc7raw_vecINtB8_11RawVecInnerpE7reserve21do_reserve_and_handleNtNtBa_5alloc6GlobalEBa_
            local.get 0
            i32.load offset=8
            local.set 3
            br 1 (;@2;)
          end
          local.get 2
          i32.eqz
          br_if 1 (;@1;)
        end
        local.get 2
        i32.eqz
        br_if 0 (;@1;)
        local.get 0
        i32.load offset=4
        local.get 3
        i32.add
        local.get 1
        local.get 2
        memory.copy
      end
      local.get 0
      local.get 3
      local.get 2
      i32.add
      i32.store offset=8
      i32.const 0
    )
    (func $_RNvXs_NvMs_NtNtCsblnovvQk4nh_5alloc3ffi5c_strNtB9_7CString3newRShNtB4_11SpecNewImpl13spec_new_impl (;192;) (type 11) (param i32 i32 i32)
      (local i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      i32.const 32
      i32.sub
      local.tee 3
      global.set $__stack_pointer
      i32.const 0
      local.set 4
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            local.get 2
            i32.const 1
            i32.add
            local.tee 5
            i32.const 0
            i32.lt_s
            br_if 0 (;@3;)
            call $_RNvCsgrkdPkmfNkI_7___rustc35___rust_no_alloc_shim_is_unstable_v2
            i32.const 1
            local.set 4
            local.get 5
            i32.const 1
            call $_RNvCsgrkdPkmfNkI_7___rustc12___rust_alloc
            local.tee 6
            i32.eqz
            br_if 0 (;@3;)
            block ;; label = @4
              local.get 2
              br_if 0 (;@4;)
              i32.const 0
              local.set 7
              i32.const 0
              local.set 4
              br 3 (;@1;)
            end
            block ;; label = @4
              local.get 2
              i32.eqz
              br_if 0 (;@4;)
              local.get 6
              local.get 1
              local.get 2
              memory.copy
            end
            block ;; label = @4
              local.get 2
              i32.const 8
              i32.lt_u
              br_if 0 (;@4;)
              local.get 3
              i32.const 8
              i32.add
              i32.const 0
              local.get 1
              local.get 2
              call $_RNvNtNtCs2GenDSTXHQd_4core5slice6memchr14memchr_aligned
              local.get 3
              i32.load offset=12
              local.set 7
              local.get 3
              i32.load offset=8
              local.set 4
              br 3 (;@1;)
            end
            block ;; label = @4
              local.get 1
              i32.load8_u
              br_if 0 (;@4;)
              i32.const 1
              local.set 4
              i32.const 0
              local.set 7
              br 3 (;@1;)
            end
            i32.const 1
            local.set 4
            local.get 2
            i32.const 1
            i32.eq
            br_if 1 (;@2;)
            block ;; label = @4
              local.get 1
              i32.load8_u offset=1
              br_if 0 (;@4;)
              i32.const 1
              local.set 7
              br 3 (;@1;)
            end
            i32.const 2
            local.set 7
            local.get 2
            i32.const 2
            i32.eq
            br_if 1 (;@2;)
            local.get 1
            i32.load8_u offset=2
            i32.eqz
            br_if 2 (;@1;)
            i32.const 3
            local.set 7
            local.get 2
            i32.const 3
            i32.eq
            br_if 1 (;@2;)
            local.get 1
            i32.load8_u offset=3
            i32.eqz
            br_if 2 (;@1;)
            i32.const 4
            local.set 7
            local.get 2
            i32.const 4
            i32.eq
            br_if 1 (;@2;)
            local.get 1
            i32.load8_u offset=4
            i32.eqz
            br_if 2 (;@1;)
            i32.const 5
            local.set 7
            local.get 2
            i32.const 5
            i32.eq
            br_if 1 (;@2;)
            local.get 1
            i32.load8_u offset=5
            i32.eqz
            br_if 2 (;@1;)
            local.get 2
            local.set 7
            i32.const 0
            local.set 4
            local.get 2
            i32.const 6
            i32.eq
            br_if 2 (;@1;)
            local.get 2
            i32.const 6
            local.get 1
            i32.load8_u offset=6
            local.tee 4
            select
            local.set 7
            local.get 4
            i32.eqz
            local.set 4
            br 2 (;@1;)
          end
          local.get 4
          local.get 5
          call $_RNvNtCsblnovvQk4nh_5alloc7raw_vec12handle_error
          unreachable
        end
        local.get 2
        local.set 7
        i32.const 0
        local.set 4
      end
      block ;; label = @1
        block ;; label = @2
          local.get 4
          i32.const 1
          i32.ne
          br_if 0 (;@2;)
          local.get 0
          local.get 2
          i32.store offset=8
          local.get 0
          local.get 6
          i32.store offset=4
          local.get 0
          local.get 5
          i32.store
          local.get 0
          local.get 7
          i32.store offset=12
          br 1 (;@1;)
        end
        local.get 3
        local.get 2
        i32.store offset=28
        local.get 3
        local.get 6
        i32.store offset=24
        local.get 3
        local.get 5
        i32.store offset=20
        local.get 3
        local.get 3
        i32.const 20
        i32.add
        call $_RNvMs_NtNtCsblnovvQk4nh_5alloc3ffi5c_strNtB4_7CString19__from_vec_unchecked
        local.get 0
        local.get 3
        i64.load
        i64.store offset=4 align=4
        local.get 0
        i32.const -2147483648
        i32.store
      end
      local.get 3
      i32.const 32
      i32.add
      global.set $__stack_pointer
    )
    (func $_RNvYNtNtCsblnovvQk4nh_5alloc6string6StringNtNtCs2GenDSTXHQd_4core3fmt5Write9write_fmtB6_ (;193;) (type 3) (param i32 i32 i32) (result i32)
      local.get 0
      global.get $GOT.data.internal.__memory_base
      i32.const 1051548
      i32.add
      local.get 1
      local.get 2
      call $_RNvNtCs2GenDSTXHQd_4core3fmt5write
    )
    (func $_RNvNtCs2GenDSTXHQd_4core9panicking19assert_failed_inner (;194;) (type 7) (param i32 i32 i32 i32 i32 i32 i32 i32)
      (local i32 i64)
      global.get $__stack_pointer
      i32.const 64
      i32.sub
      local.tee 8
      global.set $__stack_pointer
      local.get 8
      local.get 2
      i32.store offset=4
      local.get 8
      local.get 1
      i32.store
      local.get 8
      local.get 4
      i32.store offset=12
      local.get 8
      local.get 3
      i32.store offset=8
      local.get 8
      global.get $GOT.data.internal.__memory_base
      local.tee 2
      i32.const 1050808
      i32.add
      local.get 0
      i32.const 255
      i32.and
      i32.const 2
      i32.shl
      local.tee 1
      i32.add
      i32.load
      i32.store offset=20
      local.get 8
      local.get 2
      i32.const 1051604
      i32.add
      local.get 1
      i32.add
      i32.load
      i32.store offset=16
      block ;; label = @1
        local.get 5
        i32.eqz
        br_if 0 (;@1;)
        local.get 8
        local.get 6
        i32.store offset=28
        local.get 8
        local.get 5
        i32.store offset=24
        local.get 8
        global.get $GOT.func.internal._RNvXs8_NtCs2GenDSTXHQd_4core3fmtNtB5_9ArgumentsNtB5_7Display3fmt
        i64.extend_i32_u
        i64.const 32
        i64.shl
        local.get 8
        i32.const 24
        i32.add
        i64.extend_i32_u
        i64.or
        i64.store offset=40
        local.get 8
        global.get $GOT.data.internal.__table_base
        local.tee 5
        i32.const 64
        i32.add
        i64.extend_i32_u
        i64.const 32
        i64.shl
        local.tee 9
        local.get 8
        i32.const 8
        i32.add
        i64.extend_i32_u
        i64.or
        i64.store offset=56
        local.get 8
        local.get 9
        local.get 8
        i64.extend_i32_u
        i64.or
        i64.store offset=48
        local.get 8
        local.get 5
        i32.const 65
        i32.add
        i64.extend_i32_u
        i64.const 32
        i64.shl
        local.get 8
        i32.const 16
        i32.add
        i64.extend_i32_u
        i64.or
        i64.store offset=32
        global.get $GOT.data.internal.__memory_base
        i32.const 1048805
        i32.add
        local.get 8
        i32.const 32
        i32.add
        local.get 7
        call $_RNvNtCs2GenDSTXHQd_4core9panicking9panic_fmt
        unreachable
      end
      local.get 8
      global.get $GOT.data.internal.__table_base
      local.tee 5
      i32.const 64
      i32.add
      i64.extend_i32_u
      i64.const 32
      i64.shl
      local.tee 9
      local.get 8
      i32.const 8
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=48
      local.get 8
      local.get 9
      local.get 8
      i64.extend_i32_u
      i64.or
      i64.store offset=40
      local.get 8
      local.get 5
      i32.const 65
      i32.add
      i64.extend_i32_u
      i64.const 32
      i64.shl
      local.get 8
      i32.const 16
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=32
      global.get $GOT.data.internal.__memory_base
      i32.const 1048750
      i32.add
      local.get 8
      i32.const 32
      i32.add
      local.get 7
      call $_RNvNtCs2GenDSTXHQd_4core9panicking9panic_fmt
      unreachable
    )
    (func $_RNvNtNtCs2GenDSTXHQd_4core5slice5index16slice_index_fail (;195;) (type 2) (param i32 i32 i32 i32)
      (local i32 i64)
      global.get $__stack_pointer
      i32.const 32
      i32.sub
      local.tee 4
      global.set $__stack_pointer
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            local.get 0
            local.get 2
            i32.gt_u
            br_if 0 (;@3;)
            local.get 1
            local.get 2
            i32.gt_u
            br_if 1 (;@2;)
            global.get $GOT.func.internal._RNvXs8_NtNtNtCs2GenDSTXHQd_4core3fmt3num3impmNtB9_7Display3fmt
            i64.extend_i32_u
            i64.const 32
            i64.shl
            local.set 5
            local.get 0
            local.get 1
            i32.le_u
            br_if 2 (;@1;)
            local.get 4
            local.get 0
            i32.store offset=8
            local.get 4
            local.get 1
            i32.store offset=12
            local.get 4
            local.get 5
            local.get 4
            i32.const 12
            i32.add
            i64.extend_i32_u
            i64.or
            i64.store offset=24
            local.get 4
            local.get 5
            local.get 4
            i32.const 8
            i32.add
            i64.extend_i32_u
            i64.or
            i64.store offset=16
            global.get $GOT.data.internal.__memory_base
            i32.const 1048598
            i32.add
            local.get 4
            i32.const 16
            i32.add
            local.get 3
            call $_RNvNtCs2GenDSTXHQd_4core9panicking9panic_fmt
            unreachable
          end
          local.get 4
          local.get 0
          i32.store offset=8
          local.get 4
          local.get 2
          i32.store offset=12
          local.get 4
          global.get $GOT.func.internal._RNvXs8_NtNtNtCs2GenDSTXHQd_4core3fmt3num3impmNtB9_7Display3fmt
          i64.extend_i32_u
          i64.const 32
          i64.shl
          local.tee 5
          local.get 4
          i32.const 12
          i32.add
          i64.extend_i32_u
          i64.or
          i64.store offset=24
          local.get 4
          local.get 5
          local.get 4
          i32.const 8
          i32.add
          i64.extend_i32_u
          i64.or
          i64.store offset=16
          global.get $GOT.data.internal.__memory_base
          i32.const 1048638
          i32.add
          local.get 4
          i32.const 16
          i32.add
          local.get 3
          call $_RNvNtCs2GenDSTXHQd_4core9panicking9panic_fmt
          unreachable
        end
        local.get 4
        local.get 1
        i32.store offset=8
        local.get 4
        local.get 2
        i32.store offset=12
        local.get 4
        global.get $GOT.func.internal._RNvXs8_NtNtNtCs2GenDSTXHQd_4core3fmt3num3impmNtB9_7Display3fmt
        i64.extend_i32_u
        i64.const 32
        i64.shl
        local.tee 5
        local.get 4
        i32.const 12
        i32.add
        i64.extend_i32_u
        i64.or
        i64.store offset=24
        local.get 4
        local.get 5
        local.get 4
        i32.const 8
        i32.add
        i64.extend_i32_u
        i64.or
        i64.store offset=16
        global.get $GOT.data.internal.__memory_base
        i32.const 1048695
        i32.add
        local.get 4
        i32.const 16
        i32.add
        local.get 3
        call $_RNvNtCs2GenDSTXHQd_4core9panicking9panic_fmt
        unreachable
      end
      local.get 4
      local.get 1
      i32.store offset=8
      local.get 4
      local.get 2
      i32.store offset=12
      local.get 4
      local.get 5
      local.get 4
      i32.const 12
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=24
      local.get 4
      local.get 5
      local.get 4
      i32.const 8
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=16
      global.get $GOT.data.internal.__memory_base
      i32.const 1048695
      i32.add
      local.get 4
      i32.const 16
      i32.add
      local.get 3
      call $_RNvNtCs2GenDSTXHQd_4core9panicking9panic_fmt
      unreachable
    )
    (func $_RNvNtCs2GenDSTXHQd_4core9panicking9panic_fmt (;196;) (type 11) (param i32 i32 i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 32
      i32.sub
      local.tee 3
      global.set $__stack_pointer
      local.get 3
      local.get 1
      i32.store offset=16
      local.get 3
      local.get 0
      i32.store offset=12
      local.get 3
      i32.const 1
      i32.store16 offset=28
      local.get 3
      local.get 2
      i32.store offset=24
      local.get 3
      local.get 3
      i32.const 12
      i32.add
      i32.store offset=20
      local.get 3
      i32.const 20
      i32.add
      call $_RNvCsgrkdPkmfNkI_7___rustc17rust_begin_unwind
      unreachable
    )
    (func $_RNvXsd_NtNtNtCs2GenDSTXHQd_4core3fmt3num3impyNtB9_7Display3fmt (;197;) (type 4) (param i32 i32) (result i32)
      (local i32 i32 i64 i64 i32 i64 i32 i32)
      global.get $__stack_pointer
      i32.const 32
      i32.sub
      local.tee 2
      global.set $__stack_pointer
      i32.const 20
      local.set 3
      local.get 0
      i64.load
      local.tee 4
      local.set 5
      block ;; label = @1
        local.get 4
        i64.const 1000
        i64.lt_u
        br_if 0 (;@1;)
        i32.const 20
        local.set 3
        local.get 4
        local.set 5
        loop ;; label = @2
          local.get 2
          i32.const 12
          i32.add
          local.get 3
          i32.add
          local.tee 0
          i32.const -4
          i32.add
          global.get $GOT.data.internal.__memory_base
          i32.const 1050594
          i32.add
          local.tee 6
          local.get 5
          local.tee 7
          local.get 7
          i64.const 10000
          i64.div_u
          local.tee 5
          i64.const 10000
          i64.mul
          i64.sub
          i32.wrap_i64
          local.tee 8
          i32.const 65535
          i32.and
          i32.const 100
          i32.div_u
          local.tee 9
          i32.const 1
          i32.shl
          i32.add
          i32.load16_u align=1
          i32.store16 align=1
          local.get 0
          i32.const -2
          i32.add
          local.get 6
          local.get 8
          local.get 9
          i32.const 100
          i32.mul
          i32.sub
          i32.const 65535
          i32.and
          i32.const 1
          i32.shl
          i32.add
          i32.load16_u align=1
          i32.store16 align=1
          local.get 3
          i32.const -4
          i32.add
          local.set 3
          local.get 7
          i64.const 9999999
          i64.gt_u
          br_if 0 (;@2;)
        end
      end
      block ;; label = @1
        local.get 5
        i64.const 9
        i64.le_u
        br_if 0 (;@1;)
        local.get 2
        i32.const 12
        i32.add
        local.get 3
        i32.const -2
        i32.add
        local.tee 3
        i32.add
        global.get $GOT.data.internal.__memory_base
        i32.const 1050594
        i32.add
        local.get 5
        i32.wrap_i64
        local.tee 0
        local.get 0
        i32.const 65535
        i32.and
        i32.const 100
        i32.div_u
        local.tee 0
        i32.const 100
        i32.mul
        i32.sub
        i32.const 65535
        i32.and
        i32.const 1
        i32.shl
        i32.add
        i32.load16_u align=1
        i32.store16 align=1
        local.get 0
        i64.extend_i32_u
        local.set 5
      end
      block ;; label = @1
        block ;; label = @2
          local.get 4
          i64.eqz
          br_if 0 (;@2;)
          local.get 5
          i64.eqz
          br_if 1 (;@1;)
        end
        local.get 2
        i32.const 12
        i32.add
        local.get 3
        i32.const -1
        i32.add
        local.tee 3
        i32.add
        global.get $GOT.data.internal.__memory_base
        i32.const 1050594
        i32.add
        local.get 5
        i32.wrap_i64
        i32.const 1
        i32.shl
        i32.add
        i32.load8_u offset=1
        i32.store8
      end
      local.get 1
      i32.const 1
      i32.const 1
      i32.const 0
      local.get 2
      i32.const 12
      i32.add
      local.get 3
      i32.add
      i32.const 20
      local.get 3
      i32.sub
      call $_RNvMsa_NtCs2GenDSTXHQd_4core3fmtNtB5_9Formatter12pad_integral
      local.set 3
      local.get 2
      i32.const 32
      i32.add
      global.set $__stack_pointer
      local.get 3
    )
    (func $_RNvXs1i_NtCs2GenDSTXHQd_4core3fmtReNtB6_7Display3fmtB8_ (;198;) (type 4) (param i32 i32) (result i32)
      local.get 1
      local.get 0
      i32.load
      local.get 0
      i32.load offset=4
      call $_RNvMsa_NtCs2GenDSTXHQd_4core3fmtNtB5_9Formatter3pad
    )
    (func $_RNvNtCs2GenDSTXHQd_4core3fmt5write (;199;) (type 5) (param i32 i32 i32 i32) (result i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 4
      global.set $__stack_pointer
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            local.get 3
            i32.const 1
            i32.and
            br_if 0 (;@3;)
            local.get 2
            i32.load8_u
            local.tee 5
            br_if 1 (;@2;)
            i32.const 0
            local.set 5
            br 2 (;@1;)
          end
          local.get 0
          local.get 2
          local.get 3
          i32.const 1
          i32.shr_u
          local.get 1
          i32.load offset=12
          call_indirect (type 3)
          local.set 5
          br 1 (;@1;)
        end
        local.get 1
        i32.load offset=12
        local.set 6
        i32.const 0
        local.set 7
        loop ;; label = @2
          local.get 2
          i32.const 1
          i32.add
          local.set 8
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                block ;; label = @6
                  block ;; label = @7
                    local.get 5
                    i32.extend8_s
                    i32.const -1
                    i32.gt_s
                    br_if 0 (;@7;)
                    local.get 5
                    i32.const 255
                    i32.and
                    local.tee 9
                    i32.const 128
                    i32.eq
                    br_if 1 (;@6;)
                    local.get 9
                    i32.const 192
                    i32.ne
                    br_if 3 (;@4;)
                    local.get 4
                    local.get 1
                    i32.store offset=4
                    local.get 4
                    local.get 0
                    i32.store
                    local.get 4
                    i64.const 1610612768
                    i64.store offset=8 align=4
                    local.get 3
                    local.get 7
                    i32.const 3
                    i32.shl
                    i32.add
                    local.tee 5
                    i32.load
                    local.get 4
                    local.get 5
                    i32.load offset=4
                    call_indirect (type 4)
                    i32.eqz
                    br_if 2 (;@5;)
                    i32.const 1
                    local.set 5
                    br 6 (;@1;)
                  end
                  block ;; label = @7
                    local.get 0
                    local.get 8
                    local.get 5
                    i32.const 255
                    i32.and
                    local.tee 5
                    local.get 6
                    call_indirect (type 3)
                    br_if 0 (;@7;)
                    local.get 8
                    local.get 5
                    i32.add
                    local.set 2
                    br 4 (;@3;)
                  end
                  i32.const 1
                  local.set 5
                  br 5 (;@1;)
                end
                block ;; label = @6
                  local.get 0
                  local.get 2
                  i32.const 3
                  i32.add
                  local.tee 5
                  local.get 2
                  i32.load16_u offset=1 align=1
                  local.tee 2
                  local.get 6
                  call_indirect (type 3)
                  br_if 0 (;@6;)
                  local.get 5
                  local.get 2
                  i32.add
                  local.set 2
                  br 3 (;@3;)
                end
                i32.const 1
                local.set 5
                br 4 (;@1;)
              end
              local.get 7
              i32.const 1
              i32.add
              local.set 7
              local.get 8
              local.set 2
              br 1 (;@3;)
            end
            i32.const 1610612768
            local.set 10
            block ;; label = @4
              local.get 5
              i32.const 1
              i32.and
              i32.eqz
              br_if 0 (;@4;)
              local.get 2
              i32.const 5
              i32.add
              local.set 8
              local.get 2
              i32.load offset=1 align=1
              local.set 10
            end
            i32.const 0
            local.set 9
            block ;; label = @4
              block ;; label = @5
                local.get 5
                i32.const 2
                i32.and
                br_if 0 (;@5;)
                i32.const 0
                local.set 11
                local.get 8
                local.set 2
                br 1 (;@4;)
              end
              local.get 8
              i32.const 2
              i32.add
              local.set 2
              local.get 8
              i32.load16_u align=1
              local.set 11
            end
            block ;; label = @4
              block ;; label = @5
                local.get 5
                i32.const 4
                i32.and
                br_if 0 (;@5;)
                local.get 2
                local.set 8
                br 1 (;@4;)
              end
              local.get 2
              i32.const 2
              i32.add
              local.set 8
              local.get 2
              i32.load16_u align=1
              local.set 9
            end
            block ;; label = @4
              block ;; label = @5
                local.get 5
                i32.const 8
                i32.and
                br_if 0 (;@5;)
                local.get 8
                local.set 2
                br 1 (;@4;)
              end
              local.get 8
              i32.const 2
              i32.add
              local.set 2
              local.get 8
              i32.load16_u align=1
              local.set 7
            end
            block ;; label = @4
              local.get 5
              i32.const 16
              i32.and
              i32.eqz
              br_if 0 (;@4;)
              local.get 3
              local.get 11
              i32.const 65535
              i32.and
              i32.const 3
              i32.shl
              i32.add
              i32.load16_u offset=4
              local.set 11
            end
            block ;; label = @4
              local.get 5
              i32.const 32
              i32.and
              i32.eqz
              br_if 0 (;@4;)
              local.get 3
              local.get 9
              i32.const 65535
              i32.and
              i32.const 3
              i32.shl
              i32.add
              i32.load16_u offset=4
              local.set 9
            end
            local.get 4
            local.get 9
            i32.store16 offset=14
            local.get 4
            local.get 11
            i32.store16 offset=12
            local.get 4
            local.get 10
            i32.store offset=8
            local.get 4
            local.get 1
            i32.store offset=4
            local.get 4
            local.get 0
            i32.store
            block ;; label = @4
              local.get 3
              local.get 7
              i32.const 3
              i32.shl
              i32.add
              local.tee 5
              i32.load
              local.get 4
              local.get 5
              i32.load offset=4
              call_indirect (type 4)
              i32.eqz
              br_if 0 (;@4;)
              i32.const 1
              local.set 5
              br 3 (;@1;)
            end
            local.get 7
            i32.const 1
            i32.add
            local.set 7
          end
          local.get 2
          i32.load8_u
          local.tee 5
          br_if 0 (;@2;)
        end
        i32.const 0
        local.set 5
      end
      local.get 4
      i32.const 16
      i32.add
      global.set $__stack_pointer
      local.get 5
    )
    (func $_RNvMs3_NtNtCs2GenDSTXHQd_4core3ffi5c_strNtB5_4CStr19from_bytes_with_nul (;200;) (type 11) (param i32 i32 i32)
      (local i32 i32 i32 i32)
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                block ;; label = @6
                  block ;; label = @7
                    local.get 2
                    i32.const 7
                    i32.gt_u
                    br_if 0 (;@7;)
                    local.get 2
                    i32.eqz
                    br_if 5 (;@2;)
                    local.get 1
                    i32.load8_u
                    br_if 1 (;@6;)
                    i32.const 0
                    local.set 3
                    br 6 (;@1;)
                  end
                  local.get 1
                  i32.const 3
                  i32.add
                  i32.const -4
                  i32.and
                  local.tee 4
                  local.get 1
                  i32.eq
                  br_if 1 (;@5;)
                  local.get 4
                  local.get 1
                  i32.sub
                  local.set 4
                  i32.const 0
                  local.set 3
                  loop ;; label = @7
                    local.get 1
                    local.get 3
                    i32.add
                    i32.load8_u
                    i32.eqz
                    br_if 6 (;@1;)
                    local.get 4
                    local.get 3
                    i32.const 1
                    i32.add
                    local.tee 3
                    i32.ne
                    br_if 0 (;@7;)
                  end
                  local.get 4
                  local.get 2
                  i32.const -8
                  i32.add
                  local.tee 5
                  i32.gt_u
                  br_if 3 (;@3;)
                  br 2 (;@4;)
                end
                i32.const 1
                local.set 3
                local.get 2
                i32.const 1
                i32.eq
                br_if 3 (;@2;)
                local.get 1
                i32.load8_u offset=1
                i32.eqz
                br_if 4 (;@1;)
                i32.const 2
                local.set 3
                local.get 2
                i32.const 2
                i32.eq
                br_if 3 (;@2;)
                local.get 1
                i32.load8_u offset=2
                i32.eqz
                br_if 4 (;@1;)
                i32.const 3
                local.set 3
                local.get 2
                i32.const 3
                i32.eq
                br_if 3 (;@2;)
                local.get 1
                i32.load8_u offset=3
                i32.eqz
                br_if 4 (;@1;)
                i32.const 4
                local.set 3
                local.get 2
                i32.const 4
                i32.eq
                br_if 3 (;@2;)
                local.get 1
                i32.load8_u offset=4
                i32.eqz
                br_if 4 (;@1;)
                i32.const 5
                local.set 3
                local.get 2
                i32.const 5
                i32.eq
                br_if 3 (;@2;)
                local.get 1
                i32.load8_u offset=5
                i32.eqz
                br_if 4 (;@1;)
                i32.const 6
                local.set 3
                local.get 2
                i32.const 6
                i32.eq
                br_if 3 (;@2;)
                local.get 1
                i32.load8_u offset=6
                br_if 3 (;@2;)
                br 4 (;@1;)
              end
              local.get 2
              i32.const -8
              i32.add
              local.set 5
              i32.const 0
              local.set 4
            end
            loop ;; label = @4
              i32.const 16843008
              local.get 1
              local.get 4
              i32.add
              local.tee 3
              i32.load
              local.tee 6
              i32.sub
              local.get 6
              i32.or
              i32.const 16843008
              local.get 3
              i32.const 4
              i32.add
              i32.load
              local.tee 3
              i32.sub
              local.get 3
              i32.or
              i32.and
              i32.const -2139062144
              i32.and
              i32.const -2139062144
              i32.ne
              br_if 1 (;@3;)
              local.get 4
              i32.const 8
              i32.add
              local.tee 4
              local.get 5
              i32.le_u
              br_if 0 (;@4;)
            end
          end
          local.get 2
          local.get 4
          i32.eq
          br_if 0 (;@2;)
          loop ;; label = @3
            block ;; label = @4
              local.get 1
              local.get 4
              i32.add
              i32.load8_u
              br_if 0 (;@4;)
              local.get 4
              local.set 3
              br 3 (;@1;)
            end
            local.get 2
            local.get 4
            i32.const 1
            i32.add
            local.tee 4
            i32.ne
            br_if 0 (;@3;)
          end
        end
        local.get 0
        i32.const 1
        i32.store offset=4
        local.get 0
        i32.const 1
        i32.store
        return
      end
      block ;; label = @1
        local.get 3
        i32.const 1
        i32.add
        local.get 2
        i32.eq
        br_if 0 (;@1;)
        local.get 0
        local.get 3
        i32.store offset=8
        local.get 0
        i32.const 0
        i32.store offset=4
        local.get 0
        i32.const 1
        i32.store
        return
      end
      local.get 0
      local.get 2
      i32.store offset=8
      local.get 0
      local.get 1
      i32.store offset=4
      local.get 0
      i32.const 0
      i32.store
    )
    (func $_RNvMsa_NtCs2GenDSTXHQd_4core3fmtNtB5_9Formatter12pad_integral (;201;) (type 14) (param i32 i32 i32 i32 i32 i32) (result i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i64)
      i32.const 43
      i32.const 1114112
      local.get 0
      i32.load offset=8
      local.tee 6
      i32.const 2097152
      i32.and
      local.tee 7
      select
      local.set 8
      local.get 7
      i32.const 21
      i32.shr_u
      i32.const 1
      local.get 1
      select
      local.get 5
      i32.add
      local.set 9
      block ;; label = @1
        block ;; label = @2
          local.get 6
          i32.const 8388608
          i32.and
          br_if 0 (;@2;)
          i32.const 0
          local.set 2
          br 1 (;@1;)
        end
        block ;; label = @2
          block ;; label = @3
            local.get 3
            i32.const 16
            i32.lt_u
            br_if 0 (;@3;)
            local.get 2
            local.get 3
            call $_RNvNtNtCs2GenDSTXHQd_4core3str5count14do_count_chars
            local.set 7
            br 1 (;@2;)
          end
          block ;; label = @3
            local.get 3
            br_if 0 (;@3;)
            i32.const 0
            local.set 7
            br 1 (;@2;)
          end
          local.get 3
          i32.const 3
          i32.and
          local.set 10
          i32.const 0
          local.set 11
          i32.const 0
          local.set 7
          block ;; label = @3
            local.get 3
            i32.const 4
            i32.lt_u
            br_if 0 (;@3;)
            local.get 3
            i32.const 12
            i32.and
            local.set 12
            i32.const 0
            local.set 11
            i32.const 0
            local.set 7
            loop ;; label = @4
              local.get 7
              local.get 2
              local.get 11
              i32.add
              local.tee 13
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.get 13
              i32.const 1
              i32.add
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.get 13
              i32.const 2
              i32.add
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.get 13
              i32.const 3
              i32.add
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.set 7
              local.get 12
              local.get 11
              i32.const 4
              i32.add
              local.tee 11
              i32.ne
              br_if 0 (;@4;)
            end
            local.get 10
            i32.eqz
            br_if 1 (;@2;)
          end
          local.get 2
          local.get 11
          i32.add
          local.set 13
          loop ;; label = @3
            local.get 7
            local.get 13
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.set 7
            local.get 13
            i32.const 1
            i32.add
            local.set 13
            local.get 10
            i32.const -1
            i32.add
            local.tee 10
            br_if 0 (;@3;)
          end
        end
        local.get 7
        local.get 9
        i32.add
        local.set 9
      end
      local.get 8
      i32.const 45
      local.get 1
      select
      local.set 12
      block ;; label = @1
        block ;; label = @2
          local.get 9
          local.get 0
          i32.load16_u offset=12
          local.tee 1
          i32.ge_u
          br_if 0 (;@2;)
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                local.get 6
                i32.const 16777216
                i32.and
                br_if 0 (;@5;)
                local.get 1
                local.get 9
                i32.sub
                local.set 8
                i32.const 0
                local.set 7
                i32.const 0
                local.set 1
                block ;; label = @6
                  block ;; label = @7
                    block ;; label = @8
                      local.get 6
                      i32.const 29
                      i32.shr_u
                      i32.const 3
                      i32.and
                      br_table 2 (;@6;) 0 (;@8;) 1 (;@7;) 0 (;@8;) 2 (;@6;)
                    end
                    local.get 8
                    local.set 1
                    br 1 (;@6;)
                  end
                  local.get 8
                  i32.const 65534
                  i32.and
                  i32.const 1
                  i32.shr_u
                  local.set 1
                end
                local.get 6
                i32.const 2097151
                i32.and
                local.set 9
                local.get 0
                i32.load offset=4
                local.set 11
                local.get 0
                i32.load
                local.set 10
                loop ;; label = @6
                  local.get 7
                  i32.const 65535
                  i32.and
                  local.get 1
                  i32.const 65535
                  i32.and
                  i32.ge_u
                  br_if 2 (;@4;)
                  i32.const 1
                  local.set 13
                  local.get 7
                  i32.const 1
                  i32.add
                  local.set 7
                  local.get 10
                  local.get 9
                  local.get 11
                  i32.load offset=16
                  call_indirect (type 4)
                  i32.eqz
                  br_if 0 (;@6;)
                  br 5 (;@1;)
                end
              end
              local.get 0
              local.get 0
              i64.load offset=8 align=4
              local.tee 14
              i32.wrap_i64
              i32.const -1612709888
              i32.and
              i32.const 536870960
              i32.or
              i32.store offset=8
              i32.const 1
              local.set 13
              local.get 0
              i32.load
              local.tee 10
              local.get 0
              i32.load offset=4
              local.tee 11
              local.get 12
              local.get 2
              local.get 3
              call $_RNvNvMsa_NtCs2GenDSTXHQd_4core3fmtNtB7_9Formatter12pad_integral12write_prefix
              br_if 3 (;@1;)
              i32.const 0
              local.set 7
              local.get 1
              local.get 9
              i32.sub
              i32.const 65535
              i32.and
              local.set 2
              loop ;; label = @5
                local.get 7
                i32.const 65535
                i32.and
                local.get 2
                i32.ge_u
                br_if 2 (;@3;)
                i32.const 1
                local.set 13
                local.get 7
                i32.const 1
                i32.add
                local.set 7
                local.get 10
                i32.const 48
                local.get 11
                i32.load offset=16
                call_indirect (type 4)
                i32.eqz
                br_if 0 (;@5;)
                br 4 (;@1;)
              end
            end
            i32.const 1
            local.set 13
            local.get 10
            local.get 11
            local.get 12
            local.get 2
            local.get 3
            call $_RNvNvMsa_NtCs2GenDSTXHQd_4core3fmtNtB7_9Formatter12pad_integral12write_prefix
            br_if 2 (;@1;)
            local.get 10
            local.get 4
            local.get 5
            local.get 11
            i32.load offset=12
            call_indirect (type 3)
            br_if 2 (;@1;)
            i32.const 0
            local.set 7
            local.get 8
            local.get 1
            i32.sub
            i32.const 65535
            i32.and
            local.set 0
            loop ;; label = @4
              local.get 7
              i32.const 65535
              i32.and
              local.tee 2
              local.get 0
              i32.lt_u
              local.set 13
              local.get 2
              local.get 0
              i32.ge_u
              br_if 3 (;@1;)
              local.get 7
              i32.const 1
              i32.add
              local.set 7
              local.get 10
              local.get 9
              local.get 11
              i32.load offset=16
              call_indirect (type 4)
              i32.eqz
              br_if 0 (;@4;)
              br 3 (;@1;)
            end
          end
          i32.const 1
          local.set 13
          local.get 10
          local.get 4
          local.get 5
          local.get 11
          i32.load offset=12
          call_indirect (type 3)
          br_if 1 (;@1;)
          local.get 0
          local.get 14
          i64.store offset=8 align=4
          i32.const 0
          return
        end
        i32.const 1
        local.set 13
        local.get 0
        i32.load
        local.tee 7
        local.get 0
        i32.load offset=4
        local.tee 10
        local.get 12
        local.get 2
        local.get 3
        call $_RNvNvMsa_NtCs2GenDSTXHQd_4core3fmtNtB7_9Formatter12pad_integral12write_prefix
        br_if 0 (;@1;)
        local.get 7
        local.get 4
        local.get 5
        local.get 10
        i32.load offset=12
        call_indirect (type 3)
        local.set 13
      end
      local.get 13
    )
    (func $_RNvNtNtCs2GenDSTXHQd_4core3str5count14do_count_chars (;202;) (type 4) (param i32 i32) (result i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32)
      block ;; label = @1
        block ;; label = @2
          local.get 1
          local.get 0
          i32.const 3
          i32.add
          i32.const -4
          i32.and
          local.tee 2
          local.get 0
          i32.sub
          local.tee 3
          i32.lt_u
          br_if 0 (;@2;)
          local.get 1
          local.get 3
          i32.sub
          local.tee 4
          i32.const 2
          i32.shr_u
          local.tee 5
          i32.eqz
          br_if 0 (;@2;)
          local.get 4
          i32.const 3
          i32.and
          local.set 6
          i32.const 0
          local.set 7
          i32.const 0
          local.set 1
          block ;; label = @3
            local.get 2
            local.get 0
            i32.eq
            br_if 0 (;@3;)
            i32.const 0
            local.set 8
            i32.const 0
            local.set 1
            block ;; label = @4
              local.get 0
              local.get 2
              i32.sub
              local.tee 9
              i32.const -4
              i32.gt_u
              br_if 0 (;@4;)
              i32.const 0
              local.set 8
              i32.const 0
              local.set 1
              loop ;; label = @5
                local.get 1
                local.get 0
                local.get 8
                i32.add
                local.tee 2
                i32.load8_s
                i32.const -65
                i32.gt_s
                i32.add
                local.get 2
                i32.const 1
                i32.add
                i32.load8_s
                i32.const -65
                i32.gt_s
                i32.add
                local.get 2
                i32.const 2
                i32.add
                i32.load8_s
                i32.const -65
                i32.gt_s
                i32.add
                local.get 2
                i32.const 3
                i32.add
                i32.load8_s
                i32.const -65
                i32.gt_s
                i32.add
                local.set 1
                local.get 8
                i32.const 4
                i32.add
                local.tee 8
                br_if 0 (;@5;)
              end
            end
            local.get 0
            local.get 8
            i32.add
            local.set 2
            loop ;; label = @4
              local.get 1
              local.get 2
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.set 1
              local.get 2
              i32.const 1
              i32.add
              local.set 2
              local.get 9
              i32.const 1
              i32.add
              local.tee 9
              br_if 0 (;@4;)
            end
          end
          local.get 0
          local.get 3
          i32.add
          local.set 9
          block ;; label = @3
            local.get 6
            i32.eqz
            br_if 0 (;@3;)
            local.get 9
            local.get 4
            i32.const 2147483644
            i32.and
            i32.add
            local.tee 2
            i32.load8_s
            i32.const -65
            i32.gt_s
            local.set 7
            local.get 6
            i32.const 1
            i32.eq
            br_if 0 (;@3;)
            local.get 7
            local.get 2
            i32.load8_s offset=1
            i32.const -65
            i32.gt_s
            i32.add
            local.set 7
            local.get 6
            i32.const 2
            i32.eq
            br_if 0 (;@3;)
            local.get 7
            local.get 2
            i32.load8_s offset=2
            i32.const -65
            i32.gt_s
            i32.add
            local.set 7
          end
          local.get 7
          local.get 1
          i32.add
          local.set 8
          loop ;; label = @3
            local.get 9
            local.set 3
            local.get 5
            i32.eqz
            br_if 2 (;@1;)
            local.get 5
            i32.const 192
            local.get 5
            i32.const 192
            i32.lt_u
            select
            local.tee 7
            i32.const 3
            i32.and
            local.set 6
            block ;; label = @4
              block ;; label = @5
                local.get 7
                i32.const 2
                i32.shl
                local.tee 4
                i32.const 1008
                i32.and
                local.tee 1
                br_if 0 (;@5;)
                i32.const 0
                local.set 2
                br 1 (;@4;)
              end
              local.get 3
              local.get 1
              i32.add
              local.set 0
              i32.const 0
              local.set 2
              local.get 3
              local.set 1
              loop ;; label = @5
                local.get 1
                i32.const 12
                i32.add
                i32.load
                local.tee 9
                i32.const -1
                i32.xor
                i32.const 7
                i32.shr_u
                local.get 9
                i32.const 6
                i32.shr_u
                i32.or
                i32.const 16843009
                i32.and
                local.get 1
                i32.const 8
                i32.add
                i32.load
                local.tee 9
                i32.const -1
                i32.xor
                i32.const 7
                i32.shr_u
                local.get 9
                i32.const 6
                i32.shr_u
                i32.or
                i32.const 16843009
                i32.and
                local.get 1
                i32.const 4
                i32.add
                i32.load
                local.tee 9
                i32.const -1
                i32.xor
                i32.const 7
                i32.shr_u
                local.get 9
                i32.const 6
                i32.shr_u
                i32.or
                i32.const 16843009
                i32.and
                local.get 1
                i32.load
                local.tee 9
                i32.const -1
                i32.xor
                i32.const 7
                i32.shr_u
                local.get 9
                i32.const 6
                i32.shr_u
                i32.or
                i32.const 16843009
                i32.and
                local.get 2
                i32.add
                i32.add
                i32.add
                i32.add
                local.set 2
                local.get 1
                i32.const 16
                i32.add
                local.tee 1
                local.get 0
                i32.ne
                br_if 0 (;@5;)
              end
            end
            local.get 5
            local.get 7
            i32.sub
            local.set 5
            local.get 3
            local.get 4
            i32.add
            local.set 9
            local.get 2
            i32.const 8
            i32.shr_u
            i32.const 16711935
            i32.and
            local.get 2
            i32.const 16711935
            i32.and
            i32.add
            i32.const 65537
            i32.mul
            i32.const 16
            i32.shr_u
            local.get 8
            i32.add
            local.set 8
            local.get 6
            i32.eqz
            br_if 0 (;@3;)
          end
          local.get 3
          local.get 7
          i32.const 252
          i32.and
          i32.const 2
          i32.shl
          i32.add
          local.tee 2
          i32.load
          local.tee 1
          i32.const -1
          i32.xor
          i32.const 7
          i32.shr_u
          local.get 1
          i32.const 6
          i32.shr_u
          i32.or
          i32.const 16843009
          i32.and
          local.set 1
          block ;; label = @3
            local.get 6
            i32.const 1
            i32.eq
            br_if 0 (;@3;)
            local.get 2
            i32.load offset=4
            local.tee 9
            i32.const -1
            i32.xor
            i32.const 7
            i32.shr_u
            local.get 9
            i32.const 6
            i32.shr_u
            i32.or
            i32.const 16843009
            i32.and
            local.get 1
            i32.add
            local.set 1
            local.get 6
            i32.const 2
            i32.eq
            br_if 0 (;@3;)
            local.get 2
            i32.load offset=8
            local.tee 2
            i32.const -1
            i32.xor
            i32.const 7
            i32.shr_u
            local.get 2
            i32.const 6
            i32.shr_u
            i32.or
            i32.const 16843009
            i32.and
            local.get 1
            i32.add
            local.set 1
          end
          local.get 1
          i32.const 8
          i32.shr_u
          i32.const 459007
          i32.and
          local.get 1
          i32.const 16711935
          i32.and
          i32.add
          i32.const 65537
          i32.mul
          i32.const 16
          i32.shr_u
          local.get 8
          i32.add
          local.set 8
          br 1 (;@1;)
        end
        block ;; label = @2
          local.get 1
          br_if 0 (;@2;)
          i32.const 0
          return
        end
        local.get 1
        i32.const 3
        i32.and
        local.set 2
        i32.const 0
        local.set 9
        i32.const 0
        local.set 8
        block ;; label = @2
          local.get 1
          i32.const 4
          i32.lt_u
          br_if 0 (;@2;)
          local.get 1
          i32.const -4
          i32.and
          local.set 5
          i32.const 0
          local.set 8
          i32.const 0
          local.set 9
          loop ;; label = @3
            local.get 8
            local.get 0
            local.get 9
            i32.add
            local.tee 1
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.get 1
            i32.const 1
            i32.add
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.get 1
            i32.const 2
            i32.add
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.get 1
            i32.const 3
            i32.add
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.set 8
            local.get 5
            local.get 9
            i32.const 4
            i32.add
            local.tee 9
            i32.ne
            br_if 0 (;@3;)
          end
          local.get 2
          i32.eqz
          br_if 1 (;@1;)
        end
        local.get 0
        local.get 9
        i32.add
        local.set 1
        loop ;; label = @2
          local.get 8
          local.get 1
          i32.load8_s
          i32.const -65
          i32.gt_s
          i32.add
          local.set 8
          local.get 1
          i32.const 1
          i32.add
          local.set 1
          local.get 2
          i32.const -1
          i32.add
          local.tee 2
          br_if 0 (;@2;)
        end
      end
      local.get 8
    )
    (func $_RNvNvMsa_NtCs2GenDSTXHQd_4core3fmtNtB7_9Formatter12pad_integral12write_prefix (;203;) (type 15) (param i32 i32 i32 i32 i32) (result i32)
      block ;; label = @1
        local.get 2
        i32.const 1114112
        i32.eq
        br_if 0 (;@1;)
        local.get 0
        local.get 2
        local.get 1
        i32.load offset=16
        call_indirect (type 4)
        i32.eqz
        br_if 0 (;@1;)
        i32.const 1
        return
      end
      block ;; label = @1
        local.get 3
        br_if 0 (;@1;)
        i32.const 0
        return
      end
      local.get 0
      local.get 3
      local.get 4
      local.get 1
      i32.load offset=12
      call_indirect (type 3)
    )
    (func $_RNvMsa_NtCs2GenDSTXHQd_4core3fmtNtB5_9Formatter3pad (;204;) (type 3) (param i32 i32 i32) (result i32)
      (local i32 i32 i32 i32 i32 i32 i32)
      block ;; label = @1
        block ;; label = @2
          local.get 0
          i32.load offset=8
          local.tee 3
          i32.const 402653184
          i32.and
          i32.eqz
          br_if 0 (;@2;)
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                block ;; label = @6
                  block ;; label = @7
                    local.get 3
                    i32.const 268435456
                    i32.and
                    i32.eqz
                    br_if 0 (;@7;)
                    local.get 0
                    i32.load16_u offset=14
                    local.tee 4
                    br_if 1 (;@6;)
                    i32.const 0
                    local.set 2
                    br 2 (;@5;)
                  end
                  block ;; label = @7
                    local.get 2
                    i32.const 16
                    i32.lt_u
                    br_if 0 (;@7;)
                    local.get 1
                    local.get 2
                    call $_RNvNtNtCs2GenDSTXHQd_4core3str5count14do_count_chars
                    local.set 5
                    br 4 (;@3;)
                  end
                  block ;; label = @7
                    local.get 2
                    br_if 0 (;@7;)
                    i32.const 0
                    local.set 5
                    br 4 (;@3;)
                  end
                  local.get 2
                  i32.const 3
                  i32.and
                  local.set 6
                  i32.const 0
                  local.set 7
                  i32.const 0
                  local.set 5
                  block ;; label = @7
                    local.get 2
                    i32.const 4
                    i32.lt_u
                    br_if 0 (;@7;)
                    local.get 2
                    i32.const 12
                    i32.and
                    local.set 4
                    i32.const 0
                    local.set 5
                    i32.const 0
                    local.set 7
                    loop ;; label = @8
                      local.get 5
                      local.get 1
                      local.get 7
                      i32.add
                      local.tee 8
                      i32.load8_s
                      i32.const -65
                      i32.gt_s
                      i32.add
                      local.get 8
                      i32.const 1
                      i32.add
                      i32.load8_s
                      i32.const -65
                      i32.gt_s
                      i32.add
                      local.get 8
                      i32.const 2
                      i32.add
                      i32.load8_s
                      i32.const -65
                      i32.gt_s
                      i32.add
                      local.get 8
                      i32.const 3
                      i32.add
                      i32.load8_s
                      i32.const -65
                      i32.gt_s
                      i32.add
                      local.set 5
                      local.get 4
                      local.get 7
                      i32.const 4
                      i32.add
                      local.tee 7
                      i32.ne
                      br_if 0 (;@8;)
                    end
                    local.get 6
                    i32.eqz
                    br_if 4 (;@3;)
                  end
                  local.get 1
                  local.get 7
                  i32.add
                  local.set 8
                  loop ;; label = @7
                    local.get 5
                    local.get 8
                    i32.load8_s
                    i32.const -65
                    i32.gt_s
                    i32.add
                    local.set 5
                    local.get 8
                    i32.const 1
                    i32.add
                    local.set 8
                    local.get 6
                    i32.const -1
                    i32.add
                    local.tee 6
                    br_if 0 (;@7;)
                    br 4 (;@3;)
                  end
                end
                local.get 1
                local.get 2
                i32.add
                local.set 7
                i32.const 0
                local.set 2
                local.get 1
                local.set 8
                local.get 4
                local.set 6
                loop ;; label = @6
                  local.get 8
                  local.tee 5
                  local.get 7
                  i32.eq
                  br_if 2 (;@4;)
                  block ;; label = @7
                    block ;; label = @8
                      local.get 5
                      i32.load8_s
                      local.tee 8
                      i32.const -1
                      i32.le_s
                      br_if 0 (;@8;)
                      local.get 5
                      i32.const 1
                      i32.add
                      local.set 8
                      br 1 (;@7;)
                    end
                    block ;; label = @8
                      local.get 8
                      i32.const -32
                      i32.ge_u
                      br_if 0 (;@8;)
                      local.get 5
                      i32.const 2
                      i32.add
                      local.set 8
                      br 1 (;@7;)
                    end
                    local.get 5
                    i32.const 4
                    i32.const 3
                    local.get 8
                    i32.const -17
                    i32.gt_u
                    select
                    i32.add
                    local.set 8
                  end
                  local.get 8
                  local.get 5
                  i32.sub
                  local.get 2
                  i32.add
                  local.set 2
                  local.get 6
                  i32.const -1
                  i32.add
                  local.tee 6
                  br_if 0 (;@6;)
                end
              end
              i32.const 0
              local.set 6
            end
            local.get 4
            local.get 6
            i32.sub
            local.set 5
          end
          local.get 5
          local.get 0
          i32.load16_u offset=12
          local.tee 8
          i32.ge_u
          br_if 0 (;@2;)
          local.get 8
          local.get 5
          i32.sub
          local.set 9
          i32.const 0
          local.set 5
          i32.const 0
          local.set 4
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                local.get 3
                i32.const 29
                i32.shr_u
                i32.const 3
                i32.and
                br_table 2 (;@3;) 0 (;@5;) 1 (;@4;) 2 (;@3;) 2 (;@3;)
              end
              local.get 9
              local.set 4
              br 1 (;@3;)
            end
            local.get 9
            i32.const 65534
            i32.and
            i32.const 1
            i32.shr_u
            local.set 4
          end
          local.get 3
          i32.const 2097151
          i32.and
          local.set 7
          local.get 0
          i32.load offset=4
          local.set 6
          local.get 0
          i32.load
          local.set 0
          block ;; label = @3
            loop ;; label = @4
              local.get 5
              i32.const 65535
              i32.and
              local.get 4
              i32.const 65535
              i32.and
              i32.ge_u
              br_if 1 (;@3;)
              i32.const 1
              local.set 8
              local.get 5
              i32.const 1
              i32.add
              local.set 5
              local.get 0
              local.get 7
              local.get 6
              i32.load offset=16
              call_indirect (type 4)
              br_if 3 (;@1;)
              br 0 (;@4;)
            end
          end
          i32.const 1
          local.set 8
          local.get 0
          local.get 1
          local.get 2
          local.get 6
          i32.load offset=12
          call_indirect (type 3)
          br_if 1 (;@1;)
          i32.const 0
          local.set 5
          local.get 9
          local.get 4
          i32.sub
          i32.const 65535
          i32.and
          local.set 2
          loop ;; label = @3
            local.get 5
            i32.const 65535
            i32.and
            local.tee 4
            local.get 2
            i32.lt_u
            local.set 8
            local.get 4
            local.get 2
            i32.ge_u
            br_if 2 (;@1;)
            local.get 5
            i32.const 1
            i32.add
            local.set 5
            local.get 0
            local.get 7
            local.get 6
            i32.load offset=16
            call_indirect (type 4)
            br_if 2 (;@1;)
            br 0 (;@3;)
          end
        end
        local.get 0
        i32.load
        local.get 1
        local.get 2
        local.get 0
        i32.load offset=4
        i32.load offset=12
        call_indirect (type 3)
        local.set 8
      end
      local.get 8
    )
    (func $_RNvMsa_NtCs2GenDSTXHQd_4core3fmtNtB5_9Formatter9write_str (;205;) (type 3) (param i32 i32 i32) (result i32)
      local.get 0
      i32.load
      local.get 1
      local.get 2
      local.get 0
      i32.load offset=4
      i32.load offset=12
      call_indirect (type 3)
    )
    (func $_RNvXs8_NtNtNtCs2GenDSTXHQd_4core3fmt3num3impmNtB9_7Display3fmt (;206;) (type 4) (param i32 i32) (result i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 2
      global.set $__stack_pointer
      i32.const 10
      local.set 3
      local.get 0
      i32.load
      local.tee 4
      local.set 5
      block ;; label = @1
        local.get 4
        i32.const 1000
        i32.lt_u
        br_if 0 (;@1;)
        i32.const 10
        local.set 3
        local.get 4
        local.set 5
        loop ;; label = @2
          local.get 2
          i32.const 6
          i32.add
          local.get 3
          i32.add
          local.tee 6
          i32.const -4
          i32.add
          global.get $GOT.data.internal.__memory_base
          i32.const 1050594
          i32.add
          local.tee 7
          local.get 5
          local.tee 0
          local.get 0
          i32.const 10000
          i32.div_u
          local.tee 5
          i32.const 10000
          i32.mul
          i32.sub
          local.tee 8
          i32.const 65535
          i32.and
          i32.const 100
          i32.div_u
          local.tee 9
          i32.const 1
          i32.shl
          i32.add
          i32.load16_u align=1
          i32.store16 align=1
          local.get 6
          i32.const -2
          i32.add
          local.get 7
          local.get 8
          local.get 9
          i32.const 100
          i32.mul
          i32.sub
          i32.const 65535
          i32.and
          i32.const 1
          i32.shl
          i32.add
          i32.load16_u align=1
          i32.store16 align=1
          local.get 3
          i32.const -4
          i32.add
          local.set 3
          local.get 0
          i32.const 9999999
          i32.gt_u
          br_if 0 (;@2;)
        end
      end
      block ;; label = @1
        block ;; label = @2
          local.get 5
          i32.const 9
          i32.gt_u
          br_if 0 (;@2;)
          local.get 5
          local.set 0
          br 1 (;@1;)
        end
        local.get 2
        i32.const 6
        i32.add
        local.get 3
        i32.const -2
        i32.add
        local.tee 3
        i32.add
        global.get $GOT.data.internal.__memory_base
        i32.const 1050594
        i32.add
        local.get 5
        local.get 5
        i32.const 65535
        i32.and
        i32.const 100
        i32.div_u
        local.tee 0
        i32.const 100
        i32.mul
        i32.sub
        i32.const 65535
        i32.and
        i32.const 1
        i32.shl
        i32.add
        i32.load16_u align=1
        i32.store16 align=1
      end
      block ;; label = @1
        block ;; label = @2
          local.get 4
          i32.eqz
          br_if 0 (;@2;)
          local.get 0
          i32.eqz
          br_if 1 (;@1;)
        end
        local.get 2
        i32.const 6
        i32.add
        local.get 3
        i32.const -1
        i32.add
        local.tee 3
        i32.add
        global.get $GOT.data.internal.__memory_base
        i32.const 1050594
        i32.add
        local.get 0
        i32.const 1
        i32.shl
        i32.add
        i32.load8_u offset=1
        i32.store8
      end
      local.get 1
      i32.const 1
      i32.const 1
      i32.const 0
      local.get 2
      i32.const 6
      i32.add
      local.get 3
      i32.add
      i32.const 10
      local.get 3
      i32.sub
      call $_RNvMsa_NtCs2GenDSTXHQd_4core3fmtNtB5_9Formatter12pad_integral
      local.set 3
      local.get 2
      i32.const 16
      i32.add
      global.set $__stack_pointer
      local.get 3
    )
    (func $_RNvNtCs2GenDSTXHQd_4core6result13unwrap_failed (;207;) (type 13) (param i32 i32 i32 i32 i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 32
      i32.sub
      local.tee 5
      global.set $__stack_pointer
      local.get 5
      local.get 1
      i32.store offset=4
      local.get 5
      local.get 0
      i32.store
      local.get 5
      local.get 3
      i32.store offset=12
      local.get 5
      local.get 2
      i32.store offset=8
      local.get 5
      global.get $GOT.data.internal.__table_base
      local.tee 1
      i32.const 64
      i32.add
      i64.extend_i32_u
      i64.const 32
      i64.shl
      local.get 5
      i32.const 8
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=24
      local.get 5
      local.get 1
      i32.const 65
      i32.add
      i64.extend_i32_u
      i64.const 32
      i64.shl
      local.get 5
      i64.extend_i32_u
      i64.or
      i64.store offset=16
      global.get $GOT.data.internal.__memory_base
      i32.const 1048864
      i32.add
      local.get 5
      i32.const 16
      i32.add
      local.get 4
      call $_RNvNtCs2GenDSTXHQd_4core9panicking9panic_fmt
      unreachable
    )
    (func $_RNvXs1g_NtCs2GenDSTXHQd_4core3fmtRDNtB6_5DebugEL_Bx_3fmtB8_ (;208;) (type 4) (param i32 i32) (result i32)
      local.get 0
      i32.load
      local.get 1
      local.get 0
      i32.load offset=4
      i32.load offset=12
      call_indirect (type 4)
    )
    (func $_RNvXs8_NtCs2GenDSTXHQd_4core3fmtNtB5_9ArgumentsNtB5_7Display3fmt (;209;) (type 4) (param i32 i32) (result i32)
      local.get 1
      i32.load
      local.get 1
      i32.load offset=4
      local.get 0
      i32.load
      local.get 0
      i32.load offset=4
      call $_RNvNtCs2GenDSTXHQd_4core3fmt5write
    )
    (func $_RNvNtNtCs2GenDSTXHQd_4core5slice6memchr14memchr_aligned (;210;) (type 2) (param i32 i32 i32 i32)
      (local i32 i32 i32 i32 i32)
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              local.get 2
              i32.const 3
              i32.add
              i32.const -4
              i32.and
              local.tee 4
              local.get 2
              i32.ne
              br_if 0 (;@4;)
              local.get 3
              i32.const -8
              i32.add
              local.set 5
              i32.const 0
              local.set 4
              br 1 (;@3;)
            end
            local.get 3
            local.get 4
            local.get 2
            i32.sub
            local.tee 4
            local.get 3
            local.get 4
            i32.lt_u
            select
            local.set 4
            block ;; label = @4
              local.get 3
              i32.eqz
              br_if 0 (;@4;)
              i32.const 0
              local.set 6
              local.get 1
              i32.const 255
              i32.and
              local.set 7
              i32.const 1
              local.set 8
              loop ;; label = @5
                local.get 2
                local.get 6
                i32.add
                i32.load8_u
                local.get 7
                i32.eq
                br_if 4 (;@1;)
                local.get 4
                local.get 6
                i32.const 1
                i32.add
                local.tee 6
                i32.ne
                br_if 0 (;@5;)
              end
            end
            local.get 4
            local.get 3
            i32.const -8
            i32.add
            local.tee 5
            i32.gt_u
            br_if 1 (;@2;)
          end
          local.get 1
          i32.const 255
          i32.and
          i32.const 16843009
          i32.mul
          local.set 6
          loop ;; label = @3
            i32.const 16843008
            local.get 2
            local.get 4
            i32.add
            local.tee 7
            i32.load
            local.get 6
            i32.xor
            local.tee 8
            i32.sub
            local.get 8
            i32.or
            i32.const 16843008
            local.get 7
            i32.const 4
            i32.add
            i32.load
            local.get 6
            i32.xor
            local.tee 7
            i32.sub
            local.get 7
            i32.or
            i32.and
            i32.const -2139062144
            i32.and
            i32.const -2139062144
            i32.ne
            br_if 1 (;@2;)
            local.get 4
            i32.const 8
            i32.add
            local.tee 4
            local.get 5
            i32.le_u
            br_if 0 (;@3;)
          end
        end
        block ;; label = @2
          local.get 3
          local.get 4
          i32.eq
          br_if 0 (;@2;)
          local.get 1
          i32.const 255
          i32.and
          local.set 6
          i32.const 1
          local.set 8
          loop ;; label = @3
            block ;; label = @4
              local.get 2
              local.get 4
              i32.add
              i32.load8_u
              local.get 6
              i32.ne
              br_if 0 (;@4;)
              local.get 4
              local.set 6
              br 3 (;@1;)
            end
            local.get 3
            local.get 4
            i32.const 1
            i32.add
            local.tee 4
            i32.ne
            br_if 0 (;@3;)
          end
        end
        i32.const 0
        local.set 8
      end
      local.get 0
      local.get 6
      i32.store offset=4
      local.get 0
      local.get 8
      i32.store
    )
    (func $_RNvXsC_NtNtCs2GenDSTXHQd_4core3fmt3numyNtB7_8LowerHex3fmt (;211;) (type 4) (param i32 i32) (result i32)
      (local i32 i64)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 2
      global.set $__stack_pointer
      local.get 0
      i64.load
      local.set 3
      i32.const 0
      local.set 0
      loop ;; label = @1
        local.get 2
        local.get 0
        i32.add
        i32.const 15
        i32.add
        global.get $GOT.data.internal.__memory_base
        i32.const 1050567
        i32.add
        local.get 3
        i32.wrap_i64
        i32.const 15
        i32.and
        i32.add
        i32.load8_u
        i32.store8
        local.get 0
        i32.const -1
        i32.add
        local.set 0
        local.get 3
        i64.const 4
        i64.shr_u
        local.tee 3
        i64.const 0
        i64.ne
        br_if 0 (;@1;)
      end
      local.get 1
      i32.const 1
      global.get $GOT.data.internal.__memory_base
      i32.const 1050794
      i32.add
      i32.const 2
      local.get 2
      local.get 0
      i32.add
      i32.const 16
      i32.add
      i32.const 0
      local.get 0
      i32.sub
      call $_RNvMsa_NtCs2GenDSTXHQd_4core3fmtNtB5_9Formatter12pad_integral
      local.set 0
      local.get 2
      i32.const 16
      i32.add
      global.set $__stack_pointer
      local.get 0
    )
    (func $_RNvXsg_NtCs2GenDSTXHQd_4core3fmtbNtB5_7Display3fmt (;212;) (type 4) (param i32 i32) (result i32)
      block ;; label = @1
        local.get 0
        i32.load8_u
        br_if 0 (;@1;)
        local.get 1
        global.get $GOT.data.internal.__memory_base
        i32.const 1050796
        i32.add
        i32.const 5
        call $_RNvMsa_NtCs2GenDSTXHQd_4core3fmtNtB5_9Formatter3pad
        return
      end
      local.get 1
      global.get $GOT.data.internal.__memory_base
      i32.const 1050801
      i32.add
      i32.const 4
      call $_RNvMsa_NtCs2GenDSTXHQd_4core3fmtNtB5_9Formatter3pad
    )
    (func $_RNvXsi_NtCs2GenDSTXHQd_4core3fmteNtB5_7Display3fmt (;213;) (type 3) (param i32 i32 i32) (result i32)
      local.get 2
      local.get 0
      local.get 1
      call $_RNvMsa_NtCs2GenDSTXHQd_4core3fmtNtB5_9Formatter3pad
    )
    (data $.rodata (;0;) (i32.const 1048576) "\c3 \00\00i\10\00\00parent\c0\01:\c0\01:\c0\00\16slice index starts at \c0\0d but ends at \c0\00\12range start index \c0\22 out of range for slice of length \c0\00\10range end index \c0\22 out of range for slice of length \c0\00\10assertion `left \c0\17 right` failed\0a  left: \c0\09\0a right: \c0\00\10assertion `left \c0\10 right` failed: \c0\09\0a  left: \c0\09\0a right: \c0\00\c0\02: \c0\00/rustc/0376d43d443cba463a0b6a6ec9140ea17d7b7130/library/alloc/src/fmt.rs\00/rustc/0376d43d443cba463a0b6a6ec9140ea17d7b7130/library/std/src/sys/sync/mutex/no_threads.rs\00/rustc/0376d43d443cba463a0b6a6ec9140ea17d7b7130/library/std/src/panicking.rs\00/rustc/0376d43d443cba463a0b6a6ec9140ea17d7b7130/library/std/src/io/mod.rs\00/rustc/0376d43d443cba463a0b6a6ec9140ea17d7b7130/library/alloc/src/raw_vec/mod.rs\00/rustc/0376d43d443cba463a0b6a6ec9140ea17d7b7130/library/std/src/thread/id.rs\00/rustc/0376d43d443cba463a0b6a6ec9140ea17d7b7130/library/std/src/sys/io/io_slice/iovec.rs\00/\00\15memory allocation of \c0G bytes failed\0askipping backtrace printing to avoid potential recursion\0a\005fatal runtime error: failed to initiate panic, error \c0\0b, aborting\0a\00\15memory allocation of \c0\0e bytes failed\0a\00\0cpanicked at \c0\02:\0a\c03\0athread panicked while processing panic. aborting.\0a\00\09\0athread '\c0\03' (\c0\0e) panicked at \c0\02:\0a\c0\01\0a\00\19aborting due to panic at \c0\02:\0a\c0\01\0a\00a formatting trait implementation returned an error when the underlying stream did notfile name contained an unexpected NUL bytemain<unnamed>note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace\0a\00\00m]\cb\d6,P\ebcxA\a6Wq\1b\8b\b9\b8\12\e0\94Q\0d\5c#B\e7\da\e6;\e0\a0\f3fatal runtime error: rwlock locked for writing, aborting\0aRUST_BACKTRACEcannot recursively acquire mutexadvancing io slices beyond their lengthadvancing IoSlice beyond its length\00Box<dyn Any>thread caused non-unwinding panic. aborting.\0afailed to write whole bufferstack backtrace:\0anote: Some details are omitted, run with `RUST_BACKTRACE=full` for a verbose backtrace.\0afailed to generate unique thread ID: bitspace exhaustedcapacity overflowa formatting trait implementation returned an error when the underlying stream did notError0123456789abcdef==!=matches000102030405060708091011121314151617181920212223242526272829303132333435363738394041424344454647484950515253545556575859606162636465666768697071727374757677787980818283848586878889909192939495969798990xfalsetrue\00\00\00\02\00\00\00\02\00\00\00\07\00\00\00")
    (data $.data (;1;) (i32.const 1050824) "\02\00\00\00\02\00\00\00\02\00\00\00\02\00\00\00\02\00\00\00\02\00\00\00\0b\00\00\00\00\00\00\00\04\00\00\00\04\00\00\00\0c\00\00\00\0d\00\00\00\0c\00\00\00\04\00\00\00\0e\00\00\00\0f\00\00\00\10\00\00\00\19\02\10\00I\00\00\00\88\02\00\00\11\00\00\00\0d\00\00\00\0c\00\00\00\04\00\00\00\11\00\00\00\12\00\00\00\13\00\00\00\0d\00\00\00\0c\00\00\00\04\00\00\00\14\00\00\00\15\00\00\00\16\00\00\00\0d\05\10\00*\00\00\00\14\00\00\00\02\00\00\00L\09\10\00\cc\01\10\00L\00\00\00\16\01\00\00.\00\00\00\17\00\00\00\0c\00\00\00\04\00\00\00\18\00\00\00\19\00\00\00\1a\00\00\00\00\00\00\00\08\00\00\00\04\00\00\00\1b\00\00\00\1c\00\00\00\1d\00\00\00\1e\00\00\00\1f\00\00\00\10\00\00\00\04\00\00\00 \00\00\00!\00\00\00\22\00\00\00#\00\00\00o\01\10\00\5c\00\00\00\13\00\00\00\09\00\00\00\19\02\10\00I\00\00\00Z\06\00\00\0d\00\00\00\01\03\10\00X\00\00\00\1f\00\00\00\0d\00\00\00\19\02\10\00I\00\00\00X\06\00\00 \00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00$\00\00\00%\00\00\00&\00\00\00'\00\00\00(\00\00\00)\00\00\00\09\00\00\00*\00\00\00\0c\00\00\00\04\00\00\00+\00\00\00,\00\00\00-\00\00\00.\00\00\00/\00\00\000\00\00\001\00\00\00\9f\06\10\00\1c\00\00\00\17\00\00\00\02\00\00\00T\0a\10\00\b4\02\10\00L\00\00\00&\00\00\00\0d\00\00\00\00\00\00\00\08\00\00\00\04\00\00\002\00\00\00\17\00\00\00\0c\00\00\00\04\00\00\003\00\00\00\19\02\10\00I\00\00\00Y\07\00\00$\00\00\004\00\00\004\00\00\004\00\00\004\00\00\004\00\00\004\00\00\004\00\00\004\00\00\004\00\00\004\00\00\004\00\00\004\00\00\004\00\00\004\00\00\004\00\00\004\00\00\004\00\00\004\00\00\004\00\00\004\00\00\004\00\00\004\00\00\004\00\00\004\00\00\004\00\00\004\00\00\004\00\00\004\00\00\004\00\00\004\00\00\004\00\00\00\ff\ff\ff\ffZ\03\10\005\00\00\006\00\00\007\00\00\00\00\00\00\008\00\00\00\00\00\00\00\00\00\00\00\00\00\00\009\00\00\00\00\00\00\00:\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00c\02\10\00P\00\00\00\1c\00\00\00\05\00\00\00;\00\00\00\0c\00\00\00\04\00\00\00<\00\00\00=\00\00\00>\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00?\00\00\00&\01\10\00H\00\00\00\8f\02\00\00\0e\00\00\00\d7\07\10\00\d9\07\10\00\db\07\10\00")
    (@producers
      (language "Rust" "")
      (language "C11" "")
      (processed-by "rustc" "1.95.0-nightly (0376d43d4 2026-02-20)")
      (processed-by "clang" "21.1.4-wasi-sdk (https://github.com/llvm/llvm-project 222fc11f2b8f25f6a0f4976272ef1bb7bf49521d)")
      (processed-by "wit-component" "0.244.0")
      (processed-by "wit-bindgen-rust" "0.45.0")
      (processed-by "wit-bindgen-c" "0.51.0")
    )
    (@custom "target_features" (after data) "\09+\0bbulk-memory+\0fbulk-memory-opt+\16call-indirect-overlong+\0eextended-const+\0amultivalue+\0fmutable-globals+\13nontrapping-fptoint+\0freference-types+\08sign-ext")
  )
  (core module $wit-component-shim-module (;1;)
    (type (;0;) (func (param i32)))
    (type (;1;) (func (param i32 i32 i32 i32 i32 i32 i32 i32)))
    (type (;2;) (func (param i32)))
    (type (;3;) (func (param i32 i32)))
    (type (;4;) (func (param i32 i32)))
    (type (;5;) (func (param i32 i32 i32 i32)))
    (table (;0;) 12 12 funcref)
    (export "0" (func 0))
    (export "1" (func 1))
    (export "2" (func 2))
    (export "3" (func 3))
    (export "4" (func 4))
    (export "5" (func 5))
    (export "6" (func 6))
    (export "7" (func 7))
    (export "8" (func 8))
    (export "9" (func 9))
    (export "10" (func 10))
    (export "11" (func 11))
    (export "$imports" (table 0))
    (func (;0;) (type 0) (param i32)
      local.get 0
      i32.const 0
      call_indirect (type 0)
    )
    (func (;1;) (type 1) (param i32 i32 i32 i32 i32 i32 i32 i32)
      local.get 0
      local.get 1
      local.get 2
      local.get 3
      local.get 4
      local.get 5
      local.get 6
      local.get 7
      i32.const 1
      call_indirect (type 1)
    )
    (func (;2;) (type 2) (param i32)
      local.get 0
      i32.const 2
      call_indirect (type 2)
    )
    (func (;3;) (type 3) (param i32 i32)
      local.get 0
      local.get 1
      i32.const 3
      call_indirect (type 3)
    )
    (func (;4;) (type 0) (param i32)
      local.get 0
      i32.const 4
      call_indirect (type 0)
    )
    (func (;5;) (type 4) (param i32 i32)
      local.get 0
      local.get 1
      i32.const 5
      call_indirect (type 4)
    )
    (func (;6;) (type 5) (param i32 i32 i32 i32)
      local.get 0
      local.get 1
      local.get 2
      local.get 3
      i32.const 6
      call_indirect (type 5)
    )
    (func (;7;) (type 4) (param i32 i32)
      local.get 0
      local.get 1
      i32.const 7
      call_indirect (type 4)
    )
    (func (;8;) (type 0) (param i32)
      local.get 0
      i32.const 8
      call_indirect (type 0)
    )
    (func (;9;) (type 0) (param i32)
      local.get 0
      i32.const 9
      call_indirect (type 0)
    )
    (func (;10;) (type 0) (param i32)
      local.get 0
      i32.const 10
      call_indirect (type 0)
    )
    (func (;11;) (type 0) (param i32)
      local.get 0
      i32.const 11
      call_indirect (type 0)
    )
    (@producers
      (processed-by "wit-component" "0.243.0")
    )
  )
  (core module $wit-component-fixup (;2;)
    (type (;0;) (func (param i32)))
    (type (;1;) (func (param i32 i32 i32 i32 i32 i32 i32 i32)))
    (type (;2;) (func (param i32)))
    (type (;3;) (func (param i32 i32)))
    (type (;4;) (func (param i32 i32)))
    (type (;5;) (func (param i32 i32 i32 i32)))
    (import "" "0" (func (;0;) (type 0)))
    (import "" "1" (func (;1;) (type 1)))
    (import "" "2" (func (;2;) (type 2)))
    (import "" "3" (func (;3;) (type 3)))
    (import "" "4" (func (;4;) (type 0)))
    (import "" "5" (func (;5;) (type 4)))
    (import "" "6" (func (;6;) (type 5)))
    (import "" "7" (func (;7;) (type 4)))
    (import "" "8" (func (;8;) (type 0)))
    (import "" "9" (func (;9;) (type 0)))
    (import "" "10" (func (;10;) (type 0)))
    (import "" "11" (func (;11;) (type 0)))
    (import "" "$imports" (table (;0;) 12 12 funcref))
    (elem (;0;) (i32.const 0) func 0 1 2 3 4 5 6 7 8 9 10 11)
    (@producers
      (processed-by "wit-component" "0.243.0")
    )
  )
  (core instance $wit-component-shim-instance (;0;) (instantiate $wit-component-shim-module))
  (alias core export $wit-component-shim-instance "0" (core func $indirect-wasi:otel/tracing@0.2.0-rc.1-outer-span-context (;0;)))
  (alias core export $wit-component-shim-instance "1" (core func $indirect-wasi:otel/tracing@0.2.0-rc.1-on-start (;1;)))
  (alias core export $wit-component-shim-instance "2" (core func $indirect-wasi:otel/tracing@0.2.0-rc.1-on-end (;2;)))
  (core instance $wasi:otel/tracing@0.2.0-rc.1 (;1;)
    (export "outer-span-context" (func $indirect-wasi:otel/tracing@0.2.0-rc.1-outer-span-context))
    (export "on-start" (func $indirect-wasi:otel/tracing@0.2.0-rc.1-on-start))
    (export "on-end" (func $indirect-wasi:otel/tracing@0.2.0-rc.1-on-end))
  )
  (alias export $wasi:random/random@0.2.10 "get-random-u64" (func $get-random-u64 (;0;)))
  (core func $get-random-u64 (;3;) (canon lower (func $get-random-u64)))
  (core instance $wasi:random/random@0.2.10 (;2;)
    (export "get-random-u64" (func $get-random-u64))
  )
  (alias core export $wit-component-shim-instance "3" (core func $indirect-nebula:playground/logging-log (;4;)))
  (core instance $nebula:playground/logging (;3;)
    (export "log" (func $indirect-nebula:playground/logging-log))
  )
  (alias core export $wit-component-shim-instance "4" (core func $indirect-wasi:clocks/wall-clock@0.2.0-now (;5;)))
  (core instance $wasi:clocks/wall-clock@0.2.0 (;4;)
    (export "now" (func $indirect-wasi:clocks/wall-clock@0.2.0-now))
  )
  (alias export $wasi:io/error@0.2.6 "error" (type $"#type29 error" (@name "error") (;29;)))
  (core func $resource.drop (;6;) (canon resource.drop $"#type29 error"))
  (core instance $wasi:io/error@0.2.0 (;5;)
    (export "[resource-drop]error" (func $resource.drop))
  )
  (alias export $wasi:io/poll@0.2.6 "pollable" (type $"#type30 pollable" (@name "pollable") (;30;)))
  (core func $"#core-func7 resource.drop" (@name "resource.drop") (;7;) (canon resource.drop $"#type30 pollable"))
  (alias export $wasi:io/poll@0.2.6 "[method]pollable.block" (func $"[method]pollable.block" (;1;)))
  (core func $"[method]pollable.block" (;8;) (canon lower (func $"[method]pollable.block")))
  (core instance $wasi:io/poll@0.2.0 (;6;)
    (export "[resource-drop]pollable" (func $"#core-func7 resource.drop"))
    (export "[method]pollable.block" (func $"[method]pollable.block"))
  )
  (alias export $wasi:io/streams@0.2.6 "input-stream" (type $"#type31 input-stream" (@name "input-stream") (;31;)))
  (core func $"#core-func9 resource.drop" (@name "resource.drop") (;9;) (canon resource.drop $"#type31 input-stream"))
  (alias export $wasi:io/streams@0.2.6 "output-stream" (type $"#type32 output-stream" (@name "output-stream") (;32;)))
  (core func $"#core-func10 resource.drop" (@name "resource.drop") (;10;) (canon resource.drop $"#type32 output-stream"))
  (alias core export $wit-component-shim-instance "5" (core func $"indirect-wasi:io/streams@0.2.0-[method]output-stream.check-write" (;11;)))
  (alias core export $wit-component-shim-instance "6" (core func $"indirect-wasi:io/streams@0.2.0-[method]output-stream.write" (;12;)))
  (alias core export $wit-component-shim-instance "7" (core func $"indirect-wasi:io/streams@0.2.0-[method]output-stream.blocking-flush" (;13;)))
  (alias export $wasi:io/streams@0.2.6 "[method]output-stream.subscribe" (func $"[method]output-stream.subscribe" (;2;)))
  (core func $"[method]output-stream.subscribe" (;14;) (canon lower (func $"[method]output-stream.subscribe")))
  (core instance $wasi:io/streams@0.2.0 (;7;)
    (export "[resource-drop]input-stream" (func $"#core-func9 resource.drop"))
    (export "[resource-drop]output-stream" (func $"#core-func10 resource.drop"))
    (export "[method]output-stream.check-write" (func $"indirect-wasi:io/streams@0.2.0-[method]output-stream.check-write"))
    (export "[method]output-stream.write" (func $"indirect-wasi:io/streams@0.2.0-[method]output-stream.write"))
    (export "[method]output-stream.blocking-flush" (func $"indirect-wasi:io/streams@0.2.0-[method]output-stream.blocking-flush"))
    (export "[method]output-stream.subscribe" (func $"[method]output-stream.subscribe"))
  )
  (alias export $wasi:cli/terminal-input@0.2.6 "terminal-input" (type $"#type33 terminal-input" (@name "terminal-input") (;33;)))
  (core func $"#core-func15 resource.drop" (@name "resource.drop") (;15;) (canon resource.drop $"#type33 terminal-input"))
  (core instance $wasi:cli/terminal-input@0.2.0 (;8;)
    (export "[resource-drop]terminal-input" (func $"#core-func15 resource.drop"))
  )
  (alias export $wasi:cli/terminal-output@0.2.6 "terminal-output" (type $"#type34 terminal-output" (@name "terminal-output") (;34;)))
  (core func $"#core-func16 resource.drop" (@name "resource.drop") (;16;) (canon resource.drop $"#type34 terminal-output"))
  (core instance $wasi:cli/terminal-output@0.2.0 (;9;)
    (export "[resource-drop]terminal-output" (func $"#core-func16 resource.drop"))
  )
  (alias core export $wit-component-shim-instance "8" (core func $indirect-wasi:cli/environment@0.2.0-get-environment (;17;)))
  (core instance $wasi:cli/environment@0.2.0 (;10;)
    (export "get-environment" (func $indirect-wasi:cli/environment@0.2.0-get-environment))
  )
  (alias export $wasi:cli/exit@0.2.6 "exit" (func $exit (;3;)))
  (core func $exit (;18;) (canon lower (func $exit)))
  (core instance $wasi:cli/exit@0.2.0 (;11;)
    (export "exit" (func $exit))
  )
  (alias export $wasi:cli/stdin@0.2.6 "get-stdin" (func $get-stdin (;4;)))
  (core func $get-stdin (;19;) (canon lower (func $get-stdin)))
  (core instance $wasi:cli/stdin@0.2.0 (;12;)
    (export "get-stdin" (func $get-stdin))
  )
  (alias export $wasi:cli/stdout@0.2.6 "get-stdout" (func $get-stdout (;5;)))
  (core func $get-stdout (;20;) (canon lower (func $get-stdout)))
  (core instance $wasi:cli/stdout@0.2.0 (;13;)
    (export "get-stdout" (func $get-stdout))
  )
  (alias export $wasi:cli/stderr@0.2.6 "get-stderr" (func $get-stderr (;6;)))
  (core func $get-stderr (;21;) (canon lower (func $get-stderr)))
  (core instance $wasi:cli/stderr@0.2.0 (;14;)
    (export "get-stderr" (func $get-stderr))
  )
  (alias core export $wit-component-shim-instance "9" (core func $indirect-wasi:cli/terminal-stdin@0.2.0-get-terminal-stdin (;22;)))
  (core instance $wasi:cli/terminal-stdin@0.2.0 (;15;)
    (export "get-terminal-stdin" (func $indirect-wasi:cli/terminal-stdin@0.2.0-get-terminal-stdin))
  )
  (alias core export $wit-component-shim-instance "10" (core func $indirect-wasi:cli/terminal-stdout@0.2.0-get-terminal-stdout (;23;)))
  (core instance $wasi:cli/terminal-stdout@0.2.0 (;16;)
    (export "get-terminal-stdout" (func $indirect-wasi:cli/terminal-stdout@0.2.0-get-terminal-stdout))
  )
  (alias core export $wit-component-shim-instance "11" (core func $indirect-wasi:cli/terminal-stderr@0.2.0-get-terminal-stderr (;24;)))
  (core instance $wasi:cli/terminal-stderr@0.2.0 (;17;)
    (export "get-terminal-stderr" (func $indirect-wasi:cli/terminal-stderr@0.2.0-get-terminal-stderr))
  )
  (core instance $main (;18;) (instantiate $main
      (with "wasi:otel/tracing@0.2.0-rc.1" (instance $wasi:otel/tracing@0.2.0-rc.1))
      (with "wasi:random/random@0.2.10" (instance $wasi:random/random@0.2.10))
      (with "nebula:playground/logging" (instance $nebula:playground/logging))
      (with "wasi:clocks/wall-clock@0.2.0" (instance $wasi:clocks/wall-clock@0.2.0))
      (with "wasi:io/error@0.2.0" (instance $wasi:io/error@0.2.0))
      (with "wasi:io/poll@0.2.0" (instance $wasi:io/poll@0.2.0))
      (with "wasi:io/streams@0.2.0" (instance $wasi:io/streams@0.2.0))
      (with "wasi:cli/terminal-input@0.2.0" (instance $wasi:cli/terminal-input@0.2.0))
      (with "wasi:cli/terminal-output@0.2.0" (instance $wasi:cli/terminal-output@0.2.0))
      (with "wasi:cli/environment@0.2.0" (instance $wasi:cli/environment@0.2.0))
      (with "wasi:cli/exit@0.2.0" (instance $wasi:cli/exit@0.2.0))
      (with "wasi:cli/stdin@0.2.0" (instance $wasi:cli/stdin@0.2.0))
      (with "wasi:cli/stdout@0.2.0" (instance $wasi:cli/stdout@0.2.0))
      (with "wasi:cli/stderr@0.2.0" (instance $wasi:cli/stderr@0.2.0))
      (with "wasi:cli/terminal-stdin@0.2.0" (instance $wasi:cli/terminal-stdin@0.2.0))
      (with "wasi:cli/terminal-stdout@0.2.0" (instance $wasi:cli/terminal-stdout@0.2.0))
      (with "wasi:cli/terminal-stderr@0.2.0" (instance $wasi:cli/terminal-stderr@0.2.0))
    )
  )
  (alias core export $main "memory" (core memory $memory (;0;)))
  (alias core export $wit-component-shim-instance "$imports" (core table $"shim table" (;0;)))
  (alias export $wasi:otel/tracing@0.2.0-rc.1 "outer-span-context" (func $outer-span-context (;7;)))
  (alias core export $main "cabi_realloc" (core func $realloc (;25;)))
  (core func $"#core-func26 indirect-wasi:otel/tracing@0.2.0-rc.1-outer-span-context" (@name "indirect-wasi:otel/tracing@0.2.0-rc.1-outer-span-context") (;26;) (canon lower (func $outer-span-context) (memory $memory) (realloc $realloc) string-encoding=utf8))
  (alias export $wasi:otel/tracing@0.2.0-rc.1 "on-start" (func $on-start (;8;)))
  (core func $"#core-func27 indirect-wasi:otel/tracing@0.2.0-rc.1-on-start" (@name "indirect-wasi:otel/tracing@0.2.0-rc.1-on-start") (;27;) (canon lower (func $on-start) (memory $memory) string-encoding=utf8))
  (alias export $wasi:otel/tracing@0.2.0-rc.1 "on-end" (func $on-end (;9;)))
  (core func $"#core-func28 indirect-wasi:otel/tracing@0.2.0-rc.1-on-end" (@name "indirect-wasi:otel/tracing@0.2.0-rc.1-on-end") (;28;) (canon lower (func $on-end) (memory $memory) string-encoding=utf8))
  (alias export $nebula:playground/logging "log" (func $log (;10;)))
  (core func $"#core-func29 indirect-nebula:playground/logging-log" (@name "indirect-nebula:playground/logging-log") (;29;) (canon lower (func $log) (memory $memory) string-encoding=utf8))
  (alias export $wasi:clocks/wall-clock@0.2.6 "now" (func $now (;11;)))
  (core func $"#core-func30 indirect-wasi:clocks/wall-clock@0.2.0-now" (@name "indirect-wasi:clocks/wall-clock@0.2.0-now") (;30;) (canon lower (func $now) (memory $memory)))
  (alias export $wasi:io/streams@0.2.6 "[method]output-stream.check-write" (func $"[method]output-stream.check-write" (;12;)))
  (core func $"#core-func31 indirect-wasi:io/streams@0.2.0-[method]output-stream.check-write" (@name "indirect-wasi:io/streams@0.2.0-[method]output-stream.check-write") (;31;) (canon lower (func $"[method]output-stream.check-write") (memory $memory)))
  (alias export $wasi:io/streams@0.2.6 "[method]output-stream.write" (func $"[method]output-stream.write" (;13;)))
  (core func $"#core-func32 indirect-wasi:io/streams@0.2.0-[method]output-stream.write" (@name "indirect-wasi:io/streams@0.2.0-[method]output-stream.write") (;32;) (canon lower (func $"[method]output-stream.write") (memory $memory)))
  (alias export $wasi:io/streams@0.2.6 "[method]output-stream.blocking-flush" (func $"[method]output-stream.blocking-flush" (;14;)))
  (core func $"#core-func33 indirect-wasi:io/streams@0.2.0-[method]output-stream.blocking-flush" (@name "indirect-wasi:io/streams@0.2.0-[method]output-stream.blocking-flush") (;33;) (canon lower (func $"[method]output-stream.blocking-flush") (memory $memory)))
  (alias export $wasi:cli/environment@0.2.6 "get-environment" (func $get-environment (;15;)))
  (core func $"#core-func34 indirect-wasi:cli/environment@0.2.0-get-environment" (@name "indirect-wasi:cli/environment@0.2.0-get-environment") (;34;) (canon lower (func $get-environment) (memory $memory) (realloc $realloc) string-encoding=utf8))
  (alias export $wasi:cli/terminal-stdin@0.2.6 "get-terminal-stdin" (func $get-terminal-stdin (;16;)))
  (core func $"#core-func35 indirect-wasi:cli/terminal-stdin@0.2.0-get-terminal-stdin" (@name "indirect-wasi:cli/terminal-stdin@0.2.0-get-terminal-stdin") (;35;) (canon lower (func $get-terminal-stdin) (memory $memory)))
  (alias export $wasi:cli/terminal-stdout@0.2.6 "get-terminal-stdout" (func $get-terminal-stdout (;17;)))
  (core func $"#core-func36 indirect-wasi:cli/terminal-stdout@0.2.0-get-terminal-stdout" (@name "indirect-wasi:cli/terminal-stdout@0.2.0-get-terminal-stdout") (;36;) (canon lower (func $get-terminal-stdout) (memory $memory)))
  (alias export $wasi:cli/terminal-stderr@0.2.6 "get-terminal-stderr" (func $get-terminal-stderr (;18;)))
  (core func $"#core-func37 indirect-wasi:cli/terminal-stderr@0.2.0-get-terminal-stderr" (@name "indirect-wasi:cli/terminal-stderr@0.2.0-get-terminal-stderr") (;37;) (canon lower (func $get-terminal-stderr) (memory $memory)))
  (core instance $fixup-args (;19;)
    (export "$imports" (table $"shim table"))
    (export "0" (func $"#core-func26 indirect-wasi:otel/tracing@0.2.0-rc.1-outer-span-context"))
    (export "1" (func $"#core-func27 indirect-wasi:otel/tracing@0.2.0-rc.1-on-start"))
    (export "2" (func $"#core-func28 indirect-wasi:otel/tracing@0.2.0-rc.1-on-end"))
    (export "3" (func $"#core-func29 indirect-nebula:playground/logging-log"))
    (export "4" (func $"#core-func30 indirect-wasi:clocks/wall-clock@0.2.0-now"))
    (export "5" (func $"#core-func31 indirect-wasi:io/streams@0.2.0-[method]output-stream.check-write"))
    (export "6" (func $"#core-func32 indirect-wasi:io/streams@0.2.0-[method]output-stream.write"))
    (export "7" (func $"#core-func33 indirect-wasi:io/streams@0.2.0-[method]output-stream.blocking-flush"))
    (export "8" (func $"#core-func34 indirect-wasi:cli/environment@0.2.0-get-environment"))
    (export "9" (func $"#core-func35 indirect-wasi:cli/terminal-stdin@0.2.0-get-terminal-stdin"))
    (export "10" (func $"#core-func36 indirect-wasi:cli/terminal-stdout@0.2.0-get-terminal-stdout"))
    (export "11" (func $"#core-func37 indirect-wasi:cli/terminal-stderr@0.2.0-get-terminal-stderr"))
  )
  (core instance $fixup (;20;) (instantiate $wit-component-fixup
      (with "" (instance $fixup-args))
    )
  )
  (type (;35;) (func (param "msg" string)))
  (alias core export $main "nebula:playground/logging#log" (core func $nebula:playground/logging#log (;38;)))
  (func $"#func19 log" (@name "log") (;19;) (type 35) (canon lift (core func $nebula:playground/logging#log) (memory $memory) (realloc $realloc) string-encoding=utf8))
  (component $nebula:playground/logging-shim-component (;0;)
    (type (;0;) (func (param "msg" string)))
    (import "import-func-log" (func (;0;) (type 0)))
    (type (;1;) (func (param "msg" string)))
    (export (;1;) "log" (func 0) (func (type 1)))
  )
  (instance $nebula:playground/logging-shim-instance (;18;) (instantiate $nebula:playground/logging-shim-component
      (with "import-func-log" (func $"#func19 log"))
    )
  )
  (export $"#instance19 nebula:playground/logging" (@name "nebula:playground/logging") (;19;) "nebula:playground/logging" (instance $nebula:playground/logging-shim-instance))
  (@producers
    (processed-by "wit-component" "0.243.0")
  )
)
