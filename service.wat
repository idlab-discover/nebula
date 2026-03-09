(component
  (type $ty-wasi:otel/types@0.3.0 (;0;)
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
  (import "wasi:otel/types@0.3.0" (instance $wasi:otel/types@0.3.0 (;0;) (type $ty-wasi:otel/types@0.3.0)))
  (type $ty-wasi:clocks/wall-clock@0.2.10 (;1;)
    (instance
      (type (;0;) (record (field "seconds" u64) (field "nanoseconds" u32)))
      (export (;1;) "datetime" (type (eq 0)))
      (type (;2;) (func (result 1)))
      (export (;0;) "now" (func (type 2)))
    )
  )
  (import "wasi:clocks/wall-clock@0.2.10" (instance $wasi:clocks/wall-clock@0.2.10 (;1;) (type $ty-wasi:clocks/wall-clock@0.2.10)))
  (alias export $wasi:clocks/wall-clock@0.2.10 "datetime" (type $datetime (;2;)))
  (alias export $wasi:otel/types@0.3.0 "key-value" (type $key-value (;3;)))
  (alias export $wasi:otel/types@0.3.0 "instrumentation-scope" (type $instrumentation-scope (;4;)))
  (type $ty-wasi:otel/tracing@0.3.0 (;5;)
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
      (export (;2;) "inner-span-context" (func (type 32)))
    )
  )
  (import "wasi:otel/tracing@0.3.0" (instance $wasi:otel/tracing@0.3.0 (;2;) (type $ty-wasi:otel/tracing@0.3.0)))
  (type $ty-wasi:cli/environment@0.2.10 (;6;)
    (instance
      (type (;0;) (tuple string string))
      (type (;1;) (list 0))
      (type (;2;) (func (result 1)))
      (export (;0;) "get-environment" (func (type 2)))
    )
  )
  (import "wasi:cli/environment@0.2.10" (instance $wasi:cli/environment@0.2.10 (;3;) (type $ty-wasi:cli/environment@0.2.10)))
  (type $ty-wasi:cli/exit@0.2.10 (;7;)
    (instance
      (type (;0;) (result))
      (type (;1;) (func (param "status" 0)))
      (export (;0;) "exit" (func (type 1)))
    )
  )
  (import "wasi:cli/exit@0.2.10" (instance $wasi:cli/exit@0.2.10 (;4;) (type $ty-wasi:cli/exit@0.2.10)))
  (type $ty-wasi:io/error@0.2.10 (;8;)
    (instance
      (export (;0;) "error" (type (sub resource)))
      (type (;1;) (borrow 0))
      (type (;2;) (func (param "self" 1) (result string)))
      (export (;0;) "[method]error.to-debug-string" (func (type 2)))
    )
  )
  (import "wasi:io/error@0.2.10" (instance $wasi:io/error@0.2.10 (;5;) (type $ty-wasi:io/error@0.2.10)))
  (alias export $wasi:io/error@0.2.10 "error" (type $error (;9;)))
  (type $ty-wasi:io/streams@0.2.10 (;10;)
    (instance
      (export (;0;) "output-stream" (type (sub resource)))
      (alias outer 1 $error (type (;1;)))
      (export (;2;) "error" (type (eq 1)))
      (type (;3;) (own 2))
      (type (;4;) (variant (case "last-operation-failed" 3) (case "closed")))
      (export (;5;) "stream-error" (type (eq 4)))
      (type (;6;) (borrow 0))
      (type (;7;) (list u8))
      (type (;8;) (result (error 5)))
      (type (;9;) (func (param "self" 6) (param "contents" 7) (result 8)))
      (export (;0;) "[method]output-stream.blocking-write-and-flush" (func (type 9)))
    )
  )
  (import "wasi:io/streams@0.2.10" (instance $wasi:io/streams@0.2.10 (;6;) (type $ty-wasi:io/streams@0.2.10)))
  (alias export $wasi:io/streams@0.2.10 "output-stream" (type $output-stream (;11;)))
  (type $ty-wasi:cli/stderr@0.2.10 (;12;)
    (instance
      (alias outer 1 $output-stream (type (;0;)))
      (export (;1;) "output-stream" (type (eq 0)))
      (type (;2;) (own 1))
      (type (;3;) (func (result 2)))
      (export (;0;) "get-stderr" (func (type 3)))
    )
  )
  (import "wasi:cli/stderr@0.2.10" (instance $wasi:cli/stderr@0.2.10 (;7;) (type $ty-wasi:cli/stderr@0.2.10)))
  (type $ty-wasi:random/random@0.2.10 (;13;)
    (instance
      (type (;0;) (func (result u64)))
      (export (;0;) "get-random-u64" (func (type 0)))
    )
  )
  (import "wasi:random/random@0.2.10" (instance $wasi:random/random@0.2.10 (;8;) (type $ty-wasi:random/random@0.2.10)))
  (type $ty-nebula:core/types (;14;)
    (instance
      (type (;0;) (record (field "sku" string) (field "quantity" u32) (field "unit-price" f64)))
      (export (;1;) "item" (type (eq 0)))
      (type (;2;) (enum "BE" "US" "UK" "JP" "CA" "AU"))
      (export (;3;) "country" (type (eq 2)))
      (type (;4;) (list 1))
      (type (;5;) (record (field "order-id" string) (field "items" 4) (field "destination" 3)))
      (export (;6;) "order" (type (eq 5)))
      (type (;7;) (enum "EUR" "USD" "GBP" "JPY" "CAD" "AUD"))
      (export (;8;) "currency" (type (eq 7)))
      (type (;9;) (record (field "order-id" string) (field "subtotal" f64) (field "tax" f64) (field "total" f64) (field "currency" 8)))
      (export (;10;) "quote" (type (eq 9)))
    )
  )
  (import "nebula:core/types" (instance $nebula:core/types (;9;) (type $ty-nebula:core/types)))
  (core module $main (;0;)
    (type (;0;) (func (param i32)))
    (type (;1;) (func (param i32 i32 i32 i32)))
    (type (;2;) (func (param i32 i32 i32) (result i32)))
    (type (;3;) (func (param i32 i32)))
    (type (;4;) (func (param i32 i32) (result i32)))
    (type (;5;) (func (param i32 i32 i32 i32 i32 i32 i32 i32)))
    (type (;6;) (func (result i64)))
    (type (;7;) (func (result i32)))
    (type (;8;) (func))
    (type (;9;) (func (param i32 i32 i32)))
    (type (;10;) (func (param i32 i32 i32 i32 i32) (result i32)))
    (type (;11;) (func (param i32 i32 i32 i32) (result i32)))
    (type (;12;) (func (param i32 i32 i32 i32 i32 i32)))
    (type (;13;) (func (param i32 i32 i32 i32 i32)))
    (type (;14;) (func (param i32) (result i32)))
    (type (;15;) (func (param i32 i32 i32 i32 i32 i32) (result i32)))
    (type (;16;) (func (param i64 i32 i32) (result i32)))
    (import "wasi:clocks/wall-clock@0.2.0" "now" (func $_ZN19wasi_otel_framework8bindings4wasi6clocks10wall_clock3now11wit_import117hb66951f66f60100aE (;0;) (type 0)))
    (import "wasi:otel/tracing@0.3.0" "inner-span-context" (func $_ZN19wasi_otel_framework8bindings4wasi4otel7tracing18inner_span_context11wit_import117h78ff5038b43e1c94E (;1;) (type 0)))
    (import "wasi:otel/tracing@0.3.0" "on-end" (func $_ZN19wasi_otel_framework8bindings4wasi4otel7tracing6on_end12wit_import4917h6482987a27b942d2E (;2;) (type 0)))
    (import "wasi:otel/tracing@0.3.0" "on-start" (func $_ZN19wasi_otel_framework8bindings4wasi4otel7tracing8on_start11wit_import817h86df23d22f8aa9d5E (;3;) (type 5)))
    (import "wasi:random/random@0.2.10" "get-random-u64" (func $_ZN19wasi_otel_framework8bindings4wasi6random6random14get_random_u6411wit_import017h50e264afebc109d0E (;4;) (type 6)))
    (import "wasi:io/error@0.2.4" "[resource-drop]error" (func $_ZN90_$LT$wasi..imports..wasi..io..error..Error$u20$as$u20$wasi..imports.._rt..WasmResource$GT$4drop4drop17h054f8123dd94d3f0E (;5;) (type 0)))
    (import "wasi:io/streams@0.2.4" "[resource-drop]output-stream" (func $_ZN99_$LT$wasi..imports..wasi..io..streams..OutputStream$u20$as$u20$wasi..imports.._rt..WasmResource$GT$4drop4drop17hbe32e132e65d9c15E (;6;) (type 0)))
    (import "wasi:io/error@0.2.4" "[method]error.to-debug-string" (func $_ZN4wasi7imports4wasi2io5error5Error15to_debug_string11wit_import117h9d9a5f1784e054faE (;7;) (type 3)))
    (import "wasi:io/streams@0.2.4" "[method]output-stream.blocking-write-and-flush" (func $_ZN4wasi7imports4wasi2io7streams12OutputStream24blocking_write_and_flush11wit_import217hbd93b4a2527fec3cE (;8;) (type 1)))
    (import "wasi:cli/stderr@0.2.4" "get-stderr" (func $_ZN4wasi7imports4wasi3cli6stderr10get_stderr11wit_import017h6870e353e73ca545E (;9;) (type 7)))
    (import "wasi_snapshot_preview1" "environ_get" (func $__imported_wasi_snapshot_preview1_environ_get (;10;) (type 4)))
    (import "wasi_snapshot_preview1" "environ_sizes_get" (func $__imported_wasi_snapshot_preview1_environ_sizes_get (;11;) (type 4)))
    (import "wasi_snapshot_preview1" "proc_exit" (func $__imported_wasi_snapshot_preview1_proc_exit (;12;) (type 0)))
    (table (;0;) 75 75 funcref)
    (memory (;0;) 17)
    (global $__stack_pointer (;0;) (mut i32) i32.const 1048576)
    (global $GOT.data.internal.__memory_base (;1;) i32 i32.const 0)
    (global $GOT.func.internal._ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$u64$GT$3fmt17h8c687a3c8e01ab2bE (;2;) i32 i32.const 6)
    (global $GOT.func.internal._ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hd03bfcbf982015daE (;3;) i32 i32.const 7)
    (global $GOT.data.internal.errno (;4;) i32 i32.const 1055620)
    (global $GOT.func.internal._ZN98_$LT$std..sys..backtrace..BacktraceLock..print..DisplayBacktrace$u20$as$u20$core..fmt..Display$GT$3fmt17h4f6d4799b2b7b52dE (;5;) i32 i32.const 8)
    (global $GOT.data.internal._ZN3std5alloc4HOOK17hdf04194545af820fE (;6;) i32 i32.const 1055060)
    (global $GOT.func.internal._ZN3std5alloc24default_alloc_error_hook17h2659b1d5d338bd49E (;7;) i32 i32.const 9)
    (global $GOT.data.internal._ZN3std4sync4mpmc5waker17current_thread_id5DUMMY28_$u7b$$u7b$closure$u7d$$u7d$23__RUST_STD_INTERNAL_VAL17h53e402bde3b3a265E (;8;) i32 i32.const 1050736)
    (global $GOT.func.internal._ZN4core3fmt3num3imp54_$LT$impl$u20$core..fmt..Display$u20$for$u20$usize$GT$3fmt17hb1e87ec93de10a7dE (;9;) i32 i32.const 7)
    (global $GOT.data.internal.__table_base (;10;) i32 i32.const 1)
    (global $GOT.data.internal._ZN3std6thread7current2id2ID17hd09cf30819d507a8E (;11;) i32 i32.const 1055088)
    (global $GOT.func.internal._ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u64$GT$3fmt17h05089fcc125d9651E (;12;) i32 i32.const 13)
    (global $GOT.data.internal._ZN3std9panicking4HOOK17hfef601ed666ffdf2E (;13;) i32 i32.const 1055112)
    (global $GOT.data.internal._ZN3std9panicking11panic_count18GLOBAL_PANIC_COUNT17h95c275c59ddc0e59E (;14;) i32 i32.const 1055108)
    (global $GOT.data.internal._ZN3std6thread7current7CURRENT17hbf0d355f6c760390E (;15;) i32 i32.const 1055096)
    (global $GOT.func.internal._ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h4faf6c8527f1f06dE (;16;) i32 i32.const 72)
    (global $GOT.func.internal._ZN59_$LT$core..fmt..Arguments$u20$as$u20$core..fmt..Display$GT$3fmt17h06c2e0a1010e36c0E (;17;) i32 i32.const 74)
    (export "memory" (memory 0))
    (export "cabi_post_nebula:service/orders#create-order" (func $cabi_post_nebula:service/orders#create-order))
    (export "cabi_post_nebula:service/orders#read-order" (func $cabi_post_nebula:service/orders#read-order))
    (export "cabi_post_nebula:service/quotes#read-quote" (func $cabi_post_nebula:service/quotes#read-quote))
    (export "nebula:service/orders#create-order" (func $nebula:service/orders#create-order))
    (export "nebula:service/orders#delete-order" (func $nebula:service/orders#delete-order))
    (export "nebula:service/orders#read-order" (func $nebula:service/orders#read-order))
    (export "nebula:service/quotes#read-quote" (func $nebula:service/quotes#read-quote))
    (export "nebula:service/quotes#delete-quote" (func $nebula:service/orders#delete-order))
    (export "cabi_realloc" (func $cabi_realloc))
    (elem (;0;) (i32.const 1) func $_ZN7service40__link_custom_section_describing_imports17hc4f0cd52a31e1a80E $_ZN4core3ops8function6FnOnce9call_once17h942ef4decb5cc499E $_ZN69_$LT$core..alloc..layout..LayoutError$u20$as$u20$core..fmt..Debug$GT$3fmt17h18134a55c355799fE $_ZN19wasi_otel_framework8bindings40__link_custom_section_describing_imports17h47b89179910ce58fE $_ZN69_$LT$core..alloc..layout..LayoutError$u20$as$u20$core..fmt..Debug$GT$3fmt17h18134a55c355799fE.llvm.4771902097668336220 $_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$u64$GT$3fmt17h8c687a3c8e01ab2bE $_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hd03bfcbf982015daE $_ZN98_$LT$std..sys..backtrace..BacktraceLock..print..DisplayBacktrace$u20$as$u20$core..fmt..Display$GT$3fmt17h4f6d4799b2b7b52dE $_ZN3std5alloc24default_alloc_error_hook17h2659b1d5d338bd49E $_ZN3std2io5Write9write_fmt17hd7ee7125c0996452E $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h37bd321e32e301c5E $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h5172e20917525128E $_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u64$GT$3fmt17h05089fcc125d9651E $_ZN52_$LT$$RF$mut$u20$T$u20$as$u20$core..fmt..Display$GT$3fmt17hf8424e5fb260dfb5E $cabi_realloc $_ZN4core3ptr119drop_in_place$LT$std..io..default_write_fmt..Adapter$LT$std..io..cursor..Cursor$LT$$RF$mut$u20$$u5b$u8$u5d$$GT$$GT$$GT$17ha0ba1057ed3e6309E $_ZN81_$LT$std..io..default_write_fmt..Adapter$LT$T$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17h33830f6d5cb80c27E $_ZN4core3fmt5Write10write_char17hea746690382d93f2E $_ZN4core3fmt5Write9write_fmt17h3021d5dae2529369E $_ZN81_$LT$std..io..default_write_fmt..Adapter$LT$T$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17hafaaa404721689d8E $_ZN4core3fmt5Write10write_char17h954a84740e5497b8E $_ZN4core3fmt5Write9write_fmt17hc713ca0a06c37a80E $_ZN81_$LT$std..io..default_write_fmt..Adapter$LT$T$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17hc4aa4d5eb25cd696E $_ZN4core3fmt5Write10write_char17hb22f122c3ef22074E $_ZN4core3fmt5Write9write_fmt17h725e038092ca175cE $_ZN4core3ptr52drop_in_place$LT$std..sys..stdio..wasip2..Stderr$GT$17h50b0dd383b42d473E $_ZN66_$LT$std..sys..stdio..wasip2..Stderr$u20$as$u20$std..io..Write$GT$5write17h1814ddb7f133e501E $_ZN60_$LT$std..io..stdio..StderrRaw$u20$as$u20$std..io..Write$GT$14write_vectored17h29b290aa89f17d92E $_ZN3std2io5Write17is_write_vectored17h8604cbb17a5321ecE $_ZN66_$LT$std..sys..stdio..wasip2..Stderr$u20$as$u20$std..io..Write$GT$5flush17h93674d72d5677f8eE $_ZN3std2io5Write9write_all17hac23022ab680c457E $_ZN3std2io5Write18write_all_vectored17h06aaedb7a82531aeE $_ZN4core3ptr46drop_in_place$LT$alloc..vec..Vec$LT$u8$GT$$GT$17he02b1595bd0dfddfE $_ZN3std2io5impls74_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..vec..Vec$LT$u8$C$A$GT$$GT$5write17he0cf27cb84ab49d9E $_ZN3std2io5impls74_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..vec..Vec$LT$u8$C$A$GT$$GT$14write_vectored17h8e1f68a403788c08E $_ZN3std2io5impls74_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..vec..Vec$LT$u8$C$A$GT$$GT$17is_write_vectored17hf74e0cc8b03611cfE $_ZN3std2io5impls74_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..vec..Vec$LT$u8$C$A$GT$$GT$5flush17h296411f12eae77deE $_ZN3std2io5impls74_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..vec..Vec$LT$u8$C$A$GT$$GT$9write_all17h3681f71906efd68bE $_ZN3std2io5impls74_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..vec..Vec$LT$u8$C$A$GT$$GT$18write_all_vectored17h7a11db1eaf20f8fdE $_ZN3std2io5Write9write_fmt17hdae18996af61caaeE $_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17h3d6b5769f99f2a0aE $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$9write_str17hb875d0f35d6285acE $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$10write_char17hc9b79da1909ec910E $_ZN4core3fmt5Write9write_fmt17hd3b3048a187f1835E $_ZN4core3ptr71drop_in_place$LT$std..panicking..panic_handler..FormatStringPayload$GT$17h1d9ce7995872d0d8E $_ZN89_$LT$std..panicking..panic_handler..FormatStringPayload$u20$as$u20$core..fmt..Display$GT$3fmt17hd08c356bd3af9dc6E $_ZN96_$LT$std..panicking..panic_handler..FormatStringPayload$u20$as$u20$core..panic..PanicPayload$GT$8take_box17h7b8701059046b4b9E $_ZN96_$LT$std..panicking..panic_handler..FormatStringPayload$u20$as$u20$core..panic..PanicPayload$GT$3get17h17731e93ea232ebeE $_ZN4core5panic12PanicPayload6as_str17h0c9efca4fec03a8cE $_ZN86_$LT$std..panicking..panic_handler..StaticStrPayload$u20$as$u20$core..fmt..Display$GT$3fmt17h526499ea0f7fb230E $_ZN93_$LT$std..panicking..panic_handler..StaticStrPayload$u20$as$u20$core..panic..PanicPayload$GT$8take_box17h880879ae471a41e6E $_ZN93_$LT$std..panicking..panic_handler..StaticStrPayload$u20$as$u20$core..panic..PanicPayload$GT$3get17h415262167db026e7E $_ZN93_$LT$std..panicking..panic_handler..StaticStrPayload$u20$as$u20$core..panic..PanicPayload$GT$6as_str17he5019975b9fcbc26E $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h842785eb1a8ac275E $_ZN4core3ptr238drop_in_place$LT$alloc..boxed..convert..$LT$impl$u20$core..convert..From$LT$alloc..string..String$GT$$u20$for$u20$alloc..boxed..Box$LT$dyn$u20$core..error..Error$u2b$core..marker..Send$u2b$core..marker..Sync$GT$$GT$..from..StringError$GT$17hecc00a9bfe85effeE $_ZN256_$LT$alloc..boxed..convert..$LT$impl$u20$core..convert..From$LT$alloc..string..String$GT$$u20$for$u20$alloc..boxed..Box$LT$dyn$u20$core..error..Error$u2b$core..marker..Send$u2b$core..marker..Sync$GT$$GT$..from..StringError$u20$as$u20$core..fmt..Display$GT$3fmt17h50809b903e207676E $_ZN254_$LT$alloc..boxed..convert..$LT$impl$u20$core..convert..From$LT$alloc..string..String$GT$$u20$for$u20$alloc..boxed..Box$LT$dyn$u20$core..error..Error$u2b$core..marker..Send$u2b$core..marker..Sync$GT$$GT$..from..StringError$u20$as$u20$core..fmt..Debug$GT$3fmt17ha958d61d3f2fdfd7E $_ZN4core5error5Error5cause17h4c15f6f5fe6b1607E $_ZN4core5error5Error7type_id17hdbeee4edcace8278E $_ZN4core5error5Error11description17he9b90423a0317774E $_ZN4core5error5Error7provide17h47f951971b1c8124E $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17ha60ef7068aaec664E $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h51f289680be1be14E $_ZN4wasi5proxy40__link_custom_section_describing_imports17hf0eabe478194bc4bE $_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17h422152e086181fedE $"#func180 _ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$9write_str17hb875d0f35d6285acE" $"#func178 _ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$10write_char17hc9b79da1909ec910E" $_ZN4core3fmt5Write9write_fmt17h17d844f0b9f21b32E $_ZN53_$LT$core..fmt..Error$u20$as$u20$core..fmt..Debug$GT$3fmt17hf1ca92c1c0b1b4b5E $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h2f052a4d708ff989E $_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h00633e517acb8d0eE $_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h4faf6c8527f1f06dE $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h6e0427a03a9dcc44E $_ZN59_$LT$core..fmt..Arguments$u20$as$u20$core..fmt..Display$GT$3fmt17h06c2e0a1010e36c0E)
    (func $__wasm_call_ctors (;13;) (type 8))
    (func $_ZN3std3sys4sync4once10no_threads4Once4call17hf9af329f3fbf0507E (;14;) (type 0) (param i32)
      (local i32 i32 i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 1
      global.set $__stack_pointer
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              global.get $GOT.data.internal.__memory_base
              i32.const 1053996
              i32.add
              i32.load8_u offset=12
              local.tee 2
              i32.const 2
              i32.lt_u
              br_if 0 (;@4;)
              local.get 2
              i32.const -2
              i32.add
              br_table 1 (;@3;) 3 (;@1;) 1 (;@3;)
            end
            global.get $GOT.data.internal.__memory_base
            i32.const 1053996
            i32.add
            i32.const 2
            i32.store8 offset=12
            local.get 0
            i32.load
            local.set 3
            local.get 0
            i32.const 0
            i32.store
            block ;; label = @4
              local.get 3
              i32.eqz
              br_if 0 (;@4;)
              local.get 2
              i32.const 1
              i32.ne
              br_if 2 (;@2;)
              call $_ZN3std4sync9lazy_lock14panic_poisoned17heacb20ea940fe6a2E
              unreachable
            end
            global.get $GOT.data.internal.__memory_base
            i32.const 1053980
            i32.add
            call $_ZN4core6option13unwrap_failed17h46c842306997fe98E
            unreachable
          end
          global.get $GOT.data.internal.__memory_base
          local.tee 1
          i32.const 1048576
          i32.add
          i32.const 113
          local.get 1
          i32.const 1054044
          i32.add
          call $_ZN4core9panicking9panic_fmt17hd2f72abdb0aff166E
          unreachable
        end
        local.get 1
        i32.const 4
        i32.add
        local.get 3
        i32.load
        call_indirect (type 0)
        local.get 3
        i32.const 8
        i32.add
        local.get 1
        i32.const 4
        i32.add
        i32.const 8
        i32.add
        i32.load
        i32.store
        local.get 3
        local.get 1
        i64.load offset=4 align=4
        i64.store align=4
        global.get $GOT.data.internal.__memory_base
        i32.const 1053996
        i32.add
        i32.const 3
        i32.store8 offset=12
      end
      local.get 1
      i32.const 16
      i32.add
      global.set $__stack_pointer
    )
    (func $_ZN4core3ops8function6FnOnce9call_once17h942ef4decb5cc499E (;15;) (type 0) (param i32)
      local.get 0
      global.get $GOT.data.internal.__memory_base
      i32.const 1050067
      i32.add
      i32.const 20
      call $_ZN19wasi_otel_framework7tracing6Tracer3new17hd1569cf7fd71269dE
    )
    (func $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h43131d19769be0a5E (;16;) (type 0) (param i32)
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
      call $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$14grow_amortized17h050e78310bec9771E
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
        call $_ZN5alloc7raw_vec12handle_error17h9f321253d17717ecE
        unreachable
      end
      local.get 1
      i32.const 16
      i32.add
      global.set $__stack_pointer
    )
    (func $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$14grow_amortized17h050e78310bec9771E (;17;) (type 9) (param i32 i32 i32)
      (local i32 i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 3
      global.set $__stack_pointer
      local.get 3
      i32.const 4
      i32.add
      local.get 1
      i32.load
      local.tee 4
      local.get 1
      i32.load offset=4
      local.get 2
      i32.const 1
      i32.add
      local.tee 2
      local.get 4
      i32.const 1
      i32.shl
      local.tee 4
      local.get 2
      local.get 4
      i32.gt_u
      select
      local.tee 2
      i32.const 4
      local.get 2
      i32.const 4
      i32.gt_u
      select
      local.tee 2
      call $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$11finish_grow17hbabdfc7e6b86272fE
      block ;; label = @1
        block ;; label = @2
          local.get 3
          i32.load offset=4
          i32.const 1
          i32.ne
          br_if 0 (;@2;)
          local.get 3
          i32.load offset=12
          local.set 1
          local.get 3
          i32.load offset=8
          local.set 2
          br 1 (;@1;)
        end
        local.get 3
        i32.load offset=8
        local.set 4
        local.get 1
        local.get 2
        i32.store
        local.get 1
        local.get 4
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
      local.get 3
      i32.const 16
      i32.add
      global.set $__stack_pointer
    )
    (func $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$11finish_grow17hbabdfc7e6b86272fE (;18;) (type 1) (param i32 i32 i32 i32)
      (local i32)
      i32.const 1
      local.set 4
      block ;; label = @1
        block ;; label = @2
          local.get 3
          i32.const 89478485
          i32.le_u
          br_if 0 (;@2;)
          i32.const 0
          local.set 3
          i32.const 4
          local.set 1
          br 1 (;@1;)
        end
        local.get 3
        i32.const 24
        i32.mul
        local.set 3
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              local.get 1
              i32.eqz
              br_if 0 (;@4;)
              local.get 2
              local.get 1
              i32.const 24
              i32.mul
              i32.const 8
              local.get 3
              call $_RNvCsdBezzDwma51_7___rustc14___rust_realloc
              local.set 1
              br 1 (;@3;)
            end
            block ;; label = @4
              local.get 3
              br_if 0 (;@4;)
              i32.const 8
              local.set 1
              br 2 (;@2;)
            end
            call $_RNvCsdBezzDwma51_7___rustc35___rust_no_alloc_shim_is_unstable_v2
            local.get 3
            i32.const 8
            call $_RNvCsdBezzDwma51_7___rustc12___rust_alloc
            local.set 1
          end
          local.get 1
          br_if 0 (;@2;)
          i32.const 8
          local.set 1
          local.get 0
          i32.const 8
          i32.store offset=4
          br 1 (;@1;)
        end
        local.get 0
        local.get 1
        i32.store offset=4
        i32.const 0
        local.set 4
        i32.const 8
        local.set 1
      end
      local.get 0
      local.get 1
      i32.add
      local.get 3
      i32.store
      local.get 0
      local.get 4
      i32.store
    )
    (func $_ZN69_$LT$core..alloc..layout..LayoutError$u20$as$u20$core..fmt..Debug$GT$3fmt17h18134a55c355799fE (;19;) (type 4) (param i32 i32) (result i32)
      local.get 1
      global.get $GOT.data.internal.__memory_base
      i32.const 1050056
      i32.add
      i32.const 11
      call $_ZN4core3fmt9Formatter9write_str17h34f77234b6666431E
    )
    (func $_ZN7service40__link_custom_section_describing_imports17hc4f0cd52a31e1a80E (;20;) (type 8))
    (func $cabi_post_nebula:service/orders#create-order (;21;) (type 0) (param i32)
      (local i32)
      block ;; label = @1
        local.get 0
        i32.load offset=4
        local.tee 1
        i32.eqz
        br_if 0 (;@1;)
        local.get 0
        i32.load
        local.get 1
        i32.const 1
        call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
      end
    )
    (func $cabi_post_nebula:service/orders#read-order (;22;) (type 0) (param i32)
      (local i32 i32 i32 i32)
      block ;; label = @1
        local.get 0
        i32.load8_u
        i32.eqz
        br_if 0 (;@1;)
        block ;; label = @2
          local.get 0
          i32.load offset=8
          local.tee 1
          i32.eqz
          br_if 0 (;@2;)
          local.get 0
          i32.load offset=4
          local.get 1
          i32.const 1
          call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
        end
        local.get 0
        i32.load offset=16
        local.tee 2
        i32.eqz
        br_if 0 (;@1;)
        local.get 2
        local.set 1
        local.get 0
        i32.load offset=12
        local.tee 3
        local.set 0
        loop ;; label = @2
          block ;; label = @3
            local.get 0
            i32.const 4
            i32.add
            i32.load
            local.tee 4
            i32.eqz
            br_if 0 (;@3;)
            local.get 0
            i32.load
            local.get 4
            i32.const 1
            call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
          end
          local.get 0
          i32.const 24
          i32.add
          local.set 0
          local.get 1
          i32.const -1
          i32.add
          local.tee 1
          br_if 0 (;@2;)
        end
        local.get 2
        i32.const 24
        i32.mul
        local.tee 0
        i32.eqz
        br_if 0 (;@1;)
        local.get 3
        local.get 0
        i32.const 8
        call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
      end
    )
    (func $cabi_post_nebula:service/quotes#read-quote (;23;) (type 0) (param i32)
      (local i32)
      block ;; label = @1
        local.get 0
        i32.load8_u
        i32.eqz
        br_if 0 (;@1;)
        local.get 0
        i32.load offset=12
        local.tee 1
        i32.eqz
        br_if 0 (;@1;)
        local.get 0
        i32.load offset=8
        local.get 1
        i32.const 1
        call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
      end
    )
    (func $nebula:service/orders#create-order (;24;) (type 10) (param i32 i32 i32 i32 i32) (result i32)
      (local i32 i32 i32 i32 i32 i32 i32 f64 i32 i32 f64)
      global.get $__stack_pointer
      i32.const 208
      i32.sub
      local.tee 5
      global.set $__stack_pointer
      local.get 3
      i32.const 24
      i32.mul
      local.set 6
      call $_ZN11wit_bindgen2rt14run_ctors_once17h5c2f37a76084ec7bE
      i32.const 0
      local.set 7
      block ;; label = @1
        local.get 3
        i32.const 89478485
        i32.gt_u
        br_if 0 (;@1;)
        block ;; label = @2
          block ;; label = @3
            local.get 6
            br_if 0 (;@3;)
            i32.const 8
            local.set 8
            i32.const 0
            local.set 9
            br 1 (;@2;)
          end
          call $_RNvCsdBezzDwma51_7___rustc35___rust_no_alloc_shim_is_unstable_v2
          i32.const 8
          local.set 7
          local.get 3
          local.set 9
          local.get 6
          i32.const 8
          call $_RNvCsdBezzDwma51_7___rustc12___rust_alloc
          local.tee 8
          i32.eqz
          br_if 1 (;@1;)
        end
        local.get 5
        i32.const 0
        i32.store offset=20
        local.get 5
        local.get 8
        i32.store offset=16
        local.get 5
        local.get 9
        i32.store offset=12
        block ;; label = @2
          local.get 3
          i32.eqz
          br_if 0 (;@2;)
          i32.const 0
          local.set 10
          i32.const 0
          local.set 11
          loop ;; label = @3
            local.get 2
            local.get 10
            i32.add
            local.tee 7
            i32.load
            local.set 9
            local.get 7
            i32.const 16
            i32.add
            f64.load
            local.set 12
            local.get 7
            i32.const 8
            i32.add
            i32.load
            local.set 13
            local.get 7
            i32.const 4
            i32.add
            i32.load
            local.set 14
            block ;; label = @4
              local.get 11
              local.get 5
              i32.load offset=12
              i32.ne
              br_if 0 (;@4;)
              local.get 5
              i32.const 12
              i32.add
              call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h43131d19769be0a5E
              local.get 5
              i32.load offset=16
              local.set 8
            end
            local.get 8
            local.get 10
            i32.add
            local.tee 7
            local.get 12
            f64.store
            local.get 7
            i32.const 20
            i32.add
            local.get 13
            i32.store
            local.get 7
            i32.const 16
            i32.add
            local.get 14
            i32.store
            local.get 7
            i32.const 12
            i32.add
            local.get 9
            i32.store
            local.get 7
            i32.const 8
            i32.add
            local.get 14
            i32.store
            local.get 5
            local.get 11
            i32.const 1
            i32.add
            local.tee 11
            i32.store offset=20
            local.get 10
            i32.const 24
            i32.add
            local.set 10
            local.get 3
            local.get 11
            i32.ne
            br_if 0 (;@3;)
          end
          local.get 2
          local.get 6
          i32.const 8
          call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
          local.get 5
          i32.load offset=16
          local.set 8
          local.get 5
          i32.load offset=12
          local.set 9
        end
        block ;; label = @2
          global.get $GOT.data.internal.__memory_base
          i32.const 1053996
          i32.add
          i32.load8_u offset=12
          i32.const 3
          i32.eq
          br_if 0 (;@2;)
          local.get 5
          global.get $GOT.data.internal.__memory_base
          i32.const 1053996
          i32.add
          i32.store offset=24
          local.get 5
          i32.const 24
          i32.add
          call $_ZN3std3sys4sync4once10no_threads4Once4call17hf9af329f3fbf0507E
        end
        local.get 5
        i32.const 24
        i32.add
        global.get $GOT.data.internal.__memory_base
        local.tee 7
        i32.const 1050141
        i32.add
        i32.const 18
        local.get 7
        i32.const 1053996
        i32.add
        local.tee 7
        i32.load offset=4
        local.get 7
        i32.load offset=8
        call $_ZN19wasi_otel_framework7tracing4Span3new17h29681fe320ca45e6E
        local.get 5
        i32.const 24
        i32.add
        call $_ZN19wasi_otel_framework7tracing4Span5start17he751eef627212268E
        block ;; label = @2
          block ;; label = @3
            local.get 3
            br_if 0 (;@3;)
            f64.const -0x0p+0 (;=-0;)
            local.set 12
            br 1 (;@2;)
          end
          local.get 3
          i32.const 3
          i32.and
          local.set 10
          block ;; label = @3
            block ;; label = @4
              local.get 3
              i32.const 4
              i32.ge_u
              br_if 0 (;@4;)
              f64.const -0x0p+0 (;=-0;)
              local.set 12
              i32.const 0
              local.set 11
              br 1 (;@3;)
            end
            local.get 3
            i32.const 134217724
            i32.and
            local.set 14
            f64.const -0x0p+0 (;=-0;)
            local.set 12
            i32.const 0
            local.set 11
            local.get 8
            local.set 7
            loop ;; label = @4
              local.get 12
              local.get 7
              f64.load
              local.get 7
              i32.const 20
              i32.add
              i32.load
              f64.convert_i32_u
              f64.mul
              f64.add
              local.get 7
              i32.const 24
              i32.add
              f64.load
              local.get 7
              i32.const 44
              i32.add
              i32.load
              f64.convert_i32_u
              f64.mul
              f64.add
              local.get 7
              i32.const 48
              i32.add
              f64.load
              local.get 7
              i32.const 68
              i32.add
              i32.load
              f64.convert_i32_u
              f64.mul
              f64.add
              local.get 7
              i32.const 72
              i32.add
              f64.load
              local.get 7
              i32.const 92
              i32.add
              i32.load
              f64.convert_i32_u
              f64.mul
              f64.add
              local.set 12
              local.get 7
              i32.const 96
              i32.add
              local.set 7
              local.get 14
              local.get 11
              i32.const 4
              i32.add
              local.tee 11
              i32.ne
              br_if 0 (;@4;)
            end
          end
          local.get 10
          i32.eqz
          br_if 0 (;@2;)
          local.get 8
          local.get 11
          i32.const 24
          i32.mul
          i32.add
          local.set 7
          loop ;; label = @3
            local.get 12
            local.get 7
            f64.load
            local.get 7
            i32.const 20
            i32.add
            i32.load
            f64.convert_i32_u
            f64.mul
            f64.add
            local.set 12
            local.get 7
            i32.const 24
            i32.add
            local.set 7
            local.get 10
            i32.const -1
            i32.add
            local.tee 10
            br_if 0 (;@3;)
          end
        end
        global.get $GOT.data.internal.__memory_base
        local.set 7
        local.get 5
        i32.const 24
        i32.add
        call $_ZN19wasi_otel_framework7tracing4Span4stop17hd32ff2ee4334968eE
        block ;; label = @2
          local.get 7
          i32.const 1053996
          i32.add
          i32.load8_u offset=12
          i32.const 3
          i32.eq
          br_if 0 (;@2;)
          local.get 5
          global.get $GOT.data.internal.__memory_base
          i32.const 1053996
          i32.add
          i32.store offset=24
          local.get 5
          i32.const 24
          i32.add
          call $_ZN3std3sys4sync4once10no_threads4Once4call17hf9af329f3fbf0507E
        end
        local.get 5
        i32.const 24
        i32.add
        global.get $GOT.data.internal.__memory_base
        local.tee 7
        i32.const 1050159
        i32.add
        i32.const 13
        local.get 7
        i32.const 1053996
        i32.add
        local.tee 7
        i32.load offset=4
        local.get 7
        i32.load offset=8
        call $_ZN19wasi_otel_framework7tracing4Span3new17h29681fe320ca45e6E
        local.get 5
        i32.const 24
        i32.add
        call $_ZN19wasi_otel_framework7tracing4Span5start17he751eef627212268E
        f64.const 0x1.999999999999ap-4 (;=0.1;)
        local.set 15
        block ;; label = @2
          local.get 4
          i32.const 255
          i32.and
          i32.const 2
          i32.gt_u
          br_if 0 (;@2;)
          global.get $GOT.data.internal.__memory_base
          i32.const 1050192
          i32.add
          local.get 4
          i32.const 3
          i32.and
          i32.const 3
          i32.shl
          i32.add
          f64.load
          local.set 15
        end
        global.get $GOT.data.internal.__memory_base
        local.set 7
        local.get 5
        i32.const 24
        i32.add
        call $_ZN19wasi_otel_framework7tracing4Span4stop17hd32ff2ee4334968eE
        block ;; label = @2
          local.get 7
          i32.const 1053996
          i32.add
          i32.load8_u offset=12
          i32.const 3
          i32.eq
          br_if 0 (;@2;)
          local.get 5
          global.get $GOT.data.internal.__memory_base
          i32.const 1053996
          i32.add
          i32.store offset=24
          local.get 5
          i32.const 24
          i32.add
          call $_ZN3std3sys4sync4once10no_threads4Once4call17hf9af329f3fbf0507E
        end
        local.get 5
        i32.const 24
        i32.add
        global.get $GOT.data.internal.__memory_base
        local.tee 7
        i32.const 1050172
        i32.add
        i32.const 15
        local.get 7
        i32.const 1053996
        i32.add
        local.tee 7
        i32.load offset=4
        local.get 7
        i32.load offset=8
        call $_ZN19wasi_otel_framework7tracing4Span3new17h29681fe320ca45e6E
        local.get 5
        i32.const 24
        i32.add
        call $_ZN19wasi_otel_framework7tracing4Span5start17he751eef627212268E
        local.get 5
        i32.const 24
        i32.add
        call $_ZN19wasi_otel_framework7tracing4Span4stop17hd32ff2ee4334968eE
        block ;; label = @2
          local.get 3
          i32.eqz
          br_if 0 (;@2;)
          local.get 8
          i32.const 12
          i32.add
          local.set 7
          loop ;; label = @3
            block ;; label = @4
              local.get 7
              i32.const -4
              i32.add
              i32.load
              local.tee 10
              i32.eqz
              br_if 0 (;@4;)
              local.get 7
              i32.load
              local.get 10
              i32.const 1
              call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
            end
            local.get 7
            i32.const 24
            i32.add
            local.set 7
            local.get 3
            i32.const -1
            i32.add
            local.tee 3
            br_if 0 (;@3;)
          end
        end
        block ;; label = @2
          local.get 9
          i32.eqz
          br_if 0 (;@2;)
          local.get 8
          local.get 9
          i32.const 24
          i32.mul
          i32.const 8
          call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
        end
        global.get $GOT.data.internal.__memory_base
        i32.const 1054960
        i32.add
        local.tee 7
        local.get 1
        i32.store offset=4
        local.get 7
        local.get 15
        f64.store offset=16
        local.get 7
        local.get 12
        f64.store offset=8
        local.get 7
        local.get 0
        i32.store
        local.get 7
        local.get 12
        local.get 15
        f64.const 0x1p+0 (;=1;)
        f64.add
        f64.mul
        f64.store offset=24
        local.get 7
        i64.const 5501869883648
        local.get 4
        i32.const 3
        i32.shl
        i32.const 56
        i32.and
        i64.extend_i32_u
        i64.shr_u
        i64.store8 offset=32
        local.get 5
        i32.const 208
        i32.add
        global.set $__stack_pointer
        local.get 7
        return
      end
      local.get 7
      local.get 6
      call $_ZN5alloc7raw_vec12handle_error17h9f321253d17717ecE
      unreachable
    )
    (func $nebula:service/orders#delete-order (;25;) (type 3) (param i32 i32)
      call $_ZN11wit_bindgen2rt14run_ctors_once17h5c2f37a76084ec7bE
      block ;; label = @1
        local.get 1
        i32.eqz
        br_if 0 (;@1;)
        local.get 0
        local.get 1
        i32.const 1
        call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
      end
    )
    (func $nebula:service/orders#read-order (;26;) (type 4) (param i32 i32) (result i32)
      (local i32 i32 i32 i32 i64)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 2
      global.set $__stack_pointer
      call $_ZN11wit_bindgen2rt14run_ctors_once17h5c2f37a76084ec7bE
      call $_RNvCsdBezzDwma51_7___rustc35___rust_no_alloc_shim_is_unstable_v2
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                block ;; label = @6
                  i32.const 24
                  i32.const 8
                  call $_RNvCsdBezzDwma51_7___rustc12___rust_alloc
                  local.tee 3
                  i32.eqz
                  br_if 0 (;@6;)
                  call $_RNvCsdBezzDwma51_7___rustc35___rust_no_alloc_shim_is_unstable_v2
                  i32.const 11
                  i32.const 1
                  call $_RNvCsdBezzDwma51_7___rustc12___rust_alloc
                  local.tee 4
                  i32.eqz
                  br_if 1 (;@5;)
                  local.get 3
                  i64.const 4294967307
                  i64.store offset=16
                  local.get 3
                  local.get 4
                  i32.store offset=12
                  local.get 3
                  i32.const 11
                  i32.store offset=8
                  local.get 3
                  i64.const 4632233691727265792
                  i64.store
                  local.get 4
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1050130
                  i32.add
                  local.tee 5
                  i64.load align=1
                  i64.store align=1
                  local.get 4
                  i32.const 7
                  i32.add
                  local.get 5
                  i32.const 7
                  i32.add
                  i32.load align=1
                  i32.store align=1
                  local.get 1
                  i32.const -2147483648
                  i32.eq
                  br_if 2 (;@4;)
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1054960
                  i32.add
                  local.tee 4
                  local.get 1
                  i32.store offset=8
                  local.get 4
                  i32.const 1
                  i32.store8
                  local.get 4
                  local.get 0
                  i32.store offset=4
                  i32.const 24
                  i32.const 8
                  call $_ZN4core5alloc6layout6Layout19is_size_align_valid17h62d78098b400ece0E
                  i32.eqz
                  br_if 3 (;@3;)
                  local.get 2
                  i32.const 8
                  i32.const 24
                  call $_ZN11wit_bindgen2rt7Cleanup3new17heb7b848a91323ee7E
                  local.get 2
                  i32.load
                  local.set 4
                  local.get 3
                  i64.load offset=12 align=4
                  local.tee 6
                  i64.const 32
                  i64.shr_u
                  i32.wrap_i64
                  local.set 1
                  local.get 6
                  i32.wrap_i64
                  local.set 5
                  block ;; label = @7
                    block ;; label = @8
                      local.get 6
                      i64.const 47244640255
                      i64.le_u
                      br_if 0 (;@8;)
                      local.get 5
                      local.set 0
                      br 1 (;@7;)
                    end
                    block ;; label = @8
                      local.get 6
                      i64.const 4294967295
                      i64.gt_u
                      br_if 0 (;@8;)
                      i32.const 1
                      local.set 0
                      local.get 5
                      i32.const 11
                      i32.const 1
                      call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
                      br 1 (;@7;)
                    end
                    local.get 5
                    i32.const 11
                    i32.const 1
                    local.get 1
                    call $_RNvCsdBezzDwma51_7___rustc14___rust_realloc
                    local.tee 0
                    i32.eqz
                    br_if 5 (;@2;)
                  end
                  local.get 4
                  i64.const 4632233691727265792
                  i64.store offset=16
                  local.get 4
                  i32.const 1
                  i32.store offset=8
                  local.get 4
                  local.get 0
                  i32.store
                  local.get 4
                  local.get 1
                  i32.store offset=4
                  local.get 3
                  i32.const 24
                  i32.const 8
                  call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1054960
                  i32.add
                  local.tee 3
                  i32.const 0
                  i32.store8 offset=20
                  local.get 3
                  local.get 4
                  i32.store offset=12
                  local.get 3
                  i32.const 1
                  i32.store offset=16
                  br 5 (;@1;)
                end
                i32.const 8
                i32.const 24
                call $_ZN5alloc5alloc18handle_alloc_error17h6a90b55247f528a0E
                unreachable
              end
              i32.const 1
              i32.const 11
              call $_ZN5alloc7raw_vec12handle_error17h9f321253d17717ecE
              unreachable
            end
            global.get $GOT.data.internal.__memory_base
            i32.const 1054960
            i32.add
            i32.const 0
            i32.store8
            br 2 (;@1;)
          end
          global.get $GOT.data.internal.__memory_base
          local.tee 3
          i32.const 1050087
          i32.add
          i32.const 43
          local.get 2
          local.get 3
          i32.const 1054012
          i32.add
          local.get 3
          i32.const 1054028
          i32.add
          call $_ZN4core6result13unwrap_failed17hfc7ff948713b7b29E
          unreachable
        end
        i32.const 1
        local.get 1
        call $_ZN5alloc7raw_vec12handle_error17h9f321253d17717ecE
        unreachable
      end
      global.get $GOT.data.internal.__memory_base
      local.set 3
      local.get 2
      i32.const 16
      i32.add
      global.set $__stack_pointer
      local.get 3
      i32.const 1054960
      i32.add
    )
    (func $nebula:service/quotes#read-quote (;27;) (type 4) (param i32 i32) (result i32)
      (local i32 i32)
      call $_ZN11wit_bindgen2rt14run_ctors_once17h5c2f37a76084ec7bE
      i32.const 0
      local.set 2
      block ;; label = @1
        local.get 1
        i32.const -2147483648
        i32.eq
        br_if 0 (;@1;)
        i32.const 1
        local.set 2
        global.get $GOT.data.internal.__memory_base
        i32.const 1055000
        i32.add
        local.tee 3
        i32.const 1
        i32.store8 offset=40
        local.get 3
        i64.const 4637440978796412928
        i64.store offset=32
        local.get 3
        i64.const 4621819117588971520
        i64.store offset=24
        local.get 3
        i64.const 4636737291354636288
        i64.store offset=16
        local.get 3
        local.get 0
        i32.store offset=8
        local.get 3
        local.get 1
        i32.store offset=12
      end
      global.get $GOT.data.internal.__memory_base
      i32.const 1055000
      i32.add
      local.tee 3
      local.get 2
      i32.store8
      local.get 3
    )
    (func $_RNvCsdBezzDwma51_7___rustc12___rust_alloc (;28;) (type 4) (param i32 i32) (result i32)
      local.get 0
      local.get 1
      call $_RNvCsdBezzDwma51_7___rustc11___rdl_alloc
      return
    )
    (func $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc (;29;) (type 9) (param i32 i32 i32)
      local.get 0
      local.get 1
      local.get 2
      call $_RNvCsdBezzDwma51_7___rustc13___rdl_dealloc
      return
    )
    (func $_RNvCsdBezzDwma51_7___rustc14___rust_realloc (;30;) (type 11) (param i32 i32 i32 i32) (result i32)
      local.get 0
      local.get 1
      local.get 2
      local.get 3
      call $_RNvCsdBezzDwma51_7___rustc13___rdl_realloc
      return
    )
    (func $_RNvCsdBezzDwma51_7___rustc42___rust_alloc_error_handler_should_panic_v2 (;31;) (type 7) (result i32)
      i32.const 0
      return
    )
    (func $_RNvCsdBezzDwma51_7___rustc35___rust_no_alloc_shim_is_unstable_v2 (;32;) (type 8)
      return
    )
    (func $_ZN19wasi_otel_framework8bindings40__link_custom_section_describing_imports17h47b89179910ce58fE (;33;) (type 8))
    (func $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h01c727d5e6e91731E.llvm.17531129241554188790 (;34;) (type 9) (param i32 i32 i32)
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
        call $_ZN5alloc7raw_vec12handle_error17h9f321253d17717ecE
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
      i32.const 4
      local.get 2
      i32.const 4
      i32.gt_u
      select
      local.tee 2
      i32.const 4
      i32.const 12
      call $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$11finish_grow17h61649df1224f1f6fE.llvm.17531129241554188790
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
        call $_ZN5alloc7raw_vec12handle_error17h9f321253d17717ecE
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
    (func $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$11finish_grow17h61649df1224f1f6fE.llvm.17531129241554188790 (;35;) (type 12) (param i32 i32 i32 i32 i32 i32)
      (local i32 i32 i64)
      i32.const 1
      local.set 6
      i32.const 4
      local.set 7
      block ;; label = @1
        block ;; label = @2
          local.get 4
          local.get 5
          i32.add
          i32.const -1
          i32.add
          i32.const 0
          local.get 4
          i32.sub
          i32.and
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
                call $_RNvCsdBezzDwma51_7___rustc14___rust_realloc
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
              call $_RNvCsdBezzDwma51_7___rustc35___rust_no_alloc_shim_is_unstable_v2
              local.get 3
              local.get 4
              call $_RNvCsdBezzDwma51_7___rustc12___rust_alloc
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
    (func $_ZN70_$LT$alloc..vec..Vec$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h1fec862420e49aa9E (;36;) (type 0) (param i32)
      (local i32 i32 i32 i32 i32 i32 i32)
      block ;; label = @1
        local.get 0
        i32.load offset=8
        local.tee 1
        i32.eqz
        br_if 0 (;@1;)
        local.get 0
        i32.load offset=4
        local.set 2
        i32.const 0
        local.set 3
        loop ;; label = @2
          block ;; label = @3
            local.get 2
            local.get 3
            i32.const 40
            i32.mul
            i32.add
            local.tee 4
            i32.load offset=16
            local.tee 0
            i32.eqz
            br_if 0 (;@3;)
            local.get 4
            i32.load offset=20
            local.get 0
            i32.const 1
            call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
          end
          local.get 4
          i32.load offset=32
          local.set 5
          block ;; label = @3
            local.get 4
            i32.load offset=36
            local.tee 6
            i32.eqz
            br_if 0 (;@3;)
            local.get 5
            local.set 0
            loop ;; label = @4
              block ;; label = @5
                local.get 0
                i32.load
                local.tee 7
                i32.eqz
                br_if 0 (;@5;)
                local.get 0
                i32.const 4
                i32.add
                i32.load
                local.get 7
                i32.const 1
                call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
              end
              block ;; label = @5
                local.get 0
                i32.const 12
                i32.add
                i32.load
                local.tee 7
                i32.eqz
                br_if 0 (;@5;)
                local.get 0
                i32.const 16
                i32.add
                i32.load
                local.get 7
                i32.const 1
                call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
              end
              local.get 0
              i32.const 24
              i32.add
              local.set 0
              local.get 6
              i32.const -1
              i32.add
              local.tee 6
              br_if 0 (;@4;)
            end
          end
          block ;; label = @3
            local.get 4
            i32.load offset=28
            local.tee 0
            i32.eqz
            br_if 0 (;@3;)
            local.get 5
            local.get 0
            i32.const 24
            i32.mul
            i32.const 4
            call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
          end
          local.get 3
          i32.const 1
          i32.add
          local.tee 3
          local.get 1
          i32.ne
          br_if 0 (;@2;)
        end
      end
    )
    (func $_ZN70_$LT$alloc..vec..Vec$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17hded4239960058047E (;37;) (type 0) (param i32)
      (local i32 i32 i32 i32 i32 i32 i32)
      block ;; label = @1
        local.get 0
        i32.load offset=8
        local.tee 1
        i32.eqz
        br_if 0 (;@1;)
        local.get 0
        i32.load offset=4
        local.set 2
        i32.const 0
        local.set 3
        loop ;; label = @2
          block ;; label = @3
            local.get 2
            local.get 3
            i32.const 52
            i32.mul
            i32.add
            local.tee 4
            i32.load
            local.tee 0
            i32.eqz
            br_if 0 (;@3;)
            local.get 4
            i32.load offset=4
            local.get 0
            i32.const 1
            call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
          end
          block ;; label = @3
            local.get 4
            i32.load offset=12
            local.tee 0
            i32.eqz
            br_if 0 (;@3;)
            local.get 4
            i32.load offset=16
            local.get 0
            i32.const 1
            call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
          end
          local.get 4
          i32.load offset=28
          local.set 5
          block ;; label = @3
            local.get 4
            i32.load offset=32
            local.tee 6
            i32.eqz
            br_if 0 (;@3;)
            local.get 5
            local.set 0
            loop ;; label = @4
              block ;; label = @5
                local.get 0
                i32.load
                local.tee 7
                i32.eqz
                br_if 0 (;@5;)
                local.get 0
                i32.const 4
                i32.add
                i32.load
                local.get 7
                i32.const 1
                call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
              end
              block ;; label = @5
                local.get 0
                i32.const 12
                i32.add
                i32.load
                local.tee 7
                i32.eqz
                br_if 0 (;@5;)
                local.get 0
                i32.const 16
                i32.add
                i32.load
                local.get 7
                i32.const 1
                call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
              end
              local.get 0
              i32.const 24
              i32.add
              local.set 0
              local.get 6
              i32.const -1
              i32.add
              local.tee 6
              br_if 0 (;@4;)
            end
          end
          block ;; label = @3
            local.get 4
            i32.load offset=24
            local.tee 0
            i32.eqz
            br_if 0 (;@3;)
            local.get 5
            local.get 0
            i32.const 24
            i32.mul
            i32.const 4
            call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
          end
          local.get 4
          i32.load offset=44
          local.set 5
          block ;; label = @3
            local.get 4
            i32.load offset=48
            local.tee 6
            i32.eqz
            br_if 0 (;@3;)
            local.get 5
            local.set 0
            loop ;; label = @4
              block ;; label = @5
                local.get 0
                i32.load
                local.tee 7
                i32.eqz
                br_if 0 (;@5;)
                local.get 0
                i32.const 4
                i32.add
                i32.load
                local.get 7
                i32.const 1
                call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
              end
              block ;; label = @5
                local.get 0
                i32.const 12
                i32.add
                i32.load
                local.tee 7
                i32.eqz
                br_if 0 (;@5;)
                local.get 0
                i32.const 16
                i32.add
                i32.load
                local.get 7
                i32.const 1
                call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
              end
              local.get 0
              i32.const 24
              i32.add
              local.set 0
              local.get 6
              i32.const -1
              i32.add
              local.tee 6
              br_if 0 (;@4;)
            end
          end
          block ;; label = @3
            local.get 4
            i32.load offset=40
            local.tee 0
            i32.eqz
            br_if 0 (;@3;)
            local.get 5
            local.get 0
            i32.const 24
            i32.mul
            i32.const 4
            call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
          end
          local.get 3
          i32.const 1
          i32.add
          local.tee 3
          local.get 1
          i32.ne
          br_if 0 (;@2;)
        end
      end
    )
    (func $_ZN19wasi_otel_framework8bindings4wasi4otel7tracing18inner_span_context17h0078b8261bb1b596E (;38;) (type 0) (param i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      i32.const 48
      i32.sub
      local.tee 1
      global.set $__stack_pointer
      local.get 1
      i32.const 8
      i32.add
      call $_ZN19wasi_otel_framework8bindings4wasi4otel7tracing18inner_span_context11wit_import117h78ff5038b43e1c94E
      local.get 1
      i32.load offset=32
      local.tee 2
      i32.const 24
      i32.mul
      local.set 3
      i32.const 0
      local.set 4
      block ;; label = @1
        local.get 2
        i32.const 89478485
        i32.gt_u
        br_if 0 (;@1;)
        local.get 1
        i32.load offset=28
        local.set 5
        local.get 1
        i32.load8_u offset=25
        local.set 6
        local.get 1
        i32.load8_u offset=24
        local.set 7
        local.get 1
        i32.load offset=20
        local.set 8
        local.get 1
        i32.load offset=16
        local.set 9
        local.get 1
        i32.load offset=12
        local.set 10
        local.get 1
        i32.load offset=8
        local.set 11
        block ;; label = @2
          block ;; label = @3
            local.get 3
            br_if 0 (;@3;)
            i32.const 4
            local.set 12
            i32.const 0
            local.set 3
            br 1 (;@2;)
          end
          call $_RNvCsdBezzDwma51_7___rustc35___rust_no_alloc_shim_is_unstable_v2
          i32.const 4
          local.set 4
          local.get 3
          i32.const 4
          call $_RNvCsdBezzDwma51_7___rustc12___rust_alloc
          local.tee 12
          i32.eqz
          br_if 1 (;@1;)
          local.get 2
          local.set 3
        end
        local.get 1
        i32.const 0
        i32.store offset=44
        local.get 1
        local.get 12
        i32.store offset=40
        local.get 1
        local.get 3
        i32.store offset=36
        block ;; label = @2
          local.get 2
          i32.eqz
          br_if 0 (;@2;)
          i32.const 0
          local.set 13
          local.get 5
          local.set 3
          i32.const 0
          local.set 12
          loop ;; label = @3
            local.get 3
            i32.const 12
            i32.add
            i32.load
            local.set 14
            local.get 3
            i32.const 8
            i32.add
            i32.load
            local.set 15
            local.get 3
            i32.const 4
            i32.add
            i32.load
            local.set 16
            local.get 3
            i32.load
            local.set 17
            block ;; label = @4
              local.get 12
              local.get 1
              i32.load offset=36
              i32.ne
              br_if 0 (;@4;)
              local.get 1
              i32.const 36
              i32.add
              call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h7ee76122d7aec1a5E
            end
            local.get 1
            i32.load offset=40
            local.get 13
            i32.add
            local.tee 4
            local.get 16
            i32.store
            local.get 4
            i32.const 20
            i32.add
            local.get 14
            i32.store
            local.get 4
            i32.const 16
            i32.add
            local.get 15
            i32.store
            local.get 4
            i32.const 12
            i32.add
            local.get 14
            i32.store
            local.get 4
            i32.const 8
            i32.add
            local.get 16
            i32.store
            local.get 4
            i32.const 4
            i32.add
            local.get 17
            i32.store
            local.get 1
            local.get 12
            i32.const 1
            i32.add
            local.tee 12
            i32.store offset=44
            local.get 3
            i32.const 16
            i32.add
            local.set 3
            local.get 13
            i32.const 24
            i32.add
            local.set 13
            local.get 2
            local.get 12
            i32.ne
            br_if 0 (;@3;)
          end
          local.get 5
          local.get 2
          i32.const 4
          i32.shl
          i32.const 4
          call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
        end
        local.get 0
        local.get 1
        i64.load offset=36 align=4
        i64.store offset=24 align=4
        local.get 0
        local.get 7
        i32.store8 offset=37
        local.get 0
        local.get 8
        i32.store offset=20
        local.get 0
        local.get 9
        i32.store offset=16
        local.get 0
        local.get 8
        i32.store offset=12
        local.get 0
        local.get 10
        i32.store offset=8
        local.get 0
        local.get 11
        i32.store offset=4
        local.get 0
        local.get 10
        i32.store
        local.get 0
        i32.const 32
        i32.add
        local.get 1
        i32.const 44
        i32.add
        i32.load
        i32.store
        local.get 0
        local.get 6
        i32.const 255
        i32.and
        i32.const 0
        i32.ne
        i32.store8 offset=36
        local.get 1
        i32.const 48
        i32.add
        global.set $__stack_pointer
        return
      end
      local.get 4
      local.get 3
      call $_ZN5alloc7raw_vec12handle_error17h9f321253d17717ecE
      unreachable
    )
    (func $_ZN19wasi_otel_framework8bindings4wasi4otel7tracing6on_end17h1aa339de0cde82b1E (;39;) (type 0) (param i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32)
      global.get $__stack_pointer
      i32.const 288
      i32.sub
      local.tee 1
      global.set $__stack_pointer
      local.get 1
      i32.const 0
      i32.store offset=20
      local.get 1
      i64.const 17179869184
      i64.store offset=12 align=4
      local.get 1
      local.get 0
      i64.load offset=4 align=4
      i64.store offset=24
      local.get 1
      local.get 0
      i64.load offset=16
      i64.store offset=32
      local.get 1
      local.get 0
      i32.load8_u offset=37
      i32.store8 offset=40
      local.get 1
      local.get 0
      i32.load8_u offset=36
      i32.store8 offset=41
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              local.get 0
              i32.load offset=32
              local.tee 2
              i32.const 4
              i32.shl
              local.tee 3
              i32.const 4
              call $_ZN4core5alloc6layout6Layout19is_size_align_valid17h62d78098b400ece0E
              i32.eqz
              br_if 0 (;@4;)
              local.get 1
              i32.const 268
              i32.add
              i32.const 4
              local.get 3
              call $_ZN11wit_bindgen2rt7Cleanup3new17heb7b848a91323ee7E
              local.get 1
              i32.load offset=268
              local.set 4
              local.get 1
              i32.const 200
              i32.add
              local.get 1
              i32.const 280
              i32.add
              i32.load
              i32.store
              local.get 1
              local.get 1
              i64.load offset=272 align=4
              i64.store offset=192
              block ;; label = @5
                local.get 2
                i32.eqz
                br_if 0 (;@5;)
                local.get 0
                i32.load offset=28
                local.set 3
                local.get 2
                i32.const 24
                i32.mul
                i32.const -24
                i32.add
                local.tee 5
                i32.const 24
                i32.div_u
                local.set 6
                i32.const 0
                local.set 7
                block ;; label = @6
                  local.get 5
                  i32.const 24
                  i32.lt_u
                  br_if 0 (;@6;)
                  local.get 6
                  i32.const 1
                  i32.add
                  i32.const 536870910
                  i32.and
                  local.set 8
                  i32.const 0
                  local.set 7
                  loop ;; label = @7
                    local.get 4
                    local.get 7
                    i32.add
                    local.tee 5
                    local.get 3
                    i32.const 4
                    i32.add
                    i64.load align=4
                    i64.store align=4
                    local.get 5
                    i32.const 8
                    i32.add
                    local.get 3
                    i32.const 16
                    i32.add
                    i64.load align=4
                    i64.store align=4
                    local.get 5
                    i32.const 16
                    i32.add
                    local.get 3
                    i32.const 28
                    i32.add
                    i64.load align=4
                    i64.store align=4
                    local.get 5
                    i32.const 24
                    i32.add
                    local.get 3
                    i32.const 40
                    i32.add
                    i64.load align=4
                    i64.store align=4
                    local.get 7
                    i32.const 32
                    i32.add
                    local.set 7
                    local.get 3
                    i32.const 48
                    i32.add
                    local.set 3
                    local.get 8
                    i32.const -2
                    i32.add
                    local.tee 8
                    br_if 0 (;@7;)
                  end
                end
                local.get 6
                i32.const 1
                i32.and
                br_if 0 (;@5;)
                local.get 4
                local.get 7
                i32.add
                local.tee 5
                local.get 3
                i64.load offset=4 align=4
                i64.store align=4
                local.get 5
                local.get 3
                i64.load offset=16 align=4
                i64.store offset=8 align=4
              end
              local.get 1
              local.get 4
              i32.store offset=44
              local.get 1
              local.get 2
              i32.store offset=48
              local.get 1
              local.get 0
              i64.load offset=124 align=4
              i64.store offset=52 align=4
              local.get 1
              local.get 0
              i32.load8_u offset=204
              i32.store8 offset=60
              local.get 1
              local.get 0
              i64.load offset=136
              i64.store offset=64
              local.get 1
              local.get 0
              i64.load offset=88
              i64.store offset=72
              local.get 1
              local.get 0
              i32.load offset=96
              i32.store offset=80
              local.get 1
              local.get 0
              i64.load offset=104
              i64.store offset=88
              local.get 1
              local.get 0
              i32.load offset=112
              i32.store offset=96
              local.get 0
              i32.load offset=152
              local.tee 2
              i32.const 4
              i32.shl
              local.tee 3
              i32.const 4
              call $_ZN4core5alloc6layout6Layout19is_size_align_valid17h62d78098b400ece0E
              i32.eqz
              br_if 1 (;@3;)
              local.get 1
              i32.const 268
              i32.add
              i32.const 4
              local.get 3
              call $_ZN11wit_bindgen2rt7Cleanup3new17heb7b848a91323ee7E
              local.get 1
              i32.load offset=268
              local.set 4
              local.get 1
              i32.const 208
              i32.add
              i32.const 8
              i32.add
              local.get 1
              i32.const 280
              i32.add
              i32.load
              i32.store
              local.get 1
              local.get 1
              i64.load offset=272 align=4
              i64.store offset=208
              block ;; label = @5
                local.get 2
                i32.eqz
                br_if 0 (;@5;)
                local.get 0
                i32.load offset=148
                local.set 3
                local.get 2
                i32.const 24
                i32.mul
                i32.const -24
                i32.add
                local.tee 5
                i32.const 24
                i32.div_u
                local.set 6
                i32.const 0
                local.set 7
                block ;; label = @6
                  local.get 5
                  i32.const 24
                  i32.lt_u
                  br_if 0 (;@6;)
                  local.get 6
                  i32.const 1
                  i32.add
                  i32.const 536870910
                  i32.and
                  local.set 8
                  i32.const 0
                  local.set 7
                  loop ;; label = @7
                    local.get 4
                    local.get 7
                    i32.add
                    local.tee 5
                    local.get 3
                    i32.const 4
                    i32.add
                    i64.load align=4
                    i64.store align=4
                    local.get 5
                    i32.const 8
                    i32.add
                    local.get 3
                    i32.const 16
                    i32.add
                    i64.load align=4
                    i64.store align=4
                    local.get 5
                    i32.const 16
                    i32.add
                    local.get 3
                    i32.const 28
                    i32.add
                    i64.load align=4
                    i64.store align=4
                    local.get 5
                    i32.const 24
                    i32.add
                    local.get 3
                    i32.const 40
                    i32.add
                    i64.load align=4
                    i64.store align=4
                    local.get 7
                    i32.const 32
                    i32.add
                    local.set 7
                    local.get 3
                    i32.const 48
                    i32.add
                    local.set 3
                    local.get 8
                    i32.const -2
                    i32.add
                    local.tee 8
                    br_if 0 (;@7;)
                  end
                end
                local.get 6
                i32.const 1
                i32.and
                br_if 0 (;@5;)
                local.get 4
                local.get 7
                i32.add
                local.tee 5
                local.get 3
                i64.load offset=4 align=4
                i64.store align=4
                local.get 5
                local.get 3
                i64.load offset=16 align=4
                i64.store offset=8 align=4
              end
              local.get 1
              local.get 4
              i32.store offset=104
              local.get 1
              local.get 2
              i32.store offset=108
              local.get 0
              i32.load offset=164
              local.tee 9
              i32.const 5
              i32.shl
              local.tee 3
              i32.const 8
              call $_ZN4core5alloc6layout6Layout19is_size_align_valid17h62d78098b400ece0E
              i32.eqz
              br_if 2 (;@2;)
              local.get 1
              i32.const 268
              i32.add
              i32.const 8
              local.get 3
              call $_ZN11wit_bindgen2rt7Cleanup3new17heb7b848a91323ee7E
              local.get 1
              i32.load offset=268
              local.set 10
              local.get 1
              i32.const 224
              i32.add
              i32.const 8
              i32.add
              local.get 1
              i32.const 268
              i32.add
              i32.const 12
              i32.add
              i32.load
              i32.store
              local.get 1
              local.get 1
              i64.load offset=272 align=4
              i64.store offset=224
              block ;; label = @5
                local.get 9
                br_if 0 (;@5;)
                i32.const 0
                local.set 4
                br 4 (;@1;)
              end
              local.get 0
              i32.load offset=160
              local.tee 11
              local.get 9
              i32.const 40
              i32.mul
              i32.add
              local.set 12
              local.get 11
              i32.const 40
              i32.add
              local.set 5
              i32.const 0
              local.set 4
              i32.const 1
              local.set 7
              i32.const 0
              local.set 13
              loop ;; label = @5
                local.get 13
                local.set 8
                local.get 11
                local.set 3
                local.get 5
                local.set 11
                local.get 7
                local.set 13
                local.get 10
                local.get 8
                i32.const 5
                i32.shl
                i32.add
                local.tee 6
                local.get 3
                i64.load offset=20 align=4
                i64.store align=4
                local.get 6
                local.get 3
                i64.load
                i64.store offset=8
                local.get 6
                local.get 3
                i32.load offset=8
                i32.store offset=16
                block ;; label = @6
                  local.get 3
                  i32.load offset=36
                  local.tee 14
                  i32.const 4
                  i32.shl
                  local.tee 5
                  i32.const 4
                  call $_ZN4core5alloc6layout6Layout19is_size_align_valid17h62d78098b400ece0E
                  br_if 0 (;@6;)
                  global.get $GOT.data.internal.__memory_base
                  local.tee 3
                  i32.const 1050216
                  i32.add
                  i32.const 43
                  local.get 1
                  i32.const 287
                  i32.add
                  local.get 3
                  i32.const 1054068
                  i32.add
                  local.get 3
                  i32.const 1054084
                  i32.add
                  call $_ZN4core6result13unwrap_failed17hfc7ff948713b7b29E
                  unreachable
                end
                local.get 1
                i32.const 268
                i32.add
                i32.const 4
                local.get 5
                call $_ZN11wit_bindgen2rt7Cleanup3new17heb7b848a91323ee7E
                local.get 1
                i64.load offset=276 align=4
                local.set 15
                local.get 1
                i32.load offset=268
                local.set 2
                block ;; label = @6
                  local.get 1
                  i32.load offset=12
                  local.get 4
                  i32.sub
                  local.get 1
                  i32.load offset=272
                  local.tee 5
                  i32.const 0
                  i32.ne
                  local.tee 7
                  i32.ge_u
                  br_if 0 (;@6;)
                  local.get 1
                  i32.const 12
                  i32.add
                  local.get 4
                  local.get 7
                  call $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h01c727d5e6e91731E.llvm.17531129241554188790
                  local.get 1
                  i32.load offset=20
                  local.set 4
                end
                block ;; label = @6
                  local.get 5
                  i32.eqz
                  br_if 0 (;@6;)
                  local.get 1
                  i32.load offset=16
                  local.get 4
                  i32.const 12
                  i32.mul
                  i32.add
                  local.tee 7
                  local.get 15
                  i64.store offset=4 align=4
                  local.get 7
                  local.get 5
                  i32.store
                  local.get 4
                  i32.const 1
                  i32.add
                  local.set 4
                end
                local.get 1
                local.get 4
                i32.store offset=20
                block ;; label = @6
                  local.get 3
                  i32.load offset=36
                  local.tee 5
                  i32.eqz
                  br_if 0 (;@6;)
                  local.get 3
                  i32.load offset=32
                  local.set 3
                  local.get 5
                  i32.const 24
                  i32.mul
                  i32.const -24
                  i32.add
                  local.tee 5
                  i32.const 24
                  i32.div_u
                  local.set 16
                  i32.const 0
                  local.set 7
                  block ;; label = @7
                    local.get 5
                    i32.const 24
                    i32.lt_u
                    br_if 0 (;@7;)
                    local.get 16
                    i32.const 1
                    i32.add
                    i32.const 536870910
                    i32.and
                    local.set 8
                    i32.const 0
                    local.set 7
                    loop ;; label = @8
                      local.get 2
                      local.get 7
                      i32.add
                      local.tee 5
                      local.get 3
                      i32.const 4
                      i32.add
                      i64.load align=4
                      i64.store align=4
                      local.get 5
                      i32.const 8
                      i32.add
                      local.get 3
                      i32.const 16
                      i32.add
                      i64.load align=4
                      i64.store align=4
                      local.get 5
                      i32.const 16
                      i32.add
                      local.get 3
                      i32.const 28
                      i32.add
                      i64.load align=4
                      i64.store align=4
                      local.get 5
                      i32.const 24
                      i32.add
                      local.get 3
                      i32.const 40
                      i32.add
                      i64.load align=4
                      i64.store align=4
                      local.get 7
                      i32.const 32
                      i32.add
                      local.set 7
                      local.get 3
                      i32.const 48
                      i32.add
                      local.set 3
                      local.get 8
                      i32.const -2
                      i32.add
                      local.tee 8
                      br_if 0 (;@8;)
                    end
                  end
                  local.get 16
                  i32.const 1
                  i32.and
                  br_if 0 (;@6;)
                  local.get 2
                  local.get 7
                  i32.add
                  local.tee 5
                  local.get 3
                  i64.load offset=4 align=4
                  i64.store align=4
                  local.get 5
                  local.get 3
                  i64.load offset=16 align=4
                  i64.store offset=8 align=4
                end
                local.get 6
                local.get 2
                i32.store offset=24
                local.get 6
                local.get 14
                i32.store offset=28
                local.get 13
                local.get 11
                local.get 12
                i32.ne
                local.tee 3
                i32.add
                local.set 7
                local.get 11
                i32.const 40
                i32.const 0
                local.get 3
                select
                i32.add
                local.set 5
                local.get 3
                i32.eqz
                br_if 4 (;@1;)
                br 0 (;@5;)
              end
            end
            global.get $GOT.data.internal.__memory_base
            local.tee 3
            i32.const 1050216
            i32.add
            i32.const 43
            local.get 1
            i32.const 287
            i32.add
            local.get 3
            i32.const 1054068
            i32.add
            local.get 3
            i32.const 1054084
            i32.add
            call $_ZN4core6result13unwrap_failed17hfc7ff948713b7b29E
            unreachable
          end
          global.get $GOT.data.internal.__memory_base
          local.tee 3
          i32.const 1050216
          i32.add
          i32.const 43
          local.get 1
          i32.const 287
          i32.add
          local.get 3
          i32.const 1054068
          i32.add
          local.get 3
          i32.const 1054084
          i32.add
          call $_ZN4core6result13unwrap_failed17hfc7ff948713b7b29E
          unreachable
        end
        global.get $GOT.data.internal.__memory_base
        local.tee 3
        i32.const 1050216
        i32.add
        i32.const 43
        local.get 1
        i32.const 287
        i32.add
        local.get 3
        i32.const 1054068
        i32.add
        local.get 3
        i32.const 1054084
        i32.add
        call $_ZN4core6result13unwrap_failed17hfc7ff948713b7b29E
        unreachable
      end
      local.get 1
      local.get 10
      i32.store offset=112
      local.get 1
      local.get 9
      i32.store offset=116
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                block ;; label = @6
                  local.get 0
                  i32.load offset=176
                  local.tee 17
                  i32.const 36
                  i32.mul
                  local.tee 3
                  i32.const 4
                  call $_ZN4core5alloc6layout6Layout19is_size_align_valid17h62d78098b400ece0E
                  i32.eqz
                  br_if 0 (;@6;)
                  local.get 1
                  i32.const 268
                  i32.add
                  i32.const 4
                  local.get 3
                  call $_ZN11wit_bindgen2rt7Cleanup3new17heb7b848a91323ee7E
                  local.get 1
                  i32.load offset=268
                  local.set 12
                  local.get 1
                  i32.const 240
                  i32.add
                  i32.const 8
                  i32.add
                  local.get 1
                  i32.const 268
                  i32.add
                  i32.const 12
                  i32.add
                  i32.load
                  i32.store
                  local.get 1
                  local.get 1
                  i64.load offset=272 align=4
                  i64.store offset=240
                  block ;; label = @7
                    local.get 17
                    i32.eqz
                    br_if 0 (;@7;)
                    local.get 0
                    i32.load offset=172
                    local.tee 13
                    local.get 17
                    i32.const 52
                    i32.mul
                    i32.add
                    local.set 9
                    local.get 13
                    i32.const 52
                    i32.add
                    local.set 5
                    i32.const 1
                    local.set 7
                    i32.const 0
                    local.set 14
                    loop ;; label = @8
                      local.get 14
                      local.set 3
                      local.get 13
                      local.set 6
                      local.get 5
                      local.set 13
                      local.get 7
                      local.set 14
                      local.get 12
                      local.get 3
                      i32.const 36
                      i32.mul
                      i32.add
                      local.tee 11
                      local.get 6
                      i64.load offset=4 align=4
                      i64.store align=4
                      local.get 11
                      local.get 6
                      i64.load offset=16 align=4
                      i64.store offset=8 align=4
                      local.get 11
                      local.get 6
                      i32.load8_u offset=37
                      i32.store8 offset=16
                      local.get 11
                      local.get 6
                      i32.load8_u offset=36
                      i32.store8 offset=17
                      block ;; label = @9
                        local.get 6
                        i32.load offset=32
                        local.tee 16
                        i32.const 4
                        i32.shl
                        local.tee 3
                        i32.const 4
                        call $_ZN4core5alloc6layout6Layout19is_size_align_valid17h62d78098b400ece0E
                        br_if 0 (;@9;)
                        global.get $GOT.data.internal.__memory_base
                        local.tee 3
                        i32.const 1050216
                        i32.add
                        i32.const 43
                        local.get 1
                        i32.const 287
                        i32.add
                        local.get 3
                        i32.const 1054068
                        i32.add
                        local.get 3
                        i32.const 1054084
                        i32.add
                        call $_ZN4core6result13unwrap_failed17hfc7ff948713b7b29E
                        unreachable
                      end
                      local.get 1
                      i32.const 268
                      i32.add
                      i32.const 4
                      local.get 3
                      call $_ZN11wit_bindgen2rt7Cleanup3new17heb7b848a91323ee7E
                      local.get 1
                      i64.load offset=276 align=4
                      local.set 15
                      local.get 1
                      i32.load offset=268
                      local.set 2
                      block ;; label = @9
                        local.get 1
                        i32.load offset=12
                        local.get 4
                        i32.sub
                        local.get 1
                        i32.load offset=272
                        local.tee 3
                        i32.const 0
                        i32.ne
                        local.tee 5
                        i32.ge_u
                        br_if 0 (;@9;)
                        local.get 1
                        i32.const 12
                        i32.add
                        local.get 4
                        local.get 5
                        call $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h01c727d5e6e91731E.llvm.17531129241554188790
                        local.get 1
                        i32.load offset=20
                        local.set 4
                      end
                      block ;; label = @9
                        local.get 3
                        i32.eqz
                        br_if 0 (;@9;)
                        local.get 1
                        i32.load offset=16
                        local.get 4
                        i32.const 12
                        i32.mul
                        i32.add
                        local.tee 5
                        local.get 15
                        i64.store offset=4 align=4
                        local.get 5
                        local.get 3
                        i32.store
                        local.get 4
                        i32.const 1
                        i32.add
                        local.set 4
                      end
                      local.get 1
                      local.get 4
                      i32.store offset=20
                      block ;; label = @9
                        local.get 6
                        i32.load offset=32
                        local.tee 5
                        i32.eqz
                        br_if 0 (;@9;)
                        local.get 6
                        i32.load offset=28
                        local.set 3
                        local.get 5
                        i32.const 24
                        i32.mul
                        i32.const -24
                        i32.add
                        local.tee 5
                        i32.const 24
                        i32.div_u
                        local.set 10
                        i32.const 0
                        local.set 7
                        block ;; label = @10
                          local.get 5
                          i32.const 24
                          i32.lt_u
                          br_if 0 (;@10;)
                          local.get 10
                          i32.const 1
                          i32.add
                          i32.const 536870910
                          i32.and
                          local.set 8
                          i32.const 0
                          local.set 7
                          loop ;; label = @11
                            local.get 2
                            local.get 7
                            i32.add
                            local.tee 5
                            local.get 3
                            i32.const 4
                            i32.add
                            i64.load align=4
                            i64.store align=4
                            local.get 5
                            i32.const 8
                            i32.add
                            local.get 3
                            i32.const 16
                            i32.add
                            i64.load align=4
                            i64.store align=4
                            local.get 5
                            i32.const 16
                            i32.add
                            local.get 3
                            i32.const 28
                            i32.add
                            i64.load align=4
                            i64.store align=4
                            local.get 5
                            i32.const 24
                            i32.add
                            local.get 3
                            i32.const 40
                            i32.add
                            i64.load align=4
                            i64.store align=4
                            local.get 7
                            i32.const 32
                            i32.add
                            local.set 7
                            local.get 3
                            i32.const 48
                            i32.add
                            local.set 3
                            local.get 8
                            i32.const -2
                            i32.add
                            local.tee 8
                            br_if 0 (;@11;)
                          end
                        end
                        local.get 10
                        i32.const 1
                        i32.and
                        br_if 0 (;@9;)
                        local.get 2
                        local.get 7
                        i32.add
                        local.tee 5
                        local.get 3
                        i64.load offset=4 align=4
                        i64.store align=4
                        local.get 5
                        local.get 3
                        i64.load offset=16 align=4
                        i64.store offset=8 align=4
                      end
                      local.get 11
                      local.get 2
                      i32.store offset=20
                      local.get 11
                      local.get 16
                      i32.store offset=24
                      local.get 6
                      i32.load offset=48
                      local.tee 16
                      i32.const 4
                      i32.shl
                      local.tee 3
                      i32.const 4
                      call $_ZN4core5alloc6layout6Layout19is_size_align_valid17h62d78098b400ece0E
                      i32.eqz
                      br_if 3 (;@5;)
                      local.get 1
                      i32.const 268
                      i32.add
                      i32.const 4
                      local.get 3
                      call $_ZN11wit_bindgen2rt7Cleanup3new17heb7b848a91323ee7E
                      local.get 1
                      i64.load offset=276 align=4
                      local.set 15
                      local.get 1
                      i32.load offset=268
                      local.set 2
                      block ;; label = @9
                        local.get 1
                        i32.load offset=12
                        local.get 4
                        i32.sub
                        local.get 1
                        i32.load offset=272
                        local.tee 3
                        i32.const 0
                        i32.ne
                        local.tee 5
                        i32.ge_u
                        br_if 0 (;@9;)
                        local.get 1
                        i32.const 12
                        i32.add
                        local.get 4
                        local.get 5
                        call $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h01c727d5e6e91731E.llvm.17531129241554188790
                        local.get 1
                        i32.load offset=20
                        local.set 4
                      end
                      block ;; label = @9
                        local.get 3
                        i32.eqz
                        br_if 0 (;@9;)
                        local.get 1
                        i32.load offset=16
                        local.get 4
                        i32.const 12
                        i32.mul
                        i32.add
                        local.tee 5
                        local.get 15
                        i64.store offset=4 align=4
                        local.get 5
                        local.get 3
                        i32.store
                        local.get 4
                        i32.const 1
                        i32.add
                        local.set 4
                      end
                      local.get 1
                      local.get 4
                      i32.store offset=20
                      block ;; label = @9
                        local.get 6
                        i32.load offset=48
                        local.tee 5
                        i32.eqz
                        br_if 0 (;@9;)
                        local.get 6
                        i32.load offset=44
                        local.set 3
                        local.get 5
                        i32.const 24
                        i32.mul
                        i32.const -24
                        i32.add
                        local.tee 5
                        i32.const 24
                        i32.div_u
                        local.set 6
                        i32.const 0
                        local.set 7
                        block ;; label = @10
                          local.get 5
                          i32.const 24
                          i32.lt_u
                          br_if 0 (;@10;)
                          local.get 6
                          i32.const 1
                          i32.add
                          i32.const 536870910
                          i32.and
                          local.set 8
                          i32.const 0
                          local.set 7
                          loop ;; label = @11
                            local.get 2
                            local.get 7
                            i32.add
                            local.tee 5
                            local.get 3
                            i32.const 4
                            i32.add
                            i64.load align=4
                            i64.store align=4
                            local.get 5
                            i32.const 8
                            i32.add
                            local.get 3
                            i32.const 16
                            i32.add
                            i64.load align=4
                            i64.store align=4
                            local.get 5
                            i32.const 16
                            i32.add
                            local.get 3
                            i32.const 28
                            i32.add
                            i64.load align=4
                            i64.store align=4
                            local.get 5
                            i32.const 24
                            i32.add
                            local.get 3
                            i32.const 40
                            i32.add
                            i64.load align=4
                            i64.store align=4
                            local.get 7
                            i32.const 32
                            i32.add
                            local.set 7
                            local.get 3
                            i32.const 48
                            i32.add
                            local.set 3
                            local.get 8
                            i32.const -2
                            i32.add
                            local.tee 8
                            br_if 0 (;@11;)
                          end
                        end
                        local.get 6
                        i32.const 1
                        i32.and
                        br_if 0 (;@9;)
                        local.get 2
                        local.get 7
                        i32.add
                        local.tee 5
                        local.get 3
                        i64.load offset=4 align=4
                        i64.store align=4
                        local.get 5
                        local.get 3
                        i64.load offset=16 align=4
                        i64.store offset=8 align=4
                      end
                      local.get 11
                      local.get 2
                      i32.store offset=28
                      local.get 11
                      local.get 16
                      i32.store offset=32
                      local.get 14
                      local.get 13
                      local.get 9
                      i32.ne
                      local.tee 3
                      i32.add
                      local.set 7
                      local.get 13
                      i32.const 52
                      i32.const 0
                      local.get 3
                      select
                      i32.add
                      local.set 5
                      local.get 3
                      br_if 0 (;@8;)
                    end
                  end
                  local.get 1
                  local.get 12
                  i32.store offset=120
                  local.get 1
                  local.get 17
                  i32.store offset=124
                  local.get 0
                  i32.load offset=180
                  local.tee 3
                  i32.const -2147483648
                  i32.xor
                  i32.const 2
                  local.get 3
                  i32.const 0
                  i32.lt_s
                  select
                  br_table 4 (;@2;) 3 (;@3;) 2 (;@4;) 4 (;@2;)
                end
                global.get $GOT.data.internal.__memory_base
                local.tee 3
                i32.const 1050216
                i32.add
                i32.const 43
                local.get 1
                i32.const 287
                i32.add
                local.get 3
                i32.const 1054068
                i32.add
                local.get 3
                i32.const 1054084
                i32.add
                call $_ZN4core6result13unwrap_failed17hfc7ff948713b7b29E
                unreachable
              end
              global.get $GOT.data.internal.__memory_base
              local.tee 3
              i32.const 1050216
              i32.add
              i32.const 43
              local.get 1
              i32.const 287
              i32.add
              local.get 3
              i32.const 1054068
              i32.add
              local.get 3
              i32.const 1054084
              i32.add
              call $_ZN4core6result13unwrap_failed17hfc7ff948713b7b29E
              unreachable
            end
            local.get 1
            i32.const 2
            i32.store8 offset=128
            local.get 1
            local.get 0
            i64.load offset=184
            i64.store offset=132 align=4
            br 2 (;@1;)
          end
          local.get 1
          i32.const 1
          i32.store8 offset=128
          br 1 (;@1;)
        end
        local.get 1
        i32.const 0
        i32.store8 offset=128
      end
      local.get 1
      local.get 0
      i64.load offset=44 align=4
      i64.store offset=140 align=4
      i32.const 0
      local.set 3
      i32.const 0
      local.set 5
      block ;; label = @1
        local.get 0
        i32.load offset=64
        i32.const -2147483648
        i32.eq
        br_if 0 (;@1;)
        local.get 1
        local.get 0
        i64.load offset=68 align=4
        i64.store offset=152
        i32.const 1
        local.set 5
      end
      local.get 1
      local.get 5
      i32.store8 offset=148
      block ;; label = @1
        local.get 0
        i32.load offset=76
        i32.const -2147483648
        i32.eq
        br_if 0 (;@1;)
        local.get 1
        local.get 0
        i64.load offset=80
        i64.store offset=164 align=4
        i32.const 1
        local.set 3
      end
      local.get 1
      local.get 3
      i32.store8 offset=160
      block ;; label = @1
        local.get 0
        i32.load offset=60
        local.tee 6
        i32.const 4
        i32.shl
        local.tee 3
        i32.const 4
        call $_ZN4core5alloc6layout6Layout19is_size_align_valid17h62d78098b400ece0E
        i32.eqz
        br_if 0 (;@1;)
        local.get 1
        i32.const 268
        i32.add
        i32.const 4
        local.get 3
        call $_ZN11wit_bindgen2rt7Cleanup3new17heb7b848a91323ee7E
        local.get 1
        i32.load offset=268
        local.set 2
        local.get 1
        i32.const 264
        i32.add
        local.get 1
        i32.const 280
        i32.add
        i32.load
        i32.store
        local.get 1
        local.get 1
        i64.load offset=272 align=4
        i64.store offset=256
        block ;; label = @2
          local.get 6
          i32.eqz
          br_if 0 (;@2;)
          local.get 0
          i32.load offset=56
          local.set 3
          local.get 6
          i32.const 24
          i32.mul
          i32.const -24
          i32.add
          local.tee 5
          i32.const 24
          i32.div_u
          local.set 11
          i32.const 0
          local.set 7
          block ;; label = @3
            local.get 5
            i32.const 24
            i32.lt_u
            br_if 0 (;@3;)
            local.get 11
            i32.const 1
            i32.add
            i32.const 536870910
            i32.and
            local.set 8
            i32.const 0
            local.set 7
            loop ;; label = @4
              local.get 2
              local.get 7
              i32.add
              local.tee 5
              local.get 3
              i32.const 4
              i32.add
              i64.load align=4
              i64.store align=4
              local.get 5
              i32.const 8
              i32.add
              local.get 3
              i32.const 16
              i32.add
              i64.load align=4
              i64.store align=4
              local.get 5
              i32.const 16
              i32.add
              local.get 3
              i32.const 28
              i32.add
              i64.load align=4
              i64.store align=4
              local.get 5
              i32.const 24
              i32.add
              local.get 3
              i32.const 40
              i32.add
              i64.load align=4
              i64.store align=4
              local.get 7
              i32.const 32
              i32.add
              local.set 7
              local.get 3
              i32.const 48
              i32.add
              local.set 3
              local.get 8
              i32.const -2
              i32.add
              local.tee 8
              br_if 0 (;@4;)
            end
          end
          local.get 11
          i32.const 1
          i32.and
          br_if 0 (;@2;)
          local.get 2
          local.get 7
          i32.add
          local.tee 5
          local.get 3
          i64.load offset=4 align=4
          i64.store align=4
          local.get 5
          local.get 3
          i64.load offset=16 align=4
          i64.store offset=8 align=4
        end
        local.get 1
        local.get 2
        i32.store offset=172
        local.get 1
        local.get 6
        i32.store offset=176
        local.get 1
        local.get 0
        i32.load offset=192
        i32.store offset=180
        local.get 1
        local.get 0
        i64.load offset=196 align=4
        i64.store offset=184
        local.get 1
        i32.const 24
        i32.add
        call $_ZN19wasi_otel_framework8bindings4wasi4otel7tracing6on_end12wit_import4917h6482987a27b942d2E
        block ;; label = @2
          local.get 1
          i32.load offset=256
          i32.eqz
          br_if 0 (;@2;)
          local.get 1
          i32.const 256
          i32.add
          call $_ZN66_$LT$wit_bindgen..rt..Cleanup$u20$as$u20$core..ops..drop..Drop$GT$4drop17h8f4b8814b56a85eeE
        end
        block ;; label = @2
          local.get 1
          i32.load offset=240
          i32.eqz
          br_if 0 (;@2;)
          local.get 1
          i32.const 240
          i32.add
          call $_ZN66_$LT$wit_bindgen..rt..Cleanup$u20$as$u20$core..ops..drop..Drop$GT$4drop17h8f4b8814b56a85eeE
        end
        block ;; label = @2
          local.get 1
          i32.load offset=224
          i32.eqz
          br_if 0 (;@2;)
          local.get 1
          i32.const 224
          i32.add
          call $_ZN66_$LT$wit_bindgen..rt..Cleanup$u20$as$u20$core..ops..drop..Drop$GT$4drop17h8f4b8814b56a85eeE
        end
        block ;; label = @2
          local.get 1
          i32.load offset=208
          i32.eqz
          br_if 0 (;@2;)
          local.get 1
          i32.const 208
          i32.add
          call $_ZN66_$LT$wit_bindgen..rt..Cleanup$u20$as$u20$core..ops..drop..Drop$GT$4drop17h8f4b8814b56a85eeE
        end
        block ;; label = @2
          local.get 1
          i32.load offset=192
          i32.eqz
          br_if 0 (;@2;)
          local.get 1
          i32.const 192
          i32.add
          call $_ZN66_$LT$wit_bindgen..rt..Cleanup$u20$as$u20$core..ops..drop..Drop$GT$4drop17h8f4b8814b56a85eeE
        end
        local.get 1
        i32.load offset=16
        local.set 5
        block ;; label = @2
          local.get 4
          i32.eqz
          br_if 0 (;@2;)
          local.get 5
          local.set 3
          loop ;; label = @3
            local.get 3
            call $_ZN66_$LT$wit_bindgen..rt..Cleanup$u20$as$u20$core..ops..drop..Drop$GT$4drop17h8f4b8814b56a85eeE
            local.get 3
            i32.const 12
            i32.add
            local.set 3
            local.get 4
            i32.const -1
            i32.add
            local.tee 4
            br_if 0 (;@3;)
          end
        end
        block ;; label = @2
          local.get 1
          i32.load offset=12
          local.tee 3
          i32.eqz
          br_if 0 (;@2;)
          local.get 5
          local.get 3
          i32.const 12
          i32.mul
          i32.const 4
          call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
        end
        local.get 1
        i32.const 288
        i32.add
        global.set $__stack_pointer
        return
      end
      global.get $GOT.data.internal.__memory_base
      local.tee 3
      i32.const 1050216
      i32.add
      i32.const 43
      local.get 1
      i32.const 287
      i32.add
      local.get 3
      i32.const 1054068
      i32.add
      local.get 3
      i32.const 1054084
      i32.add
      call $_ZN4core6result13unwrap_failed17hfc7ff948713b7b29E
      unreachable
    )
    (func $_ZN19wasi_otel_framework8bindings4wasi4otel7tracing8on_start17ha3eacf4b9227f693E (;40;) (type 0) (param i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      i32.const 32
      i32.sub
      local.tee 1
      global.set $__stack_pointer
      local.get 0
      i32.load offset=20
      local.set 2
      local.get 0
      i32.load offset=16
      local.set 3
      local.get 0
      i32.load offset=8
      local.set 4
      local.get 0
      i32.load offset=4
      local.set 5
      block ;; label = @1
        local.get 0
        i32.load offset=32
        local.tee 6
        i32.const 4
        i32.shl
        local.tee 7
        i32.const 4
        call $_ZN4core5alloc6layout6Layout19is_size_align_valid17h62d78098b400ece0E
        i32.eqz
        br_if 0 (;@1;)
        local.get 1
        i32.const 12
        i32.add
        i32.const 4
        local.get 7
        call $_ZN11wit_bindgen2rt7Cleanup3new17heb7b848a91323ee7E
        local.get 1
        i32.load offset=12
        local.set 8
        local.get 1
        i32.const 8
        i32.add
        local.get 1
        i32.const 24
        i32.add
        i32.load
        i32.store
        local.get 1
        local.get 1
        i64.load offset=16 align=4
        i64.store
        block ;; label = @2
          local.get 6
          i32.eqz
          br_if 0 (;@2;)
          local.get 0
          i32.load offset=28
          local.set 7
          local.get 6
          i32.const 24
          i32.mul
          i32.const -24
          i32.add
          local.tee 9
          i32.const 24
          i32.div_u
          local.set 10
          i32.const 0
          local.set 11
          block ;; label = @3
            local.get 9
            i32.const 24
            i32.lt_u
            br_if 0 (;@3;)
            local.get 10
            i32.const 1
            i32.add
            i32.const 536870910
            i32.and
            local.set 12
            i32.const 0
            local.set 11
            loop ;; label = @4
              local.get 8
              local.get 11
              i32.add
              local.tee 9
              local.get 7
              i32.const 4
              i32.add
              i64.load align=4
              i64.store align=4
              local.get 9
              i32.const 8
              i32.add
              local.get 7
              i32.const 16
              i32.add
              i64.load align=4
              i64.store align=4
              local.get 9
              i32.const 16
              i32.add
              local.get 7
              i32.const 28
              i32.add
              i64.load align=4
              i64.store align=4
              local.get 9
              i32.const 24
              i32.add
              local.get 7
              i32.const 40
              i32.add
              i64.load align=4
              i64.store align=4
              local.get 11
              i32.const 32
              i32.add
              local.set 11
              local.get 7
              i32.const 48
              i32.add
              local.set 7
              local.get 12
              i32.const -2
              i32.add
              local.tee 12
              br_if 0 (;@4;)
            end
          end
          local.get 10
          i32.const 1
          i32.and
          br_if 0 (;@2;)
          local.get 8
          local.get 11
          i32.add
          local.tee 9
          local.get 7
          i64.load offset=4 align=4
          i64.store align=4
          local.get 9
          local.get 7
          i64.load offset=16 align=4
          i64.store offset=8 align=4
        end
        local.get 5
        local.get 4
        local.get 3
        local.get 2
        local.get 0
        i32.load8_u offset=37
        local.get 0
        i32.load8_u offset=36
        local.get 8
        local.get 6
        call $_ZN19wasi_otel_framework8bindings4wasi4otel7tracing8on_start11wit_import817h86df23d22f8aa9d5E
        block ;; label = @2
          local.get 1
          i32.load
          i32.eqz
          br_if 0 (;@2;)
          local.get 1
          call $_ZN66_$LT$wit_bindgen..rt..Cleanup$u20$as$u20$core..ops..drop..Drop$GT$4drop17h8f4b8814b56a85eeE
        end
        local.get 1
        i32.const 32
        i32.add
        global.set $__stack_pointer
        return
      end
      global.get $GOT.data.internal.__memory_base
      local.tee 7
      i32.const 1050216
      i32.add
      i32.const 43
      local.get 1
      i32.const 31
      i32.add
      local.get 7
      i32.const 1054068
      i32.add
      local.get 7
      i32.const 1054084
      i32.add
      call $_ZN4core6result13unwrap_failed17hfc7ff948713b7b29E
      unreachable
    )
    (func $_ZN69_$LT$core..alloc..layout..LayoutError$u20$as$u20$core..fmt..Debug$GT$3fmt17h18134a55c355799fE.llvm.4771902097668336220 (;41;) (type 4) (param i32 i32) (result i32)
      local.get 1
      global.get $GOT.data.internal.__memory_base
      i32.const 1050259
      i32.add
      i32.const 11
      call $_ZN4core3fmt9Formatter9write_str17h34f77234b6666431E
    )
    (func $_ZN19wasi_otel_framework7tracing4Span3new17h29681fe320ca45e6E (;42;) (type 13) (param i32 i32 i32 i32 i32)
      (local i32 i64 i32 i32 i32)
      global.get $__stack_pointer
      i32.const 112
      i32.sub
      local.tee 5
      global.set $__stack_pointer
      local.get 5
      i32.const 8
      i32.add
      call $_ZN19wasi_otel_framework8bindings4wasi4otel7tracing18inner_span_context17h0078b8261bb1b596E
      call $_ZN19wasi_otel_framework8bindings4wasi6random6random14get_random_u6411wit_import017h50e264afebc109d0E
      local.set 6
      local.get 5
      i32.const 56
      i32.add
      i32.const 8
      i32.add
      local.get 5
      i32.const 8
      i32.add
      i32.const 8
      i32.add
      i32.load
      i32.store
      local.get 5
      local.get 6
      i64.store offset=48
      local.get 5
      local.get 5
      i64.load offset=8 align=4
      i64.store offset=56
      local.get 5
      global.get $GOT.func.internal._ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$u64$GT$3fmt17h8c687a3c8e01ab2bE
      i64.extend_i32_u
      i64.const 32
      i64.shl
      local.get 5
      i32.const 48
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=96
      local.get 5
      i32.const 68
      i32.add
      global.get $GOT.data.internal.__memory_base
      i32.const 1050270
      i32.add
      local.get 5
      i32.const 96
      i32.add
      call $_ZN5alloc3fmt6format12format_inner17h24bee7aa8419c476E
      local.get 5
      i32.const 56
      i32.add
      i32.const 32
      i32.add
      local.get 5
      i32.const 8
      i32.add
      i32.const 32
      i32.add
      i32.load
      i32.store
      local.get 5
      local.get 5
      i64.load offset=32 align=4
      i64.store offset=80
      i32.const 0
      local.set 7
      block ;; label = @1
        block ;; label = @2
          local.get 2
          i32.const 0
          i32.lt_s
          br_if 0 (;@2;)
          block ;; label = @3
            block ;; label = @4
              local.get 2
              br_if 0 (;@4;)
              i32.const 1
              local.set 8
              br 1 (;@3;)
            end
            call $_RNvCsdBezzDwma51_7___rustc35___rust_no_alloc_shim_is_unstable_v2
            i32.const 1
            local.set 7
            local.get 2
            i32.const 1
            call $_RNvCsdBezzDwma51_7___rustc12___rust_alloc
            local.tee 8
            i32.eqz
            br_if 1 (;@2;)
          end
          block ;; label = @3
            local.get 2
            i32.eqz
            br_if 0 (;@3;)
            local.get 8
            local.get 1
            local.get 2
            memory.copy
          end
          i32.const 0
          local.set 7
          local.get 5
          i32.const 96
          i32.add
          call $_ZN19wasi_otel_framework8bindings4wasi6clocks10wall_clock3now11wit_import117hb66951f66f60100aE
          local.get 4
          i32.const 0
          i32.lt_s
          br_if 1 (;@1;)
          local.get 5
          i32.load offset=104
          local.set 9
          local.get 5
          i64.load offset=96
          local.set 6
          block ;; label = @3
            block ;; label = @4
              local.get 4
              br_if 0 (;@4;)
              i32.const 1
              local.set 1
              br 1 (;@3;)
            end
            call $_RNvCsdBezzDwma51_7___rustc35___rust_no_alloc_shim_is_unstable_v2
            i32.const 1
            local.set 7
            local.get 4
            i32.const 1
            call $_RNvCsdBezzDwma51_7___rustc12___rust_alloc
            local.tee 1
            i32.eqz
            br_if 2 (;@1;)
          end
          block ;; label = @3
            local.get 4
            i32.eqz
            br_if 0 (;@3;)
            local.get 1
            local.get 3
            local.get 4
            memory.copy
          end
          local.get 0
          local.get 2
          i32.store offset=112
          local.get 0
          local.get 8
          i32.store offset=108
          local.get 0
          local.get 2
          i32.store offset=104
          local.get 0
          local.get 9
          i32.store offset=96
          local.get 0
          local.get 6
          i64.store offset=88
          local.get 0
          local.get 5
          i64.load offset=20 align=4
          i64.store offset=116 align=4
          local.get 0
          i32.const 124
          i32.add
          local.get 5
          i32.const 28
          i32.add
          i32.load
          i32.store
          local.get 0
          local.get 5
          i64.load offset=56
          i64.store align=4
          local.get 0
          i32.const 8
          i32.add
          local.get 5
          i32.const 56
          i32.add
          i32.const 8
          i32.add
          i64.load
          i64.store align=4
          local.get 0
          i32.const 16
          i32.add
          local.get 5
          i32.const 56
          i32.add
          i32.const 16
          i32.add
          i64.load
          i64.store align=4
          local.get 0
          i32.const 24
          i32.add
          local.get 5
          i32.const 56
          i32.add
          i32.const 24
          i32.add
          i64.load
          i64.store align=4
          local.get 0
          i32.const 32
          i32.add
          local.get 5
          i32.const 56
          i32.add
          i32.const 32
          i32.add
          i32.load
          i32.store
          local.get 0
          i32.const 4
          i32.store8 offset=176
          local.get 0
          i32.const 257
          i32.store16 offset=36
          local.get 0
          i64.const -9223372036854775808
          i64.store offset=160
          local.get 0
          i64.const 17179869184
          i64.store offset=128
          local.get 0
          i64.const 0
          i64.store offset=136
          local.get 0
          i64.const 8
          i64.store offset=144
          local.get 0
          i64.const 17179869184
          i64.store offset=152
          local.get 0
          local.get 4
          i32.store offset=40
          local.get 0
          local.get 1
          i32.store offset=44
          local.get 0
          local.get 4
          i32.store offset=48
          local.get 0
          i32.const -2147483648
          i32.store offset=76
          local.get 0
          i64.const 17179869184
          i64.store offset=52 align=4
          local.get 0
          i64.const -9223372036854775808
          i64.store offset=60 align=4
          local.get 5
          i32.const 112
          i32.add
          global.set $__stack_pointer
          return
        end
        local.get 7
        local.get 2
        call $_ZN5alloc7raw_vec12handle_error17h9f321253d17717ecE
        unreachable
      end
      local.get 7
      local.get 4
      call $_ZN5alloc7raw_vec12handle_error17h9f321253d17717ecE
      unreachable
    )
    (func $_ZN19wasi_otel_framework7tracing4Span4stop17hd32ff2ee4334968eE (;43;) (type 0) (param i32)
      (local i32 i64 i32 i32 i64 i32)
      global.get $__stack_pointer
      i32.const 224
      i32.sub
      local.tee 1
      global.set $__stack_pointer
      local.get 1
      i32.const 128
      i32.add
      local.get 0
      i32.const 124
      i32.add
      i32.load
      i32.store
      local.get 1
      i32.const 140
      i32.add
      local.get 0
      i32.const 112
      i32.add
      i32.load
      i32.store
      local.get 1
      local.get 0
      i64.load offset=116 align=4
      i64.store offset=120
      local.get 1
      local.get 0
      i64.load offset=104 align=4
      i64.store offset=132 align=4
      local.get 0
      i64.load offset=88
      local.set 2
      local.get 0
      i32.load offset=96
      local.set 3
      local.get 0
      i32.load8_u offset=176
      local.set 4
      local.get 1
      i32.const 208
      i32.add
      call $_ZN19wasi_otel_framework8bindings4wasi6clocks10wall_clock3now11wit_import117hb66951f66f60100aE
      local.get 1
      i64.load offset=208
      local.set 5
      local.get 1
      i32.load offset=216
      local.set 6
      local.get 1
      i32.const 152
      i32.add
      local.get 0
      i32.const 136
      i32.add
      i32.load
      i32.store
      local.get 1
      i32.const 164
      i32.add
      local.get 0
      i32.const 148
      i32.add
      i32.load
      i32.store
      local.get 1
      i32.const 176
      i32.add
      local.get 0
      i32.const 160
      i32.add
      i32.load
      i32.store
      local.get 1
      i32.const 188
      i32.add
      local.get 0
      i32.const 172
      i32.add
      i32.load
      i32.store
      local.get 1
      local.get 0
      i64.load offset=128
      i64.store offset=144
      local.get 1
      local.get 0
      i64.load offset=140 align=4
      i64.store offset=156 align=4
      local.get 1
      local.get 0
      i64.load offset=152
      i64.store offset=168
      local.get 1
      local.get 0
      i64.load offset=164 align=4
      i64.store offset=180 align=4
      local.get 1
      i32.const 80
      i32.add
      local.get 0
      i32.const 80
      i32.add
      i64.load
      i64.store
      local.get 1
      i32.const 72
      i32.add
      local.get 0
      i32.const 72
      i32.add
      i64.load
      i64.store
      local.get 1
      i32.const 64
      i32.add
      local.get 0
      i32.const 64
      i32.add
      i64.load
      i64.store
      local.get 1
      i32.const 56
      i32.add
      local.get 0
      i32.const 56
      i32.add
      i64.load
      i64.store
      local.get 1
      i32.const 48
      i32.add
      local.get 0
      i32.const 48
      i32.add
      i64.load
      i64.store
      local.get 1
      local.get 0
      i64.load offset=40
      i64.store offset=40
      local.get 1
      i32.const 32
      i32.add
      local.get 0
      i32.const 32
      i32.add
      i64.load
      i64.store
      local.get 1
      i32.const 24
      i32.add
      local.get 0
      i32.const 24
      i32.add
      i64.load
      i64.store
      local.get 1
      i32.const 16
      i32.add
      local.get 0
      i32.const 16
      i32.add
      i64.load
      i64.store
      local.get 1
      i32.const 8
      i32.add
      local.get 0
      i32.const 8
      i32.add
      i64.load
      i64.store
      local.get 1
      local.get 0
      i64.load
      i64.store
      local.get 1
      local.get 4
      i32.store8 offset=204
      local.get 1
      i32.const 0
      i32.store offset=200
      local.get 1
      i64.const 0
      i64.store offset=192
      local.get 1
      local.get 6
      i32.store offset=112
      local.get 1
      local.get 5
      i64.store offset=104
      local.get 1
      local.get 3
      i32.store offset=96
      local.get 1
      local.get 2
      i64.store offset=88
      local.get 1
      call $_ZN19wasi_otel_framework8bindings4wasi4otel7tracing6on_end17h1aa339de0cde82b1E
      block ;; label = @1
        local.get 1
        i32.load
        local.tee 0
        i32.eqz
        br_if 0 (;@1;)
        local.get 1
        i32.load offset=4
        local.get 0
        i32.const 1
        call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
      end
      block ;; label = @1
        local.get 1
        i32.load offset=12
        local.tee 0
        i32.eqz
        br_if 0 (;@1;)
        local.get 1
        i32.load offset=16
        local.get 0
        i32.const 1
        call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
      end
      block ;; label = @1
        local.get 1
        i32.load offset=32
        local.tee 3
        i32.eqz
        br_if 0 (;@1;)
        local.get 1
        i32.load offset=28
        local.set 0
        loop ;; label = @2
          block ;; label = @3
            local.get 0
            i32.load
            local.tee 4
            i32.eqz
            br_if 0 (;@3;)
            local.get 0
            i32.const 4
            i32.add
            i32.load
            local.get 4
            i32.const 1
            call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
          end
          block ;; label = @3
            local.get 0
            i32.const 12
            i32.add
            i32.load
            local.tee 4
            i32.eqz
            br_if 0 (;@3;)
            local.get 0
            i32.const 16
            i32.add
            i32.load
            local.get 4
            i32.const 1
            call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
          end
          local.get 0
          i32.const 24
          i32.add
          local.set 0
          local.get 3
          i32.const -1
          i32.add
          local.tee 3
          br_if 0 (;@2;)
        end
      end
      block ;; label = @1
        local.get 1
        i32.load offset=24
        local.tee 0
        i32.eqz
        br_if 0 (;@1;)
        local.get 1
        i32.load offset=28
        local.get 0
        i32.const 24
        i32.mul
        i32.const 4
        call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
      end
      block ;; label = @1
        local.get 1
        i32.load offset=120
        local.tee 0
        i32.eqz
        br_if 0 (;@1;)
        local.get 1
        i32.load offset=124
        local.get 0
        i32.const 1
        call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
      end
      block ;; label = @1
        local.get 1
        i32.load offset=132
        local.tee 0
        i32.eqz
        br_if 0 (;@1;)
        local.get 1
        i32.load offset=136
        local.get 0
        i32.const 1
        call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
      end
      block ;; label = @1
        local.get 1
        i32.load offset=152
        local.tee 3
        i32.eqz
        br_if 0 (;@1;)
        local.get 1
        i32.load offset=148
        local.set 0
        loop ;; label = @2
          block ;; label = @3
            local.get 0
            i32.load
            local.tee 4
            i32.eqz
            br_if 0 (;@3;)
            local.get 0
            i32.const 4
            i32.add
            i32.load
            local.get 4
            i32.const 1
            call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
          end
          block ;; label = @3
            local.get 0
            i32.const 12
            i32.add
            i32.load
            local.tee 4
            i32.eqz
            br_if 0 (;@3;)
            local.get 0
            i32.const 16
            i32.add
            i32.load
            local.get 4
            i32.const 1
            call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
          end
          local.get 0
          i32.const 24
          i32.add
          local.set 0
          local.get 3
          i32.const -1
          i32.add
          local.tee 3
          br_if 0 (;@2;)
        end
      end
      local.get 1
      i32.const 156
      i32.add
      local.set 0
      block ;; label = @1
        local.get 1
        i32.load offset=144
        local.tee 3
        i32.eqz
        br_if 0 (;@1;)
        local.get 1
        i32.load offset=148
        local.get 3
        i32.const 24
        i32.mul
        i32.const 4
        call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
      end
      local.get 1
      i32.const 168
      i32.add
      local.set 3
      local.get 0
      call $_ZN70_$LT$alloc..vec..Vec$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h1fec862420e49aa9E
      block ;; label = @1
        local.get 1
        i32.load offset=156
        local.tee 0
        i32.eqz
        br_if 0 (;@1;)
        local.get 1
        i32.load offset=160
        local.get 0
        i32.const 40
        i32.mul
        i32.const 8
        call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
      end
      local.get 3
      call $_ZN70_$LT$alloc..vec..Vec$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17hded4239960058047E
      block ;; label = @1
        local.get 1
        i32.load offset=168
        local.tee 0
        i32.eqz
        br_if 0 (;@1;)
        local.get 1
        i32.load offset=172
        local.get 0
        i32.const 52
        i32.mul
        i32.const 4
        call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
      end
      block ;; label = @1
        local.get 1
        i32.load offset=180
        local.tee 0
        i32.const -2147483646
        i32.lt_s
        br_if 0 (;@1;)
        local.get 0
        i32.eqz
        br_if 0 (;@1;)
        local.get 1
        i32.load offset=184
        local.get 0
        i32.const 1
        call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
      end
      block ;; label = @1
        local.get 1
        i32.load offset=40
        local.tee 0
        i32.eqz
        br_if 0 (;@1;)
        local.get 1
        i32.load offset=44
        local.get 0
        i32.const 1
        call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
      end
      block ;; label = @1
        local.get 1
        i32.load offset=64
        local.tee 0
        i32.const -2147483648
        i32.eq
        br_if 0 (;@1;)
        local.get 0
        i32.eqz
        br_if 0 (;@1;)
        local.get 1
        i32.load offset=68
        local.get 0
        i32.const 1
        call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
      end
      block ;; label = @1
        local.get 1
        i32.load offset=76
        local.tee 0
        i32.const -2147483648
        i32.eq
        br_if 0 (;@1;)
        local.get 0
        i32.eqz
        br_if 0 (;@1;)
        local.get 1
        i32.load offset=80
        local.get 0
        i32.const 1
        call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
      end
      block ;; label = @1
        local.get 1
        i32.load offset=60
        local.tee 3
        i32.eqz
        br_if 0 (;@1;)
        local.get 1
        i32.load offset=56
        local.set 0
        loop ;; label = @2
          block ;; label = @3
            local.get 0
            i32.load
            local.tee 4
            i32.eqz
            br_if 0 (;@3;)
            local.get 0
            i32.const 4
            i32.add
            i32.load
            local.get 4
            i32.const 1
            call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
          end
          block ;; label = @3
            local.get 0
            i32.const 12
            i32.add
            i32.load
            local.tee 4
            i32.eqz
            br_if 0 (;@3;)
            local.get 0
            i32.const 16
            i32.add
            i32.load
            local.get 4
            i32.const 1
            call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
          end
          local.get 0
          i32.const 24
          i32.add
          local.set 0
          local.get 3
          i32.const -1
          i32.add
          local.tee 3
          br_if 0 (;@2;)
        end
      end
      block ;; label = @1
        local.get 1
        i32.load offset=52
        local.tee 0
        i32.eqz
        br_if 0 (;@1;)
        local.get 1
        i32.load offset=56
        local.get 0
        i32.const 24
        i32.mul
        i32.const 4
        call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
      end
      local.get 1
      i32.const 224
      i32.add
      global.set $__stack_pointer
    )
    (func $_ZN19wasi_otel_framework7tracing4Span5start17he751eef627212268E (;44;) (type 0) (param i32)
      local.get 0
      call $_ZN19wasi_otel_framework8bindings4wasi4otel7tracing8on_start17ha3eacf4b9227f693E
    )
    (func $_ZN19wasi_otel_framework7tracing6Tracer3new17hd1569cf7fd71269dE (;45;) (type 9) (param i32 i32 i32)
      (local i32 i32)
      i32.const 0
      local.set 3
      block ;; label = @1
        local.get 2
        i32.const 0
        i32.lt_s
        br_if 0 (;@1;)
        block ;; label = @2
          block ;; label = @3
            local.get 2
            br_if 0 (;@3;)
            i32.const 1
            local.set 4
            br 1 (;@2;)
          end
          call $_RNvCsdBezzDwma51_7___rustc35___rust_no_alloc_shim_is_unstable_v2
          i32.const 1
          local.set 3
          local.get 2
          i32.const 1
          call $_RNvCsdBezzDwma51_7___rustc12___rust_alloc
          local.tee 4
          i32.eqz
          br_if 1 (;@1;)
        end
        block ;; label = @2
          local.get 2
          i32.eqz
          br_if 0 (;@2;)
          local.get 4
          local.get 1
          local.get 2
          memory.copy
        end
        local.get 0
        local.get 2
        i32.store offset=8
        local.get 0
        local.get 4
        i32.store offset=4
        local.get 0
        local.get 2
        i32.store
        return
      end
      local.get 3
      local.get 2
      call $_ZN5alloc7raw_vec12handle_error17h9f321253d17717ecE
      unreachable
    )
    (func $_ZN11wit_bindgen2rt14run_ctors_once17h5c2f37a76084ec7bE (;46;) (type 8)
      (local i32)
      block ;; label = @1
        global.get $GOT.data.internal.__memory_base
        i32.const 1055048
        i32.add
        i32.load8_u
        br_if 0 (;@1;)
        global.get $GOT.data.internal.__memory_base
        local.set 0
        call $__wasm_call_ctors
        local.get 0
        i32.const 1055048
        i32.add
        i32.const 1
        i32.store8
      end
    )
    (func $_ZN11wit_bindgen2rt7Cleanup3new17heb7b848a91323ee7E (;47;) (type 9) (param i32 i32 i32)
      (local i32)
      block ;; label = @1
        local.get 2
        i32.eqz
        br_if 0 (;@1;)
        call $_RNvCsdBezzDwma51_7___rustc35___rust_no_alloc_shim_is_unstable_v2
        block ;; label = @2
          local.get 2
          local.get 1
          call $_RNvCsdBezzDwma51_7___rustc12___rust_alloc
          local.tee 3
          i32.eqz
          br_if 0 (;@2;)
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
        call $_ZN5alloc5alloc18handle_alloc_error17h6a90b55247f528a0E
        unreachable
      end
      local.get 0
      i64.const 0
      i64.store align=4
    )
    (func $_ZN66_$LT$wit_bindgen..rt..Cleanup$u20$as$u20$core..ops..drop..Drop$GT$4drop17h8f4b8814b56a85eeE (;48;) (type 0) (param i32)
      local.get 0
      i32.load offset=8
      local.get 0
      i32.load offset=4
      local.get 0
      i32.load
      call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
    )
    (func $_RNvCsdBezzDwma51_7___rustc18___rust_start_panic (;49;) (type 4) (param i32 i32) (result i32)
      call $_RNvCsdBezzDwma51_7___rustc12___rust_abort
      unreachable
    )
    (func $_RNvCsdBezzDwma51_7___rustc10rust_panic (;50;) (type 3) (param i32 i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 32
      i32.sub
      local.tee 2
      global.set $__stack_pointer
      local.get 2
      local.get 0
      local.get 1
      call $_RNvCsdBezzDwma51_7___rustc18___rust_start_panic
      i32.store offset=4
      local.get 2
      i64.const 0
      i64.store offset=8
      local.get 2
      global.get $GOT.func.internal._ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hd03bfcbf982015daE
      i64.extend_i32_u
      i64.const 32
      i64.shl
      local.get 2
      i32.const 4
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=24
      local.get 2
      i32.const 16
      i32.add
      local.get 2
      i32.const 8
      i32.add
      global.get $GOT.data.internal.__memory_base
      i32.const 1049805
      i32.add
      local.get 2
      i32.const 24
      i32.add
      call $_ZN3std2io5Write9write_fmt17hd7ee7125c0996452E
      local.get 2
      i32.load8_u offset=16
      local.get 2
      i32.load offset=20
      call $_ZN4core3ptr81drop_in_place$LT$core..result..Result$LT$$LP$$RP$$C$std..io..error..Error$GT$$GT$17hcad36bac1cd65805E
      local.get 2
      i32.const 8
      i32.add
      call $_ZN4core3ptr52drop_in_place$LT$std..sys..stdio..wasip2..Stderr$GT$17h50b0dd383b42d473E
      call $_ZN3std7process5abort17h6882cf5ccf16f1f0E
      unreachable
    )
    (func $_ZN3std2io5Write9write_fmt17hd7ee7125c0996452E (;51;) (type 1) (param i32 i32 i32 i32)
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
      i32.const 1054176
      i32.add
      local.get 2
      local.get 3
      call $_ZN4core3fmt5write17h80512e2a12699005E
      local.set 3
      local.get 4
      i32.load8_u
      local.set 1
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            local.get 3
            i32.eqz
            br_if 0 (;@3;)
            local.get 1
            i32.const 4
            i32.ne
            br_if 1 (;@2;)
            global.get $GOT.data.internal.__memory_base
            local.tee 4
            i32.const 1050312
            i32.add
            i32.const 173
            local.get 4
            i32.const 1054136
            i32.add
            call $_ZN4core9panicking9panic_fmt17hd2f72abdb0aff166E
            unreachable
          end
          local.get 4
          i32.load offset=4
          local.set 0
          block ;; label = @3
            local.get 1
            i32.const 4
            i32.gt_u
            br_if 0 (;@3;)
            local.get 1
            i32.const 3
            i32.ne
            br_if 2 (;@1;)
          end
          local.get 0
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
            call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
          end
          local.get 0
          i32.const 12
          i32.const 4
          call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
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
    (func $_ZN4core3ptr81drop_in_place$LT$core..result..Result$LT$$LP$$RP$$C$std..io..error..Error$GT$$GT$17hcad36bac1cd65805E (;52;) (type 3) (param i32 i32)
      (local i32 i32)
      block ;; label = @1
        block ;; label = @2
          local.get 0
          i32.const 255
          i32.and
          local.tee 0
          i32.const 4
          i32.gt_u
          br_if 0 (;@2;)
          local.get 0
          i32.const 3
          i32.ne
          br_if 1 (;@1;)
        end
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
          call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
        end
        local.get 1
        i32.const 12
        i32.const 4
        call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
      end
    )
    (func $_ZN4core3ptr52drop_in_place$LT$std..sys..stdio..wasip2..Stderr$GT$17h50b0dd383b42d473E (;53;) (type 0) (param i32)
      block ;; label = @1
        local.get 0
        i32.load
        i32.eqz
        br_if 0 (;@1;)
        local.get 0
        i32.load offset=4
        local.tee 0
        i32.const -1
        i32.eq
        br_if 0 (;@1;)
        local.get 0
        call $_ZN99_$LT$wasi..imports..wasi..io..streams..OutputStream$u20$as$u20$wasi..imports.._rt..WasmResource$GT$4drop4drop17hbe32e132e65d9c15E
      end
    )
    (func $_ZN3std7process5abort17h6882cf5ccf16f1f0E (;54;) (type 8)
      call $_ZN3std3sys3pal6wasip27helpers14abort_internal17h7622470673c2f9f4E
      unreachable
    )
    (func $_RNvCsdBezzDwma51_7___rustc11___rdl_alloc (;55;) (type 4) (param i32 i32) (result i32)
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
    (func $_RNvCsdBezzDwma51_7___rustc12___rust_abort (;56;) (type 8)
      call $_ZN3std7process5abort17h6882cf5ccf16f1f0E
      unreachable
    )
    (func $_RNvCsdBezzDwma51_7___rustc13___rdl_dealloc (;57;) (type 9) (param i32 i32 i32)
      local.get 0
      call $free
    )
    (func $_RNvCsdBezzDwma51_7___rustc13___rdl_realloc (;58;) (type 11) (param i32 i32 i32 i32) (result i32)
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
    (func $_RNvCsdBezzDwma51_7___rustc17rust_begin_unwind (;59;) (type 0) (param i32)
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
      call $_ZN3std3sys9backtrace26__rust_end_short_backtrace17ha6dd3b00ba64db17E
      unreachable
    )
    (func $_ZN3std3sys9backtrace26__rust_end_short_backtrace17ha6dd3b00ba64db17E (;60;) (type 0) (param i32)
      local.get 0
      call $_ZN3std9panicking13panic_handler28_$u7b$$u7b$closure$u7d$$u7d$17h75b4c378ae6acf8bE
      unreachable
    )
    (func $_RNvCsdBezzDwma51_7___rustc26___rust_alloc_error_handler (;61;) (type 3) (param i32 i32)
      local.get 1
      local.get 0
      call $_ZN3std5alloc8rust_oom17h72b86c5f4f628697E
      unreachable
    )
    (func $_ZN3std5alloc8rust_oom17h72b86c5f4f628697E (;62;) (type 3) (param i32 i32)
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
      call $_ZN3std3sys9backtrace26__rust_end_short_backtrace17hacabb35dcc0ab271E
      unreachable
    )
    (func $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h51f289680be1be14E (;63;) (type 3) (param i32 i32)
      (local i32)
      local.get 0
      global.get $GOT.data.internal.__memory_base
      i32.const 1050280
      i32.add
      local.tee 2
      i64.load align=4
      i64.store align=4
      local.get 0
      i32.const 8
      i32.add
      local.get 2
      i32.const 8
      i32.add
      i64.load align=4
      i64.store align=4
    )
    (func $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17ha60ef7068aaec664E (;64;) (type 3) (param i32 i32)
      (local i32)
      local.get 0
      global.get $GOT.data.internal.__memory_base
      i32.const 1050296
      i32.add
      local.tee 2
      i64.load align=4
      i64.store align=4
      local.get 0
      i32.const 8
      i32.add
      local.get 2
      i32.const 8
      i32.add
      i64.load align=4
      i64.store align=4
    )
    (func $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h37bd321e32e301c5E (;65;) (type 4) (param i32 i32) (result i32)
      local.get 0
      i32.load
      local.get 0
      i32.load offset=4
      local.get 1
      call $_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h07a37024704900fbE
    )
    (func $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h14d6e18732974dddE (;66;) (type 13) (param i32 i32 i32 i32 i32)
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
        call $_ZN5alloc7raw_vec12handle_error17h9f321253d17717ecE
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
      call $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$11finish_grow17ha2632729e3ddc620E
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
        call $_ZN5alloc7raw_vec12handle_error17h9f321253d17717ecE
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
    (func $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$11finish_grow17ha2632729e3ddc620E (;67;) (type 12) (param i32 i32 i32 i32 i32 i32)
      (local i32 i32 i64)
      i32.const 1
      local.set 6
      i32.const 4
      local.set 7
      block ;; label = @1
        block ;; label = @2
          local.get 4
          local.get 5
          i32.add
          i32.const -1
          i32.add
          i32.const 0
          local.get 4
          i32.sub
          i32.and
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
                call $_RNvCsdBezzDwma51_7___rustc14___rust_realloc
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
              call $_RNvCsdBezzDwma51_7___rustc35___rust_no_alloc_shim_is_unstable_v2
              local.get 3
              local.get 4
              call $_RNvCsdBezzDwma51_7___rustc12___rust_alloc
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
    (func $_ZN3std2io5error5Error3new17h27c20b34f4cb0c9dE (;68;) (type 9) (param i32 i32 i32)
      (local i32)
      call $_RNvCsdBezzDwma51_7___rustc35___rust_no_alloc_shim_is_unstable_v2
      block ;; label = @1
        block ;; label = @2
          i32.const 12
          i32.const 4
          call $_RNvCsdBezzDwma51_7___rustc12___rust_alloc
          local.tee 3
          i32.eqz
          br_if 0 (;@2;)
          local.get 3
          local.get 2
          i64.load align=4
          i64.store align=4
          local.get 3
          i32.const 8
          i32.add
          local.get 2
          i32.const 8
          i32.add
          i32.load
          i32.store
          call $_RNvCsdBezzDwma51_7___rustc35___rust_no_alloc_shim_is_unstable_v2
          i32.const 12
          i32.const 4
          call $_RNvCsdBezzDwma51_7___rustc12___rust_alloc
          local.tee 2
          i32.eqz
          br_if 1 (;@1;)
          local.get 2
          local.get 1
          i32.store8 offset=8
          local.get 2
          local.get 3
          i32.store
          local.get 2
          global.get $GOT.data.internal.__memory_base
          i32.const 1054588
          i32.add
          i32.store offset=4
          local.get 0
          local.get 2
          i64.extend_i32_u
          i64.const 32
          i64.shl
          i64.const 3
          i64.or
          i64.store align=4
          return
        end
        i32.const 4
        i32.const 12
        call $_ZN5alloc5alloc18handle_alloc_error17h6a90b55247f528a0E
        unreachable
      end
      i32.const 4
      i32.const 12
      call $_ZN5alloc5alloc18handle_alloc_error17h6a90b55247f528a0E
      unreachable
    )
    (func $_ZN3std2io5Write17is_write_vectored17h8604cbb17a5321ecE (;69;) (type 14) (param i32) (result i32)
      i32.const 0
    )
    (func $_ZN3std2io5Write18write_all_vectored17h06aaedb7a82531aeE (;70;) (type 1) (param i32 i32 i32 i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 i32 i32)
      global.get $__stack_pointer
      i32.const 32
      i32.sub
      local.tee 4
      global.set $__stack_pointer
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                local.get 3
                i32.eqz
                br_if 0 (;@5;)
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
                block ;; label = @6
                  loop ;; label = @7
                    local.get 5
                    i32.load
                    br_if 1 (;@6;)
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
                    br_if 0 (;@7;)
                  end
                  local.get 7
                  local.set 8
                end
                local.get 3
                local.get 8
                i32.lt_u
                br_if 1 (;@4;)
                local.get 3
                local.get 8
                i32.eq
                br_if 0 (;@5;)
                local.get 1
                i32.const 4
                i32.add
                local.set 9
                local.get 3
                local.get 8
                i32.sub
                local.set 10
                local.get 2
                local.get 8
                i32.const 3
                i32.shl
                i32.add
                local.set 7
                loop ;; label = @6
                  local.get 10
                  i32.const 3
                  i32.shl
                  local.set 8
                  i32.const 0
                  local.set 2
                  i32.const 0
                  local.set 5
                  block ;; label = @7
                    loop ;; label = @8
                      block ;; label = @9
                        local.get 8
                        local.get 5
                        i32.ne
                        br_if 0 (;@9;)
                        i32.const 1
                        local.set 5
                        br 2 (;@7;)
                      end
                      local.get 7
                      local.get 5
                      i32.add
                      local.set 6
                      local.get 5
                      i32.const 8
                      i32.add
                      local.tee 3
                      local.set 5
                      local.get 6
                      i32.const 4
                      i32.add
                      i32.load
                      local.tee 6
                      i32.eqz
                      br_if 0 (;@8;)
                    end
                    local.get 7
                    local.get 3
                    i32.add
                    i32.const -8
                    i32.add
                    i32.load
                    local.set 5
                    local.get 6
                    local.set 2
                  end
                  block ;; label = @7
                    local.get 1
                    i32.load
                    br_if 0 (;@7;)
                    local.get 1
                    call $_ZN4wasi7imports4wasi3cli6stderr10get_stderr17h00867409b546223aE
                    i32.store offset=4
                    local.get 1
                    i32.const 1
                    i32.store
                  end
                  local.get 4
                  local.get 9
                  local.get 5
                  local.get 2
                  i32.const 4096
                  local.get 2
                  i32.const 4096
                  i32.lt_u
                  select
                  local.tee 11
                  call $_ZN4wasi7imports4wasi2io7streams12OutputStream24blocking_write_and_flush17he307f6cb42e51076E
                  block ;; label = @7
                    block ;; label = @8
                      block ;; label = @9
                        block ;; label = @10
                          block ;; label = @11
                            block ;; label = @12
                              block ;; label = @13
                                local.get 4
                                i32.load
                                local.tee 5
                                i32.const 2
                                i32.eq
                                br_if 0 (;@13;)
                                i32.const 0
                                local.set 11
                                local.get 5
                                i32.const 1
                                i32.and
                                br_if 0 (;@13;)
                                local.get 4
                                local.get 4
                                i32.load offset=4
                                i32.store offset=16
                                local.get 4
                                i32.const 20
                                i32.add
                                local.get 4
                                i32.const 16
                                i32.add
                                call $_ZN4wasi7imports4wasi2io5error5Error15to_debug_string17h4c347498d8df19e4E
                                local.get 4
                                i32.const 8
                                i32.add
                                i32.const 40
                                local.get 4
                                i32.const 20
                                i32.add
                                call $_ZN3std2io5error5Error3new17h27c20b34f4cb0c9dE
                                block ;; label = @14
                                  local.get 4
                                  i32.load offset=16
                                  local.tee 5
                                  i32.const -1
                                  i32.eq
                                  br_if 0 (;@14;)
                                  local.get 5
                                  call $_ZN90_$LT$wasi..imports..wasi..io..error..Error$u20$as$u20$wasi..imports.._rt..WasmResource$GT$4drop4drop17h054f8123dd94d3f0E
                                end
                                local.get 4
                                i64.load offset=8
                                local.tee 12
                                i64.const 32
                                i64.shr_u
                                local.tee 13
                                i32.wrap_i64
                                local.set 5
                                local.get 4
                                i32.load offset=8
                                local.set 14
                                local.get 4
                                i32.load offset=12
                                local.set 11
                                block ;; label = @14
                                  block ;; label = @15
                                    local.get 12
                                    i32.wrap_i64
                                    i32.const 255
                                    i32.and
                                    br_table 4 (;@11;) 0 (;@15;) 1 (;@14;) 6 (;@9;) 3 (;@12;) 4 (;@11;)
                                  end
                                  local.get 12
                                  i64.const 65280
                                  i64.and
                                  i64.const 8960
                                  i64.ne
                                  br_if 12 (;@2;)
                                  br 7 (;@7;)
                                end
                                local.get 5
                                i32.load8_u offset=8
                                i32.const 35
                                i32.ne
                                br_if 11 (;@2;)
                                br 6 (;@7;)
                              end
                              local.get 14
                              i32.const -256
                              i32.and
                              i32.const 4
                              i32.or
                              local.set 14
                              local.get 11
                              local.set 5
                            end
                            block ;; label = @12
                              local.get 5
                              br_if 0 (;@12;)
                              global.get $GOT.data.internal.__memory_base
                              i32.const 1054216
                              i32.add
                              i64.load
                              local.set 12
                              br 10 (;@2;)
                            end
                            local.get 7
                            i32.const 4
                            i32.add
                            local.set 6
                            local.get 8
                            i32.const -8
                            i32.add
                            i32.const 3
                            i32.shr_u
                            i32.const 1
                            i32.add
                            local.set 15
                            i32.const 0
                            local.set 3
                            block ;; label = @12
                              loop ;; label = @13
                                local.get 5
                                local.get 6
                                i32.load
                                local.tee 2
                                i32.lt_u
                                br_if 1 (;@12;)
                                local.get 6
                                i32.const 8
                                i32.add
                                local.set 6
                                local.get 3
                                i32.const 1
                                i32.add
                                local.set 3
                                local.get 5
                                local.get 2
                                i32.sub
                                local.set 5
                                local.get 8
                                i32.const -8
                                i32.add
                                local.tee 8
                                br_if 0 (;@13;)
                              end
                              local.get 15
                              local.set 3
                            end
                            local.get 10
                            local.get 3
                            i32.lt_u
                            br_if 8 (;@3;)
                            block ;; label = @12
                              local.get 10
                              local.get 3
                              i32.ne
                              br_if 0 (;@12;)
                              local.get 5
                              i32.eqz
                              br_if 7 (;@5;)
                              global.get $GOT.data.internal.__memory_base
                              local.tee 5
                              i32.const 1050461
                              i32.add
                              i32.const 79
                              local.get 5
                              i32.const 1054256
                              i32.add
                              call $_ZN4core9panicking9panic_fmt17hd2f72abdb0aff166E
                              unreachable
                            end
                            local.get 7
                            local.get 3
                            i32.const 3
                            i32.shl
                            i32.add
                            local.tee 7
                            i32.load offset=4
                            local.tee 8
                            local.get 5
                            i32.ge_u
                            br_if 1 (;@10;)
                            global.get $GOT.data.internal.__memory_base
                            local.tee 5
                            i32.const 1050426
                            i32.add
                            i32.const 71
                            local.get 5
                            i32.const 1054240
                            i32.add
                            call $_ZN4core9panicking9panic_fmt17hd2f72abdb0aff166E
                            unreachable
                          end
                          local.get 13
                          i64.const 27
                          i64.eq
                          br_if 3 (;@7;)
                          br 8 (;@2;)
                        end
                        local.get 10
                        local.get 3
                        i32.sub
                        local.set 10
                        local.get 7
                        local.get 8
                        local.get 5
                        i32.sub
                        i32.store offset=4
                        local.get 7
                        local.get 7
                        i32.load
                        local.get 5
                        i32.add
                        i32.store
                        local.get 14
                        i32.const 255
                        i32.and
                        local.tee 5
                        i32.const 4
                        i32.gt_u
                        br_if 1 (;@8;)
                        local.get 5
                        i32.const 3
                        i32.eq
                        br_if 1 (;@8;)
                        br 2 (;@7;)
                      end
                      local.get 5
                      i32.load8_u offset=8
                      i32.const 35
                      i32.ne
                      br_if 6 (;@2;)
                    end
                    local.get 11
                    i32.load
                    local.set 8
                    block ;; label = @8
                      local.get 11
                      i32.const 4
                      i32.add
                      i32.load
                      local.tee 5
                      i32.load
                      local.tee 6
                      i32.eqz
                      br_if 0 (;@8;)
                      local.get 8
                      local.get 6
                      call_indirect (type 0)
                    end
                    block ;; label = @8
                      local.get 5
                      i32.load offset=4
                      local.tee 6
                      i32.eqz
                      br_if 0 (;@8;)
                      local.get 8
                      local.get 6
                      local.get 5
                      i32.load offset=8
                      call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
                    end
                    local.get 11
                    i32.const 12
                    i32.const 4
                    call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
                  end
                  local.get 10
                  br_if 0 (;@6;)
                end
              end
              local.get 0
              i32.const 4
              i32.store8
              br 3 (;@1;)
            end
            local.get 8
            local.get 3
            local.get 3
            global.get $GOT.data.internal.__memory_base
            i32.const 1054272
            i32.add
            call $_ZN4core5slice5index16slice_index_fail17hdbc11bcfa6a172dbE
            unreachable
          end
          local.get 3
          local.get 10
          local.get 10
          global.get $GOT.data.internal.__memory_base
          i32.const 1054272
          i32.add
          call $_ZN4core5slice5index16slice_index_fail17hdbc11bcfa6a172dbE
          unreachable
        end
        local.get 0
        local.get 12
        i64.store align=4
      end
      local.get 4
      i32.const 32
      i32.add
      global.set $__stack_pointer
    )
    (func $_ZN3std2io5Write9write_all17hac23022ab680c457E (;71;) (type 1) (param i32 i32 i32 i32)
      (local i32 i32 i32 i32 i64 i64 i32 i32)
      global.get $__stack_pointer
      i32.const 32
      i32.sub
      local.tee 4
      global.set $__stack_pointer
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              local.get 3
              i32.eqz
              br_if 0 (;@4;)
              local.get 1
              i32.const 4
              i32.add
              local.set 5
              loop ;; label = @5
                block ;; label = @6
                  local.get 1
                  i32.load
                  br_if 0 (;@6;)
                  local.get 1
                  call $_ZN4wasi7imports4wasi3cli6stderr10get_stderr17h00867409b546223aE
                  i32.store offset=4
                  local.get 1
                  i32.const 1
                  i32.store
                end
                local.get 4
                local.get 5
                local.get 2
                local.get 3
                i32.const 4096
                local.get 3
                i32.const 4096
                i32.lt_u
                select
                local.tee 6
                call $_ZN4wasi7imports4wasi2io7streams12OutputStream24blocking_write_and_flush17he307f6cb42e51076E
                block ;; label = @6
                  block ;; label = @7
                    block ;; label = @8
                      block ;; label = @9
                        block ;; label = @10
                          local.get 4
                          i32.load
                          local.tee 7
                          i32.const 2
                          i32.eq
                          br_if 0 (;@10;)
                          i32.const 0
                          local.set 6
                          local.get 7
                          i32.const 1
                          i32.and
                          br_if 0 (;@10;)
                          local.get 4
                          local.get 4
                          i32.load offset=4
                          i32.store offset=16
                          local.get 4
                          i32.const 20
                          i32.add
                          local.get 4
                          i32.const 16
                          i32.add
                          call $_ZN4wasi7imports4wasi2io5error5Error15to_debug_string17h4c347498d8df19e4E
                          local.get 4
                          i32.const 8
                          i32.add
                          i32.const 40
                          local.get 4
                          i32.const 20
                          i32.add
                          call $_ZN3std2io5error5Error3new17h27c20b34f4cb0c9dE
                          block ;; label = @11
                            local.get 4
                            i32.load offset=16
                            local.tee 6
                            i32.const -1
                            i32.eq
                            br_if 0 (;@11;)
                            local.get 6
                            call $_ZN90_$LT$wasi..imports..wasi..io..error..Error$u20$as$u20$wasi..imports.._rt..WasmResource$GT$4drop4drop17h054f8123dd94d3f0E
                          end
                          local.get 4
                          i64.load offset=8
                          local.tee 8
                          i64.const 32
                          i64.shr_u
                          local.tee 9
                          i32.wrap_i64
                          local.set 6
                          block ;; label = @11
                            block ;; label = @12
                              local.get 8
                              i32.wrap_i64
                              i32.const 255
                              i32.and
                              br_table 3 (;@9;) 0 (;@12;) 1 (;@11;) 5 (;@7;) 2 (;@10;) 3 (;@9;)
                            end
                            local.get 8
                            i64.const 65280
                            i64.and
                            i64.const 8960
                            i64.ne
                            br_if 9 (;@2;)
                            br 5 (;@6;)
                          end
                          local.get 6
                          i32.load8_u offset=8
                          i32.const 35
                          i32.ne
                          br_if 8 (;@2;)
                          br 4 (;@6;)
                        end
                        local.get 6
                        br_if 1 (;@8;)
                        global.get $GOT.data.internal.__memory_base
                        i32.const 1054216
                        i32.add
                        i64.load
                        local.set 8
                        br 7 (;@2;)
                      end
                      local.get 9
                      i64.const 27
                      i64.eq
                      br_if 2 (;@6;)
                      br 6 (;@2;)
                    end
                    local.get 3
                    local.get 6
                    i32.lt_u
                    br_if 4 (;@3;)
                    local.get 2
                    local.get 6
                    i32.add
                    local.set 2
                    local.get 3
                    local.get 6
                    i32.sub
                    local.set 3
                    br 1 (;@6;)
                  end
                  local.get 6
                  i32.load8_u offset=8
                  i32.const 35
                  i32.ne
                  br_if 4 (;@2;)
                  local.get 6
                  i32.load
                  local.set 10
                  block ;; label = @7
                    local.get 6
                    i32.const 4
                    i32.add
                    i32.load
                    local.tee 7
                    i32.load
                    local.tee 11
                    i32.eqz
                    br_if 0 (;@7;)
                    local.get 10
                    local.get 11
                    call_indirect (type 0)
                  end
                  block ;; label = @7
                    local.get 7
                    i32.load offset=4
                    local.tee 11
                    i32.eqz
                    br_if 0 (;@7;)
                    local.get 10
                    local.get 11
                    local.get 7
                    i32.load offset=8
                    call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
                  end
                  local.get 6
                  i32.const 12
                  i32.const 4
                  call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
                end
                local.get 3
                br_if 0 (;@5;)
              end
            end
            local.get 0
            i32.const 4
            i32.store8
            br 2 (;@1;)
          end
          local.get 6
          local.get 3
          local.get 3
          global.get $GOT.data.internal.__memory_base
          i32.const 1054224
          i32.add
          call $_ZN4core5slice5index16slice_index_fail17hdbc11bcfa6a172dbE
          unreachable
        end
        local.get 0
        local.get 8
        i64.store align=4
      end
      local.get 4
      i32.const 32
      i32.add
      global.set $__stack_pointer
    )
    (func $_ZN3std2io5Write9write_fmt17h2e3bd8e1f8277c9cE (;72;) (type 1) (param i32 i32 i32 i32)
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
      i32.const 1054112
      i32.add
      local.get 2
      local.get 3
      call $_ZN4core3fmt5write17h80512e2a12699005E
      local.set 3
      local.get 4
      i32.load8_u
      local.set 1
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            local.get 3
            i32.eqz
            br_if 0 (;@3;)
            local.get 1
            i32.const 4
            i32.ne
            br_if 1 (;@2;)
            global.get $GOT.data.internal.__memory_base
            local.tee 4
            i32.const 1050312
            i32.add
            i32.const 173
            local.get 4
            i32.const 1054136
            i32.add
            call $_ZN4core9panicking9panic_fmt17hd2f72abdb0aff166E
            unreachable
          end
          local.get 4
          i32.load offset=4
          local.set 0
          block ;; label = @3
            local.get 1
            i32.const 4
            i32.gt_u
            br_if 0 (;@3;)
            local.get 1
            i32.const 3
            i32.ne
            br_if 2 (;@1;)
          end
          local.get 0
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
            call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
          end
          local.get 0
          i32.const 12
          i32.const 4
          call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
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
    (func $_ZN3std2io5Write9write_fmt17hdae18996af61caaeE (;73;) (type 1) (param i32 i32 i32 i32)
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
      i32.const 1054152
      i32.add
      local.get 2
      local.get 3
      call $_ZN4core3fmt5write17h80512e2a12699005E
      local.set 3
      local.get 4
      i32.load8_u
      local.set 1
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            local.get 3
            i32.eqz
            br_if 0 (;@3;)
            local.get 1
            i32.const 4
            i32.ne
            br_if 1 (;@2;)
            global.get $GOT.data.internal.__memory_base
            local.tee 4
            i32.const 1050312
            i32.add
            i32.const 173
            local.get 4
            i32.const 1054136
            i32.add
            call $_ZN4core9panicking9panic_fmt17hd2f72abdb0aff166E
            unreachable
          end
          local.get 4
          i32.load offset=4
          local.set 0
          block ;; label = @3
            local.get 1
            i32.const 4
            i32.gt_u
            br_if 0 (;@3;)
            local.get 1
            i32.const 3
            i32.ne
            br_if 2 (;@1;)
          end
          local.get 0
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
            call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
          end
          local.get 0
          i32.const 12
          i32.const 4
          call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
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
    (func $_ZN3std2io5impls74_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..vec..Vec$LT$u8$C$A$GT$$GT$14write_vectored17h8e1f68a403788c08E (;74;) (type 1) (param i32 i32 i32 i32)
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
        block ;; label = @2
          block ;; label = @3
            local.get 3
            i32.const 4
            i32.ge_u
            br_if 0 (;@3;)
            i32.const 0
            local.set 6
            i32.const 0
            local.set 4
            br 1 (;@2;)
          end
          local.get 2
          i32.const 28
          i32.add
          local.set 7
          local.get 3
          i32.const 268435452
          i32.and
          local.set 8
          i32.const 0
          local.set 6
          i32.const 0
          local.set 4
          loop ;; label = @3
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
            br_if 0 (;@3;)
          end
        end
        block ;; label = @2
          local.get 5
          i32.eqz
          br_if 0 (;@2;)
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
          call $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h14d6e18732974dddE
        end
        local.get 2
        local.get 7
        i32.add
        local.set 8
        local.get 1
        i32.load offset=8
        local.set 7
        loop ;; label = @2
          local.get 2
          i32.load
          local.set 6
          block ;; label = @3
            local.get 2
            i32.const 4
            i32.add
            i32.load
            local.tee 5
            local.get 1
            i32.load
            local.get 7
            i32.sub
            i32.le_u
            br_if 0 (;@3;)
            local.get 1
            local.get 7
            local.get 5
            i32.const 1
            i32.const 1
            call $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h14d6e18732974dddE
            local.get 1
            i32.load offset=8
            local.set 7
          end
          block ;; label = @3
            local.get 5
            i32.eqz
            br_if 0 (;@3;)
            local.get 1
            i32.load offset=4
            local.get 7
            i32.add
            local.get 6
            local.get 5
            memory.copy
          end
          local.get 1
          local.get 7
          local.get 5
          i32.add
          local.tee 7
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
    (func $_ZN3std2io5impls74_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..vec..Vec$LT$u8$C$A$GT$$GT$17is_write_vectored17hf74e0cc8b03611cfE (;75;) (type 14) (param i32) (result i32)
      i32.const 1
    )
    (func $_ZN3std2io5impls74_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..vec..Vec$LT$u8$C$A$GT$$GT$18write_all_vectored17h7a11db1eaf20f8fdE (;76;) (type 1) (param i32 i32 i32 i32)
      (local i32 i32 i32 i32 i32)
      block ;; label = @1
        local.get 3
        i32.eqz
        br_if 0 (;@1;)
        local.get 3
        i32.const 3
        i32.and
        local.set 4
        block ;; label = @2
          block ;; label = @3
            local.get 3
            i32.const 4
            i32.ge_u
            br_if 0 (;@3;)
            i32.const 0
            local.set 5
            i32.const 0
            local.set 6
            br 1 (;@2;)
          end
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
          loop ;; label = @3
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
            br_if 0 (;@3;)
          end
        end
        block ;; label = @2
          local.get 4
          i32.eqz
          br_if 0 (;@2;)
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
        local.set 4
        block ;; label = @2
          local.get 6
          local.get 1
          i32.load
          local.get 1
          i32.load offset=8
          local.tee 7
          i32.sub
          i32.le_u
          br_if 0 (;@2;)
          local.get 1
          local.get 7
          local.get 6
          i32.const 1
          i32.const 1
          call $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h14d6e18732974dddE
          local.get 1
          i32.load offset=8
          local.set 7
        end
        local.get 2
        local.get 4
        i32.add
        local.set 5
        loop ;; label = @2
          local.get 2
          i32.load
          local.set 4
          block ;; label = @3
            local.get 2
            i32.const 4
            i32.add
            i32.load
            local.tee 6
            local.get 1
            i32.load
            local.get 7
            i32.sub
            i32.le_u
            br_if 0 (;@3;)
            local.get 1
            local.get 7
            local.get 6
            i32.const 1
            i32.const 1
            call $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h14d6e18732974dddE
            local.get 1
            i32.load offset=8
            local.set 7
          end
          block ;; label = @3
            local.get 6
            i32.eqz
            br_if 0 (;@3;)
            local.get 1
            i32.load offset=4
            local.get 7
            i32.add
            local.get 4
            local.get 6
            memory.copy
          end
          local.get 1
          local.get 7
          local.get 6
          i32.add
          local.tee 7
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
    (func $_ZN3std2io5impls74_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..vec..Vec$LT$u8$C$A$GT$$GT$5flush17h296411f12eae77deE (;77;) (type 3) (param i32 i32)
      local.get 0
      i32.const 4
      i32.store8
    )
    (func $_ZN3std2io5impls74_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..vec..Vec$LT$u8$C$A$GT$$GT$5write17he0cf27cb84ab49d9E (;78;) (type 1) (param i32 i32 i32 i32)
      (local i32)
      block ;; label = @1
        local.get 3
        local.get 1
        i32.load
        local.get 1
        i32.load offset=8
        local.tee 4
        i32.sub
        i32.le_u
        br_if 0 (;@1;)
        local.get 1
        local.get 4
        local.get 3
        i32.const 1
        i32.const 1
        call $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h14d6e18732974dddE
        local.get 1
        i32.load offset=8
        local.set 4
      end
      block ;; label = @1
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
      local.get 1
      local.get 4
      local.get 3
      i32.add
      i32.store offset=8
      local.get 0
      i32.const 4
      i32.store8
    )
    (func $_ZN3std2io5impls74_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..vec..Vec$LT$u8$C$A$GT$$GT$9write_all17h3681f71906efd68bE (;79;) (type 1) (param i32 i32 i32 i32)
      (local i32)
      block ;; label = @1
        local.get 3
        local.get 1
        i32.load
        local.get 1
        i32.load offset=8
        local.tee 4
        i32.sub
        i32.le_u
        br_if 0 (;@1;)
        local.get 1
        local.get 4
        local.get 3
        i32.const 1
        i32.const 1
        call $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h14d6e18732974dddE
        local.get 1
        i32.load offset=8
        local.set 4
      end
      block ;; label = @1
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
    (func $_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17hbc6b47b295e1d801E (;80;) (type 0) (param i32)
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
        call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
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
        call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
      end
    )
    (func $_ZN4core9panicking13assert_failed17h3c7428446867225fE (;81;) (type 12) (param i32 i32 i32 i32 i32 i32)
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
      i32.const 1054556
      i32.add
      local.tee 2
      local.get 6
      i32.const 12
      i32.add
      local.get 2
      local.get 3
      local.get 4
      local.get 5
      call $_ZN4core9panicking19assert_failed_inner17hb7676d3c0b1faf61E
      unreachable
    )
    (func $_ZN3std6thread2id8ThreadId3new9exhausted17hff75203e0d19cd12E (;82;) (type 8)
      (local i32)
      global.get $GOT.data.internal.__memory_base
      local.tee 0
      i32.const 1050875
      i32.add
      i32.const 111
      local.get 0
      i32.const 1054400
      i32.add
      call $_ZN4core9panicking9panic_fmt17hd2f72abdb0aff166E
      unreachable
    )
    (func $_ZN3std3env11current_dir17hd44303ffbf1e7daaE (;83;) (type 0) (param i32)
      (local i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 1
      global.set $__stack_pointer
      call $_RNvCsdBezzDwma51_7___rustc35___rust_no_alloc_shim_is_unstable_v2
      i32.const 512
      local.set 2
      block ;; label = @1
        block ;; label = @2
          i32.const 512
          i32.const 1
          call $_RNvCsdBezzDwma51_7___rustc12___rust_alloc
          local.tee 3
          i32.eqz
          br_if 0 (;@2;)
          local.get 1
          local.get 3
          i32.store offset=8
          local.get 1
          i32.const 512
          i32.store offset=4
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                local.get 3
                i32.const 512
                call $getcwd
                br_if 0 (;@5;)
                i32.const 512
                local.set 2
                loop ;; label = @6
                  global.get $GOT.data.internal.errno
                  i32.load
                  local.tee 4
                  i32.const 68
                  i32.ne
                  br_if 2 (;@4;)
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
                  call $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h14d6e18732974dddE
                  local.get 1
                  i32.load offset=8
                  local.tee 3
                  local.get 1
                  i32.load offset=4
                  local.tee 2
                  call $getcwd
                  i32.eqz
                  br_if 0 (;@6;)
                end
              end
              local.get 1
              local.get 3
              call $strlen
              local.tee 4
              i32.store offset=12
              block ;; label = @5
                local.get 2
                local.get 4
                i32.le_u
                br_if 0 (;@5;)
                block ;; label = @6
                  block ;; label = @7
                    local.get 4
                    br_if 0 (;@7;)
                    i32.const 1
                    local.set 5
                    local.get 3
                    local.get 2
                    i32.const 1
                    call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
                    br 1 (;@6;)
                  end
                  local.get 3
                  local.get 2
                  i32.const 1
                  local.get 4
                  call $_RNvCsdBezzDwma51_7___rustc14___rust_realloc
                  local.tee 5
                  i32.eqz
                  br_if 5 (;@1;)
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
              i64.load offset=4 align=4
              i64.store align=4
              local.get 0
              i32.const 8
              i32.add
              local.get 1
              i32.const 4
              i32.add
              i32.const 8
              i32.add
              i32.load
              i32.store
              br 1 (;@3;)
            end
            local.get 0
            local.get 4
            i32.store offset=8
            local.get 0
            i64.const 2147483648
            i64.store align=4
            local.get 2
            i32.eqz
            br_if 0 (;@3;)
            local.get 3
            local.get 2
            i32.const 1
            call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
          end
          local.get 1
          i32.const 16
          i32.add
          global.set $__stack_pointer
          return
        end
        i32.const 1
        i32.const 512
        call $_ZN5alloc7raw_vec12handle_error17h9f321253d17717ecE
        unreachable
      end
      i32.const 1
      local.get 4
      call $_ZN5alloc7raw_vec12handle_error17h9f321253d17717ecE
      unreachable
    )
    (func $_ZN3std3env7_var_os17h82b38eb9ace54da5E (;84;) (type 9) (param i32 i32 i32)
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
            call $_ZN4core3ffi5c_str4CStr19from_bytes_with_nul17h8c944c6e98076f57E
            block ;; label = @4
              local.get 3
              i32.load offset=404
              i32.const 1
              i32.ne
              br_if 0 (;@4;)
              local.get 3
              global.get $GOT.data.internal.__memory_base
              i32.const 1054304
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
              call $_RNvCsdBezzDwma51_7___rustc35___rust_no_alloc_shim_is_unstable_v2
              local.get 2
              i32.const 1
              call $_RNvCsdBezzDwma51_7___rustc12___rust_alloc
              local.tee 4
              i32.eqz
              br_if 3 (;@1;)
            end
            block ;; label = @4
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
          call $_ZN3std3sys3pal6common14small_c_string24run_with_cstr_allocating17ha6d3a6c3a86e6e7dE
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
              call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
            end
            local.get 2
            i32.const 12
            i32.const 4
            call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
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
      call $_ZN5alloc7raw_vec12handle_error17h9f321253d17717ecE
      unreachable
    )
    (func $_ZN3std3sys3pal6common14small_c_string24run_with_cstr_allocating17ha6d3a6c3a86e6e7dE (;85;) (type 9) (param i32 i32 i32)
      (local i32 i32 i32 i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 3
      global.set $__stack_pointer
      local.get 3
      local.get 1
      local.get 2
      call $_ZN81_$LT$$RF$$u5b$u8$u5d$$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17h89346a00dfa8b753E
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
                i32.eqz
                br_if 0 (;@5;)
                block ;; label = @6
                  block ;; label = @7
                    local.get 5
                    call $strlen
                    local.tee 2
                    br_if 0 (;@7;)
                    i32.const 1
                    local.set 6
                    br 1 (;@6;)
                  end
                  call $_RNvCsdBezzDwma51_7___rustc35___rust_no_alloc_shim_is_unstable_v2
                  local.get 2
                  i32.const 1
                  call $_RNvCsdBezzDwma51_7___rustc12___rust_alloc
                  local.tee 6
                  i32.eqz
                  br_if 5 (;@1;)
                end
                block ;; label = @6
                  local.get 2
                  i32.eqz
                  br_if 0 (;@6;)
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
                br 1 (;@4;)
              end
              local.get 0
              i32.const -2147483648
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
            call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
            br 1 (;@2;)
          end
          local.get 0
          i32.const -2147483647
          i32.store
          local.get 0
          global.get $GOT.data.internal.__memory_base
          i32.const 1054304
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
          call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
        end
        local.get 3
        i32.const 16
        i32.add
        global.set $__stack_pointer
        return
      end
      i32.const 1
      local.get 2
      call $_ZN5alloc7raw_vec12handle_error17h9f321253d17717ecE
      unreachable
    )
    (func $_ZN3std3sys3pal6wasip27helpers14abort_internal17h7622470673c2f9f4E (;86;) (type 8)
      call $abort
      unreachable
    )
    (func $_ZN3std4sync9lazy_lock14panic_poisoned17heacb20ea940fe6a2E (;87;) (type 8)
      (local i32)
      global.get $GOT.data.internal.__memory_base
      local.tee 0
      i32.const 1050737
      i32.add
      i32.const 93
      local.get 0
      i32.const 1054328
      i32.add
      call $_ZN4core9panicking9panic_fmt17hd2f72abdb0aff166E
      unreachable
    )
    (func $_ZN3std3sys9backtrace13BacktraceLock5print17h9686152c07e589f1E (;88;) (type 1) (param i32 i32 i32 i32)
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
      global.get $GOT.func.internal._ZN98_$LT$std..sys..backtrace..BacktraceLock..print..DisplayBacktrace$u20$as$u20$core..fmt..Display$GT$3fmt17h4f6d4799b2b7b52dE
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
      i32.const 1049125
      i32.add
      local.get 4
      i32.const 8
      i32.add
      local.get 2
      call_indirect (type 1)
      local.get 4
      i32.const 16
      i32.add
      global.set $__stack_pointer
    )
    (func $_ZN98_$LT$std..sys..backtrace..BacktraceLock..print..DisplayBacktrace$u20$as$u20$core..fmt..Display$GT$3fmt17h4f6d4799b2b7b52dE (;89;) (type 4) (param i32 i32) (result i32)
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
      call $_ZN3std3env11current_dir17hd44303ffbf1e7daaE
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
          call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
        end
        local.get 6
        i32.const 12
        i32.const 4
        call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
      end
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              local.get 4
              global.get $GOT.data.internal.__memory_base
              i32.const 1050599
              i32.add
              i32.const 17
              local.get 3
              i32.load offset=12
              local.tee 3
              call_indirect (type 2)
              br_if 0 (;@4;)
              local.get 0
              i32.const 1
              i32.and
              br_if 1 (;@3;)
              local.get 4
              global.get $GOT.data.internal.__memory_base
              i32.const 1050616
              i32.add
              i32.const 88
              local.get 3
              call_indirect (type 2)
              i32.eqz
              br_if 1 (;@3;)
            end
            i32.const 1
            local.set 4
            local.get 1
            i32.const -2147483648
            i32.or
            i32.const -2147483648
            i32.ne
            br_if 1 (;@2;)
            br 2 (;@1;)
          end
          i32.const 0
          local.set 4
          local.get 1
          i32.const -2147483648
          i32.or
          i32.const -2147483648
          i32.eq
          br_if 1 (;@1;)
        end
        local.get 5
        i32.wrap_i64
        local.get 1
        i32.const 1
        call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
      end
      local.get 2
      i32.const 16
      i32.add
      global.set $__stack_pointer
      local.get 4
    )
    (func $_ZN3std9panicking13panic_handler28_$u7b$$u7b$closure$u7d$$u7d$17h75b4c378ae6acf8bE (;90;) (type 0) (param i32)
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
        br_if 0 (;@1;)
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
        i32.const 1054500
        i32.add
        local.get 0
        i32.load offset=4
        local.get 0
        i32.load offset=8
        local.tee 0
        i32.load8_u offset=8
        local.get 0
        i32.load8_u offset=9
        call $_ZN3std9panicking15panic_with_hook17h76e92a2d54e68d92E
        unreachable
      end
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
      i32.const 1054528
      i32.add
      local.get 0
      i32.load offset=4
      local.get 0
      i32.load offset=8
      local.tee 0
      i32.load8_u offset=8
      local.get 0
      i32.load8_u offset=9
      call $_ZN3std9panicking15panic_with_hook17h76e92a2d54e68d92E
      unreachable
    )
    (func $_ZN3std3sys9backtrace26__rust_end_short_backtrace17hacabb35dcc0ab271E (;91;) (type 0) (param i32)
      local.get 0
      call $_ZN3std5alloc8rust_oom28_$u7b$$u7b$closure$u7d$$u7d$17hb2aa8f0cdeb71c9bE
      unreachable
    )
    (func $_ZN3std5alloc8rust_oom28_$u7b$$u7b$closure$u7d$$u7d$17hb2aa8f0cdeb71c9bE (;92;) (type 0) (param i32)
      (local i32 i32)
      global.get $GOT.data.internal._ZN3std5alloc4HOOK17hdf04194545af820fE
      i32.load
      local.set 1
      global.get $GOT.func.internal._ZN3std5alloc24default_alloc_error_hook17h2659b1d5d338bd49E
      local.set 2
      local.get 0
      i32.load
      local.get 0
      i32.load offset=4
      local.get 1
      local.get 2
      local.get 1
      select
      call_indirect (type 3)
      call $_ZN3std7process5abort17h6882cf5ccf16f1f0E
      unreachable
    )
    (func $_ZN3std3sys9backtrace4lock17h95c86d3935e9810dE (;93;) (type 7) (result i32)
      (local i32 i32 i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 0
      global.set $__stack_pointer
      global.get $GOT.data.internal.__memory_base
      i32.const 1055057
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
        global.get $GOT.data.internal._ZN3std4sync4mpmc5waker17current_thread_id5DUMMY28_$u7b$$u7b$closure$u7d$$u7d$23__RUST_STD_INTERNAL_VAL17h53e402bde3b3a265E
        local.get 2
        i32.const 1050704
        i32.add
        i32.const 65
        local.get 2
        i32.const 1054312
        i32.add
        call $_ZN4core9panicking13assert_failed17h3c7428446867225fE
        unreachable
      end
      global.get $GOT.data.internal.__memory_base
      local.set 2
      local.get 0
      i32.const 16
      i32.add
      global.set $__stack_pointer
      local.get 2
      i32.const 1055057
      i32.add
    )
    (func $_ZN3std4sync6poison5mutex14Mutex$LT$T$GT$4lock17hdbeb5512acf92b97E (;94;) (type 14) (param i32) (result i32)
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
        global.get $GOT.data.internal._ZN3std4sync4mpmc5waker17current_thread_id5DUMMY28_$u7b$$u7b$closure$u7d$$u7d$23__RUST_STD_INTERNAL_VAL17h53e402bde3b3a265E
        local.get 0
        i32.const 1050704
        i32.add
        i32.const 65
        local.get 0
        i32.const 1054312
        i32.add
        call $_ZN4core9panicking13assert_failed17h3c7428446867225fE
        unreachable
      end
      local.get 1
      i32.const 16
      i32.add
      global.set $__stack_pointer
      local.get 0
    )
    (func $_ZN3std5alloc24default_alloc_error_hook17h2659b1d5d338bd49E (;95;) (type 3) (param i32 i32)
      (local i32 i32 i32 i64)
      global.get $__stack_pointer
      i32.const 32
      i32.sub
      local.tee 2
      global.set $__stack_pointer
      block ;; label = @1
        call $_RNvCsdBezzDwma51_7___rustc42___rust_alloc_error_handler_should_panic_v2
        i32.const 255
        i32.and
        br_if 0 (;@1;)
        global.get $GOT.data.internal.__memory_base
        i32.const 1055058
        i32.add
        local.tee 3
        i32.load8_u
        local.set 4
        local.get 3
        i32.const 1
        i32.store8
        global.get $GOT.func.internal._ZN4core3fmt3num3imp54_$LT$impl$u20$core..fmt..Display$u20$for$u20$usize$GT$3fmt17hb1e87ec93de10a7dE
        i64.extend_i32_u
        i64.const 32
        i64.shl
        local.set 5
        block ;; label = @2
          block ;; label = @3
            local.get 4
            br_if 0 (;@3;)
            local.get 2
            i64.const 0
            i64.store
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
            i64.store offset=24
            local.get 2
            i32.const 16
            i32.add
            local.get 2
            global.get $GOT.data.internal.__memory_base
            i32.const 1049873
            i32.add
            local.get 2
            i32.const 24
            i32.add
            call $_ZN3std2io5Write9write_fmt17hd7ee7125c0996452E
            local.get 2
            i32.load8_u offset=16
            local.get 2
            i32.load offset=20
            call $_ZN4core3ptr81drop_in_place$LT$core..result..Result$LT$$LP$$RP$$C$std..io..error..Error$GT$$GT$17hcad36bac1cd65805E
            local.get 2
            call $_ZN4core3ptr52drop_in_place$LT$std..sys..stdio..wasip2..Stderr$GT$17h50b0dd383b42d473E
            local.get 2
            i64.const 0
            i64.store offset=16
            call $_ZN3std3sys9backtrace4lock17h95c86d3935e9810dE
            local.set 1
            block ;; label = @4
              block ;; label = @5
                block ;; label = @6
                  block ;; label = @7
                    call $_ZN3std5panic19get_backtrace_style17h7f1abd8860a59dbeE
                    i32.const 255
                    i32.and
                    br_table 0 (;@7;) 1 (;@6;) 2 (;@5;) 3 (;@4;) 0 (;@7;)
                  end
                  local.get 2
                  i32.const 24
                  i32.add
                  local.get 2
                  i32.const 16
                  i32.add
                  global.get $GOT.data.internal.__table_base
                  i32.const 9
                  i32.add
                  i32.const 0
                  call $_ZN3std3sys9backtrace13BacktraceLock5print17h9686152c07e589f1E
                  local.get 2
                  i32.load8_u offset=24
                  local.get 2
                  i32.load offset=28
                  call $_ZN4core3ptr81drop_in_place$LT$core..result..Result$LT$$LP$$RP$$C$std..io..error..Error$GT$$GT$17hcad36bac1cd65805E
                  br 2 (;@4;)
                end
                local.get 2
                i32.const 24
                i32.add
                local.get 2
                i32.const 16
                i32.add
                global.get $GOT.data.internal.__table_base
                i32.const 9
                i32.add
                i32.const 1
                call $_ZN3std3sys9backtrace13BacktraceLock5print17h9686152c07e589f1E
                local.get 2
                i32.load8_u offset=24
                local.get 2
                i32.load offset=28
                call $_ZN4core3ptr81drop_in_place$LT$core..result..Result$LT$$LP$$RP$$C$std..io..error..Error$GT$$GT$17hcad36bac1cd65805E
                br 1 (;@4;)
              end
              local.get 2
              i32.const 24
              i32.add
              local.get 2
              i32.const 16
              i32.add
              global.get $GOT.data.internal.__memory_base
              i32.const 1050783
              i32.add
              i32.const 157
              call $_ZN3std2io5Write9write_fmt17hd7ee7125c0996452E
              local.get 2
              i32.load8_u offset=24
              local.get 2
              i32.load offset=28
              call $_ZN4core3ptr81drop_in_place$LT$core..result..Result$LT$$LP$$RP$$C$std..io..error..Error$GT$$GT$17hcad36bac1cd65805E
            end
            local.get 1
            i32.const 0
            i32.store8
            local.get 2
            i32.const 16
            i32.add
            call $_ZN4core3ptr52drop_in_place$LT$std..sys..stdio..wasip2..Stderr$GT$17h50b0dd383b42d473E
            br 1 (;@2;)
          end
          local.get 2
          i64.const 0
          i64.store
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
          i64.store offset=24
          local.get 2
          i32.const 16
          i32.add
          local.get 2
          global.get $GOT.data.internal.__memory_base
          i32.const 1049709
          i32.add
          local.get 2
          i32.const 24
          i32.add
          call $_ZN3std2io5Write9write_fmt17hd7ee7125c0996452E
          local.get 2
          i32.load8_u offset=16
          local.get 2
          i32.load offset=20
          call $_ZN4core3ptr81drop_in_place$LT$core..result..Result$LT$$LP$$RP$$C$std..io..error..Error$GT$$GT$17hcad36bac1cd65805E
          local.get 2
          call $_ZN4core3ptr52drop_in_place$LT$std..sys..stdio..wasip2..Stderr$GT$17h50b0dd383b42d473E
        end
        local.get 2
        i32.const 32
        i32.add
        global.set $__stack_pointer
        return
      end
      local.get 2
      local.get 1
      i32.store offset=16
      local.get 2
      global.get $GOT.func.internal._ZN4core3fmt3num3imp54_$LT$impl$u20$core..fmt..Display$u20$for$u20$usize$GT$3fmt17hb1e87ec93de10a7dE
      i64.extend_i32_u
      i64.const 32
      i64.shl
      local.get 2
      i32.const 16
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=24
      global.get $GOT.data.internal.__memory_base
      local.tee 1
      i32.const 1049669
      i32.add
      local.get 2
      i32.const 24
      i32.add
      local.get 1
      i32.const 1054384
      i32.add
      call $_ZN4core9panicking9panic_fmt17hd2f72abdb0aff166E
      unreachable
    )
    (func $_ZN3std5panic19get_backtrace_style17h7f1abd8860a59dbeE (;96;) (type 7) (result i32)
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
        i32.const 1055064
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
        i32.const 1050861
        i32.add
        i32.const 14
        call $_ZN3std3env7_var_os17h82b38eb9ace54da5E
        i32.const 2
        local.set 2
        block ;; label = @2
          local.get 0
          i32.load offset=4
          local.tee 3
          i32.const -2147483648
          i32.eq
          br_if 0 (;@2;)
          local.get 0
          i32.load offset=8
          local.set 4
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                block ;; label = @6
                  block ;; label = @7
                    local.get 0
                    i32.load offset=12
                    i32.const -1
                    i32.add
                    br_table 1 (;@6;) 2 (;@5;) 2 (;@5;) 0 (;@7;) 2 (;@5;)
                  end
                  local.get 4
                  i32.load align=1
                  i32.const 1819047270
                  i32.ne
                  br_if 1 (;@5;)
                  i32.const 2
                  local.set 1
                  i32.const 1
                  local.set 2
                  local.get 3
                  br_if 3 (;@3;)
                  br 4 (;@2;)
                end
                local.get 4
                i32.load8_u
                i32.const 48
                i32.eq
                br_if 1 (;@4;)
              end
              i32.const 1
              local.set 1
              i32.const 0
              local.set 2
              local.get 3
              i32.eqz
              br_if 2 (;@2;)
              br 1 (;@3;)
            end
            i32.const 3
            local.set 1
            i32.const 2
            local.set 2
            local.get 3
            i32.eqz
            br_if 1 (;@2;)
          end
          local.get 4
          local.get 3
          i32.const 1
          call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
        end
        global.get $GOT.data.internal.__memory_base
        i32.const 1055064
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
    (func $_ZN3std6thread7current17with_current_name28_$u7b$$u7b$closure$u7d$$u7d$17hd5301cc5dfbcbbaaE (;97;) (type 3) (param i32 i32)
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
              i32.const 1055072
              i32.add
              i64.load
              local.tee 4
              i64.eqz
              br_if 1 (;@3;)
              global.get $GOT.data.internal.__memory_base
              i32.const 1050930
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
            i32.const 1055072
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
        i32.const 1050930
        i32.add
        i32.const 0
        global.get $GOT.data.internal._ZN3std6thread7current2id2ID17hd09cf30819d507a8E
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
      i32.const 1050934
      i32.add
      local.get 1
      select
      i32.store offset=8
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            global.get $GOT.data.internal._ZN3std6thread7current2id2ID17hd09cf30819d507a8E
            i64.load
            local.tee 5
            i64.const 0
            i64.ne
            br_if 0 (;@3;)
            global.get $GOT.data.internal.__memory_base
            i32.const 1055080
            i32.add
            i64.load
            local.set 4
            loop ;; label = @4
              local.get 4
              i64.const -1
              i64.eq
              br_if 2 (;@2;)
              global.get $GOT.data.internal.__memory_base
              i32.const 1055080
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
              br_if 0 (;@4;)
            end
            global.get $GOT.data.internal._ZN3std6thread7current2id2ID17hd09cf30819d507a8E
            local.get 5
            i64.store
          end
          local.get 2
          local.get 5
          i64.store offset=16
          block ;; label = @3
            i32.const 512
            i32.eqz
            br_if 0 (;@3;)
            local.get 2
            i32.const 24
            i32.add
            i32.const 0
            i32.const 512
            memory.fill
          end
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
          i32.const 10
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
          i32.const 11
          i32.add
          i64.extend_i32_u
          i64.const 32
          i64.shl
          i64.or
          local.tee 6
          i64.store offset=576
          local.get 2
          global.get $GOT.func.internal._ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u64$GT$3fmt17h05089fcc125d9651E
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
          i32.const 1049983
          i32.add
          local.get 2
          i32.const 560
          i32.add
          call $_ZN3std2io5Write9write_fmt17h2e3bd8e1f8277c9cE
          block ;; label = @3
            block ;; label = @4
              local.get 2
              i32.load8_u offset=552
              local.tee 1
              i32.const 4
              i32.eq
              br_if 0 (;@4;)
              block ;; label = @5
                local.get 1
                i32.const 3
                i32.lt_u
                br_if 0 (;@5;)
                local.get 2
                i32.load offset=556
                local.tee 1
                i32.load
                local.set 8
                block ;; label = @6
                  local.get 1
                  i32.const 4
                  i32.add
                  i32.load
                  local.tee 3
                  i32.load
                  local.tee 9
                  i32.eqz
                  br_if 0 (;@6;)
                  local.get 8
                  local.get 9
                  call_indirect (type 0)
                end
                block ;; label = @6
                  local.get 3
                  i32.load offset=4
                  local.tee 9
                  i32.eqz
                  br_if 0 (;@6;)
                  local.get 8
                  local.get 9
                  local.get 3
                  i32.load offset=8
                  call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
                end
                local.get 1
                i32.const 12
                i32.const 4
                call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
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
              i32.const 1049983
              i32.add
              local.get 2
              i32.const 560
              i32.add
              local.get 1
              call_indirect (type 1)
              local.get 2
              i32.load offset=556
              local.set 0
              block ;; label = @5
                local.get 2
                i32.load8_u offset=552
                local.tee 1
                i32.const 4
                i32.gt_u
                br_if 0 (;@5;)
                local.get 1
                i32.const 3
                i32.ne
                br_if 2 (;@3;)
              end
              local.get 0
              i32.load
              local.set 3
              block ;; label = @5
                local.get 0
                i32.const 4
                i32.add
                i32.load
                local.tee 1
                i32.load
                local.tee 8
                i32.eqz
                br_if 0 (;@5;)
                local.get 3
                local.get 8
                call_indirect (type 0)
              end
              block ;; label = @5
                local.get 1
                i32.load offset=4
                local.tee 8
                i32.eqz
                br_if 0 (;@5;)
                local.get 3
                local.get 8
                local.get 1
                i32.load offset=8
                call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
              end
              local.get 0
              i32.const 12
              i32.const 4
              call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
              br 1 (;@3;)
            end
            local.get 2
            i32.load offset=544
            local.tee 1
            i32.const 513
            i32.ge_u
            br_if 2 (;@1;)
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
            call_indirect (type 1)
            local.get 2
            i32.load offset=564
            local.set 0
            block ;; label = @4
              local.get 2
              i32.load8_u offset=560
              local.tee 1
              i32.const 4
              i32.gt_u
              br_if 0 (;@4;)
              local.get 1
              i32.const 3
              i32.ne
              br_if 1 (;@3;)
            end
            local.get 0
            i32.load
            local.set 3
            block ;; label = @4
              local.get 0
              i32.const 4
              i32.add
              i32.load
              local.tee 1
              i32.load
              local.tee 8
              i32.eqz
              br_if 0 (;@4;)
              local.get 3
              local.get 8
              call_indirect (type 0)
            end
            block ;; label = @4
              local.get 1
              i32.load offset=4
              local.tee 8
              i32.eqz
              br_if 0 (;@4;)
              local.get 3
              local.get 8
              local.get 1
              i32.load offset=8
              call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
            end
            local.get 0
            i32.const 12
            i32.const 4
            call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
          end
          local.get 2
          i32.const 592
          i32.add
          global.set $__stack_pointer
          return
        end
        call $_ZN3std6thread2id8ThreadId3new9exhausted17hff75203e0d19cd12E
        unreachable
      end
      i32.const 0
      local.get 1
      i32.const 512
      global.get $GOT.data.internal.__memory_base
      i32.const 1054460
      i32.add
      call $_ZN4core5slice5index16slice_index_fail17hdbc11bcfa6a172dbE
      unreachable
    )
    (func $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h5172e20917525128E (;98;) (type 4) (param i32 i32) (result i32)
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
      global.get $GOT.func.internal._ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hd03bfcbf982015daE
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
      i32.const 10
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
      i32.const 1048792
      i32.add
      local.get 2
      i32.const 8
      i32.add
      call $_ZN4core3fmt5write17h80512e2a12699005E
      local.set 1
      local.get 2
      i32.const 32
      i32.add
      global.set $__stack_pointer
      local.get 1
    )
    (func $_ZN3std9panicking15panic_with_hook17h76e92a2d54e68d92E (;99;) (type 13) (param i32 i32 i32 i32 i32)
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
              i32.const 1
              call $_ZN3std9panicking11panic_count8increase17he28d453bb96b8a60E
              i32.const 255
              i32.and
              local.tee 6
              i32.const 2
              i32.eq
              br_if 0 (;@4;)
              local.get 6
              i32.const 1
              i32.and
              i32.eqz
              br_if 1 (;@3;)
              local.get 5
              i32.const 16
              i32.add
              local.get 0
              local.get 1
              i32.load offset=24
              call_indirect (type 3)
              local.get 5
              local.get 5
              i32.load offset=20
              i32.const 0
              local.get 5
              i32.load offset=16
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
              i64.const 0
              i64.store offset=48
              local.get 5
              global.get $GOT.data.internal.__table_base
              local.tee 1
              i32.const 10
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
              i32.const 11
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
              i32.const 72
              i32.add
              local.get 5
              i32.const 48
              i32.add
              global.get $GOT.data.internal.__memory_base
              i32.const 1049912
              i32.add
              local.get 5
              i32.const 56
              i32.add
              call $_ZN3std2io5Write9write_fmt17hd7ee7125c0996452E
              local.get 5
              i32.load8_u offset=72
              local.get 5
              i32.load offset=76
              call $_ZN4core3ptr81drop_in_place$LT$core..result..Result$LT$$LP$$RP$$C$std..io..error..Error$GT$$GT$17hcad36bac1cd65805E
              local.get 5
              i32.const 48
              i32.add
              call $_ZN4core3ptr52drop_in_place$LT$std..sys..stdio..wasip2..Stderr$GT$17h50b0dd383b42d473E
              br 3 (;@1;)
            end
            global.get $GOT.data.internal._ZN3std9panicking4HOOK17hfef601ed666ffdf2E
            i32.load
            local.tee 6
            i32.const -1
            i32.gt_s
            br_if 1 (;@2;)
            local.get 5
            i64.const 0
            i64.store offset=72
            local.get 5
            i32.const 56
            i32.add
            local.get 5
            i32.const 72
            i32.add
            global.get $GOT.data.internal.__memory_base
            i32.const 1050542
            i32.add
            i32.const 115
            call $_ZN3std2io5Write9write_fmt17hd7ee7125c0996452E
            local.get 5
            i32.load8_u offset=56
            local.get 5
            i32.load offset=60
            call $_ZN4core3ptr81drop_in_place$LT$core..result..Result$LT$$LP$$RP$$C$std..io..error..Error$GT$$GT$17hcad36bac1cd65805E
            local.get 5
            i32.const 72
            i32.add
            call $_ZN4core3ptr52drop_in_place$LT$std..sys..stdio..wasip2..Stderr$GT$17h50b0dd383b42d473E
            br 2 (;@1;)
          end
          local.get 5
          i64.const 0
          i64.store offset=48
          local.get 5
          global.get $GOT.data.internal.__table_base
          local.tee 1
          i32.const 13
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
          i32.const 11
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
          i32.const 72
          i32.add
          local.get 5
          i32.const 48
          i32.add
          global.get $GOT.data.internal.__memory_base
          i32.const 1050022
          i32.add
          local.get 5
          i32.const 56
          i32.add
          call $_ZN3std2io5Write9write_fmt17hd7ee7125c0996452E
          local.get 5
          i32.load8_u offset=72
          local.get 5
          i32.load offset=76
          call $_ZN4core3ptr81drop_in_place$LT$core..result..Result$LT$$LP$$RP$$C$std..io..error..Error$GT$$GT$17hcad36bac1cd65805E
          local.get 5
          i32.const 48
          i32.add
          call $_ZN4core3ptr52drop_in_place$LT$std..sys..stdio..wasip2..Stderr$GT$17h50b0dd383b42d473E
          br 1 (;@1;)
        end
        global.get $GOT.data.internal._ZN3std9panicking4HOOK17hfef601ed666ffdf2E
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
            i32.const 8
            i32.add
            local.get 0
            local.get 1
            i32.load offset=20
            call_indirect (type 3)
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
            global.get $GOT.data.internal._ZN3std9panicking4HOOK17hfef601ed666ffdf2E
            local.tee 2
            i32.load offset=4
            local.get 5
            i32.const 56
            i32.add
            local.get 2
            i32.load offset=8
            i32.load offset=20
            call_indirect (type 3)
            br 1 (;@2;)
          end
          local.get 5
          local.get 0
          local.get 1
          i32.load offset=20
          call_indirect (type 3)
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
          i64.load
          i64.store offset=56 align=4
          local.get 5
          i32.const 56
          i32.add
          call $_ZN3std9panicking12default_hook17h16b8cc3dcb9e7d50E
        end
        global.get $GOT.data.internal.__memory_base
        i32.const 1055104
        i32.add
        i32.const 0
        i32.store8
        global.get $GOT.data.internal._ZN3std9panicking4HOOK17hfef601ed666ffdf2E
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
          i64.const 0
          i64.store offset=72
          local.get 5
          i32.const 56
          i32.add
          local.get 5
          i32.const 72
          i32.add
          global.get $GOT.data.internal.__memory_base
          i32.const 1050955
          i32.add
          i32.const 91
          call $_ZN3std2io5Write9write_fmt17hd7ee7125c0996452E
          local.get 5
          i32.load8_u offset=56
          local.get 5
          i32.load offset=60
          call $_ZN4core3ptr81drop_in_place$LT$core..result..Result$LT$$LP$$RP$$C$std..io..error..Error$GT$$GT$17hcad36bac1cd65805E
          local.get 5
          i32.const 72
          i32.add
          call $_ZN4core3ptr52drop_in_place$LT$std..sys..stdio..wasip2..Stderr$GT$17h50b0dd383b42d473E
          br 1 (;@1;)
        end
        local.get 0
        local.get 1
        call $_RNvCsdBezzDwma51_7___rustc10rust_panic
        unreachable
      end
      call $_ZN3std7process5abort17h6882cf5ccf16f1f0E
      unreachable
    )
    (func $_ZN3std9panicking11panic_count8increase17he28d453bb96b8a60E (;100;) (type 14) (param i32) (result i32)
      (local i32 i32)
      global.get $GOT.data.internal._ZN3std9panicking11panic_count18GLOBAL_PANIC_COUNT17h95c275c59ddc0e59E
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
        i32.const 1055104
        i32.add
        i32.load8_u
        br_if 0 (;@1;)
        global.get $GOT.data.internal.__memory_base
        local.tee 1
        i32.const 1055104
        i32.add
        local.get 0
        i32.store8
        local.get 1
        i32.const 1055100
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
    (func $_ZN3std9panicking12default_hook17h16b8cc3dcb9e7d50E (;101;) (type 0) (param i32)
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
        i32.const 1055100
        i32.add
        i32.load
        i32.const 1
        i32.gt_u
        br_if 0 (;@1;)
        call $_ZN3std5panic19get_backtrace_style17h7f1abd8860a59dbeE
        i32.const 255
        i32.and
        local.set 2
      end
      local.get 1
      local.get 2
      i32.store8 offset=15
      local.get 1
      local.get 0
      i32.load offset=8
      i32.store offset=16
      local.get 1
      local.get 0
      i32.load
      local.get 0
      i32.load offset=4
      call $_ZN3std9panicking14payload_as_str17he1b42096fe827c5aE
      local.get 1
      local.get 1
      i64.load
      i64.store offset=20 align=4
      global.get $GOT.data.internal.__memory_base
      i32.const 1055056
      i32.add
      i32.load8_u
      local.set 0
      local.get 1
      local.get 1
      i32.const 15
      i32.add
      i32.store offset=36
      local.get 1
      local.get 1
      i32.const 20
      i32.add
      i32.store offset=32
      local.get 1
      local.get 1
      i32.const 16
      i32.add
      i32.store offset=28
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            local.get 0
            i32.eqz
            br_if 0 (;@3;)
            global.get $GOT.data.internal.__memory_base
            local.tee 0
            i32.const 1055056
            i32.add
            i32.const 1
            i32.store8
            local.get 0
            i32.const 1055052
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
          i64.const 0
          i64.store offset=40
          local.get 1
          i32.const 28
          i32.add
          local.get 1
          i32.const 40
          i32.add
          global.get $GOT.data.internal.__memory_base
          i32.const 1054344
          i32.add
          call $_ZN3std9panicking12default_hook28_$u7b$$u7b$closure$u7d$$u7d$17h50d8ef25a62b5933E
          local.get 1
          i32.const 40
          i32.add
          call $_ZN4core3ptr52drop_in_place$LT$std..sys..stdio..wasip2..Stderr$GT$17h50b0dd383b42d473E
          br 1 (;@1;)
        end
        global.get $GOT.data.internal.__memory_base
        local.set 2
        local.get 1
        i32.const 28
        i32.add
        local.get 0
        i32.const 8
        i32.add
        call $_ZN3std4sync6poison5mutex14Mutex$LT$T$GT$4lock17hdbeb5512acf92b97E
        local.tee 3
        i32.const 4
        i32.add
        local.get 2
        i32.const 1054416
        i32.add
        call $_ZN3std9panicking12default_hook28_$u7b$$u7b$closure$u7d$$u7d$17h50d8ef25a62b5933E
        local.get 3
        i32.const 0
        i32.store8
        local.get 2
        i32.const 1055056
        i32.add
        i32.const 1
        i32.store8
        local.get 2
        i32.const 1055052
        i32.add
        local.tee 3
        i32.load
        local.set 2
        local.get 3
        local.get 0
        i32.store
        local.get 1
        local.get 2
        i32.store offset=44
        local.get 1
        i32.const 1
        i32.store offset=40
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
        i32.const 40
        i32.add
        i32.const 4
        i32.add
        call $_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17hbc6b47b295e1d801E
      end
      local.get 1
      i32.const 48
      i32.add
      global.set $__stack_pointer
    )
    (func $_ZN3std9panicking14payload_as_str17he1b42096fe827c5aE (;102;) (type 9) (param i32 i32 i32)
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
      call_indirect (type 3)
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
          call_indirect (type 3)
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
            i64.const 6308897881664671169
            i64.xor
            local.get 6
            i64.const 3027651506749694454
            i64.xor
            i64.or
            i64.const 0
            i64.eq
            br_if 0 (;@3;)
            local.get 2
            i32.const 1050943
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
    (func $_ZN3std9panicking12default_hook28_$u7b$$u7b$closure$u7d$$u7d$17h50d8ef25a62b5933E (;103;) (type 9) (param i32 i32 i32)
      (local i32 i32 i64 i32)
      global.get $__stack_pointer
      i32.const 32
      i32.sub
      local.tee 3
      global.set $__stack_pointer
      call $_ZN3std3sys9backtrace4lock17h95c86d3935e9810dE
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
          global.get $GOT.data.internal._ZN3std6thread7current7CURRENT17hbf0d355f6c760390E
          i32.load
          local.tee 6
          i32.const 2
          i32.gt_u
          br_if 0 (;@2;)
          local.get 3
          i32.const 12
          i32.add
          i32.const 0
          call $_ZN3std6thread7current17with_current_name28_$u7b$$u7b$closure$u7d$$u7d$17hd5301cc5dfbcbbaaE
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
        call $_ZN3std6thread7current17with_current_name28_$u7b$$u7b$closure$u7d$$u7d$17hd5301cc5dfbcbbaaE
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
            call $_ZN3std3sys9backtrace13BacktraceLock5print17h9686152c07e589f1E
            local.get 3
            i32.load8_u offset=12
            local.get 3
            i32.load offset=16
            call $_ZN4core3ptr81drop_in_place$LT$core..result..Result$LT$$LP$$RP$$C$std..io..error..Error$GT$$GT$17hcad36bac1cd65805E
            br 2 (;@1;)
          end
          local.get 3
          i32.const 12
          i32.add
          local.get 1
          local.get 2
          i32.load offset=36
          i32.const 1
          call $_ZN3std3sys9backtrace13BacktraceLock5print17h9686152c07e589f1E
          local.get 3
          i32.load8_u offset=12
          local.get 3
          i32.load offset=16
          call $_ZN4core3ptr81drop_in_place$LT$core..result..Result$LT$$LP$$RP$$C$std..io..error..Error$GT$$GT$17hcad36bac1cd65805E
          br 1 (;@1;)
        end
        global.get $GOT.data.internal.__memory_base
        i32.const 1054456
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
        i32.const 1050783
        i32.add
        i32.const 157
        local.get 2
        i32.load offset=36
        call_indirect (type 1)
        local.get 3
        i32.load8_u offset=12
        local.get 3
        i32.load offset=16
        call $_ZN4core3ptr81drop_in_place$LT$core..result..Result$LT$$LP$$RP$$C$std..io..error..Error$GT$$GT$17hcad36bac1cd65805E
      end
      local.get 4
      i32.const 0
      i32.store8
      local.get 3
      i32.const 32
      i32.add
      global.set $__stack_pointer
    )
    (func $_ZN52_$LT$$RF$mut$u20$T$u20$as$u20$core..fmt..Display$GT$3fmt17hf8424e5fb260dfb5E (;104;) (type 4) (param i32 i32) (result i32)
      local.get 0
      i32.load
      local.get 1
      local.get 0
      i32.load offset=4
      i32.load offset=12
      call_indirect (type 4)
    )
    (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h842785eb1a8ac275E (;105;) (type 4) (param i32 i32) (result i32)
      local.get 0
      i32.load
      local.get 1
      call $_ZN43_$LT$bool$u20$as$u20$core..fmt..Display$GT$3fmt17hff556c2642512c9cE
    )
    (func $_ZN4core3fmt5Write10write_char17h954a84740e5497b8E (;106;) (type 4) (param i32 i32) (result i32)
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
          block ;; label = @3
            local.get 1
            i32.const 128
            i32.lt_u
            br_if 0 (;@3;)
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
            local.get 1
            i32.const 2048
            i32.lt_u
            br_if 1 (;@2;)
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
            block ;; label = @4
              local.get 1
              i32.const 65536
              i32.lt_u
              br_if 0 (;@4;)
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
              br 3 (;@1;)
            end
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
          local.get 1
          i32.store8 offset=12
          i32.const 1
          local.set 1
          br 1 (;@1;)
        end
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
        call $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h14d6e18732974dddE
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
    (func $_ZN4core3fmt5Write10write_char17hb22f122c3ef22074E (;107;) (type 4) (param i32 i32) (result i32)
      (local i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 2
      global.set $__stack_pointer
      local.get 2
      i32.const 0
      i32.store offset=4
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            local.get 1
            i32.const 128
            i32.lt_u
            br_if 0 (;@3;)
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
            local.get 1
            i32.const 2048
            i32.lt_u
            br_if 1 (;@2;)
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
            block ;; label = @4
              local.get 1
              i32.const 65536
              i32.lt_u
              br_if 0 (;@4;)
              local.get 2
              local.get 3
              i32.store8 offset=7
              local.get 2
              local.get 4
              i32.store8 offset=6
              local.get 2
              local.get 5
              i32.const 63
              i32.and
              i32.const -128
              i32.or
              i32.store8 offset=5
              local.get 2
              local.get 1
              i32.const 18
              i32.shr_u
              i32.const -16
              i32.or
              i32.store8 offset=4
              i32.const 4
              local.set 1
              br 3 (;@1;)
            end
            local.get 2
            local.get 3
            i32.store8 offset=6
            local.get 2
            local.get 4
            i32.store8 offset=5
            local.get 2
            local.get 5
            i32.const 224
            i32.or
            i32.store8 offset=4
            i32.const 3
            local.set 1
            br 2 (;@1;)
          end
          local.get 2
          local.get 1
          i32.store8 offset=4
          i32.const 1
          local.set 1
          br 1 (;@1;)
        end
        local.get 2
        local.get 3
        i32.store8 offset=5
        local.get 2
        local.get 4
        i32.const 192
        i32.or
        i32.store8 offset=4
        i32.const 2
        local.set 1
      end
      local.get 2
      i32.const 8
      i32.add
      local.get 0
      i32.load offset=8
      local.get 2
      i32.const 4
      i32.add
      local.get 1
      call $_ZN3std2io5Write9write_all17hac23022ab680c457E
      block ;; label = @1
        local.get 2
        i32.load8_u offset=8
        local.tee 1
        i32.const 4
        i32.eq
        br_if 0 (;@1;)
        local.get 0
        i32.load offset=4
        local.set 4
        block ;; label = @2
          block ;; label = @3
            local.get 0
            i32.load8_u
            local.tee 3
            i32.const 4
            i32.gt_u
            br_if 0 (;@3;)
            local.get 3
            i32.const 3
            i32.ne
            br_if 1 (;@2;)
          end
          local.get 4
          i32.load
          local.set 5
          block ;; label = @3
            local.get 4
            i32.const 4
            i32.add
            i32.load
            local.tee 3
            i32.load
            local.tee 6
            i32.eqz
            br_if 0 (;@3;)
            local.get 5
            local.get 6
            call_indirect (type 0)
          end
          block ;; label = @3
            local.get 3
            i32.load offset=4
            local.tee 6
            i32.eqz
            br_if 0 (;@3;)
            local.get 5
            local.get 6
            local.get 3
            i32.load offset=8
            call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
          end
          local.get 4
          i32.const 12
          i32.const 4
          call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
        end
        local.get 0
        local.get 2
        i64.load offset=8
        i64.store align=4
      end
      local.get 2
      i32.const 16
      i32.add
      global.set $__stack_pointer
      local.get 1
      i32.const 4
      i32.ne
    )
    (func $_ZN4core3fmt5Write10write_char17hea746690382d93f2E (;108;) (type 4) (param i32 i32) (result i32)
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
          block ;; label = @3
            local.get 1
            i32.const 128
            i32.lt_u
            br_if 0 (;@3;)
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
            local.get 1
            i32.const 2048
            i32.lt_u
            br_if 1 (;@2;)
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
            block ;; label = @4
              local.get 1
              i32.const 65536
              i32.lt_u
              br_if 0 (;@4;)
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
              br 3 (;@1;)
            end
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
          local.get 1
          i32.store8 offset=12
          i32.const 1
          local.set 1
          br 1 (;@1;)
        end
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
        i32.const 1054216
        i32.add
        i64.load
        local.tee 7
        i64.const 255
        i64.and
        i64.const 4
        i64.eq
        br_if 0 (;@1;)
        local.get 0
        i32.load offset=4
        local.set 3
        block ;; label = @2
          block ;; label = @3
            local.get 0
            i32.load8_u
            local.tee 1
            i32.const 4
            i32.gt_u
            br_if 0 (;@3;)
            local.get 1
            i32.const 3
            i32.ne
            br_if 1 (;@2;)
          end
          local.get 3
          i32.load
          local.set 4
          block ;; label = @3
            local.get 3
            i32.const 4
            i32.add
            i32.load
            local.tee 1
            i32.load
            local.tee 5
            i32.eqz
            br_if 0 (;@3;)
            local.get 4
            local.get 5
            call_indirect (type 0)
          end
          block ;; label = @3
            local.get 1
            i32.load offset=4
            local.tee 5
            i32.eqz
            br_if 0 (;@3;)
            local.get 4
            local.get 5
            local.get 1
            i32.load offset=8
            call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
          end
          local.get 3
          i32.const 12
          i32.const 4
          call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
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
    (func $_ZN4core3fmt5Write9write_fmt17h3021d5dae2529369E (;109;) (type 2) (param i32 i32 i32) (result i32)
      local.get 0
      global.get $GOT.data.internal.__memory_base
      i32.const 1054112
      i32.add
      local.get 1
      local.get 2
      call $_ZN4core3fmt5write17h80512e2a12699005E
    )
    (func $_ZN4core3fmt5Write9write_fmt17h725e038092ca175cE (;110;) (type 2) (param i32 i32 i32) (result i32)
      local.get 0
      global.get $GOT.data.internal.__memory_base
      i32.const 1054176
      i32.add
      local.get 1
      local.get 2
      call $_ZN4core3fmt5write17h80512e2a12699005E
    )
    (func $_ZN4core3fmt5Write9write_fmt17hc713ca0a06c37a80E (;111;) (type 2) (param i32 i32 i32) (result i32)
      local.get 0
      global.get $GOT.data.internal.__memory_base
      i32.const 1054152
      i32.add
      local.get 1
      local.get 2
      call $_ZN4core3fmt5write17h80512e2a12699005E
    )
    (func $_ZN4core3fmt5Write9write_fmt17hd3b3048a187f1835E (;112;) (type 2) (param i32 i32 i32) (result i32)
      local.get 0
      global.get $GOT.data.internal.__memory_base
      i32.const 1054476
      i32.add
      local.get 1
      local.get 2
      call $_ZN4core3fmt5write17h80512e2a12699005E
    )
    (func $_ZN4core3ptr119drop_in_place$LT$std..io..default_write_fmt..Adapter$LT$std..io..cursor..Cursor$LT$$RF$mut$u20$$u5b$u8$u5d$$GT$$GT$$GT$17ha0ba1057ed3e6309E (;113;) (type 0) (param i32)
      (local i32 i32 i32)
      local.get 0
      i32.load offset=4
      local.set 1
      block ;; label = @1
        block ;; label = @2
          local.get 0
          i32.load8_u
          local.tee 0
          i32.const 4
          i32.gt_u
          br_if 0 (;@2;)
          local.get 0
          i32.const 3
          i32.ne
          br_if 1 (;@1;)
        end
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
          call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
        end
        local.get 1
        i32.const 12
        i32.const 4
        call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
      end
    )
    (func $_ZN4core3ptr238drop_in_place$LT$alloc..boxed..convert..$LT$impl$u20$core..convert..From$LT$alloc..string..String$GT$$u20$for$u20$alloc..boxed..Box$LT$dyn$u20$core..error..Error$u2b$core..marker..Send$u2b$core..marker..Sync$GT$$GT$..from..StringError$GT$17hecc00a9bfe85effeE (;114;) (type 0) (param i32)
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
        call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
      end
    )
    (func $_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17h3d6b5769f99f2a0aE (;115;) (type 0) (param i32)
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
        call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
      end
    )
    (func $_ZN4core3ptr46drop_in_place$LT$alloc..vec..Vec$LT$u8$GT$$GT$17he02b1595bd0dfddfE (;116;) (type 0) (param i32)
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
        call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
      end
    )
    (func $_ZN4core3ptr71drop_in_place$LT$std..panicking..panic_handler..FormatStringPayload$GT$17h1d9ce7995872d0d8E (;117;) (type 0) (param i32)
      (local i32)
      block ;; label = @1
        local.get 0
        i32.load
        local.tee 1
        i32.const -2147483648
        i32.or
        i32.const -2147483648
        i32.eq
        br_if 0 (;@1;)
        local.get 0
        i32.load offset=4
        local.get 1
        i32.const 1
        call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
      end
    )
    (func $_ZN4core5error5Error11description17he9b90423a0317774E (;118;) (type 3) (param i32 i32)
      local.get 0
      i32.const 40
      i32.store offset=4
      local.get 0
      global.get $GOT.data.internal.__memory_base
      i32.const 1051000
      i32.add
      i32.store
    )
    (func $_ZN4core5error5Error5cause17h4c15f6f5fe6b1607E (;119;) (type 3) (param i32 i32)
      local.get 0
      i32.const 0
      i32.store
    )
    (func $_ZN4core5error5Error7provide17h47f951971b1c8124E (;120;) (type 9) (param i32 i32 i32))
    (func $_ZN4core5error5Error7type_id17hdbeee4edcace8278E (;121;) (type 3) (param i32 i32)
      (local i32)
      local.get 0
      global.get $GOT.data.internal.__memory_base
      i32.const 1051040
      i32.add
      local.tee 2
      i64.load align=4
      i64.store align=4
      local.get 0
      i32.const 8
      i32.add
      local.get 2
      i32.const 8
      i32.add
      i64.load align=4
      i64.store align=4
    )
    (func $_ZN4core5panic12PanicPayload6as_str17h0c9efca4fec03a8cE (;122;) (type 3) (param i32 i32)
      local.get 0
      i32.const 0
      i32.store
    )
    (func $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$10write_char17hc9b79da1909ec910E (;123;) (type 4) (param i32 i32) (result i32)
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
        call $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h14d6e18732974dddE
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
          block ;; label = @3
            local.get 1
            i32.const 128
            i32.lt_u
            br_if 0 (;@3;)
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
            local.get 1
            i32.const 2048
            i32.lt_u
            br_if 1 (;@2;)
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
            block ;; label = @4
              local.get 1
              i32.const 65536
              i32.lt_u
              br_if 0 (;@4;)
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
              br 3 (;@1;)
            end
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
          local.get 1
          i32.store8
          br 1 (;@1;)
        end
        local.get 4
        local.get 5
        i32.store8 offset=1
        local.get 4
        local.get 6
        i32.const 192
        i32.or
        i32.store8
      end
      local.get 0
      local.get 3
      local.get 2
      i32.add
      i32.store offset=8
      i32.const 0
    )
    (func $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$9write_str17hb875d0f35d6285acE (;124;) (type 2) (param i32 i32 i32) (result i32)
      (local i32)
      block ;; label = @1
        local.get 2
        local.get 0
        i32.load
        local.get 0
        i32.load offset=8
        local.tee 3
        i32.sub
        i32.le_u
        br_if 0 (;@1;)
        local.get 0
        local.get 3
        local.get 2
        i32.const 1
        i32.const 1
        call $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h14d6e18732974dddE
        local.get 0
        i32.load offset=8
        local.set 3
      end
      block ;; label = @1
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
    (func $_ZN60_$LT$std..io..stdio..StderrRaw$u20$as$u20$std..io..Write$GT$14write_vectored17h29b290aa89f17d92E (;125;) (type 1) (param i32 i32 i32 i32)
      (local i32 i32)
      local.get 3
      i32.const 3
      i32.shl
      local.set 3
      local.get 2
      i32.const 4
      i32.add
      local.set 2
      loop ;; label = @1
        block ;; label = @2
          local.get 3
          br_if 0 (;@2;)
          local.get 0
          local.get 1
          i32.const 1
          i32.const 0
          call $_ZN66_$LT$std..sys..stdio..wasip2..Stderr$u20$as$u20$std..io..Write$GT$5write17h1814ddb7f133e501E
          return
        end
        local.get 3
        i32.const -8
        i32.add
        local.set 3
        local.get 2
        i32.load
        local.set 4
        local.get 2
        i32.const 8
        i32.add
        local.tee 5
        local.set 2
        local.get 4
        i32.eqz
        br_if 0 (;@1;)
      end
      local.get 0
      local.get 1
      local.get 5
      i32.const -12
      i32.add
      i32.load
      local.get 4
      call $_ZN66_$LT$std..sys..stdio..wasip2..Stderr$u20$as$u20$std..io..Write$GT$5write17h1814ddb7f133e501E
    )
    (func $_ZN66_$LT$std..sys..stdio..wasip2..Stderr$u20$as$u20$std..io..Write$GT$5write17h1814ddb7f133e501E (;126;) (type 1) (param i32 i32 i32 i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 32
      i32.sub
      local.tee 4
      global.set $__stack_pointer
      block ;; label = @1
        block ;; label = @2
          local.get 1
          i32.load
          i32.const 1
          i32.ne
          br_if 0 (;@2;)
          local.get 1
          i32.const 4
          i32.add
          local.set 1
          br 1 (;@1;)
        end
        local.get 1
        call $_ZN4wasi7imports4wasi3cli6stderr10get_stderr17h00867409b546223aE
        i32.store offset=4
        local.get 1
        i32.const 1
        i32.store
        local.get 1
        i32.const 4
        i32.add
        local.set 1
      end
      local.get 4
      local.get 1
      local.get 2
      local.get 3
      i32.const 4096
      local.get 3
      i32.const 4096
      i32.lt_u
      select
      local.tee 3
      call $_ZN4wasi7imports4wasi2io7streams12OutputStream24blocking_write_and_flush17he307f6cb42e51076E
      block ;; label = @1
        block ;; label = @2
          local.get 4
          i32.load
          local.tee 1
          i32.const 2
          i32.eq
          br_if 0 (;@2;)
          block ;; label = @3
            local.get 1
            i32.const 1
            i32.and
            i32.eqz
            br_if 0 (;@3;)
            local.get 0
            i32.const 4
            i32.store8
            local.get 0
            i32.const 0
            i32.store offset=4
            br 2 (;@1;)
          end
          local.get 4
          local.get 4
          i32.load offset=4
          i32.store offset=16
          local.get 4
          i32.const 20
          i32.add
          local.get 4
          i32.const 16
          i32.add
          call $_ZN4wasi7imports4wasi2io5error5Error15to_debug_string17h4c347498d8df19e4E
          local.get 4
          i32.const 8
          i32.add
          i32.const 40
          local.get 4
          i32.const 20
          i32.add
          call $_ZN3std2io5error5Error3new17h27c20b34f4cb0c9dE
          block ;; label = @3
            local.get 4
            i32.load offset=16
            local.tee 1
            i32.const -1
            i32.eq
            br_if 0 (;@3;)
            local.get 1
            call $_ZN90_$LT$wasi..imports..wasi..io..error..Error$u20$as$u20$wasi..imports.._rt..WasmResource$GT$4drop4drop17h054f8123dd94d3f0E
          end
          local.get 0
          local.get 4
          i64.load offset=8
          i64.store align=4
          br 1 (;@1;)
        end
        local.get 0
        i32.const 4
        i32.store8
        local.get 0
        local.get 3
        i32.store offset=4
      end
      local.get 4
      i32.const 32
      i32.add
      global.set $__stack_pointer
    )
    (func $_ZN66_$LT$std..sys..stdio..wasip2..Stderr$u20$as$u20$std..io..Write$GT$5flush17h93674d72d5677f8eE (;127;) (type 3) (param i32 i32)
      local.get 0
      i32.const 4
      i32.store8
    )
    (func $_ZN81_$LT$std..io..default_write_fmt..Adapter$LT$T$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17h33830f6d5cb80c27E (;128;) (type 2) (param i32 i32 i32) (result i32)
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
        i32.const 1054216
        i32.add
        i64.load
        local.tee 6
        i64.const 255
        i64.and
        i64.const 4
        i64.eq
        br_if 0 (;@1;)
        local.get 0
        i32.load offset=4
        local.set 4
        block ;; label = @2
          block ;; label = @3
            local.get 0
            i32.load8_u
            local.tee 2
            i32.const 4
            i32.gt_u
            br_if 0 (;@3;)
            local.get 2
            i32.const 3
            i32.ne
            br_if 1 (;@2;)
          end
          local.get 4
          i32.load
          local.set 7
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
            local.get 7
            local.get 5
            call_indirect (type 0)
          end
          block ;; label = @3
            local.get 2
            i32.load offset=4
            local.tee 5
            i32.eqz
            br_if 0 (;@3;)
            local.get 7
            local.get 5
            local.get 2
            i32.load offset=8
            call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
          end
          local.get 4
          i32.const 12
          i32.const 4
          call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
        end
        local.get 0
        local.get 6
        i64.store align=4
        i32.const 1
        local.set 3
      end
      local.get 3
    )
    (func $_ZN81_$LT$std..io..default_write_fmt..Adapter$LT$T$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17hafaaa404721689d8E (;129;) (type 2) (param i32 i32 i32) (result i32)
      (local i32)
      block ;; label = @1
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
        br_if 0 (;@1;)
        local.get 0
        local.get 3
        local.get 2
        i32.const 1
        i32.const 1
        call $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h14d6e18732974dddE
        local.get 0
        i32.load offset=8
        local.set 3
      end
      block ;; label = @1
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
    (func $_ZN81_$LT$std..io..default_write_fmt..Adapter$LT$T$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17hc4aa4d5eb25cd696E (;130;) (type 2) (param i32 i32 i32) (result i32)
      (local i32 i32 i32 i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 3
      global.set $__stack_pointer
      local.get 3
      i32.const 8
      i32.add
      local.get 0
      i32.load offset=8
      local.get 1
      local.get 2
      call $_ZN3std2io5Write9write_all17hac23022ab680c457E
      block ;; label = @1
        local.get 3
        i32.load8_u offset=8
        local.tee 2
        i32.const 4
        i32.eq
        br_if 0 (;@1;)
        local.get 0
        i32.load offset=4
        local.set 4
        block ;; label = @2
          block ;; label = @3
            local.get 0
            i32.load8_u
            local.tee 1
            i32.const 4
            i32.gt_u
            br_if 0 (;@3;)
            local.get 1
            i32.const 3
            i32.ne
            br_if 1 (;@2;)
          end
          local.get 4
          i32.load
          local.set 5
          block ;; label = @3
            local.get 4
            i32.const 4
            i32.add
            i32.load
            local.tee 1
            i32.load
            local.tee 6
            i32.eqz
            br_if 0 (;@3;)
            local.get 5
            local.get 6
            call_indirect (type 0)
          end
          block ;; label = @3
            local.get 1
            i32.load offset=4
            local.tee 6
            i32.eqz
            br_if 0 (;@3;)
            local.get 5
            local.get 6
            local.get 1
            i32.load offset=8
            call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
          end
          local.get 4
          i32.const 12
          i32.const 4
          call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
        end
        local.get 0
        local.get 3
        i64.load offset=8
        i64.store align=4
      end
      local.get 3
      i32.const 16
      i32.add
      global.set $__stack_pointer
      local.get 2
      i32.const 4
      i32.ne
    )
    (func $_ZN86_$LT$std..panicking..panic_handler..StaticStrPayload$u20$as$u20$core..fmt..Display$GT$3fmt17h526499ea0f7fb230E (;131;) (type 4) (param i32 i32) (result i32)
      local.get 1
      local.get 0
      i32.load
      local.get 0
      i32.load offset=4
      call $_ZN4core3fmt9Formatter9write_str17h34f77234b6666431E
    )
    (func $_ZN89_$LT$std..panicking..panic_handler..FormatStringPayload$u20$as$u20$core..fmt..Display$GT$3fmt17hd08c356bd3af9dc6E (;132;) (type 4) (param i32 i32) (result i32)
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
        call $_ZN4core3fmt9Formatter9write_str17h34f77234b6666431E
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
      call $_ZN4core3fmt5write17h80512e2a12699005E
    )
    (func $_ZN93_$LT$std..panicking..panic_handler..StaticStrPayload$u20$as$u20$core..panic..PanicPayload$GT$3get17h415262167db026e7E (;133;) (type 3) (param i32 i32)
      local.get 0
      global.get $GOT.data.internal.__memory_base
      i32.const 1054632
      i32.add
      i32.store offset=4
      local.get 0
      local.get 1
      i32.store
    )
    (func $_ZN93_$LT$std..panicking..panic_handler..StaticStrPayload$u20$as$u20$core..panic..PanicPayload$GT$6as_str17he5019975b9fcbc26E (;134;) (type 3) (param i32 i32)
      local.get 0
      local.get 1
      i64.load align=4
      i64.store
    )
    (func $_ZN93_$LT$std..panicking..panic_handler..StaticStrPayload$u20$as$u20$core..panic..PanicPayload$GT$8take_box17h880879ae471a41e6E (;135;) (type 3) (param i32 i32)
      (local i32 i32)
      local.get 1
      i32.load offset=4
      local.set 2
      local.get 1
      i32.load
      local.set 3
      call $_RNvCsdBezzDwma51_7___rustc35___rust_no_alloc_shim_is_unstable_v2
      block ;; label = @1
        i32.const 8
        i32.const 4
        call $_RNvCsdBezzDwma51_7___rustc12___rust_alloc
        local.tee 1
        br_if 0 (;@1;)
        i32.const 4
        i32.const 8
        call $_ZN5alloc5alloc18handle_alloc_error17h6a90b55247f528a0E
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
      i32.const 1054632
      i32.add
      i32.store offset=4
      local.get 0
      local.get 1
      i32.store
    )
    (func $_ZN96_$LT$std..panicking..panic_handler..FormatStringPayload$u20$as$u20$core..panic..PanicPayload$GT$3get17h17731e93ea232ebeE (;136;) (type 3) (param i32 i32)
      (local i32 i32 i32 i64)
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
        i32.const 20
        i32.add
        i32.const 8
        i32.add
        local.tee 4
        i32.const 0
        i32.store
        local.get 2
        i64.const 4294967296
        i64.store offset=20 align=4
        local.get 2
        i32.const 20
        i32.add
        global.get $GOT.data.internal.__memory_base
        i32.const 1054476
        i32.add
        local.get 3
        i32.load
        local.tee 3
        i32.load
        local.get 3
        i32.load offset=4
        call $_ZN4core3fmt5write17h80512e2a12699005E
        drop
        local.get 2
        i32.const 8
        i32.add
        i32.const 8
        i32.add
        local.get 4
        i32.load
        local.tee 3
        i32.store
        local.get 2
        local.get 2
        i64.load offset=20 align=4
        local.tee 5
        i64.store offset=8
        local.get 1
        i32.const 8
        i32.add
        local.get 3
        i32.store
        local.get 1
        local.get 5
        i64.store align=4
      end
      local.get 0
      local.get 1
      i32.store
      local.get 0
      global.get $GOT.data.internal.__memory_base
      i32.const 1054648
      i32.add
      i32.store offset=4
      local.get 2
      i32.const 32
      i32.add
      global.set $__stack_pointer
    )
    (func $_ZN96_$LT$std..panicking..panic_handler..FormatStringPayload$u20$as$u20$core..panic..PanicPayload$GT$8take_box17h7b8701059046b4b9E (;137;) (type 3) (param i32 i32)
      (local i32 i32 i32 i64)
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
        i32.const 36
        i32.add
        i32.const 8
        i32.add
        local.tee 4
        i32.const 0
        i32.store
        local.get 2
        i64.const 4294967296
        i64.store offset=36 align=4
        local.get 2
        i32.const 36
        i32.add
        global.get $GOT.data.internal.__memory_base
        i32.const 1054476
        i32.add
        local.get 3
        i32.load
        local.tee 3
        i32.load
        local.get 3
        i32.load offset=4
        call $_ZN4core3fmt5write17h80512e2a12699005E
        drop
        local.get 2
        i32.const 24
        i32.add
        i32.const 8
        i32.add
        local.get 4
        i32.load
        local.tee 3
        i32.store
        local.get 2
        local.get 2
        i64.load offset=36 align=4
        local.tee 5
        i64.store offset=24
        local.get 1
        i32.const 8
        i32.add
        local.get 3
        i32.store
        local.get 1
        local.get 5
        i64.store align=4
      end
      local.get 1
      i64.load align=4
      local.set 5
      local.get 1
      i64.const 4294967296
      i64.store align=4
      local.get 2
      i32.const 8
      i32.add
      i32.const 8
      i32.add
      local.tee 3
      local.get 1
      i32.const 8
      i32.add
      local.tee 1
      i32.load
      i32.store
      local.get 1
      i32.const 0
      i32.store
      local.get 2
      local.get 5
      i64.store offset=8
      call $_RNvCsdBezzDwma51_7___rustc35___rust_no_alloc_shim_is_unstable_v2
      block ;; label = @1
        i32.const 12
        i32.const 4
        call $_RNvCsdBezzDwma51_7___rustc12___rust_alloc
        local.tee 1
        br_if 0 (;@1;)
        i32.const 4
        i32.const 12
        call $_ZN5alloc5alloc18handle_alloc_error17h6a90b55247f528a0E
        unreachable
      end
      local.get 1
      local.get 2
      i64.load offset=8
      i64.store align=4
      local.get 1
      i32.const 8
      i32.add
      local.get 3
      i32.load
      i32.store
      local.get 0
      global.get $GOT.data.internal.__memory_base
      i32.const 1054648
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
    (func $cabi_realloc (;138;) (type 11) (param i32 i32 i32 i32) (result i32)
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            local.get 1
            br_if 0 (;@3;)
            local.get 3
            i32.eqz
            br_if 1 (;@2;)
            call $_RNvCsdBezzDwma51_7___rustc35___rust_no_alloc_shim_is_unstable_v2
            local.get 3
            local.get 2
            call $_RNvCsdBezzDwma51_7___rustc12___rust_alloc
            local.tee 2
            br_if 1 (;@2;)
            br 2 (;@1;)
          end
          local.get 0
          local.get 1
          local.get 2
          local.get 3
          call $_RNvCsdBezzDwma51_7___rustc14___rust_realloc
          local.tee 2
          i32.eqz
          br_if 1 (;@1;)
        end
        local.get 2
        return
      end
      call $_ZN3std3sys3pal6wasip27helpers14abort_internal17h7622470673c2f9f4E
      unreachable
    )
    (func $_ZN4wasi5proxy40__link_custom_section_describing_imports17hf0eabe478194bc4bE (;139;) (type 8))
    (func $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h7ee76122d7aec1a5E (;140;) (type 0) (param i32)
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
      call $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$14grow_amortized17h5bd3da6289f03ad5E
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
        call $_ZN5alloc7raw_vec12handle_error17h9f321253d17717ecE
        unreachable
      end
      local.get 1
      i32.const 16
      i32.add
      global.set $__stack_pointer
    )
    (func $_ZN4wasi7imports4wasi2io5error5Error15to_debug_string17h4c347498d8df19e4E (;141;) (type 3) (param i32 i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 2
      global.set $__stack_pointer
      local.get 1
      i32.load
      local.get 2
      i32.const 8
      i32.add
      call $_ZN4wasi7imports4wasi2io5error5Error15to_debug_string11wit_import117h9d9a5f1784e054faE
      local.get 0
      local.get 2
      i32.load offset=12
      local.tee 1
      i32.store offset=8
      local.get 0
      local.get 2
      i32.load offset=8
      i32.store offset=4
      local.get 0
      local.get 1
      i32.store
      local.get 2
      i32.const 16
      i32.add
      global.set $__stack_pointer
    )
    (func $_ZN4wasi7imports4wasi2io7streams12OutputStream24blocking_write_and_flush17he307f6cb42e51076E (;142;) (type 1) (param i32 i32 i32 i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 4
      global.set $__stack_pointer
      local.get 1
      i32.load
      local.get 2
      local.get 3
      local.get 4
      i32.const 4
      i32.add
      call $_ZN4wasi7imports4wasi2io7streams12OutputStream24blocking_write_and_flush11wit_import217hbd93b4a2527fec3cE
      i32.const 2
      local.set 1
      block ;; label = @1
        local.get 4
        i32.load8_u offset=4
        i32.const 1
        i32.and
        i32.eqz
        br_if 0 (;@1;)
        local.get 0
        local.get 4
        i32.load offset=12
        i32.store offset=4
        local.get 4
        i32.load8_u offset=8
        i32.const 0
        i32.ne
        local.set 1
      end
      local.get 0
      local.get 1
      i32.store
      local.get 4
      i32.const 16
      i32.add
      global.set $__stack_pointer
    )
    (func $_ZN4wasi7imports4wasi3cli6stderr10get_stderr17h00867409b546223aE (;143;) (type 7) (result i32)
      call $_ZN4wasi7imports4wasi3cli6stderr10get_stderr11wit_import017h6870e353e73ca545E
    )
    (func $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$14grow_amortized17h5bd3da6289f03ad5E (;144;) (type 1) (param i32 i32 i32 i32)
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
      call $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$11finish_grow17h34d8b6dcdbf8a18fE
      block ;; label = @1
        block ;; label = @2
          local.get 4
          i32.load offset=4
          i32.const 1
          i32.ne
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
    (func $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$11finish_grow17h34d8b6dcdbf8a18fE (;145;) (type 13) (param i32 i32 i32 i32 i32)
      (local i32 i32 i64)
      i32.const 1
      local.set 5
      i32.const 4
      local.set 6
      block ;; label = @1
        block ;; label = @2
          local.get 4
          i32.const 3
          i32.add
          i32.const 124
          i32.and
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
                call $_RNvCsdBezzDwma51_7___rustc14___rust_realloc
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
              call $_RNvCsdBezzDwma51_7___rustc35___rust_no_alloc_shim_is_unstable_v2
              local.get 3
              i32.const 4
              call $_RNvCsdBezzDwma51_7___rustc12___rust_alloc
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
    (func $malloc (;146;) (type 14) (param i32) (result i32)
      local.get 0
      call $dlmalloc
    )
    (func $dlmalloc (;147;) (type 14) (param i32) (result i32)
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
                                i32.const 0
                                i32.load offset=1055148
                                local.tee 2
                                br_if 0 (;@13;)
                                block ;; label = @14
                                  i32.const 0
                                  i32.load offset=1055596
                                  local.tee 3
                                  br_if 0 (;@14;)
                                  i32.const 0
                                  i64.const -1
                                  i64.store offset=1055608 align=4
                                  i32.const 0
                                  i64.const 281474976776192
                                  i64.store offset=1055600 align=4
                                  i32.const 0
                                  local.get 1
                                  i32.const 8
                                  i32.add
                                  i32.const -16
                                  i32.and
                                  i32.const 1431655768
                                  i32.xor
                                  local.tee 3
                                  i32.store offset=1055596
                                  i32.const 0
                                  i32.const 0
                                  i32.store offset=1055616
                                  i32.const 0
                                  i32.const 0
                                  i32.store offset=1055568
                                end
                                i32.const 1114112
                                i32.const 1055632
                                i32.lt_u
                                br_if 1 (;@12;)
                                i32.const 0
                                local.set 2
                                i32.const 1114112
                                i32.const 1055632
                                i32.sub
                                i32.const 89
                                i32.lt_u
                                br_if 0 (;@13;)
                                i32.const 0
                                local.set 4
                                i32.const 0
                                i32.const 1055632
                                i32.store offset=1055572
                                i32.const 0
                                i32.const 1055632
                                i32.store offset=1055140
                                i32.const 0
                                local.get 3
                                i32.store offset=1055160
                                i32.const 0
                                i32.const -1
                                i32.store offset=1055156
                                i32.const 0
                                i32.const 1114112
                                i32.const 1055632
                                i32.sub
                                local.tee 3
                                i32.store offset=1055576
                                i32.const 0
                                local.get 3
                                i32.store offset=1055560
                                i32.const 0
                                local.get 3
                                i32.store offset=1055556
                                loop ;; label = @14
                                  local.get 4
                                  i32.const 1055184
                                  i32.add
                                  local.get 4
                                  i32.const 1055172
                                  i32.add
                                  local.tee 3
                                  i32.store
                                  local.get 3
                                  local.get 4
                                  i32.const 1055164
                                  i32.add
                                  local.tee 5
                                  i32.store
                                  local.get 4
                                  i32.const 1055176
                                  i32.add
                                  local.get 5
                                  i32.store
                                  local.get 4
                                  i32.const 1055192
                                  i32.add
                                  local.get 4
                                  i32.const 1055180
                                  i32.add
                                  local.tee 5
                                  i32.store
                                  local.get 5
                                  local.get 3
                                  i32.store
                                  local.get 4
                                  i32.const 1055200
                                  i32.add
                                  local.get 4
                                  i32.const 1055188
                                  i32.add
                                  local.tee 3
                                  i32.store
                                  local.get 3
                                  local.get 5
                                  i32.store
                                  local.get 4
                                  i32.const 1055196
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
                                i32.const 1114112
                                i32.const -52
                                i32.add
                                i32.const 56
                                i32.store
                                i32.const 0
                                i32.const 0
                                i32.load offset=1055612
                                i32.store offset=1055152
                                i32.const 0
                                i32.const 1055632
                                i32.const -8
                                i32.const 1055632
                                i32.sub
                                i32.const 15
                                i32.and
                                local.tee 4
                                i32.add
                                local.tee 2
                                i32.store offset=1055148
                                i32.const 0
                                i32.const 1114112
                                i32.const 1055632
                                i32.sub
                                local.get 4
                                i32.sub
                                i32.const -56
                                i32.add
                                local.tee 4
                                i32.store offset=1055136
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
                                    i32.const 0
                                    i32.load offset=1055124
                                    local.tee 6
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
                                    local.tee 5
                                    i32.const 3
                                    i32.shr_u
                                    local.tee 3
                                    i32.shr_u
                                    local.tee 4
                                    i32.const 3
                                    i32.and
                                    i32.eqz
                                    br_if 0 (;@15;)
                                    block ;; label = @16
                                      block ;; label = @17
                                        local.get 4
                                        i32.const 1
                                        i32.and
                                        local.get 3
                                        i32.or
                                        i32.const 1
                                        i32.xor
                                        local.tee 5
                                        i32.const 3
                                        i32.shl
                                        local.tee 3
                                        i32.const 1055164
                                        i32.add
                                        local.tee 4
                                        local.get 3
                                        i32.const 1055172
                                        i32.add
                                        i32.load
                                        local.tee 3
                                        i32.load offset=8
                                        local.tee 0
                                        i32.ne
                                        br_if 0 (;@17;)
                                        i32.const 0
                                        local.get 6
                                        i32.const -2
                                        local.get 5
                                        i32.rotl
                                        i32.and
                                        i32.store offset=1055124
                                        br 1 (;@16;)
                                      end
                                      local.get 4
                                      local.get 0
                                      i32.store offset=8
                                      local.get 0
                                      local.get 4
                                      i32.store offset=12
                                    end
                                    local.get 3
                                    i32.const 8
                                    i32.add
                                    local.set 4
                                    local.get 3
                                    local.get 5
                                    i32.const 3
                                    i32.shl
                                    local.tee 5
                                    i32.const 3
                                    i32.or
                                    i32.store offset=4
                                    local.get 3
                                    local.get 5
                                    i32.add
                                    local.tee 3
                                    local.get 3
                                    i32.load offset=4
                                    i32.const 1
                                    i32.or
                                    i32.store offset=4
                                    br 14 (;@1;)
                                  end
                                  local.get 5
                                  i32.const 0
                                  i32.load offset=1055132
                                  local.tee 7
                                  i32.le_u
                                  br_if 1 (;@13;)
                                  block ;; label = @15
                                    local.get 4
                                    i32.eqz
                                    br_if 0 (;@15;)
                                    block ;; label = @16
                                      block ;; label = @17
                                        local.get 4
                                        local.get 3
                                        i32.shl
                                        i32.const 2
                                        local.get 3
                                        i32.shl
                                        local.tee 4
                                        i32.const 0
                                        local.get 4
                                        i32.sub
                                        i32.or
                                        i32.and
                                        i32.ctz
                                        local.tee 3
                                        i32.const 3
                                        i32.shl
                                        local.tee 4
                                        i32.const 1055164
                                        i32.add
                                        local.tee 0
                                        local.get 4
                                        i32.const 1055172
                                        i32.add
                                        i32.load
                                        local.tee 4
                                        i32.load offset=8
                                        local.tee 8
                                        i32.ne
                                        br_if 0 (;@17;)
                                        i32.const 0
                                        local.get 6
                                        i32.const -2
                                        local.get 3
                                        i32.rotl
                                        i32.and
                                        local.tee 6
                                        i32.store offset=1055124
                                        br 1 (;@16;)
                                      end
                                      local.get 0
                                      local.get 8
                                      i32.store offset=8
                                      local.get 8
                                      local.get 0
                                      i32.store offset=12
                                    end
                                    local.get 4
                                    local.get 5
                                    i32.const 3
                                    i32.or
                                    i32.store offset=4
                                    local.get 4
                                    local.get 3
                                    i32.const 3
                                    i32.shl
                                    local.tee 3
                                    i32.add
                                    local.get 3
                                    local.get 5
                                    i32.sub
                                    local.tee 0
                                    i32.store
                                    local.get 4
                                    local.get 5
                                    i32.add
                                    local.tee 8
                                    local.get 0
                                    i32.const 1
                                    i32.or
                                    i32.store offset=4
                                    block ;; label = @16
                                      local.get 7
                                      i32.eqz
                                      br_if 0 (;@16;)
                                      local.get 7
                                      i32.const -8
                                      i32.and
                                      i32.const 1055164
                                      i32.add
                                      local.set 5
                                      i32.const 0
                                      i32.load offset=1055144
                                      local.set 3
                                      block ;; label = @17
                                        block ;; label = @18
                                          local.get 6
                                          i32.const 1
                                          local.get 7
                                          i32.const 3
                                          i32.shr_u
                                          i32.shl
                                          local.tee 9
                                          i32.and
                                          br_if 0 (;@18;)
                                          i32.const 0
                                          local.get 6
                                          local.get 9
                                          i32.or
                                          i32.store offset=1055124
                                          local.get 5
                                          local.set 9
                                          br 1 (;@17;)
                                        end
                                        local.get 5
                                        i32.load offset=8
                                        local.set 9
                                      end
                                      local.get 9
                                      local.get 3
                                      i32.store offset=12
                                      local.get 5
                                      local.get 3
                                      i32.store offset=8
                                      local.get 3
                                      local.get 5
                                      i32.store offset=12
                                      local.get 3
                                      local.get 9
                                      i32.store offset=8
                                    end
                                    local.get 4
                                    i32.const 8
                                    i32.add
                                    local.set 4
                                    i32.const 0
                                    local.get 8
                                    i32.store offset=1055144
                                    i32.const 0
                                    local.get 0
                                    i32.store offset=1055132
                                    br 14 (;@1;)
                                  end
                                  i32.const 0
                                  i32.load offset=1055128
                                  local.tee 10
                                  i32.eqz
                                  br_if 1 (;@13;)
                                  local.get 10
                                  i32.ctz
                                  i32.const 2
                                  i32.shl
                                  i32.const 1055428
                                  i32.add
                                  i32.load
                                  local.tee 8
                                  i32.load offset=4
                                  i32.const -8
                                  i32.and
                                  local.get 5
                                  i32.sub
                                  local.set 3
                                  local.get 8
                                  local.set 0
                                  block ;; label = @15
                                    loop ;; label = @16
                                      block ;; label = @17
                                        local.get 0
                                        i32.load offset=16
                                        local.tee 4
                                        br_if 0 (;@17;)
                                        local.get 0
                                        i32.load offset=20
                                        local.tee 4
                                        i32.eqz
                                        br_if 2 (;@15;)
                                      end
                                      local.get 4
                                      i32.load offset=4
                                      i32.const -8
                                      i32.and
                                      local.get 5
                                      i32.sub
                                      local.tee 0
                                      local.get 3
                                      local.get 0
                                      local.get 3
                                      i32.lt_u
                                      local.tee 0
                                      select
                                      local.set 3
                                      local.get 4
                                      local.get 8
                                      local.get 0
                                      select
                                      local.set 8
                                      local.get 4
                                      local.set 0
                                      br 0 (;@16;)
                                    end
                                  end
                                  local.get 8
                                  i32.load offset=24
                                  local.set 2
                                  block ;; label = @15
                                    local.get 8
                                    i32.load offset=12
                                    local.tee 4
                                    local.get 8
                                    i32.eq
                                    br_if 0 (;@15;)
                                    local.get 8
                                    i32.load offset=8
                                    local.tee 0
                                    local.get 4
                                    i32.store offset=12
                                    local.get 4
                                    local.get 0
                                    i32.store offset=8
                                    br 13 (;@2;)
                                  end
                                  block ;; label = @15
                                    block ;; label = @16
                                      local.get 8
                                      i32.load offset=20
                                      local.tee 0
                                      i32.eqz
                                      br_if 0 (;@16;)
                                      local.get 8
                                      i32.const 20
                                      i32.add
                                      local.set 9
                                      br 1 (;@15;)
                                    end
                                    local.get 8
                                    i32.load offset=16
                                    local.tee 0
                                    i32.eqz
                                    br_if 4 (;@11;)
                                    local.get 8
                                    i32.const 16
                                    i32.add
                                    local.set 9
                                  end
                                  loop ;; label = @15
                                    local.get 9
                                    local.set 11
                                    local.get 0
                                    local.tee 4
                                    i32.const 20
                                    i32.add
                                    local.set 9
                                    local.get 4
                                    i32.load offset=20
                                    local.tee 0
                                    br_if 0 (;@15;)
                                    local.get 4
                                    i32.const 16
                                    i32.add
                                    local.set 9
                                    local.get 4
                                    i32.load offset=16
                                    local.tee 0
                                    br_if 0 (;@15;)
                                  end
                                  local.get 11
                                  i32.const 0
                                  i32.store
                                  br 12 (;@2;)
                                end
                                i32.const -1
                                local.set 5
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
                                local.set 5
                                i32.const 0
                                i32.load offset=1055128
                                local.tee 10
                                i32.eqz
                                br_if 0 (;@13;)
                                i32.const 31
                                local.set 7
                                block ;; label = @14
                                  local.get 0
                                  i32.const 16777196
                                  i32.gt_u
                                  br_if 0 (;@14;)
                                  local.get 5
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
                                  local.set 7
                                end
                                i32.const 0
                                local.get 5
                                i32.sub
                                local.set 3
                                block ;; label = @14
                                  block ;; label = @15
                                    block ;; label = @16
                                      block ;; label = @17
                                        local.get 7
                                        i32.const 2
                                        i32.shl
                                        i32.const 1055428
                                        i32.add
                                        i32.load
                                        local.tee 0
                                        br_if 0 (;@17;)
                                        i32.const 0
                                        local.set 4
                                        i32.const 0
                                        local.set 9
                                        br 1 (;@16;)
                                      end
                                      i32.const 0
                                      local.set 4
                                      local.get 5
                                      i32.const 0
                                      i32.const 25
                                      local.get 7
                                      i32.const 1
                                      i32.shr_u
                                      i32.sub
                                      local.get 7
                                      i32.const 31
                                      i32.eq
                                      select
                                      i32.shl
                                      local.set 8
                                      i32.const 0
                                      local.set 9
                                      loop ;; label = @17
                                        block ;; label = @18
                                          local.get 0
                                          i32.load offset=4
                                          i32.const -8
                                          i32.and
                                          local.get 5
                                          i32.sub
                                          local.tee 6
                                          local.get 3
                                          i32.ge_u
                                          br_if 0 (;@18;)
                                          local.get 6
                                          local.set 3
                                          local.get 0
                                          local.set 9
                                          local.get 6
                                          br_if 0 (;@18;)
                                          i32.const 0
                                          local.set 3
                                          local.get 0
                                          local.set 9
                                          local.get 0
                                          local.set 4
                                          br 3 (;@15;)
                                        end
                                        local.get 4
                                        local.get 0
                                        i32.load offset=20
                                        local.tee 6
                                        local.get 6
                                        local.get 0
                                        local.get 8
                                        i32.const 29
                                        i32.shr_u
                                        i32.const 4
                                        i32.and
                                        i32.add
                                        i32.load offset=16
                                        local.tee 11
                                        i32.eq
                                        select
                                        local.get 4
                                        local.get 6
                                        select
                                        local.set 4
                                        local.get 8
                                        i32.const 1
                                        i32.shl
                                        local.set 8
                                        local.get 11
                                        local.set 0
                                        local.get 11
                                        br_if 0 (;@17;)
                                      end
                                    end
                                    block ;; label = @16
                                      local.get 4
                                      local.get 9
                                      i32.or
                                      br_if 0 (;@16;)
                                      i32.const 0
                                      local.set 9
                                      i32.const 2
                                      local.get 7
                                      i32.shl
                                      local.tee 4
                                      i32.const 0
                                      local.get 4
                                      i32.sub
                                      i32.or
                                      local.get 10
                                      i32.and
                                      local.tee 4
                                      i32.eqz
                                      br_if 3 (;@13;)
                                      local.get 4
                                      i32.ctz
                                      i32.const 2
                                      i32.shl
                                      i32.const 1055428
                                      i32.add
                                      i32.load
                                      local.set 4
                                    end
                                    local.get 4
                                    i32.eqz
                                    br_if 1 (;@14;)
                                  end
                                  loop ;; label = @15
                                    local.get 4
                                    i32.load offset=4
                                    i32.const -8
                                    i32.and
                                    local.get 5
                                    i32.sub
                                    local.tee 6
                                    local.get 3
                                    i32.lt_u
                                    local.set 8
                                    block ;; label = @16
                                      local.get 4
                                      i32.load offset=16
                                      local.tee 0
                                      br_if 0 (;@16;)
                                      local.get 4
                                      i32.load offset=20
                                      local.set 0
                                    end
                                    local.get 6
                                    local.get 3
                                    local.get 8
                                    select
                                    local.set 3
                                    local.get 4
                                    local.get 9
                                    local.get 8
                                    select
                                    local.set 9
                                    local.get 0
                                    local.set 4
                                    local.get 0
                                    br_if 0 (;@15;)
                                  end
                                end
                                local.get 9
                                i32.eqz
                                br_if 0 (;@13;)
                                local.get 3
                                i32.const 0
                                i32.load offset=1055132
                                local.get 5
                                i32.sub
                                i32.ge_u
                                br_if 0 (;@13;)
                                local.get 9
                                i32.load offset=24
                                local.set 11
                                block ;; label = @14
                                  local.get 9
                                  i32.load offset=12
                                  local.tee 4
                                  local.get 9
                                  i32.eq
                                  br_if 0 (;@14;)
                                  local.get 9
                                  i32.load offset=8
                                  local.tee 0
                                  local.get 4
                                  i32.store offset=12
                                  local.get 4
                                  local.get 0
                                  i32.store offset=8
                                  br 11 (;@3;)
                                end
                                block ;; label = @14
                                  block ;; label = @15
                                    local.get 9
                                    i32.load offset=20
                                    local.tee 0
                                    i32.eqz
                                    br_if 0 (;@15;)
                                    local.get 9
                                    i32.const 20
                                    i32.add
                                    local.set 8
                                    br 1 (;@14;)
                                  end
                                  local.get 9
                                  i32.load offset=16
                                  local.tee 0
                                  i32.eqz
                                  br_if 4 (;@10;)
                                  local.get 9
                                  i32.const 16
                                  i32.add
                                  local.set 8
                                end
                                loop ;; label = @14
                                  local.get 8
                                  local.set 6
                                  local.get 0
                                  local.tee 4
                                  i32.const 20
                                  i32.add
                                  local.set 8
                                  local.get 4
                                  i32.load offset=20
                                  local.tee 0
                                  br_if 0 (;@14;)
                                  local.get 4
                                  i32.const 16
                                  i32.add
                                  local.set 8
                                  local.get 4
                                  i32.load offset=16
                                  local.tee 0
                                  br_if 0 (;@14;)
                                end
                                local.get 6
                                i32.const 0
                                i32.store
                                br 10 (;@3;)
                              end
                              block ;; label = @13
                                i32.const 0
                                i32.load offset=1055132
                                local.tee 4
                                local.get 5
                                i32.lt_u
                                br_if 0 (;@13;)
                                i32.const 0
                                i32.load offset=1055144
                                local.set 3
                                block ;; label = @14
                                  block ;; label = @15
                                    local.get 4
                                    local.get 5
                                    i32.sub
                                    local.tee 0
                                    i32.const 16
                                    i32.lt_u
                                    br_if 0 (;@15;)
                                    local.get 3
                                    local.get 5
                                    i32.add
                                    local.tee 8
                                    local.get 0
                                    i32.const 1
                                    i32.or
                                    i32.store offset=4
                                    local.get 3
                                    local.get 4
                                    i32.add
                                    local.get 0
                                    i32.store
                                    local.get 3
                                    local.get 5
                                    i32.const 3
                                    i32.or
                                    i32.store offset=4
                                    br 1 (;@14;)
                                  end
                                  local.get 3
                                  local.get 4
                                  i32.const 3
                                  i32.or
                                  i32.store offset=4
                                  local.get 3
                                  local.get 4
                                  i32.add
                                  local.tee 4
                                  local.get 4
                                  i32.load offset=4
                                  i32.const 1
                                  i32.or
                                  i32.store offset=4
                                  i32.const 0
                                  local.set 8
                                  i32.const 0
                                  local.set 0
                                end
                                i32.const 0
                                local.get 0
                                i32.store offset=1055132
                                i32.const 0
                                local.get 8
                                i32.store offset=1055144
                                local.get 3
                                i32.const 8
                                i32.add
                                local.set 4
                                br 12 (;@1;)
                              end
                              block ;; label = @13
                                i32.const 0
                                i32.load offset=1055136
                                local.tee 0
                                local.get 5
                                i32.le_u
                                br_if 0 (;@13;)
                                local.get 2
                                local.get 5
                                i32.add
                                local.tee 4
                                local.get 0
                                local.get 5
                                i32.sub
                                local.tee 3
                                i32.const 1
                                i32.or
                                i32.store offset=4
                                i32.const 0
                                local.get 4
                                i32.store offset=1055148
                                i32.const 0
                                local.get 3
                                i32.store offset=1055136
                                local.get 2
                                local.get 5
                                i32.const 3
                                i32.or
                                i32.store offset=4
                                local.get 2
                                i32.const 8
                                i32.add
                                local.set 4
                                br 12 (;@1;)
                              end
                              block ;; label = @13
                                block ;; label = @14
                                  i32.const 0
                                  i32.load offset=1055596
                                  i32.eqz
                                  br_if 0 (;@14;)
                                  i32.const 0
                                  i32.load offset=1055604
                                  local.set 3
                                  br 1 (;@13;)
                                end
                                i32.const 0
                                i64.const -1
                                i64.store offset=1055608 align=4
                                i32.const 0
                                i64.const 281474976776192
                                i64.store offset=1055600 align=4
                                i32.const 0
                                local.get 1
                                i32.const 12
                                i32.add
                                i32.const -16
                                i32.and
                                i32.const 1431655768
                                i32.xor
                                i32.store offset=1055596
                                i32.const 0
                                i32.const 0
                                i32.store offset=1055616
                                i32.const 0
                                i32.const 0
                                i32.store offset=1055568
                                i32.const 65536
                                local.set 3
                              end
                              i32.const 0
                              local.set 4
                              block ;; label = @13
                                local.get 3
                                local.get 5
                                i32.const 71
                                i32.add
                                local.tee 11
                                i32.add
                                local.tee 8
                                i32.const 0
                                local.get 3
                                i32.sub
                                local.tee 6
                                i32.and
                                local.tee 9
                                local.get 5
                                i32.gt_u
                                br_if 0 (;@13;)
                                i32.const 0
                                i32.const 48
                                i32.store offset=1055620
                                br 12 (;@1;)
                              end
                              block ;; label = @13
                                i32.const 0
                                i32.load offset=1055564
                                local.tee 4
                                i32.eqz
                                br_if 0 (;@13;)
                                block ;; label = @14
                                  i32.const 0
                                  i32.load offset=1055556
                                  local.tee 3
                                  local.get 9
                                  i32.add
                                  local.tee 7
                                  local.get 3
                                  i32.le_u
                                  br_if 0 (;@14;)
                                  local.get 7
                                  local.get 4
                                  i32.le_u
                                  br_if 1 (;@13;)
                                end
                                i32.const 0
                                local.set 4
                                i32.const 0
                                i32.const 48
                                i32.store offset=1055620
                                br 12 (;@1;)
                              end
                              i32.const 0
                              i32.load8_u offset=1055568
                              i32.const 4
                              i32.and
                              br_if 5 (;@7;)
                              block ;; label = @13
                                block ;; label = @14
                                  block ;; label = @15
                                    local.get 2
                                    i32.eqz
                                    br_if 0 (;@15;)
                                    i32.const 1055572
                                    local.set 4
                                    loop ;; label = @16
                                      block ;; label = @17
                                        local.get 2
                                        local.get 4
                                        i32.load
                                        local.tee 3
                                        i32.lt_u
                                        br_if 0 (;@17;)
                                        local.get 2
                                        local.get 3
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
                                  local.tee 8
                                  i32.const -1
                                  i32.eq
                                  br_if 6 (;@8;)
                                  local.get 9
                                  local.set 6
                                  block ;; label = @15
                                    i32.const 0
                                    i32.load offset=1055600
                                    local.tee 4
                                    i32.const -1
                                    i32.add
                                    local.tee 3
                                    local.get 8
                                    i32.and
                                    i32.eqz
                                    br_if 0 (;@15;)
                                    local.get 9
                                    local.get 8
                                    i32.sub
                                    local.get 3
                                    local.get 8
                                    i32.add
                                    i32.const 0
                                    local.get 4
                                    i32.sub
                                    i32.and
                                    i32.add
                                    local.set 6
                                  end
                                  local.get 6
                                  local.get 5
                                  i32.le_u
                                  br_if 6 (;@8;)
                                  local.get 6
                                  i32.const 2147483646
                                  i32.gt_u
                                  br_if 6 (;@8;)
                                  block ;; label = @15
                                    i32.const 0
                                    i32.load offset=1055564
                                    local.tee 4
                                    i32.eqz
                                    br_if 0 (;@15;)
                                    i32.const 0
                                    i32.load offset=1055556
                                    local.tee 3
                                    local.get 6
                                    i32.add
                                    local.tee 0
                                    local.get 3
                                    i32.le_u
                                    br_if 7 (;@8;)
                                    local.get 0
                                    local.get 4
                                    i32.gt_u
                                    br_if 7 (;@8;)
                                  end
                                  local.get 6
                                  call $sbrk
                                  local.tee 4
                                  local.get 8
                                  i32.ne
                                  br_if 1 (;@13;)
                                  br 8 (;@6;)
                                end
                                local.get 8
                                local.get 0
                                i32.sub
                                local.get 6
                                i32.and
                                local.tee 6
                                i32.const 2147483646
                                i32.gt_u
                                br_if 5 (;@8;)
                                local.get 6
                                call $sbrk
                                local.tee 8
                                local.get 4
                                i32.load
                                local.get 4
                                i32.load offset=4
                                i32.add
                                i32.eq
                                br_if 4 (;@9;)
                                local.get 8
                                local.set 4
                              end
                              block ;; label = @13
                                local.get 6
                                local.get 5
                                i32.const 72
                                i32.add
                                i32.ge_u
                                br_if 0 (;@13;)
                                local.get 4
                                i32.const -1
                                i32.eq
                                br_if 0 (;@13;)
                                block ;; label = @14
                                  local.get 11
                                  local.get 6
                                  i32.sub
                                  i32.const 0
                                  i32.load offset=1055604
                                  local.tee 3
                                  i32.add
                                  i32.const 0
                                  local.get 3
                                  i32.sub
                                  i32.and
                                  local.tee 3
                                  i32.const 2147483646
                                  i32.le_u
                                  br_if 0 (;@14;)
                                  local.get 4
                                  local.set 8
                                  br 8 (;@6;)
                                end
                                block ;; label = @14
                                  local.get 3
                                  call $sbrk
                                  i32.const -1
                                  i32.eq
                                  br_if 0 (;@14;)
                                  local.get 3
                                  local.get 6
                                  i32.add
                                  local.set 6
                                  local.get 4
                                  local.set 8
                                  br 8 (;@6;)
                                end
                                i32.const 0
                                local.get 6
                                i32.sub
                                call $sbrk
                                drop
                                br 5 (;@8;)
                              end
                              local.get 4
                              local.set 8
                              local.get 4
                              i32.const -1
                              i32.ne
                              br_if 6 (;@6;)
                              br 4 (;@8;)
                            end
                            unreachable
                          end
                          i32.const 0
                          local.set 4
                          br 8 (;@2;)
                        end
                        i32.const 0
                        local.set 4
                        br 6 (;@3;)
                      end
                      local.get 8
                      i32.const -1
                      i32.ne
                      br_if 2 (;@6;)
                    end
                    i32.const 0
                    i32.const 0
                    i32.load offset=1055568
                    i32.const 4
                    i32.or
                    i32.store offset=1055568
                  end
                  local.get 9
                  i32.const 2147483646
                  i32.gt_u
                  br_if 1 (;@5;)
                  local.get 9
                  call $sbrk
                  local.set 8
                  i32.const 0
                  call $sbrk
                  local.set 4
                  local.get 8
                  i32.const -1
                  i32.eq
                  br_if 1 (;@5;)
                  local.get 4
                  i32.const -1
                  i32.eq
                  br_if 1 (;@5;)
                  local.get 8
                  local.get 4
                  i32.ge_u
                  br_if 1 (;@5;)
                  local.get 4
                  local.get 8
                  i32.sub
                  local.tee 6
                  local.get 5
                  i32.const 56
                  i32.add
                  i32.le_u
                  br_if 1 (;@5;)
                end
                i32.const 0
                i32.const 0
                i32.load offset=1055556
                local.get 6
                i32.add
                local.tee 4
                i32.store offset=1055556
                block ;; label = @6
                  local.get 4
                  i32.const 0
                  i32.load offset=1055560
                  i32.le_u
                  br_if 0 (;@6;)
                  i32.const 0
                  local.get 4
                  i32.store offset=1055560
                end
                block ;; label = @6
                  block ;; label = @7
                    block ;; label = @8
                      block ;; label = @9
                        i32.const 0
                        i32.load offset=1055148
                        local.tee 3
                        i32.eqz
                        br_if 0 (;@9;)
                        i32.const 1055572
                        local.set 4
                        loop ;; label = @10
                          local.get 8
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
                          i32.const 0
                          i32.load offset=1055140
                          local.tee 4
                          i32.eqz
                          br_if 0 (;@10;)
                          local.get 8
                          local.get 4
                          i32.ge_u
                          br_if 1 (;@9;)
                        end
                        i32.const 0
                        local.get 8
                        i32.store offset=1055140
                      end
                      i32.const 0
                      local.set 4
                      i32.const 0
                      local.get 6
                      i32.store offset=1055576
                      i32.const 0
                      local.get 8
                      i32.store offset=1055572
                      i32.const 0
                      i32.const -1
                      i32.store offset=1055156
                      i32.const 0
                      i32.const 0
                      i32.load offset=1055596
                      i32.store offset=1055160
                      i32.const 0
                      i32.const 0
                      i32.store offset=1055584
                      loop ;; label = @9
                        local.get 4
                        i32.const 1055184
                        i32.add
                        local.get 4
                        i32.const 1055172
                        i32.add
                        local.tee 3
                        i32.store
                        local.get 3
                        local.get 4
                        i32.const 1055164
                        i32.add
                        local.tee 0
                        i32.store
                        local.get 4
                        i32.const 1055176
                        i32.add
                        local.get 0
                        i32.store
                        local.get 4
                        i32.const 1055192
                        i32.add
                        local.get 4
                        i32.const 1055180
                        i32.add
                        local.tee 0
                        i32.store
                        local.get 0
                        local.get 3
                        i32.store
                        local.get 4
                        i32.const 1055200
                        i32.add
                        local.get 4
                        i32.const 1055188
                        i32.add
                        local.tee 3
                        i32.store
                        local.get 3
                        local.get 0
                        i32.store
                        local.get 4
                        i32.const 1055196
                        i32.add
                        local.get 3
                        i32.store
                        local.get 4
                        i32.const 32
                        i32.add
                        local.tee 4
                        i32.const 256
                        i32.ne
                        br_if 0 (;@9;)
                      end
                      local.get 8
                      i32.const -8
                      local.get 8
                      i32.sub
                      i32.const 15
                      i32.and
                      local.tee 4
                      i32.add
                      local.tee 3
                      local.get 6
                      i32.const -56
                      i32.add
                      local.tee 0
                      local.get 4
                      i32.sub
                      local.tee 4
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      i32.const 0
                      i32.const 0
                      i32.load offset=1055612
                      i32.store offset=1055152
                      i32.const 0
                      local.get 4
                      i32.store offset=1055136
                      i32.const 0
                      local.get 3
                      i32.store offset=1055148
                      local.get 8
                      local.get 0
                      i32.add
                      i32.const 56
                      i32.store offset=4
                      br 2 (;@6;)
                    end
                    local.get 3
                    local.get 8
                    i32.ge_u
                    br_if 0 (;@7;)
                    local.get 3
                    local.get 0
                    i32.lt_u
                    br_if 0 (;@7;)
                    local.get 4
                    i32.load offset=12
                    i32.const 8
                    i32.and
                    br_if 0 (;@7;)
                    local.get 3
                    i32.const -8
                    local.get 3
                    i32.sub
                    i32.const 15
                    i32.and
                    local.tee 0
                    i32.add
                    local.tee 8
                    i32.const 0
                    i32.load offset=1055136
                    local.get 6
                    i32.add
                    local.tee 11
                    local.get 0
                    i32.sub
                    local.tee 0
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    local.get 4
                    local.get 9
                    local.get 6
                    i32.add
                    i32.store offset=4
                    i32.const 0
                    i32.const 0
                    i32.load offset=1055612
                    i32.store offset=1055152
                    i32.const 0
                    local.get 0
                    i32.store offset=1055136
                    i32.const 0
                    local.get 8
                    i32.store offset=1055148
                    local.get 3
                    local.get 11
                    i32.add
                    i32.const 56
                    i32.store offset=4
                    br 1 (;@6;)
                  end
                  block ;; label = @7
                    local.get 8
                    i32.const 0
                    i32.load offset=1055140
                    i32.ge_u
                    br_if 0 (;@7;)
                    i32.const 0
                    local.get 8
                    i32.store offset=1055140
                  end
                  local.get 8
                  local.get 6
                  i32.add
                  local.set 0
                  i32.const 1055572
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
                  i32.const 1055572
                  local.set 4
                  block ;; label = @7
                    loop ;; label = @8
                      block ;; label = @9
                        local.get 3
                        local.get 4
                        i32.load
                        local.tee 0
                        i32.lt_u
                        br_if 0 (;@9;)
                        local.get 3
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
                  local.get 8
                  i32.const -8
                  local.get 8
                  i32.sub
                  i32.const 15
                  i32.and
                  local.tee 4
                  i32.add
                  local.tee 11
                  local.get 6
                  i32.const -56
                  i32.add
                  local.tee 9
                  local.get 4
                  i32.sub
                  local.tee 4
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get 8
                  local.get 9
                  i32.add
                  i32.const 56
                  i32.store offset=4
                  local.get 3
                  local.get 0
                  i32.const 55
                  local.get 0
                  i32.sub
                  i32.const 15
                  i32.and
                  i32.add
                  i32.const -63
                  i32.add
                  local.tee 9
                  local.get 9
                  local.get 3
                  i32.const 16
                  i32.add
                  i32.lt_u
                  select
                  local.tee 9
                  i32.const 35
                  i32.store offset=4
                  i32.const 0
                  i32.const 0
                  i32.load offset=1055612
                  i32.store offset=1055152
                  i32.const 0
                  local.get 4
                  i32.store offset=1055136
                  i32.const 0
                  local.get 11
                  i32.store offset=1055148
                  local.get 9
                  i32.const 16
                  i32.add
                  i32.const 0
                  i64.load offset=1055580 align=4
                  i64.store align=4
                  local.get 9
                  i32.const 0
                  i64.load offset=1055572 align=4
                  i64.store offset=8 align=4
                  i32.const 0
                  local.get 9
                  i32.const 8
                  i32.add
                  i32.store offset=1055580
                  i32.const 0
                  local.get 6
                  i32.store offset=1055576
                  i32.const 0
                  local.get 8
                  i32.store offset=1055572
                  i32.const 0
                  i32.const 0
                  i32.store offset=1055584
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
                  local.get 3
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
                  local.get 3
                  i32.sub
                  local.tee 8
                  i32.store
                  local.get 3
                  local.get 8
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  block ;; label = @7
                    block ;; label = @8
                      local.get 8
                      i32.const 255
                      i32.gt_u
                      br_if 0 (;@8;)
                      local.get 8
                      i32.const -8
                      i32.and
                      i32.const 1055164
                      i32.add
                      local.set 4
                      block ;; label = @9
                        block ;; label = @10
                          i32.const 0
                          i32.load offset=1055124
                          local.tee 0
                          i32.const 1
                          local.get 8
                          i32.const 3
                          i32.shr_u
                          i32.shl
                          local.tee 8
                          i32.and
                          br_if 0 (;@10;)
                          i32.const 0
                          local.get 0
                          local.get 8
                          i32.or
                          i32.store offset=1055124
                          local.get 4
                          local.set 0
                          br 1 (;@9;)
                        end
                        local.get 4
                        i32.load offset=8
                        local.set 0
                      end
                      local.get 0
                      local.get 3
                      i32.store offset=12
                      local.get 4
                      local.get 3
                      i32.store offset=8
                      i32.const 12
                      local.set 8
                      i32.const 8
                      local.set 9
                      br 1 (;@7;)
                    end
                    i32.const 31
                    local.set 4
                    block ;; label = @8
                      local.get 8
                      i32.const 16777215
                      i32.gt_u
                      br_if 0 (;@8;)
                      local.get 8
                      i32.const 38
                      local.get 8
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
                    local.get 3
                    local.get 4
                    i32.store offset=28
                    local.get 3
                    i64.const 0
                    i64.store offset=16 align=4
                    local.get 4
                    i32.const 2
                    i32.shl
                    i32.const 1055428
                    i32.add
                    local.set 0
                    block ;; label = @8
                      block ;; label = @9
                        block ;; label = @10
                          i32.const 0
                          i32.load offset=1055128
                          local.tee 9
                          i32.const 1
                          local.get 4
                          i32.shl
                          local.tee 6
                          i32.and
                          br_if 0 (;@10;)
                          local.get 0
                          local.get 3
                          i32.store
                          i32.const 0
                          local.get 9
                          local.get 6
                          i32.or
                          i32.store offset=1055128
                          local.get 3
                          local.get 0
                          i32.store offset=24
                          br 1 (;@9;)
                        end
                        local.get 8
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
                          local.get 8
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
                          local.tee 6
                          i32.load offset=16
                          local.tee 9
                          br_if 0 (;@10;)
                        end
                        local.get 6
                        i32.const 16
                        i32.add
                        local.get 3
                        i32.store
                        local.get 3
                        local.get 0
                        i32.store offset=24
                      end
                      i32.const 8
                      local.set 8
                      i32.const 12
                      local.set 9
                      local.get 3
                      local.set 0
                      local.get 3
                      local.set 4
                      br 1 (;@7;)
                    end
                    local.get 0
                    i32.load offset=8
                    local.set 4
                    local.get 0
                    local.get 3
                    i32.store offset=8
                    local.get 4
                    local.get 3
                    i32.store offset=12
                    local.get 3
                    local.get 4
                    i32.store offset=8
                    i32.const 0
                    local.set 4
                    i32.const 24
                    local.set 8
                    i32.const 12
                    local.set 9
                  end
                  local.get 3
                  local.get 9
                  i32.add
                  local.get 0
                  i32.store
                  local.get 3
                  local.get 8
                  i32.add
                  local.get 4
                  i32.store
                end
                i32.const 0
                i32.load offset=1055136
                local.tee 4
                local.get 5
                i32.le_u
                br_if 0 (;@5;)
                i32.const 0
                i32.load offset=1055148
                local.tee 3
                local.get 5
                i32.add
                local.tee 0
                local.get 4
                local.get 5
                i32.sub
                local.tee 4
                i32.const 1
                i32.or
                i32.store offset=4
                i32.const 0
                local.get 4
                i32.store offset=1055136
                i32.const 0
                local.get 0
                i32.store offset=1055148
                local.get 3
                local.get 5
                i32.const 3
                i32.or
                i32.store offset=4
                local.get 3
                i32.const 8
                i32.add
                local.set 4
                br 4 (;@1;)
              end
              i32.const 0
              local.set 4
              i32.const 0
              i32.const 48
              i32.store offset=1055620
              br 3 (;@1;)
            end
            local.get 4
            local.get 8
            i32.store
            local.get 4
            local.get 4
            i32.load offset=4
            local.get 6
            i32.add
            i32.store offset=4
            local.get 8
            local.get 9
            local.get 5
            call $prepend_alloc
            local.set 4
            br 2 (;@1;)
          end
          block ;; label = @3
            local.get 11
            i32.eqz
            br_if 0 (;@3;)
            block ;; label = @4
              block ;; label = @5
                local.get 9
                local.get 9
                i32.load offset=28
                local.tee 8
                i32.const 2
                i32.shl
                i32.const 1055428
                i32.add
                local.tee 0
                i32.load
                i32.ne
                br_if 0 (;@5;)
                local.get 0
                local.get 4
                i32.store
                local.get 4
                br_if 1 (;@4;)
                i32.const 0
                local.get 10
                i32.const -2
                local.get 8
                i32.rotl
                i32.and
                local.tee 10
                i32.store offset=1055128
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
                  local.get 4
                  i32.store offset=16
                  br 1 (;@5;)
                end
                local.get 11
                local.get 4
                i32.store offset=20
              end
              local.get 4
              i32.eqz
              br_if 1 (;@3;)
            end
            local.get 4
            local.get 11
            i32.store offset=24
            block ;; label = @4
              local.get 9
              i32.load offset=16
              local.tee 0
              i32.eqz
              br_if 0 (;@4;)
              local.get 4
              local.get 0
              i32.store offset=16
              local.get 0
              local.get 4
              i32.store offset=24
            end
            local.get 9
            i32.load offset=20
            local.tee 0
            i32.eqz
            br_if 0 (;@3;)
            local.get 4
            local.get 0
            i32.store offset=20
            local.get 0
            local.get 4
            i32.store offset=24
          end
          block ;; label = @3
            block ;; label = @4
              local.get 3
              i32.const 15
              i32.gt_u
              br_if 0 (;@4;)
              local.get 9
              local.get 3
              local.get 5
              i32.or
              local.tee 4
              i32.const 3
              i32.or
              i32.store offset=4
              local.get 9
              local.get 4
              i32.add
              local.tee 4
              local.get 4
              i32.load offset=4
              i32.const 1
              i32.or
              i32.store offset=4
              br 1 (;@3;)
            end
            local.get 9
            local.get 5
            i32.add
            local.tee 8
            local.get 3
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 9
            local.get 5
            i32.const 3
            i32.or
            i32.store offset=4
            local.get 8
            local.get 3
            i32.add
            local.get 3
            i32.store
            block ;; label = @4
              local.get 3
              i32.const 255
              i32.gt_u
              br_if 0 (;@4;)
              local.get 3
              i32.const -8
              i32.and
              i32.const 1055164
              i32.add
              local.set 4
              block ;; label = @5
                block ;; label = @6
                  i32.const 0
                  i32.load offset=1055124
                  local.tee 5
                  i32.const 1
                  local.get 3
                  i32.const 3
                  i32.shr_u
                  i32.shl
                  local.tee 3
                  i32.and
                  br_if 0 (;@6;)
                  i32.const 0
                  local.get 5
                  local.get 3
                  i32.or
                  i32.store offset=1055124
                  local.get 4
                  local.set 3
                  br 1 (;@5;)
                end
                local.get 4
                i32.load offset=8
                local.set 3
              end
              local.get 3
              local.get 8
              i32.store offset=12
              local.get 4
              local.get 8
              i32.store offset=8
              local.get 8
              local.get 4
              i32.store offset=12
              local.get 8
              local.get 3
              i32.store offset=8
              br 1 (;@3;)
            end
            i32.const 31
            local.set 4
            block ;; label = @4
              local.get 3
              i32.const 16777215
              i32.gt_u
              br_if 0 (;@4;)
              local.get 3
              i32.const 38
              local.get 3
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
            local.get 8
            local.get 4
            i32.store offset=28
            local.get 8
            i64.const 0
            i64.store offset=16 align=4
            local.get 4
            i32.const 2
            i32.shl
            i32.const 1055428
            i32.add
            local.set 5
            block ;; label = @4
              local.get 10
              i32.const 1
              local.get 4
              i32.shl
              local.tee 0
              i32.and
              br_if 0 (;@4;)
              local.get 5
              local.get 8
              i32.store
              i32.const 0
              local.get 10
              local.get 0
              i32.or
              i32.store offset=1055128
              local.get 8
              local.get 5
              i32.store offset=24
              local.get 8
              local.get 8
              i32.store offset=8
              local.get 8
              local.get 8
              i32.store offset=12
              br 1 (;@3;)
            end
            local.get 3
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
            local.get 5
            i32.load
            local.set 0
            block ;; label = @4
              loop ;; label = @5
                local.get 0
                local.tee 5
                i32.load offset=4
                i32.const -8
                i32.and
                local.get 3
                i32.eq
                br_if 1 (;@4;)
                local.get 4
                i32.const 29
                i32.shr_u
                local.set 0
                local.get 4
                i32.const 1
                i32.shl
                local.set 4
                local.get 5
                local.get 0
                i32.const 4
                i32.and
                i32.add
                local.tee 6
                i32.load offset=16
                local.tee 0
                br_if 0 (;@5;)
              end
              local.get 6
              i32.const 16
              i32.add
              local.get 8
              i32.store
              local.get 8
              local.get 5
              i32.store offset=24
              local.get 8
              local.get 8
              i32.store offset=12
              local.get 8
              local.get 8
              i32.store offset=8
              br 1 (;@3;)
            end
            local.get 5
            i32.load offset=8
            local.tee 4
            local.get 8
            i32.store offset=12
            local.get 5
            local.get 8
            i32.store offset=8
            local.get 8
            i32.const 0
            i32.store offset=24
            local.get 8
            local.get 5
            i32.store offset=12
            local.get 8
            local.get 4
            i32.store offset=8
          end
          local.get 9
          i32.const 8
          i32.add
          local.set 4
          br 1 (;@1;)
        end
        block ;; label = @2
          local.get 2
          i32.eqz
          br_if 0 (;@2;)
          block ;; label = @3
            block ;; label = @4
              local.get 8
              local.get 8
              i32.load offset=28
              local.tee 9
              i32.const 2
              i32.shl
              i32.const 1055428
              i32.add
              local.tee 0
              i32.load
              i32.ne
              br_if 0 (;@4;)
              local.get 0
              local.get 4
              i32.store
              local.get 4
              br_if 1 (;@3;)
              i32.const 0
              local.get 10
              i32.const -2
              local.get 9
              i32.rotl
              i32.and
              i32.store offset=1055128
              br 2 (;@2;)
            end
            block ;; label = @4
              block ;; label = @5
                local.get 2
                i32.load offset=16
                local.get 8
                i32.ne
                br_if 0 (;@5;)
                local.get 2
                local.get 4
                i32.store offset=16
                br 1 (;@4;)
              end
              local.get 2
              local.get 4
              i32.store offset=20
            end
            local.get 4
            i32.eqz
            br_if 1 (;@2;)
          end
          local.get 4
          local.get 2
          i32.store offset=24
          block ;; label = @3
            local.get 8
            i32.load offset=16
            local.tee 0
            i32.eqz
            br_if 0 (;@3;)
            local.get 4
            local.get 0
            i32.store offset=16
            local.get 0
            local.get 4
            i32.store offset=24
          end
          local.get 8
          i32.load offset=20
          local.tee 0
          i32.eqz
          br_if 0 (;@2;)
          local.get 4
          local.get 0
          i32.store offset=20
          local.get 0
          local.get 4
          i32.store offset=24
        end
        block ;; label = @2
          block ;; label = @3
            local.get 3
            i32.const 15
            i32.gt_u
            br_if 0 (;@3;)
            local.get 8
            local.get 3
            local.get 5
            i32.or
            local.tee 4
            i32.const 3
            i32.or
            i32.store offset=4
            local.get 8
            local.get 4
            i32.add
            local.tee 4
            local.get 4
            i32.load offset=4
            i32.const 1
            i32.or
            i32.store offset=4
            br 1 (;@2;)
          end
          local.get 8
          local.get 5
          i32.add
          local.tee 0
          local.get 3
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 8
          local.get 5
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 0
          local.get 3
          i32.add
          local.get 3
          i32.store
          block ;; label = @3
            local.get 7
            i32.eqz
            br_if 0 (;@3;)
            local.get 7
            i32.const -8
            i32.and
            i32.const 1055164
            i32.add
            local.set 5
            i32.const 0
            i32.load offset=1055144
            local.set 4
            block ;; label = @4
              block ;; label = @5
                i32.const 1
                local.get 7
                i32.const 3
                i32.shr_u
                i32.shl
                local.tee 9
                local.get 6
                i32.and
                br_if 0 (;@5;)
                i32.const 0
                local.get 9
                local.get 6
                i32.or
                i32.store offset=1055124
                local.get 5
                local.set 9
                br 1 (;@4;)
              end
              local.get 5
              i32.load offset=8
              local.set 9
            end
            local.get 9
            local.get 4
            i32.store offset=12
            local.get 5
            local.get 4
            i32.store offset=8
            local.get 4
            local.get 5
            i32.store offset=12
            local.get 4
            local.get 9
            i32.store offset=8
          end
          i32.const 0
          local.get 0
          i32.store offset=1055144
          i32.const 0
          local.get 3
          i32.store offset=1055132
        end
        local.get 8
        i32.const 8
        i32.add
        local.set 4
      end
      local.get 1
      i32.const 16
      i32.add
      global.set $__stack_pointer
      local.get 4
    )
    (func $prepend_alloc (;148;) (type 2) (param i32 i32 i32) (result i32)
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
          i32.const 0
          i32.load offset=1055148
          i32.ne
          br_if 0 (;@2;)
          i32.const 0
          local.get 5
          i32.store offset=1055148
          i32.const 0
          i32.const 0
          i32.load offset=1055136
          local.get 0
          i32.add
          local.tee 2
          i32.store offset=1055136
          local.get 5
          local.get 2
          i32.const 1
          i32.or
          i32.store offset=4
          br 1 (;@1;)
        end
        block ;; label = @2
          local.get 4
          i32.const 0
          i32.load offset=1055144
          i32.ne
          br_if 0 (;@2;)
          i32.const 0
          local.get 5
          i32.store offset=1055144
          i32.const 0
          i32.const 0
          i32.load offset=1055132
          local.get 0
          i32.add
          local.tee 2
          i32.store offset=1055132
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
                i32.const 0
                i32.const 0
                i32.load offset=1055124
                i32.const -2
                local.get 1
                i32.const 3
                i32.shr_u
                i32.rotl
                i32.and
                i32.store offset=1055124
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
                local.get 4
                i32.load offset=28
                local.tee 7
                i32.const 2
                i32.shl
                i32.const 1055428
                i32.add
                local.tee 1
                i32.load
                i32.ne
                br_if 0 (;@5;)
                local.get 1
                local.get 2
                i32.store
                local.get 2
                br_if 1 (;@4;)
                i32.const 0
                i32.const 0
                i32.load offset=1055128
                i32.const -2
                local.get 7
                i32.rotl
                i32.and
                i32.store offset=1055128
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
          local.get 0
          i32.const -8
          i32.and
          i32.const 1055164
          i32.add
          local.set 2
          block ;; label = @3
            block ;; label = @4
              i32.const 0
              i32.load offset=1055124
              local.tee 1
              i32.const 1
              local.get 0
              i32.const 3
              i32.shr_u
              i32.shl
              local.tee 0
              i32.and
              br_if 0 (;@4;)
              i32.const 0
              local.get 1
              local.get 0
              i32.or
              i32.store offset=1055124
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
        local.get 2
        i32.const 2
        i32.shl
        i32.const 1055428
        i32.add
        local.set 1
        block ;; label = @2
          i32.const 0
          i32.load offset=1055128
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
          i32.const 0
          local.get 7
          local.get 4
          i32.or
          i32.store offset=1055128
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
    (func $free (;149;) (type 0) (param i32)
      local.get 0
      call $dlfree
    )
    (func $dlfree (;150;) (type 0) (param i32)
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
          local.tee 4
          i32.sub
          local.tee 1
          i32.const 0
          i32.load offset=1055140
          i32.lt_u
          br_if 1 (;@1;)
          local.get 4
          local.get 0
          i32.add
          local.set 0
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                block ;; label = @6
                  local.get 1
                  i32.const 0
                  i32.load offset=1055144
                  i32.eq
                  br_if 0 (;@6;)
                  local.get 1
                  i32.load offset=12
                  local.set 2
                  block ;; label = @7
                    local.get 4
                    i32.const 255
                    i32.gt_u
                    br_if 0 (;@7;)
                    local.get 2
                    local.get 1
                    i32.load offset=8
                    local.tee 5
                    i32.ne
                    br_if 2 (;@5;)
                    i32.const 0
                    i32.const 0
                    i32.load offset=1055124
                    i32.const -2
                    local.get 4
                    i32.const 3
                    i32.shr_u
                    i32.rotl
                    i32.and
                    i32.store offset=1055124
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
                i32.const 0
                local.get 0
                i32.store offset=1055132
                local.get 3
                local.get 0
                i32.store
                local.get 1
                local.get 0
                i32.const 1
                i32.or
                i32.store offset=4
                return
              end
              local.get 2
              local.get 5
              i32.store offset=8
              local.get 5
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
              local.get 1
              i32.load offset=28
              local.tee 5
              i32.const 2
              i32.shl
              i32.const 1055428
              i32.add
              local.tee 4
              i32.load
              i32.ne
              br_if 0 (;@4;)
              local.get 4
              local.get 2
              i32.store
              local.get 2
              br_if 1 (;@3;)
              i32.const 0
              i32.const 0
              i32.load offset=1055128
              i32.const -2
              local.get 5
              i32.rotl
              i32.and
              i32.store offset=1055128
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
                    i32.const 0
                    i32.load offset=1055148
                    i32.ne
                    br_if 0 (;@7;)
                    i32.const 0
                    local.get 1
                    i32.store offset=1055148
                    i32.const 0
                    i32.const 0
                    i32.load offset=1055136
                    local.get 0
                    i32.add
                    local.tee 0
                    i32.store offset=1055136
                    local.get 1
                    local.get 0
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    local.get 1
                    i32.const 0
                    i32.load offset=1055144
                    i32.ne
                    br_if 6 (;@1;)
                    i32.const 0
                    i32.const 0
                    i32.store offset=1055132
                    i32.const 0
                    i32.const 0
                    i32.store offset=1055144
                    return
                  end
                  block ;; label = @7
                    local.get 3
                    i32.const 0
                    i32.load offset=1055144
                    local.tee 6
                    i32.ne
                    br_if 0 (;@7;)
                    i32.const 0
                    local.get 1
                    i32.store offset=1055144
                    i32.const 0
                    i32.const 0
                    i32.load offset=1055132
                    local.get 0
                    i32.add
                    local.tee 0
                    i32.store offset=1055132
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
                      i32.const 0
                      i32.const 0
                      i32.load offset=1055124
                      i32.const -2
                      local.get 4
                      i32.const 3
                      i32.shr_u
                      i32.rotl
                      i32.and
                      i32.store offset=1055124
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
                local.get 3
                i32.load offset=28
                local.tee 5
                i32.const 2
                i32.shl
                i32.const 1055428
                i32.add
                local.tee 4
                i32.load
                i32.ne
                br_if 0 (;@5;)
                local.get 4
                local.get 2
                i32.store
                local.get 2
                br_if 1 (;@4;)
                i32.const 0
                i32.const 0
                i32.load offset=1055128
                i32.const -2
                local.get 5
                i32.rotl
                i32.and
                i32.store offset=1055128
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
          i32.const 0
          local.get 0
          i32.store offset=1055132
          return
        end
        block ;; label = @2
          local.get 0
          i32.const 255
          i32.gt_u
          br_if 0 (;@2;)
          local.get 0
          i32.const -8
          i32.and
          i32.const 1055164
          i32.add
          local.set 2
          block ;; label = @3
            block ;; label = @4
              i32.const 0
              i32.load offset=1055124
              local.tee 4
              i32.const 1
              local.get 0
              i32.const 3
              i32.shr_u
              i32.shl
              local.tee 0
              i32.and
              br_if 0 (;@4;)
              i32.const 0
              local.get 4
              local.get 0
              i32.or
              i32.store offset=1055124
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
        local.get 2
        i32.const 2
        i32.shl
        i32.const 1055428
        i32.add
        local.set 5
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                i32.const 0
                i32.load offset=1055128
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
                i32.const 0
                local.get 4
                local.get 3
                i32.or
                i32.store offset=1055128
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
        i32.const 0
        i32.const 0
        i32.load offset=1055156
        i32.const -1
        i32.add
        local.tee 1
        i32.const -1
        local.get 1
        select
        i32.store offset=1055156
      end
    )
    (func $calloc (;151;) (type 4) (param i32 i32) (result i32)
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
    (func $realloc (;152;) (type 4) (param i32 i32) (result i32)
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
        i32.const 0
        i32.const 48
        i32.store offset=1055620
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
            i32.const 4
            i32.or
            i32.lt_u
            br_if 1 (;@2;)
            local.get 5
            local.get 2
            i32.sub
            i32.const 0
            i32.load offset=1055604
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
          block ;; label = @3
            local.get 7
            i32.const 0
            i32.load offset=1055148
            i32.ne
            br_if 0 (;@3;)
            i32.const 0
            i32.load offset=1055136
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
            i32.const 0
            local.get 6
            local.get 2
            i32.add
            local.tee 1
            i32.store offset=1055148
            i32.const 0
            local.get 5
            local.get 2
            i32.sub
            local.tee 2
            i32.store offset=1055136
            local.get 1
            local.get 2
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 0
            return
          end
          block ;; label = @3
            local.get 7
            i32.const 0
            i32.load offset=1055144
            i32.ne
            br_if 0 (;@3;)
            i32.const 0
            i32.load offset=1055132
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
            i32.const 0
            local.get 2
            i32.store offset=1055144
            i32.const 0
            local.get 1
            i32.store offset=1055132
            local.get 0
            return
          end
          local.get 7
          i32.load offset=4
          local.tee 8
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
                i32.const 0
                i32.const 0
                i32.load offset=1055124
                i32.const -2
                local.get 8
                i32.const 3
                i32.shr_u
                i32.rotl
                i32.and
                i32.store offset=1055124
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
                local.get 7
                i32.load offset=28
                local.tee 8
                i32.const 2
                i32.shl
                i32.const 1055428
                i32.add
                local.tee 5
                i32.load
                i32.ne
                br_if 0 (;@5;)
                local.get 5
                local.get 1
                i32.store
                local.get 1
                br_if 1 (;@4;)
                i32.const 0
                i32.const 0
                i32.load offset=1055128
                i32.const -2
                local.get 8
                i32.rotl
                i32.and
                i32.store offset=1055128
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
    (func $dispose_chunk (;153;) (type 3) (param i32 i32)
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
                  i32.const 0
                  i32.load offset=1055144
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
                    i32.const 0
                    i32.const 0
                    i32.load offset=1055124
                    i32.const -2
                    local.get 4
                    i32.const 3
                    i32.shr_u
                    i32.rotl
                    i32.and
                    i32.store offset=1055124
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
                i32.const 0
                local.get 1
                i32.store offset=1055132
                local.get 2
                local.get 1
                i32.store
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
              local.get 0
              i32.load offset=28
              local.tee 5
              i32.const 2
              i32.shl
              i32.const 1055428
              i32.add
              local.tee 4
              i32.load
              i32.ne
              br_if 0 (;@4;)
              local.get 4
              local.get 3
              i32.store
              local.get 3
              br_if 1 (;@3;)
              i32.const 0
              i32.const 0
              i32.load offset=1055128
              i32.const -2
              local.get 5
              i32.rotl
              i32.and
              i32.store offset=1055128
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
                    i32.const 0
                    i32.load offset=1055148
                    i32.ne
                    br_if 0 (;@7;)
                    i32.const 0
                    local.get 0
                    i32.store offset=1055148
                    i32.const 0
                    i32.const 0
                    i32.load offset=1055136
                    local.get 1
                    i32.add
                    local.tee 1
                    i32.store offset=1055136
                    local.get 0
                    local.get 1
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    local.get 0
                    i32.const 0
                    i32.load offset=1055144
                    i32.ne
                    br_if 6 (;@1;)
                    i32.const 0
                    i32.const 0
                    i32.store offset=1055132
                    i32.const 0
                    i32.const 0
                    i32.store offset=1055144
                    return
                  end
                  block ;; label = @7
                    local.get 2
                    i32.const 0
                    i32.load offset=1055144
                    local.tee 6
                    i32.ne
                    br_if 0 (;@7;)
                    i32.const 0
                    local.get 0
                    i32.store offset=1055144
                    i32.const 0
                    i32.const 0
                    i32.load offset=1055132
                    local.get 1
                    i32.add
                    local.tee 1
                    i32.store offset=1055132
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
                      i32.const 0
                      i32.const 0
                      i32.load offset=1055124
                      i32.const -2
                      local.get 4
                      i32.const 3
                      i32.shr_u
                      i32.rotl
                      i32.and
                      i32.store offset=1055124
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
                local.get 2
                i32.load offset=28
                local.tee 5
                i32.const 2
                i32.shl
                i32.const 1055428
                i32.add
                local.tee 4
                i32.load
                i32.ne
                br_if 0 (;@5;)
                local.get 4
                local.get 3
                i32.store
                local.get 3
                br_if 1 (;@4;)
                i32.const 0
                i32.const 0
                i32.load offset=1055128
                i32.const -2
                local.get 5
                i32.rotl
                i32.and
                i32.store offset=1055128
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
          i32.const 0
          local.get 1
          i32.store offset=1055132
          return
        end
        block ;; label = @2
          local.get 1
          i32.const 255
          i32.gt_u
          br_if 0 (;@2;)
          local.get 1
          i32.const -8
          i32.and
          i32.const 1055164
          i32.add
          local.set 3
          block ;; label = @3
            block ;; label = @4
              i32.const 0
              i32.load offset=1055124
              local.tee 4
              i32.const 1
              local.get 1
              i32.const 3
              i32.shr_u
              i32.shl
              local.tee 1
              i32.and
              br_if 0 (;@4;)
              i32.const 0
              local.get 4
              local.get 1
              i32.or
              i32.store offset=1055124
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
        local.get 3
        i32.const 2
        i32.shl
        i32.const 1055428
        i32.add
        local.set 4
        block ;; label = @2
          i32.const 0
          i32.load offset=1055128
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
          i32.const 0
          local.get 5
          local.get 2
          i32.or
          i32.store offset=1055128
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
    (func $posix_memalign (;154;) (type 2) (param i32 i32 i32) (result i32)
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
    (func $internal_memalign (;155;) (type 4) (param i32 i32) (result i32)
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
        i32.const 0
        i32.const 48
        i32.store offset=1055620
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
    (func $_Exit (;156;) (type 0) (param i32)
      local.get 0
      call $__wasi_proc_exit
      unreachable
    )
    (func $__wasilibc_ensure_environ (;157;) (type 8)
      block ;; label = @1
        i32.const 0
        i32.load offset=1054788
        i32.const -1
        i32.ne
        br_if 0 (;@1;)
        call $__wasilibc_initialize_environ
      end
    )
    (func $__wasilibc_initialize_environ (;158;) (type 8)
      (local i32 i32 i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 0
      global.set $__stack_pointer
      block ;; label = @1
        block ;; label = @2
          local.get 0
          i32.const 12
          i32.add
          local.get 0
          i32.const 8
          i32.add
          call $__wasi_environ_sizes_get
          br_if 0 (;@2;)
          block ;; label = @3
            local.get 0
            i32.load offset=12
            local.tee 1
            br_if 0 (;@3;)
            i32.const 1055624
            local.set 1
            br 2 (;@1;)
          end
          block ;; label = @3
            block ;; label = @4
              local.get 1
              i32.const 1
              i32.add
              local.tee 1
              i32.eqz
              br_if 0 (;@4;)
              local.get 0
              i32.load offset=8
              call $malloc
              local.tee 2
              i32.eqz
              br_if 0 (;@4;)
              local.get 1
              i32.const 4
              call $calloc
              local.tee 1
              br_if 1 (;@3;)
              local.get 2
              call $free
            end
            i32.const 70
            call $_Exit
            unreachable
          end
          local.get 1
          local.get 2
          call $__wasi_environ_get
          i32.eqz
          br_if 1 (;@1;)
          local.get 2
          call $free
          local.get 1
          call $free
        end
        i32.const 71
        call $_Exit
        unreachable
      end
      i32.const 0
      local.get 1
      i32.store offset=1054788
      local.get 0
      i32.const 16
      i32.add
      global.set $__stack_pointer
    )
    (func $__wasi_environ_get (;159;) (type 4) (param i32 i32) (result i32)
      local.get 0
      local.get 1
      call $__imported_wasi_snapshot_preview1_environ_get
      i32.const 65535
      i32.and
    )
    (func $__wasi_environ_sizes_get (;160;) (type 4) (param i32 i32) (result i32)
      local.get 0
      local.get 1
      call $__imported_wasi_snapshot_preview1_environ_sizes_get
      i32.const 65535
      i32.and
    )
    (func $__wasi_proc_exit (;161;) (type 0) (param i32)
      local.get 0
      call $__imported_wasi_snapshot_preview1_proc_exit
      unreachable
    )
    (func $abort (;162;) (type 8)
      unreachable
    )
    (func $getcwd (;163;) (type 4) (param i32 i32) (result i32)
      (local i32)
      i32.const 0
      i32.load offset=1054792
      local.set 2
      block ;; label = @1
        block ;; label = @2
          local.get 0
          br_if 0 (;@2;)
          local.get 2
          call $strdup
          local.tee 0
          br_if 1 (;@1;)
          i32.const 0
          i32.const 48
          i32.store offset=1055620
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
          i32.const 0
          i32.const 68
          i32.store offset=1055620
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
    (func $sbrk (;164;) (type 14) (param i32) (result i32)
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
          i32.const 0
          i32.const 48
          i32.store offset=1055620
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
    (func $getenv (;165;) (type 14) (param i32) (result i32)
      (local i32 i32 i32 i32)
      call $__wasilibc_ensure_environ
      block ;; label = @1
        local.get 0
        i32.const 61
        call $__strchrnul
        local.tee 1
        local.get 0
        i32.ne
        br_if 0 (;@1;)
        i32.const 0
        return
      end
      i32.const 0
      local.set 2
      block ;; label = @1
        local.get 0
        local.get 1
        local.get 0
        i32.sub
        local.tee 3
        i32.add
        i32.load8_u
        br_if 0 (;@1;)
        i32.const 0
        i32.load offset=1054788
        local.tee 4
        i32.eqz
        br_if 0 (;@1;)
        local.get 4
        i32.load
        local.tee 1
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
              local.get 1
              local.get 3
              call $strncmp
              br_if 0 (;@4;)
              local.get 1
              local.get 3
              i32.add
              local.tee 1
              i32.load8_u
              i32.const 61
              i32.eq
              br_if 2 (;@2;)
            end
            local.get 4
            i32.load
            local.set 1
            local.get 4
            i32.const 4
            i32.add
            local.set 4
            local.get 1
            br_if 0 (;@3;)
            br 2 (;@1;)
          end
        end
        local.get 1
        i32.const 1
        i32.add
        local.set 2
      end
      local.get 2
    )
    (func $__strchrnul (;166;) (type 4) (param i32 i32) (result i32)
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
    (func $__stpcpy (;167;) (type 4) (param i32 i32) (result i32)
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
    (func $strcpy (;168;) (type 4) (param i32 i32) (result i32)
      local.get 0
      local.get 1
      call $__stpcpy
      drop
      local.get 0
    )
    (func $strdup (;169;) (type 14) (param i32) (result i32)
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
    (func $strlen (;170;) (type 14) (param i32) (result i32)
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
    (func $strncmp (;171;) (type 2) (param i32 i32 i32) (result i32)
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
    (func $_ZN5alloc5alloc18handle_alloc_error17h6a90b55247f528a0E (;172;) (type 3) (param i32 i32)
      local.get 1
      local.get 0
      call $_RNvCsdBezzDwma51_7___rustc26___rust_alloc_error_handler
      unreachable
    )
    (func $_ZN254_$LT$alloc..boxed..convert..$LT$impl$u20$core..convert..From$LT$alloc..string..String$GT$$u20$for$u20$alloc..boxed..Box$LT$dyn$u20$core..error..Error$u2b$core..marker..Send$u2b$core..marker..Sync$GT$$GT$..from..StringError$u20$as$u20$core..fmt..Debug$GT$3fmt17ha958d61d3f2fdfd7E (;173;) (type 4) (param i32 i32) (result i32)
      local.get 0
      i32.load offset=4
      local.get 0
      i32.load offset=8
      local.get 1
      call $_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h768c7e894f3688e1E
    )
    (func $_ZN256_$LT$alloc..boxed..convert..$LT$impl$u20$core..convert..From$LT$alloc..string..String$GT$$u20$for$u20$alloc..boxed..Box$LT$dyn$u20$core..error..Error$u2b$core..marker..Send$u2b$core..marker..Sync$GT$$GT$..from..StringError$u20$as$u20$core..fmt..Display$GT$3fmt17h50809b903e207676E (;174;) (type 4) (param i32 i32) (result i32)
      local.get 0
      i32.load offset=4
      local.get 0
      i32.load offset=8
      local.get 1
      call $_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h07a37024704900fbE
    )
    (func $_ZN4core3fmt5Write9write_fmt17h17d844f0b9f21b32E (;175;) (type 2) (param i32 i32 i32) (result i32)
      local.get 0
      global.get $GOT.data.internal.__memory_base
      i32.const 1054796
      i32.add
      local.get 1
      local.get 2
      call $_ZN4core3fmt5write17h80512e2a12699005E
    )
    (func $_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17h422152e086181fedE (;176;) (type 0) (param i32)
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
        call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
      end
    )
    (func $_ZN53_$LT$core..fmt..Error$u20$as$u20$core..fmt..Debug$GT$3fmt17hf1ca92c1c0b1b4b5E (;177;) (type 4) (param i32 i32) (result i32)
      local.get 1
      global.get $GOT.data.internal.__memory_base
      i32.const 1051056
      i32.add
      i32.const 5
      call $_ZN4core3fmt9Formatter9write_str17h34f77234b6666431E
    )
    (func $"#func178 _ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$10write_char17hc9b79da1909ec910E" (@name "_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$10write_char17hc9b79da1909ec910E") (;178;) (type 4) (param i32 i32) (result i32)
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
        call $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17hcbefda44afc0f2d1E
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
          block ;; label = @3
            local.get 1
            i32.const 128
            i32.lt_u
            br_if 0 (;@3;)
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
            local.get 1
            i32.const 2048
            i32.lt_u
            br_if 1 (;@2;)
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
            block ;; label = @4
              local.get 1
              i32.const 65536
              i32.lt_u
              br_if 0 (;@4;)
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
              br 3 (;@1;)
            end
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
          local.get 1
          i32.store8
          br 1 (;@1;)
        end
        local.get 4
        local.get 5
        i32.store8 offset=1
        local.get 4
        local.get 6
        i32.const 192
        i32.or
        i32.store8
      end
      local.get 0
      local.get 3
      local.get 2
      i32.add
      i32.store offset=8
      i32.const 0
    )
    (func $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17hcbefda44afc0f2d1E (;179;) (type 9) (param i32 i32 i32)
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
        call $_ZN5alloc7raw_vec12handle_error17h9f321253d17717ecE
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
      call $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$11finish_grow17hc64a89ec890c0997E
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
        call $_ZN5alloc7raw_vec12handle_error17h9f321253d17717ecE
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
    (func $"#func180 _ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$9write_str17hb875d0f35d6285acE" (@name "_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$9write_str17hb875d0f35d6285acE") (;180;) (type 2) (param i32 i32 i32) (result i32)
      (local i32)
      block ;; label = @1
        local.get 2
        local.get 0
        i32.load
        local.get 0
        i32.load offset=8
        local.tee 3
        i32.sub
        i32.le_u
        br_if 0 (;@1;)
        local.get 0
        local.get 3
        local.get 2
        call $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17hcbefda44afc0f2d1E
        local.get 0
        i32.load offset=8
        local.set 3
      end
      block ;; label = @1
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
    (func $_ZN5alloc7raw_vec12handle_error17h9f321253d17717ecE (;181;) (type 3) (param i32 i32)
      block ;; label = @1
        local.get 0
        i32.eqz
        br_if 0 (;@1;)
        local.get 0
        local.get 1
        call $_ZN5alloc5alloc18handle_alloc_error17h6a90b55247f528a0E
        unreachable
      end
      call $_ZN5alloc7raw_vec17capacity_overflow17h8410dfe870f84b26E
      unreachable
    )
    (func $_ZN5alloc3ffi5c_str7CString19_from_vec_unchecked17hc91dc6be42ad8623E (;182;) (type 3) (param i32 i32)
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
            call $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$11finish_grow17hc64a89ec890c0997E
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
              call $_RNvCsdBezzDwma51_7___rustc14___rust_dealloc
              br 1 (;@3;)
            end
            local.get 5
            local.get 3
            i32.const 1
            local.get 1
            call $_RNvCsdBezzDwma51_7___rustc14___rust_realloc
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
        call $_ZN5alloc7raw_vec12handle_error17h9f321253d17717ecE
        unreachable
      end
      i32.const 1
      local.get 1
      call $_ZN5alloc7raw_vec12handle_error17h9f321253d17717ecE
      unreachable
    )
    (func $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$11finish_grow17hc64a89ec890c0997E (;183;) (type 1) (param i32 i32 i32 i32)
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
                call $_RNvCsdBezzDwma51_7___rustc14___rust_realloc
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
              call $_RNvCsdBezzDwma51_7___rustc35___rust_no_alloc_shim_is_unstable_v2
              local.get 3
              i32.const 1
              call $_RNvCsdBezzDwma51_7___rustc12___rust_alloc
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
    (func $_ZN5alloc3fmt6format12format_inner17h24bee7aa8419c476E (;184;) (type 9) (param i32 i32 i32)
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
                  local.get 2
                  i32.const 1
                  i32.and
                  br_if 0 (;@6;)
                  local.get 1
                  i32.load8_u
                  local.tee 4
                  i32.eqz
                  br_if 2 (;@4;)
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
                          i32.eq
                          br_if 0 (;@10;)
                          local.get 6
                          local.get 4
                          i32.const 3
                          i32.and
                          i32.const 24
                          i32.rotl
                          local.tee 8
                          i32.const 5
                          i32.shl
                          i32.const 1073741824
                          i32.and
                          local.get 8
                          i32.const 16777216
                          i32.and
                          i32.const 7
                          i32.shl
                          local.get 8
                          i32.const 536870912
                          i32.and
                          i32.or
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
                          local.get 7
                          i32.eqz
                          local.get 5
                          i32.or
                          local.set 5
                          br 2 (;@8;)
                        end
                        local.get 7
                        local.get 6
                        i32.load16_u align=1
                        local.tee 4
                        i32.add
                        local.set 7
                        local.get 6
                        local.get 4
                        i32.add
                        i32.const 2
                        i32.add
                        local.set 6
                        br 1 (;@8;)
                      end
                      local.get 6
                      local.get 4
                      i32.const 255
                      i32.and
                      local.tee 4
                      i32.add
                      local.set 6
                      local.get 7
                      local.get 4
                      i32.add
                      local.set 7
                    end
                    local.get 6
                    i32.load8_u
                    local.tee 4
                    br_if 0 (;@7;)
                  end
                  i32.const 0
                  local.set 4
                  local.get 5
                  local.get 7
                  i32.const 16
                  i32.lt_u
                  i32.and
                  br_if 1 (;@5;)
                  i32.const 0
                  local.set 8
                  local.get 7
                  i32.const 1
                  i32.shl
                  local.tee 4
                  i32.const 0
                  i32.ge_s
                  br_if 1 (;@5;)
                  br 5 (;@1;)
                end
                local.get 2
                i32.const 1
                i32.shr_u
                local.set 4
              end
              local.get 4
              br_if 1 (;@3;)
            end
            i32.const 1
            local.set 6
            i32.const 0
            local.set 4
            br 1 (;@2;)
          end
          call $_RNvCsdBezzDwma51_7___rustc35___rust_no_alloc_shim_is_unstable_v2
          i32.const 1
          local.set 8
          local.get 4
          i32.const 1
          call $_RNvCsdBezzDwma51_7___rustc12___rust_alloc
          local.tee 6
          i32.eqz
          br_if 1 (;@1;)
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
        block ;; label = @2
          local.get 3
          global.get $GOT.data.internal.__memory_base
          i32.const 1054796
          i32.add
          local.get 1
          local.get 2
          call $_ZN4core3fmt5write17h80512e2a12699005E
          i32.eqz
          br_if 0 (;@2;)
          global.get $GOT.data.internal.__memory_base
          local.tee 4
          i32.const 1051061
          i32.add
          i32.const 86
          local.get 3
          i32.const 15
          i32.add
          local.get 4
          i32.const 1054820
          i32.add
          local.get 4
          i32.const 1054836
          i32.add
          call $_ZN4core6result13unwrap_failed17hfc7ff948713b7b29E
          unreachable
        end
        local.get 0
        local.get 3
        i64.load align=4
        i64.store align=4
        local.get 0
        i32.const 8
        i32.add
        local.get 3
        i32.const 8
        i32.add
        i32.load
        i32.store
        local.get 3
        i32.const 16
        i32.add
        global.set $__stack_pointer
        return
      end
      local.get 8
      local.get 4
      call $_ZN5alloc7raw_vec12handle_error17h9f321253d17717ecE
      unreachable
    )
    (func $_ZN5alloc7raw_vec17capacity_overflow17h8410dfe870f84b26E (;185;) (type 8)
      (local i32)
      global.get $GOT.data.internal.__memory_base
      local.tee 0
      i32.const 1051147
      i32.add
      i32.const 35
      local.get 0
      i32.const 1054852
      i32.add
      call $_ZN4core9panicking9panic_fmt17hd2f72abdb0aff166E
      unreachable
    )
    (func $_ZN81_$LT$$RF$$u5b$u8$u5d$$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17h89346a00dfa8b753E (;186;) (type 9) (param i32 i32 i32)
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
            call $_RNvCsdBezzDwma51_7___rustc35___rust_no_alloc_shim_is_unstable_v2
            i32.const 1
            local.set 4
            local.get 5
            i32.const 1
            call $_RNvCsdBezzDwma51_7___rustc12___rust_alloc
            local.tee 6
            i32.eqz
            br_if 0 (;@3;)
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
              i32.const 7
              i32.gt_u
              br_if 0 (;@4;)
              block ;; label = @5
                local.get 2
                br_if 0 (;@5;)
                i32.const 0
                local.set 7
                i32.const 0
                local.set 4
                br 4 (;@1;)
              end
              block ;; label = @5
                local.get 1
                i32.load8_u
                br_if 0 (;@5;)
                i32.const 1
                local.set 4
                i32.const 0
                local.set 7
                br 4 (;@1;)
              end
              i32.const 1
              local.set 4
              local.get 2
              i32.const 1
              i32.eq
              br_if 2 (;@2;)
              block ;; label = @5
                local.get 1
                i32.load8_u offset=1
                br_if 0 (;@5;)
                i32.const 1
                local.set 7
                br 4 (;@1;)
              end
              i32.const 2
              local.set 7
              local.get 2
              i32.const 2
              i32.eq
              br_if 2 (;@2;)
              local.get 1
              i32.load8_u offset=2
              i32.eqz
              br_if 3 (;@1;)
              i32.const 3
              local.set 7
              local.get 2
              i32.const 3
              i32.eq
              br_if 2 (;@2;)
              local.get 1
              i32.load8_u offset=3
              i32.eqz
              br_if 3 (;@1;)
              i32.const 4
              local.set 7
              local.get 2
              i32.const 4
              i32.eq
              br_if 2 (;@2;)
              local.get 1
              i32.load8_u offset=4
              i32.eqz
              br_if 3 (;@1;)
              i32.const 5
              local.set 7
              local.get 2
              i32.const 5
              i32.eq
              br_if 2 (;@2;)
              local.get 1
              i32.load8_u offset=5
              i32.eqz
              br_if 3 (;@1;)
              local.get 2
              local.set 7
              i32.const 0
              local.set 4
              local.get 2
              i32.const 6
              i32.eq
              br_if 3 (;@1;)
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
              br 3 (;@1;)
            end
            local.get 3
            i32.const 8
            i32.add
            i32.const 0
            local.get 1
            local.get 2
            call $_ZN4core5slice6memchr14memchr_aligned17h3a453d2ddf9c7cc0E
            local.get 3
            i32.load offset=12
            local.set 7
            local.get 3
            i32.load offset=8
            local.set 4
            br 2 (;@1;)
          end
          local.get 4
          local.get 5
          call $_ZN5alloc7raw_vec12handle_error17h9f321253d17717ecE
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
          i32.and
          i32.eqz
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
        call $_ZN5alloc3ffi5c_str7CString19_from_vec_unchecked17hc91dc6be42ad8623E
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
    (func $_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h4faf6c8527f1f06dE (;187;) (type 4) (param i32 i32) (result i32)
      (local i32 i32 i32 i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 2
      global.set $__stack_pointer
      i32.const 1
      local.set 3
      block ;; label = @1
        local.get 1
        i32.load
        local.tee 4
        i32.const 39
        local.get 1
        i32.load offset=4
        local.tee 5
        i32.load offset=16
        local.tee 1
        call_indirect (type 4)
        br_if 0 (;@1;)
        local.get 2
        local.get 0
        i32.load
        i32.const 257
        call $_ZN4core4char7methods22_$LT$impl$u20$char$GT$16escape_debug_ext17h59a41b54ab9c23edE
        block ;; label = @2
          block ;; label = @3
            local.get 2
            i32.load8_u offset=13
            local.tee 3
            i32.const 129
            i32.lt_u
            br_if 0 (;@3;)
            local.get 4
            local.get 2
            i32.load
            local.get 1
            call_indirect (type 4)
            i32.eqz
            br_if 1 (;@2;)
            i32.const 1
            local.set 3
            br 2 (;@1;)
          end
          local.get 4
          local.get 2
          local.get 2
          i32.load8_u offset=12
          local.tee 0
          i32.add
          local.get 3
          local.get 0
          i32.sub
          local.get 5
          i32.load offset=12
          call_indirect (type 2)
          i32.eqz
          br_if 0 (;@2;)
          i32.const 1
          local.set 3
          br 1 (;@1;)
        end
        local.get 4
        i32.const 39
        local.get 1
        call_indirect (type 4)
        local.set 3
      end
      local.get 2
      i32.const 16
      i32.add
      global.set $__stack_pointer
      local.get 3
    )
    (func $_ZN4core3fmt5write17h80512e2a12699005E (;188;) (type 11) (param i32 i32 i32 i32) (result i32)
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
          call_indirect (type 2)
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
                    block ;; label = @8
                      block ;; label = @9
                        local.get 5
                        i32.extend8_s
                        i32.const -1
                        i32.gt_s
                        br_if 0 (;@9;)
                        local.get 5
                        i32.const 255
                        i32.and
                        local.tee 9
                        i32.const 128
                        i32.eq
                        br_if 1 (;@8;)
                        local.get 9
                        i32.const 192
                        i32.eq
                        br_if 2 (;@7;)
                        i32.const 1610612768
                        local.set 10
                        block ;; label = @10
                          local.get 5
                          i32.const 1
                          i32.and
                          i32.eqz
                          br_if 0 (;@10;)
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
                        local.get 5
                        i32.const 2
                        i32.and
                        br_if 3 (;@6;)
                        local.get 8
                        local.set 2
                        i32.const 0
                        local.set 8
                        br 4 (;@5;)
                      end
                      block ;; label = @9
                        local.get 0
                        local.get 8
                        local.get 5
                        i32.const 255
                        i32.and
                        local.tee 5
                        local.get 6
                        call_indirect (type 2)
                        br_if 0 (;@9;)
                        local.get 8
                        local.get 5
                        i32.add
                        local.set 2
                        br 6 (;@3;)
                      end
                      i32.const 1
                      local.set 5
                      br 7 (;@1;)
                    end
                    block ;; label = @8
                      local.get 0
                      local.get 2
                      i32.const 3
                      i32.add
                      local.tee 5
                      local.get 2
                      i32.load16_u offset=1 align=1
                      local.tee 2
                      local.get 6
                      call_indirect (type 2)
                      br_if 0 (;@8;)
                      local.get 5
                      local.get 2
                      i32.add
                      local.set 2
                      br 5 (;@3;)
                    end
                    i32.const 1
                    local.set 5
                    br 6 (;@1;)
                  end
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
                  br_if 2 (;@4;)
                  i32.const 1
                  local.set 5
                  br 5 (;@1;)
                end
                local.get 8
                i32.const 2
                i32.add
                local.set 2
                local.get 8
                i32.load16_u align=1
                local.set 8
              end
              block ;; label = @5
                block ;; label = @6
                  local.get 5
                  i32.const 4
                  i32.and
                  br_if 0 (;@6;)
                  local.get 2
                  local.set 11
                  br 1 (;@5;)
                end
                local.get 2
                i32.const 2
                i32.add
                local.set 11
                local.get 2
                i32.load16_u align=1
                local.set 9
              end
              block ;; label = @5
                block ;; label = @6
                  local.get 5
                  i32.const 8
                  i32.and
                  br_if 0 (;@6;)
                  local.get 11
                  local.set 2
                  br 1 (;@5;)
                end
                local.get 11
                i32.const 2
                i32.add
                local.set 2
                local.get 11
                i32.load16_u align=1
                local.set 7
              end
              block ;; label = @5
                local.get 5
                i32.const 16
                i32.and
                i32.eqz
                br_if 0 (;@5;)
                local.get 3
                local.get 8
                i32.const 65535
                i32.and
                i32.const 3
                i32.shl
                i32.add
                i32.load16_u offset=4
                local.set 8
              end
              block ;; label = @5
                local.get 5
                i32.const 32
                i32.and
                i32.eqz
                br_if 0 (;@5;)
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
              local.get 8
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
              block ;; label = @5
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
                br_if 0 (;@5;)
                i32.const 1
                local.set 5
                br 4 (;@1;)
              end
              local.get 7
              i32.const 1
              i32.add
              local.set 7
              br 1 (;@3;)
            end
            local.get 7
            i32.const 1
            i32.add
            local.set 7
            local.get 8
            local.set 2
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
    (func $_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h768c7e894f3688e1E (;189;) (type 2) (param i32 i32 i32) (result i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 3
      global.set $__stack_pointer
      i32.const 1
      local.set 4
      block ;; label = @1
        local.get 2
        i32.load
        local.tee 5
        i32.const 34
        local.get 2
        i32.load offset=4
        local.tee 6
        i32.load offset=16
        local.tee 7
        call_indirect (type 4)
        br_if 0 (;@1;)
        block ;; label = @2
          block ;; label = @3
            local.get 1
            br_if 0 (;@3;)
            i32.const 0
            local.set 8
            i32.const 0
            local.set 2
            br 1 (;@2;)
          end
          i32.const 0
          local.set 9
          i32.const 0
          local.get 1
          i32.sub
          local.set 10
          i32.const 0
          local.set 8
          local.get 1
          local.set 11
          local.get 0
          local.set 12
          block ;; label = @3
            loop ;; label = @4
              local.get 12
              local.get 11
              i32.add
              local.set 13
              i32.const 0
              local.set 2
              block ;; label = @5
                loop ;; label = @6
                  local.get 12
                  local.get 2
                  i32.add
                  local.tee 14
                  i32.load8_u
                  local.tee 15
                  i32.const -127
                  i32.add
                  i32.const 255
                  i32.and
                  i32.const 161
                  i32.lt_u
                  br_if 1 (;@5;)
                  local.get 15
                  i32.const 34
                  i32.eq
                  br_if 1 (;@5;)
                  local.get 15
                  i32.const 92
                  i32.eq
                  br_if 1 (;@5;)
                  local.get 11
                  local.get 2
                  i32.const 1
                  i32.add
                  local.tee 2
                  i32.ne
                  br_if 0 (;@6;)
                end
                local.get 8
                local.get 11
                i32.add
                local.set 8
                br 2 (;@3;)
              end
              local.get 14
              i32.const 1
              i32.add
              local.set 12
              local.get 8
              local.get 2
              i32.add
              local.set 11
              block ;; label = @5
                block ;; label = @6
                  block ;; label = @7
                    block ;; label = @8
                      local.get 14
                      i32.load8_s
                      local.tee 15
                      i32.const -1
                      i32.le_s
                      br_if 0 (;@8;)
                      local.get 15
                      i32.const 255
                      i32.and
                      local.set 15
                      br 1 (;@7;)
                    end
                    local.get 12
                    i32.load8_u
                    i32.const 63
                    i32.and
                    local.set 16
                    local.get 15
                    i32.const 31
                    i32.and
                    local.set 17
                    local.get 14
                    i32.const 2
                    i32.add
                    local.set 12
                    block ;; label = @8
                      local.get 15
                      i32.const -33
                      i32.gt_u
                      br_if 0 (;@8;)
                      local.get 17
                      i32.const 6
                      i32.shl
                      local.get 16
                      i32.or
                      local.set 15
                      br 1 (;@7;)
                    end
                    local.get 16
                    i32.const 6
                    i32.shl
                    local.get 12
                    i32.load8_u
                    i32.const 63
                    i32.and
                    i32.or
                    local.set 16
                    local.get 14
                    i32.const 3
                    i32.add
                    local.set 12
                    block ;; label = @8
                      local.get 15
                      i32.const -16
                      i32.ge_u
                      br_if 0 (;@8;)
                      local.get 16
                      local.get 17
                      i32.const 12
                      i32.shl
                      i32.or
                      local.set 15
                      br 1 (;@7;)
                    end
                    local.get 12
                    i32.load8_u
                    local.set 15
                    local.get 14
                    i32.const 4
                    i32.add
                    local.set 12
                    local.get 16
                    i32.const 6
                    i32.shl
                    local.get 15
                    i32.const 63
                    i32.and
                    i32.or
                    local.get 17
                    i32.const 18
                    i32.shl
                    i32.const 1835008
                    i32.and
                    i32.or
                    local.tee 15
                    i32.const 1114112
                    i32.ne
                    br_if 0 (;@7;)
                    local.get 11
                    local.set 8
                    br 1 (;@6;)
                  end
                  local.get 3
                  local.get 15
                  i32.const 65537
                  call $_ZN4core4char7methods22_$LT$impl$u20$char$GT$16escape_debug_ext17h59a41b54ab9c23edE
                  block ;; label = @7
                    local.get 3
                    i32.load8_u offset=13
                    local.tee 14
                    local.get 3
                    i32.load8_u offset=12
                    local.tee 16
                    i32.sub
                    local.tee 17
                    i32.const 255
                    i32.and
                    i32.const 1
                    i32.eq
                    br_if 0 (;@7;)
                    block ;; label = @8
                      block ;; label = @9
                        local.get 9
                        local.get 11
                        i32.gt_u
                        br_if 0 (;@9;)
                        block ;; label = @10
                          local.get 9
                          i32.eqz
                          br_if 0 (;@10;)
                          block ;; label = @11
                            local.get 9
                            local.get 1
                            i32.lt_u
                            br_if 0 (;@11;)
                            local.get 9
                            local.get 1
                            i32.eq
                            br_if 1 (;@10;)
                            br 2 (;@9;)
                          end
                          local.get 0
                          local.get 9
                          i32.add
                          i32.load8_s
                          i32.const -64
                          i32.lt_s
                          br_if 1 (;@9;)
                        end
                        local.get 11
                        i32.eqz
                        br_if 1 (;@8;)
                        block ;; label = @10
                          local.get 11
                          local.get 1
                          i32.lt_u
                          br_if 0 (;@10;)
                          local.get 11
                          local.get 10
                          i32.add
                          br_if 1 (;@9;)
                          br 2 (;@8;)
                        end
                        local.get 0
                        local.get 8
                        i32.add
                        local.get 2
                        i32.add
                        i32.load8_s
                        i32.const -65
                        i32.gt_s
                        br_if 1 (;@8;)
                      end
                      local.get 0
                      local.get 1
                      local.get 9
                      local.get 8
                      local.get 2
                      i32.add
                      global.get $GOT.data.internal.__memory_base
                      i32.const 1054868
                      i32.add
                      call $_ZN4core3str16slice_error_fail17h6f341072763fa168E
                      unreachable
                    end
                    local.get 5
                    local.get 0
                    local.get 9
                    i32.add
                    local.get 8
                    local.get 9
                    i32.sub
                    local.get 2
                    i32.add
                    local.get 6
                    i32.load offset=12
                    local.tee 11
                    call_indirect (type 2)
                    br_if 2 (;@5;)
                    block ;; label = @8
                      block ;; label = @9
                        local.get 14
                        i32.const 129
                        i32.lt_u
                        br_if 0 (;@9;)
                        local.get 5
                        local.get 3
                        i32.load
                        local.get 7
                        call_indirect (type 4)
                        br_if 4 (;@5;)
                        br 1 (;@8;)
                      end
                      local.get 5
                      local.get 3
                      local.get 16
                      i32.add
                      local.get 17
                      local.get 11
                      call_indirect (type 2)
                      br_if 3 (;@5;)
                    end
                    block ;; label = @8
                      block ;; label = @9
                        local.get 15
                        i32.const 128
                        i32.ge_u
                        br_if 0 (;@9;)
                        i32.const 1
                        local.set 14
                        br 1 (;@8;)
                      end
                      block ;; label = @9
                        local.get 15
                        i32.const 2048
                        i32.ge_u
                        br_if 0 (;@9;)
                        i32.const 2
                        local.set 14
                        br 1 (;@8;)
                      end
                      i32.const 3
                      i32.const 4
                      local.get 15
                      i32.const 65536
                      i32.lt_u
                      select
                      local.set 14
                    end
                    local.get 14
                    local.get 8
                    i32.add
                    local.get 2
                    i32.add
                    local.set 9
                  end
                  block ;; label = @7
                    block ;; label = @8
                      local.get 15
                      i32.const 128
                      i32.ge_u
                      br_if 0 (;@8;)
                      i32.const 1
                      local.set 15
                      br 1 (;@7;)
                    end
                    block ;; label = @8
                      local.get 15
                      i32.const 2048
                      i32.ge_u
                      br_if 0 (;@8;)
                      i32.const 2
                      local.set 15
                      br 1 (;@7;)
                    end
                    i32.const 3
                    i32.const 4
                    local.get 15
                    i32.const 65536
                    i32.lt_u
                    select
                    local.set 15
                  end
                  local.get 15
                  local.get 8
                  i32.add
                  local.get 2
                  i32.add
                  local.set 8
                end
                local.get 13
                local.get 12
                i32.sub
                local.tee 11
                br_if 1 (;@4;)
                br 2 (;@3;)
              end
            end
            i32.const 1
            local.set 4
            br 2 (;@1;)
          end
          block ;; label = @3
            local.get 9
            local.get 8
            i32.gt_u
            br_if 0 (;@3;)
            i32.const 0
            local.set 2
            block ;; label = @4
              local.get 9
              i32.eqz
              br_if 0 (;@4;)
              block ;; label = @5
                local.get 9
                local.get 1
                i32.lt_u
                br_if 0 (;@5;)
                local.get 9
                local.set 2
                local.get 9
                local.get 1
                i32.eq
                br_if 1 (;@4;)
                br 2 (;@3;)
              end
              local.get 9
              local.set 2
              local.get 0
              local.get 9
              i32.add
              i32.load8_s
              i32.const -64
              i32.lt_s
              br_if 1 (;@3;)
            end
            block ;; label = @4
              local.get 8
              br_if 0 (;@4;)
              i32.const 0
              local.set 8
              br 2 (;@2;)
            end
            block ;; label = @4
              local.get 8
              local.get 1
              i32.lt_u
              br_if 0 (;@4;)
              local.get 8
              local.get 1
              i32.eq
              br_if 2 (;@2;)
              local.get 2
              local.set 9
              br 1 (;@3;)
            end
            local.get 0
            local.get 8
            i32.add
            i32.load8_s
            i32.const -65
            i32.gt_s
            br_if 1 (;@2;)
            local.get 2
            local.set 9
          end
          local.get 0
          local.get 1
          local.get 9
          local.get 8
          global.get $GOT.data.internal.__memory_base
          i32.const 1054884
          i32.add
          call $_ZN4core3str16slice_error_fail17h6f341072763fa168E
          unreachable
        end
        local.get 5
        local.get 0
        local.get 2
        i32.add
        local.get 8
        local.get 2
        i32.sub
        local.get 6
        i32.load offset=12
        call_indirect (type 2)
        br_if 0 (;@1;)
        local.get 5
        i32.const 34
        local.get 7
        call_indirect (type 4)
        local.set 4
      end
      local.get 3
      i32.const 16
      i32.add
      global.set $__stack_pointer
      local.get 4
    )
    (func $_ZN4core4char7methods22_$LT$impl$u20$char$GT$16escape_debug_ext17h59a41b54ab9c23edE (;190;) (type 9) (param i32 i32 i32)
      (local i32 i32 i32)
      global.get $__stack_pointer
      i32.const 32
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
                    block ;; label = @8
                      block ;; label = @9
                        block ;; label = @10
                          block ;; label = @11
                            block ;; label = @12
                              block ;; label = @13
                                block ;; label = @14
                                  block ;; label = @15
                                    local.get 1
                                    br_table 2 (;@13;) 1 (;@14;) 1 (;@14;) 1 (;@14;) 1 (;@14;) 1 (;@14;) 1 (;@14;) 1 (;@14;) 1 (;@14;) 3 (;@12;) 5 (;@10;) 1 (;@14;) 1 (;@14;) 4 (;@11;) 1 (;@14;) 1 (;@14;) 1 (;@14;) 1 (;@14;) 1 (;@14;) 1 (;@14;) 1 (;@14;) 1 (;@14;) 1 (;@14;) 1 (;@14;) 1 (;@14;) 1 (;@14;) 1 (;@14;) 1 (;@14;) 1 (;@14;) 1 (;@14;) 1 (;@14;) 1 (;@14;) 1 (;@14;) 1 (;@14;) 8 (;@7;) 1 (;@14;) 1 (;@14;) 1 (;@14;) 1 (;@14;) 7 (;@8;) 0 (;@15;)
                                  end
                                  local.get 1
                                  i32.const 92
                                  i32.eq
                                  br_if 5 (;@9;)
                                end
                                local.get 2
                                i32.const 1
                                i32.and
                                i32.eqz
                                br_if 7 (;@6;)
                                local.get 1
                                i32.const 767
                                i32.le_u
                                br_if 7 (;@6;)
                                local.get 1
                                call $_ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17h8cb9155decd1f16eE
                                i32.eqz
                                br_if 7 (;@6;)
                                local.get 3
                                i32.const 12
                                i32.add
                                i32.const 2
                                i32.add
                                i32.const 0
                                i32.store8
                                local.get 3
                                i32.const 0
                                i32.store16 offset=12
                                local.get 3
                                global.get $GOT.data.internal.__memory_base
                                i32.const 1052140
                                i32.add
                                local.tee 4
                                local.get 1
                                i32.const 20
                                i32.shr_u
                                i32.add
                                i32.load8_u
                                i32.store8 offset=15
                                local.get 3
                                local.get 4
                                local.get 1
                                i32.const 4
                                i32.shr_u
                                i32.const 15
                                i32.and
                                i32.add
                                i32.load8_u
                                i32.store8 offset=19
                                local.get 3
                                local.get 4
                                local.get 1
                                i32.const 8
                                i32.shr_u
                                i32.const 15
                                i32.and
                                i32.add
                                i32.load8_u
                                i32.store8 offset=18
                                local.get 3
                                local.get 4
                                local.get 1
                                i32.const 12
                                i32.shr_u
                                i32.const 15
                                i32.and
                                i32.add
                                i32.load8_u
                                i32.store8 offset=17
                                local.get 3
                                local.get 4
                                local.get 1
                                i32.const 16
                                i32.shr_u
                                i32.const 15
                                i32.and
                                i32.add
                                i32.load8_u
                                i32.store8 offset=16
                                local.get 3
                                i32.const 12
                                i32.add
                                local.get 1
                                i32.const 1
                                i32.or
                                i32.clz
                                i32.const 2
                                i32.shr_u
                                local.tee 2
                                i32.add
                                local.tee 5
                                i32.const 123
                                i32.store8
                                local.get 5
                                i32.const -1
                                i32.add
                                i32.const 117
                                i32.store8
                                local.get 3
                                i32.const 12
                                i32.add
                                local.get 2
                                i32.const -2
                                i32.add
                                local.tee 2
                                i32.add
                                i32.const 92
                                i32.store8
                                local.get 3
                                i32.const 12
                                i32.add
                                i32.const 8
                                i32.add
                                local.tee 5
                                local.get 4
                                local.get 1
                                i32.const 15
                                i32.and
                                i32.add
                                i32.load8_u
                                i32.store8
                                local.get 0
                                local.get 3
                                i64.load offset=12 align=2
                                i64.store align=1
                                local.get 3
                                i32.const 125
                                i32.store8 offset=21
                                local.get 0
                                i32.const 8
                                i32.add
                                local.get 5
                                i32.load16_u
                                i32.store16 align=1
                                br 8 (;@5;)
                              end
                              local.get 0
                              i64.const 0
                              i64.store offset=2 align=2
                              local.get 0
                              i32.const 12380
                              i32.store16
                              br 10 (;@2;)
                            end
                            local.get 0
                            i64.const 0
                            i64.store offset=2 align=2
                            local.get 0
                            i32.const 29788
                            i32.store16
                            br 9 (;@2;)
                          end
                          local.get 0
                          i64.const 0
                          i64.store offset=2 align=2
                          local.get 0
                          i32.const 29276
                          i32.store16
                          br 8 (;@2;)
                        end
                        local.get 0
                        i64.const 0
                        i64.store offset=2 align=2
                        local.get 0
                        i32.const 28252
                        i32.store16
                        br 7 (;@2;)
                      end
                      local.get 0
                      i64.const 0
                      i64.store offset=2 align=2
                      local.get 0
                      i32.const 23644
                      i32.store16
                      br 6 (;@2;)
                    end
                    local.get 2
                    i32.const 256
                    i32.and
                    i32.eqz
                    br_if 1 (;@6;)
                    local.get 0
                    i64.const 0
                    i64.store offset=2 align=2
                    local.get 0
                    i32.const 10076
                    i32.store16
                    br 5 (;@2;)
                  end
                  local.get 2
                  i32.const 16777215
                  i32.and
                  i32.const 65536
                  i32.ge_u
                  br_if 3 (;@3;)
                end
                local.get 1
                call $_ZN4core7unicode9printable12is_printable17h725c9c4a43be5724E
                br_if 1 (;@4;)
                local.get 3
                i32.const 22
                i32.add
                i32.const 2
                i32.add
                i32.const 0
                i32.store8
                local.get 3
                i32.const 0
                i32.store16 offset=22
                local.get 3
                global.get $GOT.data.internal.__memory_base
                i32.const 1052140
                i32.add
                local.tee 4
                local.get 1
                i32.const 20
                i32.shr_u
                i32.add
                i32.load8_u
                i32.store8 offset=25
                local.get 3
                local.get 4
                local.get 1
                i32.const 4
                i32.shr_u
                i32.const 15
                i32.and
                i32.add
                i32.load8_u
                i32.store8 offset=29
                local.get 3
                local.get 4
                local.get 1
                i32.const 8
                i32.shr_u
                i32.const 15
                i32.and
                i32.add
                i32.load8_u
                i32.store8 offset=28
                local.get 3
                local.get 4
                local.get 1
                i32.const 12
                i32.shr_u
                i32.const 15
                i32.and
                i32.add
                i32.load8_u
                i32.store8 offset=27
                local.get 3
                local.get 4
                local.get 1
                i32.const 16
                i32.shr_u
                i32.const 15
                i32.and
                i32.add
                i32.load8_u
                i32.store8 offset=26
                local.get 3
                i32.const 22
                i32.add
                local.get 1
                i32.const 1
                i32.or
                i32.clz
                i32.const 2
                i32.shr_u
                local.tee 2
                i32.add
                local.tee 5
                i32.const 123
                i32.store8
                local.get 5
                i32.const -1
                i32.add
                i32.const 117
                i32.store8
                local.get 3
                i32.const 22
                i32.add
                local.get 2
                i32.const -2
                i32.add
                local.tee 2
                i32.add
                i32.const 92
                i32.store8
                local.get 3
                i32.const 22
                i32.add
                i32.const 8
                i32.add
                local.tee 5
                local.get 4
                local.get 1
                i32.const 15
                i32.and
                i32.add
                i32.load8_u
                i32.store8
                local.get 0
                local.get 3
                i64.load offset=22 align=2
                i64.store align=1
                local.get 3
                i32.const 125
                i32.store8 offset=31
                local.get 0
                i32.const 8
                i32.add
                local.get 5
                i32.load16_u
                i32.store16 align=1
              end
              i32.const 10
              local.set 1
              br 3 (;@1;)
            end
            local.get 0
            local.get 1
            i32.store
            i32.const 129
            local.set 1
            i32.const 128
            local.set 2
            br 2 (;@1;)
          end
          local.get 0
          i64.const 0
          i64.store offset=2 align=2
          local.get 0
          i32.const 8796
          i32.store16
        end
        i32.const 2
        local.set 1
        i32.const 0
        local.set 2
      end
      local.get 0
      local.get 1
      i32.store8 offset=13
      local.get 0
      local.get 2
      i32.store8 offset=12
      local.get 3
      i32.const 32
      i32.add
      global.set $__stack_pointer
    )
    (func $_ZN4core3str16slice_error_fail17h6f341072763fa168E (;191;) (type 13) (param i32 i32 i32 i32 i32)
      local.get 0
      local.get 1
      local.get 2
      local.get 3
      local.get 4
      call $_ZN4core3str19slice_error_fail_rt17h54edf58acd8686c9E
      unreachable
    )
    (func $_ZN4core3fmt3num50_$LT$impl$u20$core..fmt..Debug$u20$for$u20$u32$GT$3fmt17h559c227a3154a656E (;192;) (type 4) (param i32 i32) (result i32)
      (local i32 i32 i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 2
      global.set $__stack_pointer
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            local.get 1
            i32.load offset=8
            local.tee 3
            i32.const 33554432
            i32.and
            br_if 0 (;@3;)
            local.get 3
            i32.const 67108864
            i32.and
            br_if 1 (;@2;)
            local.get 1
            i32.const 1
            i32.const 1
            i32.const 0
            local.get 2
            i32.const 6
            i32.add
            local.get 0
            i32.load
            local.get 2
            i32.const 6
            i32.add
            i32.const 10
            call $_ZN4core3fmt3num3imp21_$LT$impl$u20$u32$GT$10_fmt_inner17habec0c7d2ee1a866E
            local.tee 0
            i32.add
            i32.const 10
            local.get 0
            i32.sub
            call $_ZN4core3fmt9Formatter12pad_integral17h92efc1b1156e5c6aE
            local.set 0
            br 2 (;@1;)
          end
          local.get 0
          i32.load
          local.set 0
          i32.const 0
          local.set 3
          loop ;; label = @3
            local.get 2
            i32.const 6
            i32.add
            local.get 3
            i32.add
            i32.const 7
            i32.add
            global.get $GOT.data.internal.__memory_base
            i32.const 1052140
            i32.add
            local.get 0
            i32.const 15
            i32.and
            i32.add
            i32.load8_u
            i32.store8
            local.get 3
            i32.const -1
            i32.add
            local.set 3
            local.get 0
            i32.const 15
            i32.gt_u
            local.set 4
            local.get 0
            i32.const 4
            i32.shr_u
            local.set 0
            local.get 4
            br_if 0 (;@3;)
          end
          local.get 1
          i32.const 1
          global.get $GOT.data.internal.__memory_base
          i32.const 1052156
          i32.add
          i32.const 2
          local.get 2
          i32.const 6
          i32.add
          local.get 3
          i32.add
          i32.const 8
          i32.add
          i32.const 0
          local.get 3
          i32.sub
          call $_ZN4core3fmt9Formatter12pad_integral17h92efc1b1156e5c6aE
          local.set 0
          br 1 (;@1;)
        end
        local.get 0
        i32.load
        local.set 0
        i32.const 0
        local.set 3
        loop ;; label = @2
          local.get 2
          i32.const 6
          i32.add
          local.get 3
          i32.add
          i32.const 7
          i32.add
          global.get $GOT.data.internal.__memory_base
          i32.const 1052158
          i32.add
          local.get 0
          i32.const 15
          i32.and
          i32.add
          i32.load8_u
          i32.store8
          local.get 3
          i32.const -1
          i32.add
          local.set 3
          local.get 0
          i32.const 15
          i32.gt_u
          local.set 4
          local.get 0
          i32.const 4
          i32.shr_u
          local.set 0
          local.get 4
          br_if 0 (;@2;)
        end
        local.get 1
        i32.const 1
        global.get $GOT.data.internal.__memory_base
        i32.const 1052156
        i32.add
        i32.const 2
        local.get 2
        i32.const 6
        i32.add
        local.get 3
        i32.add
        i32.const 8
        i32.add
        i32.const 0
        local.get 3
        i32.sub
        call $_ZN4core3fmt9Formatter12pad_integral17h92efc1b1156e5c6aE
        local.set 0
      end
      local.get 2
      i32.const 16
      i32.add
      global.set $__stack_pointer
      local.get 0
    )
    (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h6e0427a03a9dcc44E (;193;) (type 4) (param i32 i32) (result i32)
      local.get 0
      i32.load
      local.get 1
      local.get 0
      i32.load offset=4
      i32.load offset=12
      call_indirect (type 4)
    )
    (func $_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h07a37024704900fbE (;194;) (type 2) (param i32 i32 i32) (result i32)
      local.get 2
      local.get 0
      local.get 1
      call $_ZN4core3fmt9Formatter3pad17h64b35fcb0035e695E
    )
    (func $_ZN4core3fmt9Formatter3pad17h64b35fcb0035e695E (;195;) (type 2) (param i32 i32 i32) (result i32)
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
              local.get 3
              i32.const 268435456
              i32.and
              br_if 0 (;@4;)
              block ;; label = @5
                local.get 2
                i32.const 16
                i32.lt_u
                br_if 0 (;@5;)
                local.get 1
                local.get 2
                call $_ZN4core3str5count14do_count_chars17h7374b7ea62e3e3a2E
                local.set 4
                br 2 (;@3;)
              end
              block ;; label = @5
                local.get 2
                br_if 0 (;@5;)
                i32.const 0
                local.set 4
                i32.const 0
                local.set 2
                br 2 (;@3;)
              end
              local.get 2
              i32.const 3
              i32.and
              local.set 5
              block ;; label = @5
                block ;; label = @6
                  local.get 2
                  i32.const 4
                  i32.ge_u
                  br_if 0 (;@6;)
                  i32.const 0
                  local.set 6
                  i32.const 0
                  local.set 4
                  br 1 (;@5;)
                end
                local.get 2
                i32.const 12
                i32.and
                local.set 7
                i32.const 0
                local.set 6
                i32.const 0
                local.set 4
                loop ;; label = @6
                  local.get 4
                  local.get 1
                  local.get 6
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
                  local.set 4
                  local.get 7
                  local.get 6
                  i32.const 4
                  i32.add
                  local.tee 6
                  i32.ne
                  br_if 0 (;@6;)
                end
              end
              local.get 5
              i32.eqz
              br_if 1 (;@3;)
              local.get 1
              local.get 6
              i32.add
              local.set 8
              loop ;; label = @5
                local.get 4
                local.get 8
                i32.load8_s
                i32.const -65
                i32.gt_s
                i32.add
                local.set 4
                local.get 8
                i32.const 1
                i32.add
                local.set 8
                local.get 5
                i32.const -1
                i32.add
                local.tee 5
                br_if 0 (;@5;)
                br 2 (;@3;)
              end
            end
            block ;; label = @4
              block ;; label = @5
                block ;; label = @6
                  local.get 0
                  i32.load16_u offset=14
                  local.tee 7
                  br_if 0 (;@6;)
                  i32.const 0
                  local.set 2
                  br 1 (;@5;)
                end
                local.get 1
                local.get 2
                i32.add
                local.set 5
                i32.const 0
                local.set 2
                local.get 1
                local.set 8
                local.get 7
                local.set 6
                loop ;; label = @6
                  local.get 8
                  local.tee 4
                  local.get 5
                  i32.eq
                  br_if 2 (;@4;)
                  block ;; label = @7
                    block ;; label = @8
                      local.get 4
                      i32.load8_s
                      local.tee 8
                      i32.const -1
                      i32.le_s
                      br_if 0 (;@8;)
                      local.get 4
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
                      local.get 4
                      i32.const 2
                      i32.add
                      local.set 8
                      br 1 (;@7;)
                    end
                    block ;; label = @8
                      local.get 8
                      i32.const -16
                      i32.ge_u
                      br_if 0 (;@8;)
                      local.get 4
                      i32.const 3
                      i32.add
                      local.set 8
                      br 1 (;@7;)
                    end
                    local.get 4
                    i32.const 4
                    i32.add
                    local.set 8
                  end
                  local.get 8
                  local.get 4
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
            local.get 7
            local.get 6
            i32.sub
            local.set 4
          end
          local.get 4
          local.get 0
          i32.load16_u offset=12
          local.tee 8
          i32.ge_u
          br_if 0 (;@2;)
          local.get 8
          local.get 4
          i32.sub
          local.set 9
          i32.const 0
          local.set 4
          i32.const 0
          local.set 7
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
              local.set 7
              br 1 (;@3;)
            end
            local.get 9
            i32.const 65534
            i32.and
            i32.const 1
            i32.shr_u
            local.set 7
          end
          local.get 3
          i32.const 2097151
          i32.and
          local.set 5
          local.get 0
          i32.load offset=4
          local.set 6
          local.get 0
          i32.load
          local.set 0
          block ;; label = @3
            loop ;; label = @4
              local.get 4
              i32.const 65535
              i32.and
              local.get 7
              i32.const 65535
              i32.and
              i32.ge_u
              br_if 1 (;@3;)
              i32.const 1
              local.set 8
              local.get 4
              i32.const 1
              i32.add
              local.set 4
              local.get 0
              local.get 5
              local.get 6
              i32.load offset=16
              call_indirect (type 4)
              i32.eqz
              br_if 0 (;@4;)
              br 3 (;@1;)
            end
          end
          i32.const 1
          local.set 8
          local.get 0
          local.get 1
          local.get 2
          local.get 6
          i32.load offset=12
          call_indirect (type 2)
          br_if 1 (;@1;)
          i32.const 0
          local.set 4
          local.get 9
          local.get 7
          i32.sub
          i32.const 65535
          i32.and
          local.set 2
          loop ;; label = @3
            local.get 4
            i32.const 65535
            i32.and
            local.tee 7
            local.get 2
            i32.lt_u
            local.set 8
            local.get 7
            local.get 2
            i32.ge_u
            br_if 2 (;@1;)
            local.get 4
            i32.const 1
            i32.add
            local.set 4
            local.get 0
            local.get 5
            local.get 6
            i32.load offset=16
            call_indirect (type 4)
            i32.eqz
            br_if 0 (;@3;)
            br 2 (;@1;)
          end
        end
        local.get 0
        i32.load
        local.get 1
        local.get 2
        local.get 0
        i32.load offset=4
        i32.load offset=12
        call_indirect (type 2)
        local.set 8
      end
      local.get 8
    )
    (func $_ZN43_$LT$bool$u20$as$u20$core..fmt..Display$GT$3fmt17hff556c2642512c9cE (;196;) (type 4) (param i32 i32) (result i32)
      block ;; label = @1
        local.get 0
        i32.load8_u
        br_if 0 (;@1;)
        local.get 1
        global.get $GOT.data.internal.__memory_base
        i32.const 1051931
        i32.add
        i32.const 5
        call $_ZN4core3fmt9Formatter3pad17h64b35fcb0035e695E
        return
      end
      local.get 1
      global.get $GOT.data.internal.__memory_base
      i32.const 1051936
      i32.add
      i32.const 4
      call $_ZN4core3fmt9Formatter3pad17h64b35fcb0035e695E
    )
    (func $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h2f052a4d708ff989E (;197;) (type 4) (param i32 i32) (result i32)
      local.get 1
      local.get 0
      i32.load
      local.get 0
      i32.load offset=4
      call $_ZN4core3fmt9Formatter3pad17h64b35fcb0035e695E
    )
    (func $_ZN4core3fmt3num3imp21_$LT$impl$u20$u32$GT$10_fmt_inner17habec0c7d2ee1a866E (;198;) (type 2) (param i32 i32 i32) (result i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32)
      local.get 0
      local.set 3
      local.get 2
      local.set 4
      block ;; label = @1
        local.get 0
        i32.const 1000
        i32.lt_u
        br_if 0 (;@1;)
        local.get 1
        i32.const -4
        i32.add
        local.set 5
        i32.const 0
        local.set 6
        local.get 0
        local.set 7
        block ;; label = @2
          block ;; label = @3
            loop ;; label = @4
              local.get 7
              local.get 7
              i32.const 10000
              i32.div_u
              local.tee 3
              i32.const 10000
              i32.mul
              i32.sub
              local.tee 8
              i32.const 65535
              i32.and
              i32.const 100
              i32.div_u
              local.set 9
              block ;; label = @5
                block ;; label = @6
                  local.get 2
                  local.get 6
                  i32.add
                  local.tee 4
                  i32.const -4
                  i32.add
                  local.get 2
                  i32.ge_u
                  br_if 0 (;@6;)
                  local.get 5
                  local.get 2
                  i32.add
                  local.tee 10
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1051940
                  i32.add
                  local.get 9
                  i32.const 1
                  i32.shl
                  local.tee 11
                  i32.add
                  i32.load8_u
                  i32.store8
                  local.get 4
                  i32.const -3
                  i32.add
                  local.get 2
                  i32.lt_u
                  br_if 1 (;@5;)
                  local.get 4
                  i32.const -3
                  i32.add
                  local.get 2
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1054900
                  i32.add
                  call $_ZN4core9panicking18panic_bounds_check17hbefee40b9c0b1c6bE
                  unreachable
                end
                local.get 4
                i32.const -4
                i32.add
                local.get 2
                global.get $GOT.data.internal.__memory_base
                i32.const 1054900
                i32.add
                call $_ZN4core9panicking18panic_bounds_check17hbefee40b9c0b1c6bE
                unreachable
              end
              local.get 10
              i32.const 1
              i32.add
              global.get $GOT.data.internal.__memory_base
              i32.const 1051940
              i32.add
              local.get 11
              i32.add
              i32.const 1
              i32.add
              i32.load8_u
              i32.store8
              block ;; label = @5
                local.get 4
                i32.const -2
                i32.add
                local.get 2
                i32.ge_u
                br_if 0 (;@5;)
                local.get 10
                i32.const 2
                i32.add
                global.get $GOT.data.internal.__memory_base
                i32.const 1051940
                i32.add
                local.get 8
                local.get 9
                i32.const 100
                i32.mul
                i32.sub
                i32.const 1
                i32.shl
                i32.const 131070
                i32.and
                local.tee 9
                i32.add
                i32.load8_u
                i32.store8
                local.get 4
                i32.const -1
                i32.add
                local.get 2
                i32.ge_u
                br_if 2 (;@3;)
                local.get 10
                i32.const 3
                i32.add
                global.get $GOT.data.internal.__memory_base
                i32.const 1051940
                i32.add
                local.get 9
                i32.add
                i32.const 1
                i32.add
                i32.load8_u
                i32.store8
                local.get 5
                i32.const -4
                i32.add
                local.set 5
                local.get 6
                i32.const -4
                i32.add
                local.set 6
                local.get 7
                i32.const 9999999
                i32.gt_u
                local.set 4
                local.get 3
                local.set 7
                local.get 4
                i32.eqz
                br_if 3 (;@2;)
                br 1 (;@4;)
              end
            end
            local.get 4
            i32.const -2
            i32.add
            local.get 2
            global.get $GOT.data.internal.__memory_base
            i32.const 1054900
            i32.add
            call $_ZN4core9panicking18panic_bounds_check17hbefee40b9c0b1c6bE
            unreachable
          end
          local.get 4
          i32.const -1
          i32.add
          local.get 2
          global.get $GOT.data.internal.__memory_base
          i32.const 1054900
          i32.add
          call $_ZN4core9panicking18panic_bounds_check17hbefee40b9c0b1c6bE
          unreachable
        end
        local.get 2
        local.get 6
        i32.add
        local.set 4
      end
      block ;; label = @1
        block ;; label = @2
          local.get 3
          i32.const 9
          i32.gt_u
          br_if 0 (;@2;)
          local.get 3
          local.set 10
          local.get 4
          local.set 7
          br 1 (;@1;)
        end
        local.get 3
        i32.const 65535
        i32.and
        i32.const 100
        i32.div_u
        local.set 10
        block ;; label = @2
          block ;; label = @3
            local.get 4
            i32.const -2
            i32.add
            local.tee 7
            local.get 2
            i32.ge_u
            br_if 0 (;@3;)
            local.get 1
            local.get 7
            i32.add
            global.get $GOT.data.internal.__memory_base
            i32.const 1051940
            i32.add
            local.get 3
            local.get 10
            i32.const 100
            i32.mul
            i32.sub
            i32.const 65535
            i32.and
            i32.const 1
            i32.shl
            local.tee 6
            i32.add
            i32.load8_u
            i32.store8
            local.get 4
            i32.const -1
            i32.add
            local.tee 4
            local.get 2
            i32.ge_u
            br_if 1 (;@2;)
            local.get 1
            local.get 4
            i32.add
            global.get $GOT.data.internal.__memory_base
            i32.const 1051940
            i32.add
            local.get 6
            i32.add
            i32.const 1
            i32.add
            i32.load8_u
            i32.store8
            br 2 (;@1;)
          end
          local.get 7
          local.get 2
          global.get $GOT.data.internal.__memory_base
          i32.const 1054900
          i32.add
          call $_ZN4core9panicking18panic_bounds_check17hbefee40b9c0b1c6bE
          unreachable
        end
        local.get 4
        local.get 2
        global.get $GOT.data.internal.__memory_base
        i32.const 1054900
        i32.add
        call $_ZN4core9panicking18panic_bounds_check17hbefee40b9c0b1c6bE
        unreachable
      end
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            local.get 0
            i32.eqz
            br_if 0 (;@3;)
            local.get 10
            i32.eqz
            br_if 1 (;@2;)
          end
          local.get 7
          i32.const -1
          i32.add
          local.tee 7
          local.get 2
          i32.ge_u
          br_if 1 (;@1;)
          local.get 1
          local.get 7
          i32.add
          global.get $GOT.data.internal.__memory_base
          i32.const 1051940
          i32.add
          local.get 10
          i32.const 1
          i32.shl
          i32.add
          i32.load8_u offset=1
          i32.store8
        end
        local.get 7
        return
      end
      local.get 7
      local.get 2
      global.get $GOT.data.internal.__memory_base
      i32.const 1054900
      i32.add
      call $_ZN4core9panicking18panic_bounds_check17hbefee40b9c0b1c6bE
      unreachable
    )
    (func $_ZN4core3fmt9Formatter12pad_integral17h92efc1b1156e5c6aE (;199;) (type 15) (param i32 i32 i32 i32 i32 i32) (result i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i64)
      block ;; label = @1
        block ;; label = @2
          local.get 1
          br_if 0 (;@2;)
          local.get 5
          i32.const 1
          i32.add
          local.set 6
          local.get 0
          i32.load offset=8
          local.set 7
          i32.const 45
          local.set 8
          br 1 (;@1;)
        end
        i32.const 43
        i32.const 1114112
        local.get 0
        i32.load offset=8
        local.tee 7
        i32.const 2097152
        i32.and
        local.tee 1
        select
        local.set 8
        local.get 1
        i32.const 21
        i32.shr_u
        local.get 5
        i32.add
        local.set 6
      end
      block ;; label = @1
        block ;; label = @2
          local.get 7
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
            call $_ZN4core3str5count14do_count_chars17h7374b7ea62e3e3a2E
            local.set 1
            br 1 (;@2;)
          end
          block ;; label = @3
            local.get 3
            br_if 0 (;@3;)
            i32.const 0
            local.set 1
            br 1 (;@2;)
          end
          local.get 3
          i32.const 3
          i32.and
          local.set 9
          block ;; label = @3
            block ;; label = @4
              local.get 3
              i32.const 4
              i32.ge_u
              br_if 0 (;@4;)
              i32.const 0
              local.set 10
              i32.const 0
              local.set 1
              br 1 (;@3;)
            end
            local.get 3
            i32.const 12
            i32.and
            local.set 11
            i32.const 0
            local.set 10
            i32.const 0
            local.set 1
            loop ;; label = @4
              local.get 1
              local.get 2
              local.get 10
              i32.add
              local.tee 12
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.get 12
              i32.const 1
              i32.add
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.get 12
              i32.const 2
              i32.add
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.get 12
              i32.const 3
              i32.add
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.set 1
              local.get 11
              local.get 10
              i32.const 4
              i32.add
              local.tee 10
              i32.ne
              br_if 0 (;@4;)
            end
          end
          local.get 9
          i32.eqz
          br_if 0 (;@2;)
          local.get 2
          local.get 10
          i32.add
          local.set 12
          loop ;; label = @3
            local.get 1
            local.get 12
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.set 1
            local.get 12
            i32.const 1
            i32.add
            local.set 12
            local.get 9
            i32.const -1
            i32.add
            local.tee 9
            br_if 0 (;@3;)
          end
        end
        local.get 1
        local.get 6
        i32.add
        local.set 6
      end
      block ;; label = @1
        block ;; label = @2
          local.get 6
          local.get 0
          i32.load16_u offset=12
          local.tee 11
          i32.ge_u
          br_if 0 (;@2;)
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                local.get 7
                i32.const 16777216
                i32.and
                br_if 0 (;@5;)
                local.get 11
                local.get 6
                i32.sub
                local.set 13
                i32.const 0
                local.set 1
                i32.const 0
                local.set 11
                block ;; label = @6
                  block ;; label = @7
                    block ;; label = @8
                      local.get 7
                      i32.const 29
                      i32.shr_u
                      i32.const 3
                      i32.and
                      br_table 2 (;@6;) 0 (;@8;) 1 (;@7;) 0 (;@8;) 2 (;@6;)
                    end
                    local.get 13
                    local.set 11
                    br 1 (;@6;)
                  end
                  local.get 13
                  i32.const 65534
                  i32.and
                  i32.const 1
                  i32.shr_u
                  local.set 11
                end
                local.get 7
                i32.const 2097151
                i32.and
                local.set 6
                local.get 0
                i32.load offset=4
                local.set 9
                local.get 0
                i32.load
                local.set 10
                loop ;; label = @6
                  local.get 1
                  i32.const 65535
                  i32.and
                  local.get 11
                  i32.const 65535
                  i32.and
                  i32.ge_u
                  br_if 2 (;@4;)
                  i32.const 1
                  local.set 12
                  local.get 1
                  i32.const 1
                  i32.add
                  local.set 1
                  local.get 10
                  local.get 6
                  local.get 9
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
              local.set 12
              local.get 0
              i32.load
              local.tee 10
              local.get 0
              i32.load offset=4
              local.tee 9
              local.get 8
              local.get 2
              local.get 3
              call $_ZN4core3fmt9Formatter12pad_integral12write_prefix17he430fbee53e753f6E
              br_if 3 (;@1;)
              i32.const 0
              local.set 1
              local.get 11
              local.get 6
              i32.sub
              i32.const 65535
              i32.and
              local.set 2
              loop ;; label = @5
                local.get 1
                i32.const 65535
                i32.and
                local.get 2
                i32.ge_u
                br_if 2 (;@3;)
                i32.const 1
                local.set 12
                local.get 1
                i32.const 1
                i32.add
                local.set 1
                local.get 10
                i32.const 48
                local.get 9
                i32.load offset=16
                call_indirect (type 4)
                i32.eqz
                br_if 0 (;@5;)
                br 4 (;@1;)
              end
            end
            i32.const 1
            local.set 12
            local.get 10
            local.get 9
            local.get 8
            local.get 2
            local.get 3
            call $_ZN4core3fmt9Formatter12pad_integral12write_prefix17he430fbee53e753f6E
            br_if 2 (;@1;)
            local.get 10
            local.get 4
            local.get 5
            local.get 9
            i32.load offset=12
            call_indirect (type 2)
            br_if 2 (;@1;)
            i32.const 0
            local.set 1
            local.get 13
            local.get 11
            i32.sub
            i32.const 65535
            i32.and
            local.set 0
            loop ;; label = @4
              local.get 1
              i32.const 65535
              i32.and
              local.tee 2
              local.get 0
              i32.lt_u
              local.set 12
              local.get 2
              local.get 0
              i32.ge_u
              br_if 3 (;@1;)
              local.get 1
              i32.const 1
              i32.add
              local.set 1
              local.get 10
              local.get 6
              local.get 9
              i32.load offset=16
              call_indirect (type 4)
              i32.eqz
              br_if 0 (;@4;)
              br 3 (;@1;)
            end
          end
          i32.const 1
          local.set 12
          local.get 10
          local.get 4
          local.get 5
          local.get 9
          i32.load offset=12
          call_indirect (type 2)
          br_if 1 (;@1;)
          local.get 0
          local.get 14
          i64.store offset=8 align=4
          i32.const 0
          return
        end
        i32.const 1
        local.set 12
        local.get 0
        i32.load
        local.tee 1
        local.get 0
        i32.load offset=4
        local.tee 10
        local.get 8
        local.get 2
        local.get 3
        call $_ZN4core3fmt9Formatter12pad_integral12write_prefix17he430fbee53e753f6E
        br_if 0 (;@1;)
        local.get 1
        local.get 4
        local.get 5
        local.get 10
        i32.load offset=12
        call_indirect (type 2)
        local.set 12
      end
      local.get 12
    )
    (func $_ZN4core9panicking9panic_fmt17hd2f72abdb0aff166E (;200;) (type 9) (param i32 i32 i32)
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
      call $_RNvCsdBezzDwma51_7___rustc17rust_begin_unwind
      unreachable
    )
    (func $_ZN4core3ffi5c_str4CStr19from_bytes_with_nul17h8c944c6e98076f57E (;201;) (type 9) (param i32 i32 i32)
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
    (func $_ZN4core9panicking18panic_bounds_check17hbefee40b9c0b1c6bE (;202;) (type 9) (param i32 i32 i32)
      (local i32 i64)
      global.get $__stack_pointer
      i32.const 32
      i32.sub
      local.tee 3
      global.set $__stack_pointer
      local.get 3
      local.get 1
      i32.store offset=12
      local.get 3
      local.get 0
      i32.store offset=8
      local.get 3
      global.get $GOT.func.internal._ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hd03bfcbf982015daE
      i64.extend_i32_u
      i64.const 32
      i64.shl
      local.tee 4
      local.get 3
      i32.const 8
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=24
      local.get 3
      local.get 4
      local.get 3
      i32.const 12
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=16
      global.get $GOT.data.internal.__memory_base
      i32.const 1048840
      i32.add
      local.get 3
      i32.const 16
      i32.add
      local.get 2
      call $_ZN4core9panicking9panic_fmt17hd2f72abdb0aff166E
      unreachable
    )
    (func $_ZN4core3fmt3num3imp21_$LT$impl$u20$u64$GT$10_fmt_inner17h1661a418afc77872E (;203;) (type 16) (param i64 i32 i32) (result i32)
      (local i64 i32 i32 i32 i64 i32 i32 i32 i32)
      local.get 0
      local.set 3
      local.get 2
      local.set 4
      block ;; label = @1
        local.get 0
        i64.const 1000
        i64.lt_u
        br_if 0 (;@1;)
        local.get 1
        i32.const -4
        i32.add
        local.set 5
        i32.const 0
        local.set 6
        local.get 0
        local.set 7
        block ;; label = @2
          block ;; label = @3
            loop ;; label = @4
              local.get 7
              local.get 7
              i64.const 10000
              i64.div_u
              local.tee 3
              i64.const 10000
              i64.mul
              i64.sub
              i32.wrap_i64
              local.tee 8
              i32.const 65535
              i32.and
              i32.const 100
              i32.div_u
              local.set 9
              block ;; label = @5
                block ;; label = @6
                  local.get 2
                  local.get 6
                  i32.add
                  local.tee 10
                  i32.const -4
                  i32.add
                  local.get 2
                  i32.ge_u
                  br_if 0 (;@6;)
                  local.get 5
                  local.get 2
                  i32.add
                  local.tee 4
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1051940
                  i32.add
                  local.get 9
                  i32.const 1
                  i32.shl
                  local.tee 11
                  i32.add
                  i32.load8_u
                  i32.store8
                  local.get 10
                  i32.const -3
                  i32.add
                  local.get 2
                  i32.lt_u
                  br_if 1 (;@5;)
                  local.get 10
                  i32.const -3
                  i32.add
                  local.get 2
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1054900
                  i32.add
                  call $_ZN4core9panicking18panic_bounds_check17hbefee40b9c0b1c6bE
                  unreachable
                end
                local.get 10
                i32.const -4
                i32.add
                local.get 2
                global.get $GOT.data.internal.__memory_base
                i32.const 1054900
                i32.add
                call $_ZN4core9panicking18panic_bounds_check17hbefee40b9c0b1c6bE
                unreachable
              end
              local.get 4
              i32.const 1
              i32.add
              global.get $GOT.data.internal.__memory_base
              i32.const 1051940
              i32.add
              local.get 11
              i32.add
              i32.const 1
              i32.add
              i32.load8_u
              i32.store8
              block ;; label = @5
                local.get 10
                i32.const -2
                i32.add
                local.get 2
                i32.ge_u
                br_if 0 (;@5;)
                local.get 4
                i32.const 2
                i32.add
                global.get $GOT.data.internal.__memory_base
                i32.const 1051940
                i32.add
                local.get 8
                local.get 9
                i32.const 100
                i32.mul
                i32.sub
                i32.const 1
                i32.shl
                i32.const 131070
                i32.and
                local.tee 9
                i32.add
                i32.load8_u
                i32.store8
                local.get 10
                i32.const -1
                i32.add
                local.get 2
                i32.ge_u
                br_if 2 (;@3;)
                local.get 4
                i32.const 3
                i32.add
                global.get $GOT.data.internal.__memory_base
                i32.const 1051940
                i32.add
                local.get 9
                i32.add
                i32.const 1
                i32.add
                i32.load8_u
                i32.store8
                local.get 5
                i32.const -4
                i32.add
                local.set 5
                local.get 6
                i32.const -4
                i32.add
                local.set 6
                local.get 7
                i64.const 9999999
                i64.gt_u
                local.set 10
                local.get 3
                local.set 7
                local.get 10
                i32.eqz
                br_if 3 (;@2;)
                br 1 (;@4;)
              end
            end
            local.get 10
            i32.const -2
            i32.add
            local.get 2
            global.get $GOT.data.internal.__memory_base
            i32.const 1054900
            i32.add
            call $_ZN4core9panicking18panic_bounds_check17hbefee40b9c0b1c6bE
            unreachable
          end
          local.get 10
          i32.const -1
          i32.add
          local.get 2
          global.get $GOT.data.internal.__memory_base
          i32.const 1054900
          i32.add
          call $_ZN4core9panicking18panic_bounds_check17hbefee40b9c0b1c6bE
          unreachable
        end
        local.get 2
        local.get 6
        i32.add
        local.set 4
      end
      block ;; label = @1
        block ;; label = @2
          local.get 3
          i64.const 9
          i64.gt_u
          br_if 0 (;@2;)
          local.get 4
          local.set 10
          br 1 (;@1;)
        end
        local.get 3
        i32.wrap_i64
        local.tee 5
        i32.const 65535
        i32.and
        i32.const 100
        i32.div_u
        local.set 6
        block ;; label = @2
          block ;; label = @3
            local.get 4
            i32.const -2
            i32.add
            local.tee 10
            local.get 2
            i32.ge_u
            br_if 0 (;@3;)
            local.get 1
            local.get 10
            i32.add
            global.get $GOT.data.internal.__memory_base
            i32.const 1051940
            i32.add
            local.get 5
            local.get 6
            i32.const 100
            i32.mul
            i32.sub
            i32.const 65535
            i32.and
            i32.const 1
            i32.shl
            local.tee 5
            i32.add
            i32.load8_u
            i32.store8
            local.get 4
            i32.const -1
            i32.add
            local.tee 4
            local.get 2
            i32.ge_u
            br_if 1 (;@2;)
            local.get 6
            i64.extend_i32_u
            local.set 3
            local.get 1
            local.get 4
            i32.add
            global.get $GOT.data.internal.__memory_base
            i32.const 1051940
            i32.add
            local.get 5
            i32.add
            i32.const 1
            i32.add
            i32.load8_u
            i32.store8
            br 2 (;@1;)
          end
          local.get 10
          local.get 2
          global.get $GOT.data.internal.__memory_base
          i32.const 1054900
          i32.add
          call $_ZN4core9panicking18panic_bounds_check17hbefee40b9c0b1c6bE
          unreachable
        end
        local.get 4
        local.get 2
        global.get $GOT.data.internal.__memory_base
        i32.const 1054900
        i32.add
        call $_ZN4core9panicking18panic_bounds_check17hbefee40b9c0b1c6bE
        unreachable
      end
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            local.get 0
            i64.eqz
            br_if 0 (;@3;)
            local.get 3
            i64.const 0
            i64.eq
            br_if 1 (;@2;)
          end
          local.get 10
          i32.const -1
          i32.add
          local.tee 10
          local.get 2
          i32.ge_u
          br_if 1 (;@1;)
          local.get 1
          local.get 10
          i32.add
          global.get $GOT.data.internal.__memory_base
          i32.const 1051940
          i32.add
          local.get 3
          i32.wrap_i64
          i32.const 1
          i32.shl
          i32.add
          i32.load8_u offset=1
          i32.store8
        end
        local.get 10
        return
      end
      local.get 10
      local.get 2
      global.get $GOT.data.internal.__memory_base
      i32.const 1054900
      i32.add
      call $_ZN4core9panicking18panic_bounds_check17hbefee40b9c0b1c6bE
      unreachable
    )
    (func $_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hd03bfcbf982015daE (;204;) (type 4) (param i32 i32) (result i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 2
      global.set $__stack_pointer
      local.get 1
      i32.const 1
      i32.const 1
      i32.const 0
      local.get 2
      i32.const 6
      i32.add
      local.get 0
      i32.load
      local.get 2
      i32.const 6
      i32.add
      i32.const 10
      call $_ZN4core3fmt3num3imp21_$LT$impl$u20$u32$GT$10_fmt_inner17habec0c7d2ee1a866E
      local.tee 0
      i32.add
      i32.const 10
      local.get 0
      i32.sub
      call $_ZN4core3fmt9Formatter12pad_integral17h92efc1b1156e5c6aE
      local.set 0
      local.get 2
      i32.const 16
      i32.add
      global.set $__stack_pointer
      local.get 0
    )
    (func $_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u64$GT$3fmt17h05089fcc125d9651E (;205;) (type 4) (param i32 i32) (result i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 32
      i32.sub
      local.tee 2
      global.set $__stack_pointer
      local.get 1
      i32.const 1
      i32.const 1
      i32.const 0
      local.get 2
      i32.const 12
      i32.add
      local.get 0
      i64.load
      local.get 2
      i32.const 12
      i32.add
      i32.const 20
      call $_ZN4core3fmt3num3imp21_$LT$impl$u20$u64$GT$10_fmt_inner17h1661a418afc77872E
      local.tee 0
      i32.add
      i32.const 20
      local.get 0
      i32.sub
      call $_ZN4core3fmt9Formatter12pad_integral17h92efc1b1156e5c6aE
      local.set 0
      local.get 2
      i32.const 32
      i32.add
      global.set $__stack_pointer
      local.get 0
    )
    (func $_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$u64$GT$3fmt17h8c687a3c8e01ab2bE (;206;) (type 4) (param i32 i32) (result i32)
      (local i32 i64 i32)
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
        i32.const 1052140
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
        i64.const 15
        i64.gt_u
        local.set 4
        local.get 3
        i64.const 4
        i64.shr_u
        local.set 3
        local.get 4
        br_if 0 (;@1;)
      end
      local.get 1
      i32.const 1
      global.get $GOT.data.internal.__memory_base
      i32.const 1052156
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
      call $_ZN4core3fmt9Formatter12pad_integral17h92efc1b1156e5c6aE
      local.set 0
      local.get 2
      i32.const 16
      i32.add
      global.set $__stack_pointer
      local.get 0
    )
    (func $_ZN4core5slice5index16slice_index_fail17hdbc11bcfa6a172dbE (;207;) (type 1) (param i32 i32 i32 i32)
      block ;; label = @1
        block ;; label = @2
          local.get 0
          local.get 2
          i32.gt_u
          br_if 0 (;@2;)
          local.get 1
          local.get 2
          i32.gt_u
          br_if 1 (;@1;)
          local.get 0
          local.get 1
          i32.le_u
          br_if 1 (;@1;)
          local.get 0
          local.get 1
          local.get 3
          call $_ZN4core5slice5index16slice_index_fail8do_panic7runtime17h5812bc59c3cd61b2E
          unreachable
        end
        local.get 0
        local.get 2
        local.get 3
        call $_ZN4core5slice5index16slice_index_fail8do_panic7runtime17hb814b290150820e7E
        unreachable
      end
      local.get 1
      local.get 2
      local.get 3
      call $_ZN4core5slice5index16slice_index_fail8do_panic7runtime17h0fafb702a7364918E
      unreachable
    )
    (func $_ZN4core9panicking5panic17h0445be39967a97afE (;208;) (type 9) (param i32 i32 i32)
      local.get 0
      local.get 1
      i32.const 1
      i32.shl
      i32.const 1
      i32.or
      local.get 2
      call $_ZN4core9panicking9panic_fmt17hd2f72abdb0aff166E
      unreachable
    )
    (func $_ZN4core3fmt9Formatter12pad_integral12write_prefix17he430fbee53e753f6E (;209;) (type 10) (param i32 i32 i32 i32 i32) (result i32)
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
      call_indirect (type 2)
    )
    (func $_ZN4core3str5count14do_count_chars17h7374b7ea62e3e3a2E (;210;) (type 4) (param i32 i32) (result i32)
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
          i32.const 4
          i32.lt_u
          br_if 0 (;@2;)
          local.get 4
          i32.const 3
          i32.and
          local.set 5
          i32.const 0
          local.set 6
          i32.const 0
          local.set 1
          block ;; label = @3
            local.get 2
            local.get 0
            i32.eq
            br_if 0 (;@3;)
            i32.const 0
            local.set 7
            i32.const 0
            local.set 1
            block ;; label = @4
              local.get 0
              local.get 2
              i32.sub
              local.tee 8
              i32.const -4
              i32.gt_u
              br_if 0 (;@4;)
              i32.const 0
              local.set 7
              i32.const 0
              local.set 1
              loop ;; label = @5
                local.get 1
                local.get 0
                local.get 7
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
                local.get 7
                i32.const 4
                i32.add
                local.tee 7
                br_if 0 (;@5;)
              end
            end
            local.get 0
            local.get 7
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
              local.get 8
              i32.const 1
              i32.add
              local.tee 8
              br_if 0 (;@4;)
            end
          end
          local.get 0
          local.get 3
          i32.add
          local.set 8
          block ;; label = @3
            local.get 5
            i32.eqz
            br_if 0 (;@3;)
            local.get 8
            local.get 4
            i32.const 2147483644
            i32.and
            i32.add
            local.tee 2
            i32.load8_s
            i32.const -65
            i32.gt_s
            local.set 6
            local.get 5
            i32.const 1
            i32.eq
            br_if 0 (;@3;)
            local.get 6
            local.get 2
            i32.load8_s offset=1
            i32.const -65
            i32.gt_s
            i32.add
            local.set 6
            local.get 5
            i32.const 2
            i32.eq
            br_if 0 (;@3;)
            local.get 6
            local.get 2
            i32.load8_s offset=2
            i32.const -65
            i32.gt_s
            i32.add
            local.set 6
          end
          local.get 4
          i32.const 2
          i32.shr_u
          local.set 3
          local.get 6
          local.get 1
          i32.add
          local.set 7
          loop ;; label = @3
            local.get 8
            local.set 6
            local.get 3
            i32.eqz
            br_if 2 (;@1;)
            local.get 3
            i32.const 192
            local.get 3
            i32.const 192
            i32.lt_u
            select
            local.tee 4
            i32.const 3
            i32.and
            local.set 5
            block ;; label = @4
              block ;; label = @5
                local.get 4
                i32.const 2
                i32.shl
                local.tee 9
                i32.const 1008
                i32.and
                local.tee 8
                br_if 0 (;@5;)
                i32.const 0
                local.set 2
                br 1 (;@4;)
              end
              i32.const 0
              local.set 2
              local.get 6
              local.set 1
              loop ;; label = @5
                local.get 1
                i32.const 12
                i32.add
                i32.load
                local.tee 0
                i32.const -1
                i32.xor
                i32.const 7
                i32.shr_u
                local.get 0
                i32.const 6
                i32.shr_u
                i32.or
                i32.const 16843009
                i32.and
                local.get 1
                i32.const 8
                i32.add
                i32.load
                local.tee 0
                i32.const -1
                i32.xor
                i32.const 7
                i32.shr_u
                local.get 0
                i32.const 6
                i32.shr_u
                i32.or
                i32.const 16843009
                i32.and
                local.get 1
                i32.const 4
                i32.add
                i32.load
                local.tee 0
                i32.const -1
                i32.xor
                i32.const 7
                i32.shr_u
                local.get 0
                i32.const 6
                i32.shr_u
                i32.or
                i32.const 16843009
                i32.and
                local.get 1
                i32.load
                local.tee 0
                i32.const -1
                i32.xor
                i32.const 7
                i32.shr_u
                local.get 0
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
                local.set 1
                local.get 8
                i32.const -16
                i32.add
                local.tee 8
                br_if 0 (;@5;)
              end
            end
            local.get 3
            local.get 4
            i32.sub
            local.set 3
            local.get 6
            local.get 9
            i32.add
            local.set 8
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
            local.get 7
            i32.add
            local.set 7
            local.get 5
            i32.eqz
            br_if 0 (;@3;)
          end
          local.get 6
          local.get 4
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
            local.get 5
            i32.const 1
            i32.eq
            br_if 0 (;@3;)
            local.get 2
            i32.load offset=4
            local.tee 8
            i32.const -1
            i32.xor
            i32.const 7
            i32.shr_u
            local.get 8
            i32.const 6
            i32.shr_u
            i32.or
            i32.const 16843009
            i32.and
            local.get 1
            i32.add
            local.set 1
            local.get 5
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
          local.get 7
          i32.add
          local.set 7
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
        local.set 8
        block ;; label = @2
          block ;; label = @3
            local.get 1
            i32.const 4
            i32.ge_u
            br_if 0 (;@3;)
            i32.const 0
            local.set 2
            i32.const 0
            local.set 7
            br 1 (;@2;)
          end
          local.get 1
          i32.const -4
          i32.and
          local.set 3
          i32.const 0
          local.set 2
          i32.const 0
          local.set 7
          loop ;; label = @3
            local.get 7
            local.get 0
            local.get 2
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
            local.set 7
            local.get 3
            local.get 2
            i32.const 4
            i32.add
            local.tee 2
            i32.ne
            br_if 0 (;@3;)
          end
        end
        local.get 8
        i32.eqz
        br_if 0 (;@1;)
        local.get 0
        local.get 2
        i32.add
        local.set 1
        loop ;; label = @2
          local.get 7
          local.get 1
          i32.load8_s
          i32.const -65
          i32.gt_s
          i32.add
          local.set 7
          local.get 1
          i32.const 1
          i32.add
          local.set 1
          local.get 8
          i32.const -1
          i32.add
          local.tee 8
          br_if 0 (;@2;)
        end
      end
      local.get 7
    )
    (func $_ZN4core3fmt9Formatter9write_str17h34f77234b6666431E (;211;) (type 2) (param i32 i32 i32) (result i32)
      local.get 0
      i32.load
      local.get 1
      local.get 2
      local.get 0
      i32.load offset=4
      i32.load offset=12
      call_indirect (type 2)
    )
    (func $_ZN4core3str19slice_error_fail_rt17h54edf58acd8686c9E (;212;) (type 13) (param i32 i32 i32 i32 i32)
      (local i32 i32 i32 i64)
      global.get $__stack_pointer
      i32.const 80
      i32.sub
      local.tee 5
      global.set $__stack_pointer
      local.get 5
      local.get 3
      i32.store offset=4
      local.get 5
      local.get 2
      i32.store
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              local.get 1
              i32.const 257
              i32.lt_u
              br_if 0 (;@4;)
              i32.const 253
              local.set 6
              loop ;; label = @5
                block ;; label = @6
                  block ;; label = @7
                    local.get 0
                    local.get 6
                    i32.add
                    local.tee 7
                    i32.const 3
                    i32.add
                    i32.load8_s
                    i32.const -65
                    i32.gt_s
                    br_if 0 (;@7;)
                    local.get 7
                    i32.const 2
                    i32.add
                    i32.load8_s
                    i32.const -65
                    i32.le_s
                    br_if 1 (;@6;)
                    local.get 6
                    i32.const 2
                    i32.add
                    local.set 6
                    br 5 (;@2;)
                  end
                  local.get 6
                  i32.const 3
                  i32.add
                  local.set 6
                  br 4 (;@2;)
                end
                local.get 7
                i32.const 1
                i32.add
                i32.load8_s
                i32.const -65
                i32.gt_s
                br_if 2 (;@3;)
                local.get 7
                i32.load8_s
                i32.const -65
                i32.gt_s
                br_if 3 (;@2;)
                local.get 6
                i32.const -4
                i32.add
                local.tee 6
                i32.const -3
                i32.ne
                br_if 0 (;@5;)
              end
              i32.const 0
              local.set 6
              br 2 (;@2;)
            end
            local.get 5
            local.get 1
            i32.store offset=12
            local.get 5
            local.get 0
            i32.store offset=8
            i32.const 0
            local.set 6
            i32.const 1
            local.set 7
            br 2 (;@1;)
          end
          local.get 6
          i32.const 1
          i32.add
          local.set 6
        end
        local.get 5
        local.get 0
        i32.store offset=8
        global.get $GOT.data.internal.__memory_base
        local.set 7
        local.get 5
        local.get 6
        i32.store offset=12
        local.get 7
        i32.const 1052174
        i32.add
        i32.const 1
        local.get 6
        local.get 1
        i32.lt_u
        local.tee 6
        select
        local.set 7
        i32.const 5
        i32.const 0
        local.get 6
        select
        local.set 6
      end
      local.get 5
      local.get 6
      i32.store offset=20
      local.get 5
      local.get 7
      i32.store offset=16
      block ;; label = @1
        block ;; label = @2
          local.get 2
          local.get 1
          i32.gt_u
          br_if 0 (;@2;)
          local.get 3
          local.get 1
          i32.le_u
          br_if 1 (;@1;)
          local.get 3
          local.set 2
        end
        local.get 5
        local.get 2
        i32.store offset=32
        local.get 5
        global.get $GOT.func.internal._ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hd03bfcbf982015daE
        i64.extend_i32_u
        i64.const 32
        i64.shl
        local.get 5
        i32.const 32
        i32.add
        i64.extend_i32_u
        i64.or
        i64.store offset=40
        local.get 5
        global.get $GOT.data.internal.__table_base
        i32.const 69
        i32.add
        i64.extend_i32_u
        i64.const 32
        i64.shl
        local.tee 8
        local.get 5
        i32.const 16
        i32.add
        i64.extend_i32_u
        i64.or
        i64.store offset=56
        local.get 5
        local.get 8
        local.get 5
        i32.const 8
        i32.add
        i64.extend_i32_u
        i64.or
        i64.store offset=48
        global.get $GOT.data.internal.__memory_base
        i32.const 1048676
        i32.add
        local.get 5
        i32.const 40
        i32.add
        local.get 4
        call $_ZN4core9panicking9panic_fmt17hd2f72abdb0aff166E
        unreachable
      end
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                local.get 2
                local.get 3
                i32.gt_u
                br_if 0 (;@5;)
                block ;; label = @6
                  block ;; label = @7
                    local.get 2
                    i32.eqz
                    br_if 0 (;@7;)
                    local.get 2
                    local.get 1
                    i32.ge_u
                    br_if 0 (;@7;)
                    local.get 0
                    local.get 2
                    i32.add
                    i32.load8_s
                    i32.const -64
                    i32.lt_s
                    br_if 1 (;@6;)
                  end
                  local.get 3
                  local.set 2
                end
                local.get 5
                local.get 2
                i32.store offset=24
                local.get 2
                local.get 1
                i32.ge_u
                br_if 2 (;@3;)
                i32.const 0
                local.set 7
                local.get 2
                i32.eqz
                br_if 1 (;@4;)
                loop ;; label = @6
                  block ;; label = @7
                    local.get 0
                    local.get 2
                    i32.add
                    i32.load8_s
                    i32.const -65
                    i32.le_s
                    br_if 0 (;@7;)
                    local.get 2
                    local.set 7
                    br 3 (;@4;)
                  end
                  local.get 2
                  i32.const -1
                  i32.add
                  local.tee 2
                  br_if 0 (;@6;)
                  br 2 (;@4;)
                end
              end
              local.get 5
              global.get $GOT.func.internal._ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hd03bfcbf982015daE
              i64.extend_i32_u
              i64.const 32
              i64.shl
              local.tee 8
              local.get 5
              i32.const 4
              i32.add
              i64.extend_i32_u
              i64.or
              i64.store offset=48
              local.get 5
              local.get 8
              local.get 5
              i64.extend_i32_u
              i64.or
              i64.store offset=40
              local.get 5
              global.get $GOT.data.internal.__table_base
              i32.const 69
              i32.add
              i64.extend_i32_u
              i64.const 32
              i64.shl
              local.tee 8
              local.get 5
              i32.const 16
              i32.add
              i64.extend_i32_u
              i64.or
              i64.store offset=64
              local.get 5
              local.get 8
              local.get 5
              i32.const 8
              i32.add
              i64.extend_i32_u
              i64.or
              i64.store offset=56
              global.get $GOT.data.internal.__memory_base
              i32.const 1048632
              i32.add
              local.get 5
              i32.const 40
              i32.add
              local.get 4
              call $_ZN4core9panicking9panic_fmt17hd2f72abdb0aff166E
              unreachable
            end
            local.get 7
            local.get 1
            i32.eq
            br_if 0 (;@3;)
            block ;; label = @4
              block ;; label = @5
                local.get 0
                local.get 7
                i32.add
                local.tee 0
                i32.load8_s
                local.tee 6
                i32.const -1
                i32.gt_s
                br_if 0 (;@5;)
                local.get 0
                i32.load8_u offset=1
                i32.const 63
                i32.and
                local.set 2
                local.get 6
                i32.const 31
                i32.and
                local.set 1
                local.get 6
                i32.const -33
                i32.gt_u
                br_if 1 (;@4;)
                local.get 1
                i32.const 6
                i32.shl
                local.get 2
                i32.or
                local.set 6
                br 3 (;@2;)
              end
              local.get 5
              local.get 6
              i32.const 255
              i32.and
              i32.store offset=28
              i32.const 1
              local.set 6
              br 3 (;@1;)
            end
            local.get 2
            i32.const 6
            i32.shl
            local.get 0
            i32.load8_u offset=2
            i32.const 63
            i32.and
            i32.or
            local.set 2
            block ;; label = @4
              local.get 6
              i32.const -16
              i32.ge_u
              br_if 0 (;@4;)
              local.get 2
              local.get 1
              i32.const 12
              i32.shl
              i32.or
              local.set 6
              br 2 (;@2;)
            end
            local.get 2
            i32.const 6
            i32.shl
            local.get 0
            i32.load8_u offset=3
            i32.const 63
            i32.and
            i32.or
            local.get 1
            i32.const 18
            i32.shl
            i32.const 1835008
            i32.and
            i32.or
            local.tee 6
            i32.const 1114112
            i32.ne
            br_if 1 (;@2;)
          end
          local.get 4
          call $_ZN4core6option13unwrap_failed17h46c842306997fe98E
          unreachable
        end
        local.get 5
        local.get 6
        i32.store offset=28
        block ;; label = @2
          local.get 6
          i32.const 128
          i32.ge_u
          br_if 0 (;@2;)
          i32.const 1
          local.set 6
          br 1 (;@1;)
        end
        block ;; label = @2
          local.get 6
          i32.const 2048
          i32.ge_u
          br_if 0 (;@2;)
          i32.const 2
          local.set 6
          br 1 (;@1;)
        end
        i32.const 3
        i32.const 4
        local.get 6
        i32.const 65536
        i32.lt_u
        select
        local.set 6
      end
      local.get 5
      local.get 7
      i32.store offset=32
      local.get 5
      local.get 6
      local.get 7
      i32.add
      i32.store offset=36
      local.get 5
      global.get $GOT.data.internal.__table_base
      local.tee 7
      i32.const 69
      i32.add
      i64.extend_i32_u
      i64.const 32
      i64.shl
      local.tee 8
      local.get 5
      i32.const 16
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=72
      local.get 5
      local.get 8
      local.get 5
      i32.const 8
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=64
      local.get 5
      local.get 7
      i32.const 70
      i32.add
      i64.extend_i32_u
      i64.const 32
      i64.shl
      local.get 5
      i32.const 32
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=56
      local.get 5
      global.get $GOT.func.internal._ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h4faf6c8527f1f06dE
      i64.extend_i32_u
      i64.const 32
      i64.shl
      local.get 5
      i32.const 28
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=48
      local.get 5
      global.get $GOT.func.internal._ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hd03bfcbf982015daE
      i64.extend_i32_u
      i64.const 32
      i64.shl
      local.get 5
      i32.const 24
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=40
      global.get $GOT.data.internal.__memory_base
      i32.const 1048717
      i32.add
      local.get 5
      i32.const 40
      i32.add
      local.get 4
      call $_ZN4core9panicking9panic_fmt17hd2f72abdb0aff166E
      unreachable
    )
    (func $_ZN4core6option13unwrap_failed17h46c842306997fe98E (;213;) (type 0) (param i32)
      global.get $GOT.data.internal.__memory_base
      i32.const 1052179
      i32.add
      i32.const 43
      local.get 0
      call $_ZN4core9panicking5panic17h0445be39967a97afE
      unreachable
    )
    (func $_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h00633e517acb8d0eE (;214;) (type 4) (param i32 i32) (result i32)
      (local i32 i32)
      i32.const 1
      local.set 2
      block ;; label = @1
        local.get 0
        local.get 1
        call $_ZN4core3fmt3num50_$LT$impl$u20$core..fmt..Debug$u20$for$u20$u32$GT$3fmt17h559c227a3154a656E
        br_if 0 (;@1;)
        global.get $GOT.data.internal.__memory_base
        local.set 3
        local.get 1
        i32.load
        local.get 3
        i32.const 1053827
        i32.add
        i32.const 2
        local.get 1
        i32.load offset=4
        i32.load offset=12
        call_indirect (type 2)
        br_if 0 (;@1;)
        local.get 0
        i32.const 4
        i32.add
        local.get 1
        call $_ZN4core3fmt3num50_$LT$impl$u20$core..fmt..Debug$u20$for$u20$u32$GT$3fmt17h559c227a3154a656E
        local.set 2
      end
      local.get 2
    )
    (func $_ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17h8cb9155decd1f16eE (;215;) (type 14) (param i32) (result i32)
      (local i32 i32 i32 i32 i32)
      i32.const 0
      local.set 1
      global.get $GOT.data.internal.__memory_base
      i32.const 1052224
      i32.add
      local.tee 2
      local.get 2
      i32.const 0
      i32.const 16
      local.get 0
      i32.const 69291
      i32.lt_u
      select
      local.tee 3
      local.get 3
      i32.const 8
      i32.or
      local.tee 3
      local.get 2
      local.get 3
      i32.const 2
      i32.shl
      i32.add
      i32.load
      i32.const 11
      i32.shl
      local.get 0
      i32.const 11
      i32.shl
      local.tee 3
      i32.gt_u
      select
      local.tee 4
      local.get 4
      i32.const 4
      i32.or
      local.tee 4
      local.get 2
      local.get 4
      i32.const 2
      i32.shl
      i32.add
      i32.load
      i32.const 11
      i32.shl
      local.get 3
      i32.gt_u
      select
      local.tee 4
      local.get 4
      i32.const 2
      i32.or
      local.tee 4
      local.get 2
      local.get 4
      i32.const 2
      i32.shl
      i32.add
      i32.load
      i32.const 11
      i32.shl
      local.get 3
      i32.gt_u
      select
      local.tee 4
      local.get 4
      i32.const 1
      i32.add
      local.tee 4
      local.get 2
      local.get 4
      i32.const 2
      i32.shl
      i32.add
      i32.load
      i32.const 11
      i32.shl
      local.get 3
      i32.gt_u
      select
      local.tee 4
      local.get 4
      i32.const 1
      i32.add
      local.tee 4
      local.get 2
      local.get 4
      i32.const 2
      i32.shl
      i32.add
      i32.load
      i32.const 11
      i32.shl
      local.get 3
      i32.gt_u
      select
      local.tee 4
      i32.const 2
      i32.shl
      i32.add
      i32.load
      i32.const 11
      i32.shl
      local.tee 2
      local.get 3
      i32.eq
      local.get 2
      local.get 3
      i32.lt_u
      i32.add
      local.get 4
      i32.add
      local.tee 4
      i32.const 2
      i32.shl
      i32.add
      local.tee 5
      i32.load
      i32.const 21
      i32.shr_u
      local.set 2
      i32.const 767
      local.set 3
      block ;; label = @1
        block ;; label = @2
          local.get 4
          i32.const 31
          i32.gt_u
          br_if 0 (;@2;)
          local.get 5
          i32.load offset=4
          i32.const 21
          i32.shr_u
          local.set 3
          local.get 4
          i32.eqz
          br_if 1 (;@1;)
        end
        local.get 5
        i32.const -4
        i32.add
        i32.load
        i32.const 2097151
        i32.and
        local.set 1
      end
      block ;; label = @1
        local.get 3
        local.get 2
        i32.const -1
        i32.xor
        i32.add
        i32.eqz
        br_if 0 (;@1;)
        local.get 0
        local.get 1
        i32.sub
        local.set 0
        local.get 3
        i32.const -1
        i32.add
        local.set 4
        i32.const 0
        local.set 3
        loop ;; label = @2
          local.get 3
          global.get $GOT.data.internal.__memory_base
          i32.const 1051164
          i32.add
          local.get 2
          i32.add
          i32.load8_u
          i32.add
          local.tee 3
          local.get 0
          i32.gt_u
          br_if 1 (;@1;)
          local.get 4
          local.get 2
          i32.const 1
          i32.add
          local.tee 2
          i32.ne
          br_if 0 (;@2;)
        end
      end
      local.get 2
      i32.const 1
      i32.and
    )
    (func $_ZN4core7unicode9printable12is_printable17h725c9c4a43be5724E (;216;) (type 14) (param i32) (result i32)
      (local i32 i32 i32 i32 i32 i32 i32)
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            local.get 0
            i32.const 32
            i32.lt_u
            br_if 0 (;@3;)
            block ;; label = @4
              local.get 0
              i32.const 127
              i32.ge_u
              br_if 0 (;@4;)
              i32.const 1
              local.set 1
              br 3 (;@1;)
            end
            block ;; label = @4
              block ;; label = @5
                local.get 0
                i32.const 65536
                i32.lt_u
                br_if 0 (;@5;)
                local.get 0
                i32.const 131072
                i32.lt_u
                br_if 1 (;@4;)
                local.get 0
                i32.const 2097150
                i32.and
                local.tee 1
                i32.const 183982
                i32.ne
                local.get 0
                i32.const 2097120
                i32.and
                i32.const 173792
                i32.ne
                local.get 1
                i32.const 178206
                i32.ne
                i32.and
                i32.and
                local.get 0
                i32.const -191472
                i32.add
                i32.const -15
                i32.lt_u
                i32.and
                local.get 0
                i32.const -194560
                i32.add
                i32.const -2466
                i32.lt_u
                i32.and
                local.get 0
                i32.const -196608
                i32.add
                i32.const -1506
                i32.lt_u
                i32.and
                local.get 0
                i32.const -201552
                i32.add
                i32.const -5
                i32.lt_u
                i32.and
                local.get 0
                i32.const -917760
                i32.add
                i32.const -707718
                i32.lt_u
                i32.and
                local.get 0
                i32.const 918000
                i32.lt_u
                i32.and
                local.set 1
                br 4 (;@1;)
              end
              global.get $GOT.data.internal.__memory_base
              i32.const 1053164
              i32.add
              local.tee 2
              i32.const 2
              i32.add
              local.set 1
              local.get 0
              i32.const 8
              i32.shr_u
              i32.const 255
              i32.and
              local.set 3
              i32.const 0
              local.set 4
              block ;; label = @5
                loop ;; label = @6
                  local.get 1
                  local.set 5
                  local.get 4
                  local.get 2
                  i32.load8_u offset=1
                  local.tee 1
                  i32.add
                  local.set 6
                  block ;; label = @7
                    block ;; label = @8
                      local.get 2
                      i32.load8_u
                      local.tee 2
                      local.get 3
                      i32.eq
                      br_if 0 (;@8;)
                      local.get 2
                      local.get 3
                      i32.gt_u
                      br_if 3 (;@5;)
                      br 1 (;@7;)
                    end
                    block ;; label = @8
                      local.get 6
                      local.get 4
                      i32.lt_u
                      br_if 0 (;@8;)
                      local.get 6
                      i32.const 284
                      i32.gt_u
                      br_if 0 (;@8;)
                      global.get $GOT.data.internal.__memory_base
                      i32.const 1053240
                      i32.add
                      local.get 4
                      i32.add
                      local.set 2
                      loop ;; label = @9
                        local.get 1
                        i32.eqz
                        br_if 2 (;@7;)
                        local.get 1
                        i32.const -1
                        i32.add
                        local.set 1
                        local.get 2
                        i32.load8_u
                        local.set 4
                        local.get 2
                        i32.const 1
                        i32.add
                        local.set 2
                        local.get 4
                        local.get 0
                        i32.const 255
                        i32.and
                        i32.ne
                        br_if 0 (;@9;)
                        br 6 (;@3;)
                      end
                    end
                    local.get 4
                    local.get 6
                    i32.const 284
                    global.get $GOT.data.internal.__memory_base
                    i32.const 1054932
                    i32.add
                    call $_ZN4core5slice5index16slice_index_fail17hdbc11bcfa6a172dbE
                    unreachable
                  end
                  local.get 5
                  i32.const 0
                  i32.const 2
                  local.get 5
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1053164
                  i32.add
                  i32.const 76
                  i32.add
                  local.tee 7
                  i32.eq
                  select
                  i32.add
                  local.set 1
                  local.get 6
                  local.set 4
                  local.get 5
                  local.set 2
                  local.get 5
                  local.get 7
                  i32.ne
                  br_if 0 (;@6;)
                end
              end
              i32.const 1
              local.set 1
              i32.const 0
              local.set 2
              loop ;; label = @5
                local.get 2
                i32.const 1
                i32.add
                local.set 5
                block ;; label = @6
                  block ;; label = @7
                    global.get $GOT.data.internal.__memory_base
                    i32.const 1053524
                    i32.add
                    local.get 2
                    i32.add
                    i32.load8_s
                    local.tee 4
                    i32.const 0
                    i32.lt_s
                    br_if 0 (;@7;)
                    local.get 5
                    local.set 2
                    br 1 (;@6;)
                  end
                  block ;; label = @7
                    local.get 5
                    i32.const 292
                    i32.eq
                    br_if 0 (;@7;)
                    local.get 4
                    i32.const 127
                    i32.and
                    i32.const 8
                    i32.shl
                    global.get $GOT.data.internal.__memory_base
                    i32.const 1053524
                    i32.add
                    local.get 2
                    i32.add
                    i32.const 1
                    i32.add
                    i32.load8_u
                    i32.or
                    local.set 4
                    local.get 2
                    i32.const 2
                    i32.add
                    local.set 2
                    br 1 (;@6;)
                  end
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1054916
                  i32.add
                  call $_ZN4core6option13unwrap_failed17h46c842306997fe98E
                  unreachable
                end
                local.get 0
                local.get 4
                i32.sub
                local.tee 0
                i32.const 0
                i32.lt_s
                br_if 4 (;@1;)
                local.get 1
                i32.const 1
                i32.xor
                local.set 1
                local.get 2
                i32.const 292
                i32.ne
                br_if 0 (;@5;)
                br 4 (;@1;)
              end
            end
            global.get $GOT.data.internal.__memory_base
            i32.const 1052356
            i32.add
            local.tee 2
            i32.const 2
            i32.add
            local.set 1
            local.get 0
            i32.const 8
            i32.shr_u
            i32.const 255
            i32.and
            local.set 3
            i32.const 0
            local.set 4
            loop ;; label = @4
              local.get 1
              local.set 5
              local.get 4
              local.get 2
              i32.load8_u offset=1
              local.tee 1
              i32.add
              local.set 6
              block ;; label = @5
                block ;; label = @6
                  local.get 2
                  i32.load8_u
                  local.tee 2
                  local.get 3
                  i32.eq
                  br_if 0 (;@6;)
                  local.get 2
                  local.get 3
                  i32.le_u
                  br_if 1 (;@5;)
                  br 4 (;@2;)
                end
                block ;; label = @6
                  local.get 6
                  local.get 4
                  i32.lt_u
                  br_if 0 (;@6;)
                  local.get 6
                  i32.const 212
                  i32.gt_u
                  br_if 0 (;@6;)
                  global.get $GOT.data.internal.__memory_base
                  i32.const 1052448
                  i32.add
                  local.get 4
                  i32.add
                  local.set 2
                  loop ;; label = @7
                    local.get 1
                    i32.eqz
                    br_if 2 (;@5;)
                    local.get 1
                    i32.const -1
                    i32.add
                    local.set 1
                    local.get 2
                    i32.load8_u
                    local.set 4
                    local.get 2
                    i32.const 1
                    i32.add
                    local.set 2
                    local.get 4
                    local.get 0
                    i32.const 255
                    i32.and
                    i32.ne
                    br_if 0 (;@7;)
                    br 4 (;@3;)
                  end
                end
                local.get 4
                local.get 6
                i32.const 212
                global.get $GOT.data.internal.__memory_base
                i32.const 1054932
                i32.add
                call $_ZN4core5slice5index16slice_index_fail17hdbc11bcfa6a172dbE
                unreachable
              end
              local.get 5
              i32.const 0
              i32.const 2
              local.get 5
              global.get $GOT.data.internal.__memory_base
              i32.const 1052356
              i32.add
              i32.const 92
              i32.add
              i32.eq
              local.tee 7
              select
              i32.add
              local.set 1
              local.get 6
              local.set 4
              local.get 5
              local.set 2
              local.get 7
              i32.eqz
              br_if 0 (;@4;)
              br 2 (;@2;)
            end
          end
          i32.const 0
          local.set 1
          br 1 (;@1;)
        end
        local.get 0
        i32.const 65535
        i32.and
        local.set 4
        i32.const 1
        local.set 1
        i32.const 0
        local.set 2
        loop ;; label = @2
          local.get 2
          i32.const 1
          i32.add
          local.set 5
          block ;; label = @3
            block ;; label = @4
              global.get $GOT.data.internal.__memory_base
              i32.const 1052660
              i32.add
              local.get 2
              i32.add
              i32.load8_s
              local.tee 0
              i32.const 0
              i32.lt_s
              br_if 0 (;@4;)
              local.get 5
              local.set 2
              br 1 (;@3;)
            end
            block ;; label = @4
              local.get 5
              i32.const 504
              i32.eq
              br_if 0 (;@4;)
              local.get 0
              i32.const 127
              i32.and
              i32.const 8
              i32.shl
              global.get $GOT.data.internal.__memory_base
              i32.const 1052660
              i32.add
              local.get 2
              i32.add
              i32.const 1
              i32.add
              i32.load8_u
              i32.or
              local.set 0
              local.get 2
              i32.const 2
              i32.add
              local.set 2
              br 1 (;@3;)
            end
            global.get $GOT.data.internal.__memory_base
            i32.const 1054916
            i32.add
            call $_ZN4core6option13unwrap_failed17h46c842306997fe98E
            unreachable
          end
          local.get 4
          local.get 0
          i32.sub
          local.tee 4
          i32.const 0
          i32.lt_s
          br_if 1 (;@1;)
          local.get 1
          i32.const 1
          i32.xor
          local.set 1
          local.get 2
          i32.const 504
          i32.ne
          br_if 0 (;@2;)
        end
      end
      local.get 1
      i32.const 1
      i32.and
    )
    (func $_ZN4core5alloc6layout6Layout19is_size_align_valid17h62d78098b400ece0E (;217;) (type 4) (param i32 i32) (result i32)
      local.get 1
      i32.popcnt
      i32.const 1
      i32.eq
      local.get 0
      i32.const -2147483648
      local.get 1
      i32.sub
      i32.le_u
      i32.and
    )
    (func $_ZN4core5slice5index16slice_index_fail8do_panic7runtime17h5812bc59c3cd61b2E (;218;) (type 9) (param i32 i32 i32)
      (local i32 i64)
      global.get $__stack_pointer
      i32.const 32
      i32.sub
      local.tee 3
      global.set $__stack_pointer
      local.get 3
      local.get 1
      i32.store offset=12
      local.get 3
      local.get 0
      i32.store offset=8
      local.get 3
      global.get $GOT.func.internal._ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hd03bfcbf982015daE
      i64.extend_i32_u
      i64.const 32
      i64.shl
      local.tee 4
      local.get 3
      i32.const 12
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=24
      local.get 3
      local.get 4
      local.get 3
      i32.const 8
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=16
      global.get $GOT.data.internal.__memory_base
      i32.const 1048800
      i32.add
      local.get 3
      i32.const 16
      i32.add
      local.get 2
      call $_ZN4core9panicking9panic_fmt17hd2f72abdb0aff166E
      unreachable
    )
    (func $_ZN4core5slice5index16slice_index_fail8do_panic7runtime17hb814b290150820e7E (;219;) (type 9) (param i32 i32 i32)
      (local i32 i64)
      global.get $__stack_pointer
      i32.const 32
      i32.sub
      local.tee 3
      global.set $__stack_pointer
      local.get 3
      local.get 1
      i32.store offset=12
      local.get 3
      local.get 0
      i32.store offset=8
      local.get 3
      global.get $GOT.func.internal._ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hd03bfcbf982015daE
      i64.extend_i32_u
      i64.const 32
      i64.shl
      local.tee 4
      local.get 3
      i32.const 12
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=24
      local.get 3
      local.get 4
      local.get 3
      i32.const 8
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=16
      global.get $GOT.data.internal.__memory_base
      i32.const 1048895
      i32.add
      local.get 3
      i32.const 16
      i32.add
      local.get 2
      call $_ZN4core9panicking9panic_fmt17hd2f72abdb0aff166E
      unreachable
    )
    (func $_ZN4core5slice5index16slice_index_fail8do_panic7runtime17h0fafb702a7364918E (;220;) (type 9) (param i32 i32 i32)
      (local i32 i64)
      global.get $__stack_pointer
      i32.const 32
      i32.sub
      local.tee 3
      global.set $__stack_pointer
      local.get 3
      local.get 1
      i32.store offset=12
      local.get 3
      local.get 0
      i32.store offset=8
      local.get 3
      global.get $GOT.func.internal._ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hd03bfcbf982015daE
      i64.extend_i32_u
      i64.const 32
      i64.shl
      local.tee 4
      local.get 3
      i32.const 12
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=24
      local.get 3
      local.get 4
      local.get 3
      i32.const 8
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=16
      global.get $GOT.data.internal.__memory_base
      i32.const 1048952
      i32.add
      local.get 3
      i32.const 16
      i32.add
      local.get 2
      call $_ZN4core9panicking9panic_fmt17hd2f72abdb0aff166E
      unreachable
    )
    (func $_ZN4core5slice6memchr14memchr_aligned17h3a453d2ddf9c7cc0E (;221;) (type 1) (param i32 i32 i32 i32)
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
    (func $_ZN4core6result13unwrap_failed17hfc7ff948713b7b29E (;222;) (type 13) (param i32 i32 i32 i32 i32)
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
      i32.const 72
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
      i32.const 69
      i32.add
      i64.extend_i32_u
      i64.const 32
      i64.shl
      local.get 5
      i64.extend_i32_u
      i64.or
      i64.store offset=16
      global.get $GOT.data.internal.__memory_base
      i32.const 1049121
      i32.add
      local.get 5
      i32.const 16
      i32.add
      local.get 4
      call $_ZN4core9panicking9panic_fmt17hd2f72abdb0aff166E
      unreachable
    )
    (func $_ZN4core9panicking19assert_failed_inner17hb7676d3c0b1faf61E (;223;) (type 5) (param i32 i32 i32 i32 i32 i32 i32 i32)
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
      i32.const 1053832
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
      i32.const 1054948
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
        global.get $GOT.func.internal._ZN59_$LT$core..fmt..Arguments$u20$as$u20$core..fmt..Display$GT$3fmt17h06c2e0a1010e36c0E
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
        i32.const 72
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
        i32.const 69
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
        i32.const 1049062
        i32.add
        local.get 8
        i32.const 32
        i32.add
        local.get 7
        call $_ZN4core9panicking9panic_fmt17hd2f72abdb0aff166E
        unreachable
      end
      local.get 8
      global.get $GOT.data.internal.__table_base
      local.tee 5
      i32.const 72
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
      i32.const 69
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
      i32.const 1049007
      i32.add
      local.get 8
      i32.const 32
      i32.add
      local.get 7
      call $_ZN4core9panicking9panic_fmt17hd2f72abdb0aff166E
      unreachable
    )
    (func $_ZN59_$LT$core..fmt..Arguments$u20$as$u20$core..fmt..Display$GT$3fmt17h06c2e0a1010e36c0E (;224;) (type 4) (param i32 i32) (result i32)
      local.get 1
      i32.load
      local.get 1
      i32.load offset=4
      local.get 0
      i32.load
      local.get 0
      i32.load offset=4
      call $_ZN4core3fmt5write17h80512e2a12699005E
    )
    (data $.rodata (;0;) (i32.const 1048576) "one-time initialization may not be performed recursively\0ebegin <= end (\c0\04 <= \c0\10) when slicing `\c0\01`\c0\00\0bbyte index \c0\16 is out of bounds of `\c0\01`\c0\00\0bbyte index \c0& is not a char boundary; it is inside \c0\08 (bytes \c0\06) of `\c0\01`\c0\00\c0\01:\c0\01:\c0\00\16slice index starts at \c0\0d but ends at \c0\00 index out of bounds: the len is \c0\12 but the index is \c0\00\12range start index \c0\22 out of range for slice of length \c0\00\10range end index \c0\22 out of range for slice of length \c0\00\10assertion `left \c0\17 right` failed\0a  left: \c0\09\0a right: \c0\00\10assertion `left \c0\10 right` failed: \c0\09\0a  left: \c0\09\0a right: \c0\00\c0\02: \c0\00library/alloc/src/fmt.rs\00library/std/src/sys/sync/mutex/no_threads.rs\00library/core/src/fmt/num.rs\00library/std/src/sync/lazy_lock.rs\00library/std/src/sys/io/io_slice/wasi.rs\00library/std/src/panicking.rs\00library/core/src/unicode/printable.rs\00/home/ewout/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/std/src/sync/once.rs\00library/core/src/fmt/mod.rs\00library/std/src/io/mod.rs\00library/alloc/src/raw_vec/mod.rs\00library/std/src/thread/id.rs\00library/std/src/alloc.rs\00crates/otel/src/lib.rs\00crates/service/src/lib.rs\00\15memory allocation of \c0\0d bytes failed\00/\00\15memory allocation of \c0G bytes failed\0askipping backtrace printing to avoid potential recursion\0a\005fatal runtime error: failed to initiate panic, error \c0\0b, aborting\0a\00\15memory allocation of \c0\0e bytes failed\0a\00\0cpanicked at \c0\02:\0a\c03\0athread panicked while processing panic. aborting.\0a\00\09\0athread '\c0\03' (\c0\0e) panicked at \c0\02:\0a\c0\01\0a\00\19aborting due to panic at \c0\02:\0a\c0\01\0a\00LayoutErrornebula-order-servicecalled `Result::unwrap()` on an `Err` valueexample-skucalculate-subtotalcalculate-taxcalculate-total\00\00\00\00\00\9a\99\99\99\99\99\c9?333333\c3?\0a\d7\a3p=\0a\c7?called `Result::unwrap()` on an `Err` valueLayoutError\c3 \00\00i\10\00\00\00\00\c1M\d6\882\b5\8dW\f6\e1}\13\01a\04*m]\cb\d6,P\ebcxA\a6Wq\1b\8b\b9a formatting trait implementation returned an error when the underlying stream did notfailed to write whole bufferadvancing IoSlice beyond its lengthadvancing io slices beyond their lengthfile name contained an unexpected NUL bytefatal runtime error: rwlock locked for writing, aborting\0astack backtrace:\0anote: Some details are omitted, run with `RUST_BACKTRACE=full` for a verbose backtrace.\0acannot recursively acquire mutex\00LazyLock instance has previously been poisonednote: run with `RUST_BACKTRACE=1` environment variable to display a backtrace\0aRUST_BACKTRACEfailed to generate unique thread ID: bitspace exhaustedmain<unnamed>Box<dyn Any>thread caused non-unwinding panic. aborting.\0adescription() is deprecated; use Display\eb\b1\92\1e\92\a9\85\81\cb\ba\85\f4c\c1\b8\fdErrora formatting trait implementation returned an error when the underlying stream did notcapacity overflow\00p\00\07\00-\01\01\01\02\01\02\01\01H\0b0\15\10\01e\07\02\06\02\02\01\04#\01\1e\1b[\0b:\09\09\01\18\04\01\09\01\03\01\05+\03;\09*\18\01 7\01\01\01\04\08\04\01\03\07\0a\02\1d\01:\01\01\01\02\04\08\01\09\01\0a\02\1a\01\02\029\01\04\02\04\02\02\03\03\01\1e\02\03\01\0b\029\01\04\05\01\02\04\01\14\02\16\06\01\01:\01\01\02\01\04\08\01\07\03\0a\02\1e\01;\01\01\01\0c\01\09\01(\01\03\017\01\01\03\05\03\01\04\07\02\0b\02\1d\01:\01\02\02\01\01\03\03\01\04\07\02\0b\02\1c\029\02\01\01\02\04\08\01\09\01\0a\02\1d\01H\01\04\01\02\03\01\01\08\01Q\01\02\07\0c\08b\01\02\09\0b\07I\02\1b\01\01\01\01\017\0e\01\05\01\02\05\0b\01$\09\01f\04\01\06\01\02\02\02\19\02\04\03\10\04\0d\01\02\02\06\01\0f\01\00\03\00\04\1c\03\1d\02\1e\02@\02\01\07\08\01\02\0b\09\01-\03\01\01u\02\22\01v\03\04\02\09\01\06\03\db\02\02\01:\01\01\07\01\01\01\01\02\08\06\0a\02\010.\02\0c\14\040\0a\04\03&\09\0c\02 \04\02\068\01\01\02\03\01\01\058\08\02\02\98\03\01\0d\01\07\04\01\06\01\03\02\c6@\00\01\c3!\00\03\8d\01` \00\06i\02\00\04\01\0a \02P\02\00\01\03\01\04\01\19\02\05\01\97\02\1a\12\0d\01&\08\19\0b\01\01,\030\01\02\04\02\02\02\01$\01C\06\02\02\02\02\0c\01\08\01/\013\01\01\03\02\02\05\02\01\01*\02\08\01\ee\01\02\01\04\01\00\01\00\10\10\10\00\02\00\01\e2\01\95\05\00\03\01\02\05\04(\03\04\01\a5\02\00\04A\05\00\02M\06F\0b1\04{\016\0f)\01\02\02\0a\031\04\02\02\07\01=\03$\05\01\08>\01\0c\024\09\01\01\08\04\02\01_\03\02\04\06\01\02\01\9d\01\03\08\15\029\02\01\01\01\01\0c\01\09\01\0e\07\03\05C\01\02\06\01\01\02\01\01\03\04\03\01\01\0e\02U\08\02\03\01\01\17\01Q\01\02\06\01\01\02\01\01\02\01\02\eb\01\02\04\06\02\01\02\1b\02U\08\02\01\01\02j\01\01\01\02\08e\01\01\01\02\04\01\05\00\09\01\02\f5\01\0a\04\04\01\90\04\02\02\04\01 \0a(\06\02\04\08\01\09\06\02\03.\0d\01\02\c6\01\01\03\01\01\c9\07\01\06\01\01R\16\02\07\01\02\01\02z\06\03\01\01\02\01\07\01\01H\02\03\01\01\01\00\02\0b\024\05\05\03\17\01\00\01\06\0f\00\0c\03\03\00\05;\07\00\01?\04Q\01\0b\02\00\02\00.\02\17\00\05\03\06\08\08\02\07\1e\04\94\03\007\042\08\01\0e\01\16\05\01\0f\00\07\01\11\02\07\01\02\01\05d\01\a0\07\00\01=\04\00\04\fe\02\f3\01\02\01\07\02\05\01\00\07m\07\00`\80\f0\00falsetrue000102030405060708091011121314151617181920212223242526272829303132333435363738394041424344454647484950515253545556575859606162636465666768697071727374757677787980818283848586878889909192939495969798990123456789abcdef0x0123456789ABCDEF[...]called `Option::unwrap()` on a `None` value\00\00\00\03\00\00\83\04 \00\91\05`\00]\13\a0\00\12\17 \1f\0c `\1f\ef,`+*0\e0+o\a6\a0,\02\a8 -\1e\fb .\00\fe`6\9e\ff\a06\fd\01!7\01\0aa7$\0d!8\ab\0e\a19/\18!:\f3\1e!K@4\a1S\1ea\e1T\f0jaUOo\e1U\9d\bcaV\00\cfaWe\d1\a1W\00\da!X\00\e0\a1Y\ae\e2![\ec\e4\e1\5c\d0\e8a] \00\ee^\f0\01\7f_\00\06\01\01\03\01\04\02\05\07\07\02\08\08\09\02\0a\05\0b\02\0e\04\10\01\11\02\12\05\13\1c\14\01\15\02\17\02\19\0d\1c\05\1d\08\1f\01$\01j\04k\02n\02\af\03\b1\02\bc\02\cf\02\d1\02\d4\0c\d5\09\d6\02\d7\02\da\01\e0\05\e1\02\e6\01\e7\04\e8\02\ee \f0\04\f8\02\fa\05\fb\01\0c';>NO\8f\9e\9e\9f{\8b\93\96\a2\b2\ba\86\b1\06\07\096=>V\f3\d0\d1\04\14\1867VW\7f\aa\ae\af\bd5\e0\12\87\89\8e\9e\04\0d\0e\11\12)14:EFIJNOde\8a\8c\8d\8f\b6\c1\c3\c4\c6\cb\d6\5c\b6\b7\1b\1c\07\08\0a\0b\14\1769:\a8\a9\d8\d9\097\90\91\a8\07\0a;>fi\8f\92\11o_\bf\ee\efZb\b9\ba\f4\fc\ffST\9a\9b./'(U\9d\a0\a1\a3\a4\a7\a8\ad\ba\bc\c4\06\0b\0c\15\1d:?EQ\a6\a7\cc\cd\a0\07\19\1a\22%>?\df\e7\ec\ef\ff\c5\c6\04 #%&(38:HJLPSUVXZ\5c^`cefksx}\7f\8a\a4\aa\af\b0\c0\d0\ae\afno\c7\dd\de\93^\22{\05\03\04-\03f\03\01/.\80\82\1d\031\0f\1c\04$\09\1e\05+\05D\04\0e*\80\aa\06$\04$\04(\084\0bN\034\0c\817\09\16\0a\08\18;E9\03c\08\090\16\05!\03\1b\05\1b&8\04K\05/\04\0a\07\09\07@ '\04\0c\096\03:\05\1a\07\04\0c\07PI73\0d3\07.\08\0a\06&\03\1d\08\02\80\d0R\10\06\08\09!.\08*\16\1a&\1c\14\17\09N\04$\09D\0d\19\07\0a\06H\08'\09u\0bB>*\06;\05\0a\06Q\06\01\05\10\03\05\0bY\08\02\1db\1eH\08\0a\80\a6^\22E\0b\0a\06\0d\13:\06\0a\06\14\1c,\04\17\80\b9<dS\0cH\09\0aFE\1bH\08S\0dI\07\0aV\08X\22\0e\0a\06F\0a\1d\03GI7\03\0e\08\0a\069\07\0a\06,\04\0a\80\f6\19\07;\03\1dU\01\0f2\0d\83\9bfu\0b\80\c4\8aLc\0d\840\10\16\0a\8f\9b\05\82G\9a\b9:\86\c6\829\07*\04\5c\06&\0aF\0a(\05\13\81\b0:\80\c6[\054,K\049\07\11@\05\0b\07\09\9c\d6) as\a1\fd\813\0f\01\1d\06\0e\04\08\81\8c\89\04k\05\0d\03\09\07\10\8f`\80\fd\03\81\b4\06\17\0f\11\0fG\09t<\80\f6\0as\08p\15Fz\14\0c\14\0cW\09\19\80\87\81G\03\85B\0f\15\84P\1f\06\06\80\d5+\05>!\01p-\03\1a\04\02\81@\1f\11:\05\01\81\d0*\80\d6+\04\01\80\c06\08\02\80\e0\80\f7)L\04\0a\04\02\83\11DL=\80\c2<\06\01\04U\05\1b4\02\81\0e,\04d\0cV\0a\80\ae8\1d\0d,\04\09\07\02\0e\06\80\9a\83\d9\03\11\03\0d\03\80\da\06\0c\04\01\0f\0c\048\08\0a\06(\08,\04\02\0e\09'\81X\08\1d\03\0b\03;\04\1e\04\0a\07\80\fb\84\05\00\01\03\05\05\06\06\02\07\06\08\07\09\11\0a\1c\0b\19\0c\19\0d\10\0e\0c\0f\04\10\03\12\12\13\09\16\01\17\04\18\01\19\03\1a\09\1b\01\1c\02\1f\16 \03+\02-\0b.\010\041\022\01\a9\02\aa\04\ab\08\fa\02\fb\05\fe\03\ff\09\adxy\8b\8d\a20WX\8b\8c\90\1c\dd\0e\0fKL\fb\fc./?\5c]_\e2\84\8d\8e\91\92\a9\b1\ba\bb\c5\c6\c9\ca\de\e4\e5\ff\00\04\11\12)147:;=IJ]\84\8e\92\a9\b1\b4\ba\bb\c6\ca\ce\cf\e4\e5\00\04\0d\0e\11\12)14:;EFIJ^de\84\91\9b\9d\c9\ce\cf\0d\11):;EIW[^_de\8d\91\a9\b4\ba\bb\c5\c9\df\e4\e5\f0\0d\11EIde\80\84\b2\bc\be\bf\d5\d7\f0\f1\83\85\8b\a4\a6\be\bf\c5\c7\cf\da\dbH\98\bd\cd\c6\ce\cfINOWY^_\89\8e\8f\b1\b6\b7\bf\c1\c6\c7\d7\11\16\17[\5c\f6\f7\fe\ff\80mq\de\df\0e\1fno\1c\1d_}~\ae\af\de\dfM\bb\bc\16\17\1e\1fFGNOXZ\5c^~\7f\b5\c5\d4\d5\dc\f0\f1\f5rs\8ftu&./\a7\af\b7\bf\c7\cf\d7\df\9a\00@\97\980\8f\1f\ce\ffNOZ[\07\08\0f\10'/\ee\efno7=?BESgu\c8\c9\d0\d1\d8\d9\e7\fe\ff\00 _\22\82\df\04\82D\08\1b\04\06\11\81\ac\0e\80\ab\05 \07\81\1c\03\19\08\01\04/\044\04\07\03\01\07\06\07\11\0aP\0f\12\07U\07\03\04\1c\0a\09\03\08\03\07\03\02\03\03\03\0c\04\05\03\0b\06\01\0e\15\05N\07\1b\07W\07\02\05\18\0cP\04C\03-\03\01\04\11\06\0f\0c:\04\1d%_ m\04j%\80\c8\05\82\b0\03\1a\06\82\fd\03Y\07\16\09\18\09\14\0c\14\0cj\06\0a\06\1a\06Y\07+\05F\0a,\04\0c\04\01\031\0b,\04\1a\06\0b\03\80\ac\06\0a\06L\14\80\f4\08<\03\0f\03>\058\08+\05\82\ff\11\18\08/\11-\03\22\0e!\0f\80\8c\04\82\9a\16\0b\15\88\94\05/\05;\07\02\0e\18\09\80\be\22t\0c\80\d6\1a\81\10\05\80\e1\09\f2\9e\037\09\81\5c\14\80\b8\08\80\dd\14<\03\0a\068\08F\08\0c\06t\0b\1e\03Z\04Y\09\80\83\18\1c\0a\16\09L\04\80\8a\06\ab\a4\0c\17\041\a1\04\81\da&\07\0c\05\05\82\b3 *\06L\04\80\8d\04\80\be\03\1b\03\0f\0d==!=matches..\00\00\00\02\00\00\00\02\00\00\00\07\00\00\00")
    (data $.data (;1;) (i32.const 1053848) "\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\16\03\10\00p\00\00\00\db\00\00\001\00\00\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\03\00\00\00+\04\10\00\19\00\00\00\09\00\00\00\01\00\00\00\16\03\10\00p\00\00\00\db\00\00\00\14\00\00\00\04\00\00\00\04\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\05\00\00\00\14\04\10\00\16\00\00\00\02\00\00\00\05\00\00\00\04\00\00\00\04\00\00\00\0f\00\00\00\10\00\00\00\0c\00\00\00\04\00\00\00\11\00\00\00\12\00\00\00\13\00\00\00\a3\03\10\00\19\00\00\00\88\02\00\00\11\00\00\00\10\00\00\00\0c\00\00\00\04\00\00\00\14\00\00\00\15\00\00\00\16\00\00\00\10\00\00\00\0c\00\00\00\04\00\00\00\17\00\00\00\18\00\00\00\19\00\00\00\1e\07\10\00\1c\00\00\00\17\00\00\00\00\00\00\00\02\00\00\00\f8\15\10\00\a3\03\10\00\19\00\00\00Y\07\00\00$\00\00\00\ab\02\10\00'\00\00\00\14\00\00\00\0d\00\00\00\a3\03\10\00\19\00\00\00Z\06\00\00\0d\00\00\00\a3\03\10\00\19\00\00\00X\06\00\00 \00\00\00\84\07\10\00*\00\00\00\14\00\00\00\00\00\00\00\02\00\00\00P\16\10\00@\02\10\00,\00\00\00\13\00\00\00\09\00\00\00\89\02\10\00!\00\00\00\9f\01\00\00\05\00\00\00\1a\00\00\00\08\00\00\00\04\00\00\00\1b\00\00\00\1c\00\00\00\1d\00\00\00\1e\00\00\00\1f\00\00\00 \00\00\00\0a\00\00\00\fb\03\10\00\18\00\00\00p\01\00\00\09\00\00\00\de\03\10\00\1c\00\00\00&\00\00\00\0d\00\00\00!\00\00\00\0c\00\00\00\04\00\00\00\22\00\00\00#\00\00\00$\00\00\00%\00\00\00&\00\00\00'\00\00\00(\00\00\00\01\00\00\00\d3\02\10\00\1c\00\00\00\16\01\00\00.\00\00\00)\00\00\00\0c\00\00\00\04\00\00\00*\00\00\00+\00\00\00,\00\00\00-\00\00\00\10\00\00\00\04\00\00\00.\00\00\00/\00\00\000\00\00\001\00\00\00\00\00\00\00\08\00\00\00\04\00\00\002\00\00\003\00\00\004\00\00\005\00\00\00\00\00\00\00\04\00\00\00\04\00\00\006\00\00\007\00\00\00\0c\00\00\00\04\00\00\008\00\00\007\00\00\00\0c\00\00\00\04\00\00\009\00\00\008\00\00\00l\17\10\00:\00\00\00;\00\00\00<\00\00\00:\00\00\00=\00\00\00\00\00\00\00\08\00\00\00\04\00\00\00>\00\00\00)\00\00\00\0c\00\00\00\04\00\00\00?\00\00\00@\00\00\00@\00\00\00@\00\00\00@\00\00\00@\00\00\00@\00\00\00@\00\00\00@\00\00\00@\00\00\00@\00\00\00@\00\00\00@\00\00\00@\00\00\00@\00\00\00@\00\00\00@\00\00\00@\00\00\00@\00\00\00@\00\00\00@\00\00\00@\00\00\00@\00\00\00@\00\00\00@\00\00\00@\00\00\00@\00\00\00@\00\00\00@\00\00\00@\00\00\00@\00\00\00@\00\00\00\ff\ff\ff\ffk\04\10\00A\00\00\00\0c\00\00\00\04\00\00\00B\00\00\00C\00\00\00D\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00E\00\00\00'\02\10\00\18\00\00\00\8a\02\00\00\0e\00\00\00\bd\03\10\00 \00\00\00\1c\00\00\00\05\00\00\00\87\03\10\00\1b\00\00\00~\0b\00\00&\00\00\00\87\03\10\00\1b\00\00\00\87\0b\00\00\1a\00\00\00m\02\10\00\1b\00\00\00W\02\00\00\05\00\00\00\f0\02\10\00%\00\00\00\1a\00\00\006\00\00\00\f0\02\10\00%\00\00\00\0a\00\00\00+\00\00\00x\14\10\00z\14\10\00|\14\10\00")
    (@producers
      (language "Rust" "")
      (language "C11" "")
      (processed-by "rustc" "1.93.1 (01f6ddf75 2026-02-11)")
      (processed-by "clang" "20.1.8-wasi-sdk (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)")
      (processed-by "wit-component" "0.20.1")
      (processed-by "wit-bindgen-rust" "0.45.0")
      (processed-by "wit-bindgen-c" "0.17.0")
    )
    (@custom "target_features" (after data) "\09+\0bbulk-memory+\0fbulk-memory-opt+\16call-indirect-overlong+\0eextended-const+\0amultivalue+\0fmutable-globals+\13nontrapping-fptoint+\0freference-types+\08sign-ext")
  )
  (core module $wit-component:adapter:wasi_snapshot_preview1 (;1;)
    (type (;0;) (func (param i32)))
    (type (;1;) (func (param i32 i32)))
    (type (;2;) (func (param i32 i32 i32 i32)))
    (type (;3;) (func (param i32 i32 i32 i32) (result i32)))
    (type (;4;) (func (result i32)))
    (type (;5;) (func (param i32 i32) (result i32)))
    (type (;6;) (func (param i32 i32 i32) (result i32)))
    (type (;7;) (func))
    (import "env" "memory" (memory (;0;) 0))
    (import "wasi:cli/environment@0.2.6" "get-environment" (func $_ZN22wasi_snapshot_preview124wasi_cli_get_environment17hc764838d2ad13cceE (;0;) (type 0)))
    (import "wasi:io/streams@0.2.6" "[resource-drop]output-stream" (func $_ZN137_$LT$wasi_snapshot_preview1..bindings..wasi..io..streams..OutputStream$u20$as$u20$wasi_snapshot_preview1..bindings.._rt..WasmResource$GT$4drop4drop17h74b054ace65a729fE (;1;) (type 0)))
    (import "wasi:io/error@0.2.6" "[resource-drop]error" (func $_ZN128_$LT$wasi_snapshot_preview1..bindings..wasi..io..error..Error$u20$as$u20$wasi_snapshot_preview1..bindings.._rt..WasmResource$GT$4drop4drop17h5dfe5e22018724f9E (;2;) (type 0)))
    (import "__main_module__" "cabi_realloc" (func $_ZN22wasi_snapshot_preview15State3new12cabi_realloc17h5d5233c0485a18bdE (;3;) (type 3)))
    (import "wasi:cli/stderr@0.2.6" "get-stderr" (func $_ZN22wasi_snapshot_preview18bindings4wasi3cli6stderr10get_stderr11wit_import017h50cc4fa9b23d8431E (;4;) (type 4)))
    (import "wasi:io/streams@0.2.6" "[method]output-stream.blocking-write-and-flush" (func $_ZN22wasi_snapshot_preview18bindings4wasi2io7streams12OutputStream24blocking_write_and_flush11wit_import217hea2384f87c28a782E (;5;) (type 2)))
    (import "wasi:cli/exit@0.2.6" "exit" (func $_ZN22wasi_snapshot_preview18bindings4wasi3cli4exit4exit11wit_import117hd1c63b9a46050b9dE (;6;) (type 0)))
    (global $__stack_pointer (;0;) (mut i32) i32.const 0)
    (global $internal_state_ptr (;1;) (mut i32) i32.const 0)
    (global $allocation_state (;2;) (mut i32) i32.const 0)
    (export "environ_sizes_get" (func $environ_sizes_get))
    (export "proc_exit" (func $proc_exit))
    (export "environ_get" (func $environ_get))
    (export "cabi_import_realloc" (func $cabi_import_realloc))
    (func $_ZN22wasi_snapshot_preview15State3ptr17h7789f7ba54ccf647E (;7;) (type 4) (result i32)
      (local i32)
      block ;; label = @1
        call $get_state_ptr
        local.tee 0
        br_if 0 (;@1;)
        call $_ZN22wasi_snapshot_preview15State3new17hc823f6207d67811fE
        local.tee 0
        call $set_state_ptr
      end
      local.get 0
    )
    (func $_ZN22wasi_snapshot_preview16macros11assert_fail17hbfcba5b0fa6b0547E (;8;) (type 0) (param i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 48
      i32.sub
      local.tee 1
      global.set $__stack_pointer
      local.get 1
      i32.const 32
      i32.store8 offset=47
      local.get 1
      i64.const 7308895158390646132
      i64.store offset=39 align=1
      local.get 1
      i64.const 8097863973307965728
      i64.store offset=31 align=1
      local.get 1
      i64.const 7234307576302018670
      i64.store offset=23 align=1
      local.get 1
      i64.const 8028075845441778529
      i64.store offset=15 align=1
      local.get 1
      i32.const 15
      i32.add
      i32.const 33
      call $_ZN22wasi_snapshot_preview16macros5print17h9c9d9fd21c22ed6eE
      local.get 0
      call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h3a4dc17d787e2b64E
      unreachable
    )
    (func $cabi_import_realloc (;9;) (type 3) (param i32 i32 i32 i32) (result i32)
      (local i32 i32 i64)
      call $allocate_stack
      global.get $__stack_pointer
      i32.const 48
      i32.sub
      local.tee 4
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
                          call $_ZN22wasi_snapshot_preview15State3ptr17h7789f7ba54ccf647E
                          local.tee 5
                          i32.load
                          i32.const 560490357
                          i32.ne
                          br_if 0 (;@10;)
                          local.get 5
                          i32.load offset=65532
                          i32.const 560490357
                          i32.ne
                          br_if 1 (;@9;)
                          local.get 5
                          i64.load offset=4 align=4
                          local.set 6
                          local.get 5
                          i32.const 4
                          i32.store offset=4
                          local.get 4
                          i32.const 16
                          i32.add
                          local.get 5
                          i32.const 20
                          i32.add
                          i32.load
                          i32.store
                          local.get 4
                          i32.const 8
                          i32.add
                          local.get 5
                          i32.const 12
                          i32.add
                          i64.load align=4
                          i64.store
                          local.get 4
                          local.get 6
                          i64.store
                          local.get 0
                          i32.eqz
                          br_if 2 (;@8;)
                          local.get 1
                          local.get 3
                          i32.le_u
                          br_if 3 (;@7;)
                          local.get 2
                          i32.const 1
                          i32.eq
                          br_if 9 (;@1;)
                          i32.const 387
                          call $_ZN22wasi_snapshot_preview16macros11assert_fail17hbfcba5b0fa6b0547E
                          unreachable
                        end
                        i32.const 2803
                        call $_ZN22wasi_snapshot_preview16macros11assert_fail17hbfcba5b0fa6b0547E
                        unreachable
                      end
                      i32.const 2804
                      call $_ZN22wasi_snapshot_preview16macros11assert_fail17hbfcba5b0fa6b0547E
                      unreachable
                    end
                    local.get 4
                    i32.load
                    br_table 5 (;@2;) 3 (;@4;) 2 (;@5;) 1 (;@6;) 4 (;@3;) 5 (;@2;)
                  end
                  i32.const 386
                  call $_ZN22wasi_snapshot_preview16macros11assert_fail17hbfcba5b0fa6b0547E
                  unreachable
                end
                local.get 4
                i32.const 12
                i32.add
                local.set 0
                block ;; label = @6
                  local.get 2
                  i32.const 1
                  i32.eq
                  br_if 0 (;@6;)
                  local.get 0
                  local.get 2
                  local.get 3
                  call $_ZN22wasi_snapshot_preview19BumpAlloc5alloc17h4f7bce9411dcbea5E
                  local.set 0
                  br 5 (;@1;)
                end
                local.get 4
                local.get 4
                i32.load offset=4
                local.tee 2
                i32.const 1
                i32.add
                i32.store offset=4
                block ;; label = @6
                  local.get 2
                  local.get 4
                  i32.load offset=8
                  i32.eq
                  br_if 0 (;@6;)
                  local.get 4
                  local.get 4
                  i64.load offset=12 align=4
                  i64.store offset=24 align=4
                  local.get 4
                  i32.const 24
                  i32.add
                  i32.const 1
                  local.get 3
                  call $_ZN22wasi_snapshot_preview19BumpAlloc5alloc17h4f7bce9411dcbea5E
                  local.set 0
                  br 5 (;@1;)
                end
                local.get 0
                i32.const 1
                local.get 3
                call $_ZN22wasi_snapshot_preview19BumpAlloc5alloc17h4f7bce9411dcbea5E
                local.set 0
                br 4 (;@1;)
              end
              block ;; label = @5
                local.get 2
                i32.const 1
                i32.eq
                br_if 0 (;@5;)
                local.get 4
                i32.const 12
                i32.add
                local.get 2
                local.get 3
                call $_ZN22wasi_snapshot_preview19BumpAlloc5alloc17h4f7bce9411dcbea5E
                local.set 0
                br 4 (;@1;)
              end
              local.get 4
              i32.const 4
              i32.or
              i32.const 1
              local.get 3
              i32.const 1
              i32.add
              call $_ZN22wasi_snapshot_preview19BumpAlloc5alloc17h4f7bce9411dcbea5E
              local.set 0
              br 3 (;@1;)
            end
            block ;; label = @4
              local.get 2
              i32.const 1
              i32.eq
              br_if 0 (;@4;)
              local.get 4
              i32.const 8
              i32.add
              local.get 2
              local.get 3
              call $_ZN22wasi_snapshot_preview19BumpAlloc5alloc17h4f7bce9411dcbea5E
              local.set 0
              br 3 (;@1;)
            end
            local.get 4
            local.get 4
            i32.load offset=4
            local.get 3
            i32.add
            i32.store offset=4
            local.get 4
            local.get 4
            i64.load offset=8
            i64.store offset=24 align=4
            local.get 4
            i32.const 24
            i32.add
            i32.const 1
            local.get 3
            call $_ZN22wasi_snapshot_preview19BumpAlloc5alloc17h4f7bce9411dcbea5E
            local.set 0
            br 2 (;@1;)
          end
          i32.const 428
          call $_ZN22wasi_snapshot_preview16macros18eprint_unreachable17hf3e9d5c9c5a8815aE
          local.get 4
          i32.const 8250
          i32.store16 offset=24 align=1
          local.get 4
          i32.const 24
          i32.add
          i32.const 2
          call $_ZN22wasi_snapshot_preview16macros5print17h9c9d9fd21c22ed6eE
          local.get 4
          i64.const 748834980320733542
          i64.store offset=40 align=1
          local.get 4
          i64.const 7957688057596965985
          i64.store offset=32 align=1
          local.get 4
          i64.const 7165064744911531886
          i64.store offset=24 align=1
          local.get 4
          i32.const 24
          i32.add
          i32.const 24
          call $_ZN22wasi_snapshot_preview16macros5print17h9c9d9fd21c22ed6eE
          local.get 4
          i32.const 10
          i32.store8 offset=24
          local.get 4
          i32.const 24
          i32.add
          i32.const 1
          call $_ZN22wasi_snapshot_preview16macros5print17h9c9d9fd21c22ed6eE
          unreachable
        end
        local.get 4
        i32.const 4
        i32.or
        local.get 2
        local.get 3
        call $_ZN22wasi_snapshot_preview19BumpAlloc5alloc17h4f7bce9411dcbea5E
        local.set 0
        local.get 4
        i32.const 4
        i32.store
      end
      local.get 5
      i32.const 4
      i32.add
      local.tee 5
      local.get 4
      i64.load
      i64.store align=4
      local.get 5
      i32.const 16
      i32.add
      local.get 4
      i32.const 16
      i32.add
      i32.load
      i32.store
      local.get 5
      i32.const 8
      i32.add
      local.get 4
      i32.const 8
      i32.add
      i64.load
      i64.store align=4
      local.get 4
      i32.const 48
      i32.add
      global.set $__stack_pointer
      local.get 0
    )
    (func $_ZN22wasi_snapshot_preview19BumpAlloc5alloc17h4f7bce9411dcbea5E (;10;) (type 6) (param i32 i32 i32) (result i32)
      (local i32 i32 i32)
      global.get $__stack_pointer
      i32.const 32
      i32.sub
      local.tee 3
      global.set $__stack_pointer
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            local.get 1
            i32.popcnt
            i32.const 1
            i32.ne
            br_if 0 (;@3;)
            local.get 0
            i32.load offset=4
            local.tee 4
            local.get 1
            local.get 0
            i32.load
            local.tee 5
            i32.add
            i32.const -1
            i32.add
            i32.const 0
            local.get 1
            i32.sub
            i32.and
            local.get 5
            i32.sub
            local.tee 1
            i32.lt_u
            br_if 1 (;@2;)
            local.get 4
            local.get 1
            i32.sub
            local.tee 4
            local.get 2
            i32.ge_u
            br_if 2 (;@1;)
            i32.const 450
            call $_ZN22wasi_snapshot_preview16macros18eprint_unreachable17hf3e9d5c9c5a8815aE
            local.get 3
            i32.const 8250
            i32.store16 offset=3 align=1
            local.get 3
            i32.const 3
            i32.add
            i32.const 2
            call $_ZN22wasi_snapshot_preview16macros5print17h9c9d9fd21c22ed6eE
            local.get 3
            i32.const 10
            i32.store8 offset=31
            local.get 3
            i32.const 1701278305
            i32.store offset=27 align=1
            local.get 3
            i64.const 7791349879831294825
            i64.store offset=19 align=1
            local.get 3
            i64.const 2334406575183130223
            i64.store offset=11 align=1
            local.get 3
            i64.const 7598805550979902561
            i64.store offset=3 align=1
            local.get 3
            i32.const 3
            i32.add
            i32.const 29
            call $_ZN22wasi_snapshot_preview16macros5print17h9c9d9fd21c22ed6eE
            local.get 3
            i32.const 10
            i32.store8 offset=3
            local.get 3
            i32.const 3
            i32.add
            i32.const 1
            call $_ZN22wasi_snapshot_preview16macros5print17h9c9d9fd21c22ed6eE
            unreachable
          end
          i32.const 460
          call $_ZN22wasi_snapshot_preview16macros18eprint_unreachable17hf3e9d5c9c5a8815aE
          local.get 3
          i32.const 8250
          i32.store16 offset=3 align=1
          local.get 3
          i32.const 3
          i32.add
          i32.const 2
          call $_ZN22wasi_snapshot_preview16macros5print17h9c9d9fd21c22ed6eE
          local.get 3
          i32.const 2676
          i32.store16 offset=19 align=1
          local.get 3
          i64.const 7954884637768641633
          i64.store offset=11 align=1
          local.get 3
          i64.const 2334106421097295465
          i64.store offset=3 align=1
          local.get 3
          i32.const 3
          i32.add
          i32.const 18
          call $_ZN22wasi_snapshot_preview16macros5print17h9c9d9fd21c22ed6eE
          local.get 3
          i32.const 10
          i32.store8 offset=3
          local.get 3
          i32.const 3
          i32.add
          i32.const 1
          call $_ZN22wasi_snapshot_preview16macros5print17h9c9d9fd21c22ed6eE
          unreachable
        end
        i32.const 464
        call $_ZN22wasi_snapshot_preview16macros18eprint_unreachable17hf3e9d5c9c5a8815aE
        local.get 3
        i32.const 8250
        i32.store16 offset=3 align=1
        local.get 3
        i32.const 3
        i32.add
        i32.const 2
        call $_ZN22wasi_snapshot_preview16macros5print17h9c9d9fd21c22ed6eE
        local.get 3
        i32.const 10
        i32.store8 offset=21
        local.get 3
        i32.const 25972
        i32.store16 offset=19 align=1
        local.get 3
        i64.const 7017575155838820463
        i64.store offset=11 align=1
        local.get 3
        i64.const 8367798494427701606
        i64.store offset=3 align=1
        local.get 3
        i32.const 3
        i32.add
        i32.const 19
        call $_ZN22wasi_snapshot_preview16macros5print17h9c9d9fd21c22ed6eE
        local.get 3
        i32.const 10
        i32.store8 offset=3
        local.get 3
        i32.const 3
        i32.add
        i32.const 1
        call $_ZN22wasi_snapshot_preview16macros5print17h9c9d9fd21c22ed6eE
        unreachable
      end
      local.get 0
      local.get 4
      local.get 2
      i32.sub
      i32.store offset=4
      local.get 0
      local.get 5
      local.get 1
      i32.add
      local.tee 1
      local.get 2
      i32.add
      i32.store
      local.get 3
      i32.const 32
      i32.add
      global.set $__stack_pointer
      local.get 1
    )
    (func $_ZN22wasi_snapshot_preview16macros18eprint_unreachable17hf3e9d5c9c5a8815aE (;11;) (type 0) (param i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 48
      i32.sub
      local.tee 1
      global.set $__stack_pointer
      local.get 1
      i32.const 32
      i32.store8 offset=47
      local.get 1
      i32.const 1701734764
      i32.store offset=43 align=1
      local.get 1
      i64.const 2338042707334751329
      i64.store offset=35 align=1
      local.get 1
      i64.const 2338600898263348341
      i64.store offset=27 align=1
      local.get 1
      i64.const 7162263158133189730
      i64.store offset=19 align=1
      local.get 1
      i64.const 7018969289221893749
      i64.store offset=11 align=1
      local.get 1
      i32.const 11
      i32.add
      i32.const 37
      call $_ZN22wasi_snapshot_preview16macros5print17h9c9d9fd21c22ed6eE
      local.get 0
      call $_ZN22wasi_snapshot_preview16macros10eprint_u3215eprint_u32_impl17h798b90aa412f3f56E
      local.get 1
      i32.const 48
      i32.add
      global.set $__stack_pointer
    )
    (func $_ZN22wasi_snapshot_preview16macros5print17h9c9d9fd21c22ed6eE (;12;) (type 1) (param i32 i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 2
      global.set $__stack_pointer
      local.get 2
      call $_ZN22wasi_snapshot_preview18bindings4wasi3cli6stderr10get_stderr11wit_import017h50cc4fa9b23d8431E
      i32.store offset=12
      local.get 2
      i32.const 4
      i32.add
      local.get 2
      i32.const 12
      i32.add
      local.get 0
      local.get 1
      call $_ZN22wasi_snapshot_preview18bindings4wasi2io7streams12OutputStream24blocking_write_and_flush17h2c9dfbfe41e99e82E
      block ;; label = @1
        local.get 2
        i32.load offset=4
        local.tee 1
        i32.const 2
        i32.eq
        br_if 0 (;@1;)
        local.get 1
        br_if 0 (;@1;)
        local.get 2
        i32.load offset=8
        local.tee 1
        i32.const -1
        i32.eq
        br_if 0 (;@1;)
        local.get 1
        call $_ZN128_$LT$wasi_snapshot_preview1..bindings..wasi..io..error..Error$u20$as$u20$wasi_snapshot_preview1..bindings.._rt..WasmResource$GT$4drop4drop17h5dfe5e22018724f9E
      end
      block ;; label = @1
        local.get 2
        i32.load offset=12
        local.tee 1
        i32.const -1
        i32.eq
        br_if 0 (;@1;)
        local.get 1
        call $_ZN137_$LT$wasi_snapshot_preview1..bindings..wasi..io..streams..OutputStream$u20$as$u20$wasi_snapshot_preview1..bindings.._rt..WasmResource$GT$4drop4drop17h74b054ace65a729fE
      end
      local.get 2
      i32.const 16
      i32.add
      global.set $__stack_pointer
    )
    (func $_ZN22wasi_snapshot_preview16macros11unreachable17he1d3116e01cc340dE (;13;) (type 0) (param i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 1
      global.set $__stack_pointer
      local.get 0
      call $_ZN22wasi_snapshot_preview16macros18eprint_unreachable17hf3e9d5c9c5a8815aE
      local.get 1
      i32.const 10
      i32.store8 offset=15
      local.get 1
      i32.const 15
      i32.add
      i32.const 1
      call $_ZN22wasi_snapshot_preview16macros5print17h9c9d9fd21c22ed6eE
      unreachable
    )
    (func $environ_get (;14;) (type 5) (param i32 i32) (result i32)
      (local i32 i32 i32 i32 i32 i32)
      call $allocate_stack
      global.get $__stack_pointer
      i32.const 32
      i32.sub
      local.tee 2
      global.set $__stack_pointer
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            call $_ZN22wasi_snapshot_preview15State3ptr17h7789f7ba54ccf647E
            local.tee 3
            i32.load
            i32.const 560490357
            i32.ne
            br_if 0 (;@3;)
            local.get 3
            i32.load offset=65532
            i32.const 560490357
            i32.ne
            br_if 1 (;@2;)
            local.get 3
            i32.const 59032
            i32.store offset=20
            local.get 3
            i32.const -1
            i32.store offset=12
            local.get 3
            local.get 1
            i32.store offset=8
            local.get 3
            local.get 3
            i32.const 6192
            i32.add
            i32.store offset=16
            local.get 3
            i32.load offset=4
            local.set 1
            local.get 3
            i32.const 2
            i32.store offset=4
            local.get 1
            i32.const 4
            i32.ne
            br_if 2 (;@1;)
            local.get 2
            i64.const 0
            i64.store align=4
            local.get 2
            call $_ZN22wasi_snapshot_preview124wasi_cli_get_environment17hc764838d2ad13cceE
            local.get 2
            i32.load offset=4
            local.set 4
            local.get 2
            i32.load
            local.set 1
            local.get 3
            i32.const 4
            i32.store offset=4
            block ;; label = @4
              local.get 4
              i32.eqz
              br_if 0 (;@4;)
              loop ;; label = @5
                local.get 1
                i32.const 12
                i32.add
                i32.load
                local.set 3
                local.get 1
                i32.const 8
                i32.add
                i32.load
                local.set 5
                local.get 1
                i32.const 4
                i32.add
                i32.load
                local.set 6
                local.get 0
                local.get 1
                i32.load
                local.tee 7
                i32.store
                local.get 7
                local.get 6
                i32.add
                i32.const 61
                i32.store8
                local.get 5
                local.get 3
                i32.add
                i32.const 0
                i32.store8
                local.get 1
                i32.const 16
                i32.add
                local.set 1
                local.get 0
                i32.const 4
                i32.add
                local.set 0
                local.get 4
                i32.const -1
                i32.add
                local.tee 4
                br_if 0 (;@5;)
              end
            end
            local.get 2
            i32.const 32
            i32.add
            global.set $__stack_pointer
            i32.const 0
            return
          end
          i32.const 2803
          call $_ZN22wasi_snapshot_preview16macros11assert_fail17hbfcba5b0fa6b0547E
          unreachable
        end
        i32.const 2804
        call $_ZN22wasi_snapshot_preview16macros11assert_fail17hbfcba5b0fa6b0547E
        unreachable
      end
      i32.const 2944
      call $_ZN22wasi_snapshot_preview16macros18eprint_unreachable17hf3e9d5c9c5a8815aE
      local.get 2
      i32.const 8250
      i32.store16 align=1
      local.get 2
      i32.const 2
      call $_ZN22wasi_snapshot_preview16macros5print17h9c9d9fd21c22ed6eE
      local.get 2
      i32.const 10
      i32.store8 offset=28
      local.get 2
      i32.const 1952805664
      i32.store offset=24 align=1
      local.get 2
      i64.const 8747223464599642400
      i64.store offset=16 align=1
      local.get 2
      i64.const 8245937404367563884
      i64.store offset=8 align=1
      local.get 2
      i64.const 6998721855778483561
      i64.store align=1
      local.get 2
      i32.const 29
      call $_ZN22wasi_snapshot_preview16macros5print17h9c9d9fd21c22ed6eE
      local.get 2
      i32.const 10
      i32.store8
      local.get 2
      i32.const 1
      call $_ZN22wasi_snapshot_preview16macros5print17h9c9d9fd21c22ed6eE
      unreachable
    )
    (func $environ_sizes_get (;15;) (type 5) (param i32 i32) (result i32)
      (local i32 i32 i32 i32)
      call $allocate_stack
      global.get $__stack_pointer
      i32.const 32
      i32.sub
      local.tee 2
      global.set $__stack_pointer
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                block ;; label = @6
                  block ;; label = @7
                    call $get_allocation_state
                    i32.const -2
                    i32.add
                    br_table 1 (;@6;) 0 (;@7;) 1 (;@6;) 0 (;@7;)
                  end
                  i32.const 0
                  local.set 3
                  local.get 0
                  i32.const 0
                  i32.store
                  br 1 (;@5;)
                end
                call $_ZN22wasi_snapshot_preview15State3ptr17h7789f7ba54ccf647E
                local.tee 3
                i32.load
                i32.const 560490357
                i32.ne
                br_if 1 (;@4;)
                local.get 3
                i32.load offset=65532
                i32.const 560490357
                i32.ne
                br_if 2 (;@3;)
                local.get 3
                i32.const 59032
                i32.store offset=16
                local.get 3
                local.get 3
                i32.const 6192
                i32.add
                i32.store offset=12
                local.get 3
                i32.load offset=4
                local.set 4
                local.get 3
                i64.const 1
                i64.store offset=4 align=4
                local.get 4
                i32.const 4
                i32.ne
                br_if 3 (;@2;)
                local.get 2
                i64.const 0
                i64.store align=4
                local.get 2
                call $_ZN22wasi_snapshot_preview124wasi_cli_get_environment17hc764838d2ad13cceE
                local.get 2
                i32.load offset=4
                local.set 4
                local.get 3
                i32.load offset=4
                local.set 5
                local.get 3
                i32.const 4
                i32.store offset=4
                local.get 5
                i32.const 1
                i32.ne
                br_if 4 (;@1;)
                local.get 3
                i32.load offset=8
                local.set 3
                local.get 0
                local.get 4
                i32.store
                local.get 3
                local.get 4
                i32.const 1
                i32.shl
                i32.add
                local.set 3
              end
              local.get 1
              local.get 3
              i32.store
              local.get 2
              i32.const 32
              i32.add
              global.set $__stack_pointer
              i32.const 0
              return
            end
            i32.const 2803
            call $_ZN22wasi_snapshot_preview16macros11assert_fail17hbfcba5b0fa6b0547E
            unreachable
          end
          i32.const 2804
          call $_ZN22wasi_snapshot_preview16macros11assert_fail17hbfcba5b0fa6b0547E
          unreachable
        end
        i32.const 2944
        call $_ZN22wasi_snapshot_preview16macros18eprint_unreachable17hf3e9d5c9c5a8815aE
        local.get 2
        i32.const 8250
        i32.store16 align=1
        local.get 2
        i32.const 2
        call $_ZN22wasi_snapshot_preview16macros5print17h9c9d9fd21c22ed6eE
        local.get 2
        i32.const 10
        i32.store8 offset=28
        local.get 2
        i32.const 1952805664
        i32.store offset=24 align=1
        local.get 2
        i64.const 8747223464599642400
        i64.store offset=16 align=1
        local.get 2
        i64.const 8245937404367563884
        i64.store offset=8 align=1
        local.get 2
        i64.const 6998721855778483561
        i64.store align=1
        local.get 2
        i32.const 29
        call $_ZN22wasi_snapshot_preview16macros5print17h9c9d9fd21c22ed6eE
        local.get 2
        i32.const 10
        i32.store8
        local.get 2
        i32.const 1
        call $_ZN22wasi_snapshot_preview16macros5print17h9c9d9fd21c22ed6eE
        unreachable
      end
      i32.const 644
      call $_ZN22wasi_snapshot_preview16macros11unreachable17he1d3116e01cc340dE
      unreachable
    )
    (func $_ZN22wasi_snapshot_preview18bindings4wasi2io7streams12OutputStream24blocking_write_and_flush17h2c9dfbfe41e99e82E (;16;) (type 2) (param i32 i32 i32 i32)
      (local i32 i64)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 4
      global.set $__stack_pointer
      local.get 1
      i32.load
      local.get 2
      local.get 3
      local.get 4
      i32.const 4
      i32.add
      call $_ZN22wasi_snapshot_preview18bindings4wasi2io7streams12OutputStream24blocking_write_and_flush11wit_import217hea2384f87c28a782E
      block ;; label = @1
        block ;; label = @2
          local.get 4
          i32.load8_u offset=4
          br_if 0 (;@2;)
          i64.const 2
          local.set 5
          br 1 (;@1;)
        end
        i64.const 1
        local.get 4
        i64.load32_u offset=12
        i64.const 32
        i64.shl
        local.get 4
        i32.load8_u offset=8
        select
        local.set 5
      end
      local.get 0
      local.get 5
      i64.store align=4
      local.get 4
      i32.const 16
      i32.add
      global.set $__stack_pointer
    )
    (func $proc_exit (;17;) (type 0) (param i32)
      (local i32)
      call $allocate_stack
      global.get $__stack_pointer
      i32.const 48
      i32.sub
      local.tee 1
      global.set $__stack_pointer
      local.get 0
      i32.const 0
      i32.ne
      call $_ZN22wasi_snapshot_preview18bindings4wasi3cli4exit4exit17h2ac252088eb96da8E
      i32.const 2333
      call $_ZN22wasi_snapshot_preview16macros18eprint_unreachable17hf3e9d5c9c5a8815aE
      local.get 1
      i32.const 8250
      i32.store16 offset=10 align=1
      local.get 1
      i32.const 10
      i32.add
      i32.const 2
      call $_ZN22wasi_snapshot_preview16macros5print17h9c9d9fd21c22ed6eE
      local.get 1
      i32.const 2593
      i32.store16 offset=46 align=1
      local.get 1
      i32.const 1953069157
      i32.store offset=42 align=1
      local.get 1
      i64.const 2338537461596644384
      i64.store offset=34 align=1
      local.get 1
      i64.const 7957695015159098981
      i64.store offset=26 align=1
      local.get 1
      i64.const 7882825952909664372
      i64.store offset=18 align=1
      local.get 1
      i64.const 7599935561254793064
      i64.store offset=10 align=1
      local.get 1
      i32.const 10
      i32.add
      i32.const 38
      call $_ZN22wasi_snapshot_preview16macros5print17h9c9d9fd21c22ed6eE
      local.get 1
      i32.const 10
      i32.store8 offset=10
      local.get 1
      i32.const 10
      i32.add
      i32.const 1
      call $_ZN22wasi_snapshot_preview16macros5print17h9c9d9fd21c22ed6eE
      unreachable
    )
    (func $_ZN22wasi_snapshot_preview18bindings4wasi3cli4exit4exit17h2ac252088eb96da8E (;18;) (type 0) (param i32)
      local.get 0
      call $_ZN22wasi_snapshot_preview18bindings4wasi3cli4exit4exit11wit_import117hd1c63b9a46050b9dE
    )
    (func $_ZN22wasi_snapshot_preview15State3new17hc823f6207d67811fE (;19;) (type 4) (result i32)
      (local i32)
      block ;; label = @1
        call $get_allocation_state
        i32.const 2
        i32.ne
        br_if 0 (;@1;)
        i32.const 3
        call $set_allocation_state
        i32.const 0
        i32.const 0
        i32.const 8
        i32.const 65536
        call $_ZN22wasi_snapshot_preview15State3new12cabi_realloc17h5d5233c0485a18bdE
        local.set 0
        i32.const 4
        call $set_allocation_state
        local.get 0
        i32.const 2
        i32.store offset=6180
        local.get 0
        i32.const 0
        i32.store offset=24
        local.get 0
        i64.const 17740359541
        i64.store
        block ;; label = @2
          i32.const 37
          i32.eqz
          br_if 0 (;@2;)
          local.get 0
          i32.const 65480
          i32.add
          i32.const 0
          i32.const 37
          memory.fill
        end
        local.get 0
        i32.const 560490357
        i32.store offset=65532
        local.get 0
        i32.const 11822
        i32.store16 offset=65528
        local.get 0
        i32.const 0
        i32.store offset=65520
        local.get 0
        return
      end
      i32.const 2835
      call $_ZN22wasi_snapshot_preview16macros11assert_fail17hbfcba5b0fa6b0547E
      unreachable
    )
    (func $_ZN22wasi_snapshot_preview16macros10eprint_u3215eprint_u32_impl17h798b90aa412f3f56E (;20;) (type 0) (param i32)
      (local i32 i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 1
      global.set $__stack_pointer
      block ;; label = @1
        local.get 0
        i32.eqz
        br_if 0 (;@1;)
        local.get 0
        i32.const 10
        i32.div_u
        local.tee 2
        call $_ZN22wasi_snapshot_preview16macros10eprint_u3215eprint_u32_impl17h798b90aa412f3f56E
        local.get 1
        local.get 2
        i32.const 246
        i32.mul
        local.get 0
        i32.add
        i32.const 48
        i32.or
        i32.store8 offset=15
        local.get 1
        i32.const 15
        i32.add
        i32.const 1
        call $_ZN22wasi_snapshot_preview16macros5print17h9c9d9fd21c22ed6eE
      end
      local.get 1
      i32.const 16
      i32.add
      global.set $__stack_pointer
    )
    (func $_ZN22wasi_snapshot_preview16macros10eprint_u3217h3a4dc17d787e2b64E (;21;) (type 0) (param i32)
      local.get 0
      call $_ZN22wasi_snapshot_preview16macros10eprint_u3215eprint_u32_impl17h798b90aa412f3f56E
    )
    (func $get_state_ptr (;22;) (type 4) (result i32)
      global.get $internal_state_ptr
    )
    (func $set_state_ptr (;23;) (type 0) (param i32)
      local.get 0
      global.set $internal_state_ptr
    )
    (func $get_allocation_state (;24;) (type 4) (result i32)
      global.get $allocation_state
    )
    (func $set_allocation_state (;25;) (type 0) (param i32)
      local.get 0
      global.set $allocation_state
    )
    (func $allocate_stack (;26;) (type 7)
      global.get $allocation_state
      i32.const 0
      i32.eq
      if ;; label = @1
        i32.const 1
        global.set $allocation_state
        i32.const 0
        i32.const 0
        i32.const 8
        i32.const 65536
        call $_ZN22wasi_snapshot_preview15State3new12cabi_realloc17h5d5233c0485a18bdE
        i32.const 65536
        i32.add
        global.set $__stack_pointer
        i32.const 2
        global.set $allocation_state
      end
    )
    (@producers
      (language "Rust" "")
      (processed-by "rustc" "1.90.0 (1159e78c4 2025-09-14)")
    )
  )
  (core module $wit-component-shim-module (;2;)
    (type (;0;) (func (param i32)))
    (type (;1;) (func (param i32)))
    (type (;2;) (func (param i32 i32 i32 i32 i32 i32 i32 i32)))
    (type (;3;) (func (param i32 i32)))
    (type (;4;) (func (param i32 i32 i32 i32)))
    (type (;5;) (func (param i32 i32) (result i32)))
    (type (;6;) (func (param i32)))
    (table (;0;) 11 11 funcref)
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
    (export "$imports" (table 0))
    (func (;0;) (type 0) (param i32)
      local.get 0
      i32.const 0
      call_indirect (type 0)
    )
    (func (;1;) (type 0) (param i32)
      local.get 0
      i32.const 1
      call_indirect (type 0)
    )
    (func (;2;) (type 1) (param i32)
      local.get 0
      i32.const 2
      call_indirect (type 1)
    )
    (func (;3;) (type 2) (param i32 i32 i32 i32 i32 i32 i32 i32)
      local.get 0
      local.get 1
      local.get 2
      local.get 3
      local.get 4
      local.get 5
      local.get 6
      local.get 7
      i32.const 3
      call_indirect (type 2)
    )
    (func (;4;) (type 3) (param i32 i32)
      local.get 0
      local.get 1
      i32.const 4
      call_indirect (type 3)
    )
    (func (;5;) (type 4) (param i32 i32 i32 i32)
      local.get 0
      local.get 1
      local.get 2
      local.get 3
      i32.const 5
      call_indirect (type 4)
    )
    (func (;6;) (type 5) (param i32 i32) (result i32)
      local.get 0
      local.get 1
      i32.const 6
      call_indirect (type 5)
    )
    (func (;7;) (type 5) (param i32 i32) (result i32)
      local.get 0
      local.get 1
      i32.const 7
      call_indirect (type 5)
    )
    (func (;8;) (type 6) (param i32)
      local.get 0
      i32.const 8
      call_indirect (type 6)
    )
    (func (;9;) (type 0) (param i32)
      local.get 0
      i32.const 9
      call_indirect (type 0)
    )
    (func (;10;) (type 4) (param i32 i32 i32 i32)
      local.get 0
      local.get 1
      local.get 2
      local.get 3
      i32.const 10
      call_indirect (type 4)
    )
    (@producers
      (processed-by "wit-component" "0.241.2")
    )
  )
  (core module $wit-component-fixup (;3;)
    (type (;0;) (func (param i32)))
    (type (;1;) (func (param i32)))
    (type (;2;) (func (param i32 i32 i32 i32 i32 i32 i32 i32)))
    (type (;3;) (func (param i32 i32)))
    (type (;4;) (func (param i32 i32 i32 i32)))
    (type (;5;) (func (param i32 i32) (result i32)))
    (type (;6;) (func (param i32)))
    (import "" "0" (func (;0;) (type 0)))
    (import "" "1" (func (;1;) (type 0)))
    (import "" "2" (func (;2;) (type 1)))
    (import "" "3" (func (;3;) (type 2)))
    (import "" "4" (func (;4;) (type 3)))
    (import "" "5" (func (;5;) (type 4)))
    (import "" "6" (func (;6;) (type 5)))
    (import "" "7" (func (;7;) (type 5)))
    (import "" "8" (func (;8;) (type 6)))
    (import "" "9" (func (;9;) (type 0)))
    (import "" "10" (func (;10;) (type 4)))
    (import "" "$imports" (table (;0;) 11 11 funcref))
    (elem (;0;) (i32.const 0) func 0 1 2 3 4 5 6 7 8 9 10)
    (@producers
      (processed-by "wit-component" "0.241.2")
    )
  )
  (core instance $wit-component-shim-instance (;0;) (instantiate $wit-component-shim-module))
  (alias export $nebula:core/types "order" (type $order (;15;)))
  (alias export $nebula:core/types "quote" (type $quote (;16;)))
  (alias core export $wit-component-shim-instance "0" (core func $indirect-wasi:clocks/wall-clock@0.2.0-now (;0;)))
  (core instance $wasi:clocks/wall-clock@0.2.0 (;1;)
    (export "now" (func $indirect-wasi:clocks/wall-clock@0.2.0-now))
  )
  (alias core export $wit-component-shim-instance "1" (core func $indirect-wasi:otel/tracing@0.3.0-inner-span-context (;1;)))
  (alias core export $wit-component-shim-instance "2" (core func $indirect-wasi:otel/tracing@0.3.0-on-end (;2;)))
  (alias core export $wit-component-shim-instance "3" (core func $indirect-wasi:otel/tracing@0.3.0-on-start (;3;)))
  (core instance $wasi:otel/tracing@0.3.0 (;2;)
    (export "inner-span-context" (func $indirect-wasi:otel/tracing@0.3.0-inner-span-context))
    (export "on-end" (func $indirect-wasi:otel/tracing@0.3.0-on-end))
    (export "on-start" (func $indirect-wasi:otel/tracing@0.3.0-on-start))
  )
  (alias export $wasi:random/random@0.2.10 "get-random-u64" (func $get-random-u64 (;0;)))
  (core func $get-random-u64 (;4;) (canon lower (func $get-random-u64)))
  (core instance $wasi:random/random@0.2.10 (;3;)
    (export "get-random-u64" (func $get-random-u64))
  )
  (alias export $wasi:io/error@0.2.10 "error" (type $"#type17 error" (@name "error") (;17;)))
  (core func $resource.drop (;5;) (canon resource.drop $"#type17 error"))
  (alias core export $wit-component-shim-instance "4" (core func $"indirect-wasi:io/error@0.2.4-[method]error.to-debug-string" (;6;)))
  (core instance $wasi:io/error@0.2.4 (;4;)
    (export "[resource-drop]error" (func $resource.drop))
    (export "[method]error.to-debug-string" (func $"indirect-wasi:io/error@0.2.4-[method]error.to-debug-string"))
  )
  (alias export $wasi:io/streams@0.2.10 "output-stream" (type $"#type18 output-stream" (@name "output-stream") (;18;)))
  (core func $"#core-func7 resource.drop" (@name "resource.drop") (;7;) (canon resource.drop $"#type18 output-stream"))
  (alias core export $wit-component-shim-instance "5" (core func $"indirect-wasi:io/streams@0.2.4-[method]output-stream.blocking-write-and-flush" (;8;)))
  (core instance $wasi:io/streams@0.2.4 (;5;)
    (export "[resource-drop]output-stream" (func $"#core-func7 resource.drop"))
    (export "[method]output-stream.blocking-write-and-flush" (func $"indirect-wasi:io/streams@0.2.4-[method]output-stream.blocking-write-and-flush"))
  )
  (alias export $wasi:cli/stderr@0.2.10 "get-stderr" (func $get-stderr (;1;)))
  (core func $get-stderr (;9;) (canon lower (func $get-stderr)))
  (core instance $wasi:cli/stderr@0.2.4 (;6;)
    (export "get-stderr" (func $get-stderr))
  )
  (alias core export $wit-component-shim-instance "6" (core func $adapt-wasi_snapshot_preview1-environ_get (;10;)))
  (alias core export $wit-component-shim-instance "7" (core func $adapt-wasi_snapshot_preview1-environ_sizes_get (;11;)))
  (alias core export $wit-component-shim-instance "8" (core func $adapt-wasi_snapshot_preview1-proc_exit (;12;)))
  (core instance $wasi_snapshot_preview1 (;7;)
    (export "environ_get" (func $adapt-wasi_snapshot_preview1-environ_get))
    (export "environ_sizes_get" (func $adapt-wasi_snapshot_preview1-environ_sizes_get))
    (export "proc_exit" (func $adapt-wasi_snapshot_preview1-proc_exit))
  )
  (core instance $main (;8;) (instantiate $main
      (with "wasi:clocks/wall-clock@0.2.0" (instance $wasi:clocks/wall-clock@0.2.0))
      (with "wasi:otel/tracing@0.3.0" (instance $wasi:otel/tracing@0.3.0))
      (with "wasi:random/random@0.2.10" (instance $wasi:random/random@0.2.10))
      (with "wasi:io/error@0.2.4" (instance $wasi:io/error@0.2.4))
      (with "wasi:io/streams@0.2.4" (instance $wasi:io/streams@0.2.4))
      (with "wasi:cli/stderr@0.2.4" (instance $wasi:cli/stderr@0.2.4))
      (with "wasi_snapshot_preview1" (instance $wasi_snapshot_preview1))
    )
  )
  (alias core export $main "memory" (core memory $memory (;0;)))
  (core instance $env (;9;)
    (export "memory" (memory $memory))
  )
  (alias core export $wit-component-shim-instance "9" (core func $indirect-wasi:cli/environment@0.2.6-get-environment (;13;)))
  (core instance $wasi:cli/environment@0.2.6 (;10;)
    (export "get-environment" (func $indirect-wasi:cli/environment@0.2.6-get-environment))
  )
  (alias export $wasi:io/streams@0.2.10 "output-stream" (type $"#type19 output-stream" (@name "output-stream") (;19;)))
  (core func $"#core-func14 resource.drop" (@name "resource.drop") (;14;) (canon resource.drop $"#type19 output-stream"))
  (alias core export $wit-component-shim-instance "10" (core func $"indirect-wasi:io/streams@0.2.6-[method]output-stream.blocking-write-and-flush" (;15;)))
  (core instance $wasi:io/streams@0.2.6 (;11;)
    (export "[resource-drop]output-stream" (func $"#core-func14 resource.drop"))
    (export "[method]output-stream.blocking-write-and-flush" (func $"indirect-wasi:io/streams@0.2.6-[method]output-stream.blocking-write-and-flush"))
  )
  (alias export $wasi:io/error@0.2.10 "error" (type $"#type20 error" (@name "error") (;20;)))
  (core func $"#core-func16 resource.drop" (@name "resource.drop") (;16;) (canon resource.drop $"#type20 error"))
  (core instance $wasi:io/error@0.2.6 (;12;)
    (export "[resource-drop]error" (func $"#core-func16 resource.drop"))
  )
  (alias core export $main "cabi_realloc" (core func $cabi_realloc (;17;)))
  (core instance $__main_module__ (;13;)
    (export "cabi_realloc" (func $cabi_realloc))
  )
  (alias export $wasi:cli/stderr@0.2.10 "get-stderr" (func $"#func2 get-stderr" (@name "get-stderr") (;2;)))
  (core func $"#core-func18 get-stderr" (@name "get-stderr") (;18;) (canon lower (func $"#func2 get-stderr")))
  (core instance $wasi:cli/stderr@0.2.6 (;14;)
    (export "get-stderr" (func $"#core-func18 get-stderr"))
  )
  (alias export $wasi:cli/exit@0.2.10 "exit" (func $exit (;3;)))
  (core func $exit (;19;) (canon lower (func $exit)))
  (core instance $wasi:cli/exit@0.2.6 (;15;)
    (export "exit" (func $exit))
  )
  (core instance $"#core-instance16 wasi_snapshot_preview1" (@name "wasi_snapshot_preview1") (;16;) (instantiate $wit-component:adapter:wasi_snapshot_preview1
      (with "env" (instance $env))
      (with "wasi:cli/environment@0.2.6" (instance $wasi:cli/environment@0.2.6))
      (with "wasi:io/streams@0.2.6" (instance $wasi:io/streams@0.2.6))
      (with "wasi:io/error@0.2.6" (instance $wasi:io/error@0.2.6))
      (with "__main_module__" (instance $__main_module__))
      (with "wasi:cli/stderr@0.2.6" (instance $wasi:cli/stderr@0.2.6))
      (with "wasi:cli/exit@0.2.6" (instance $wasi:cli/exit@0.2.6))
    )
  )
  (alias core export $wit-component-shim-instance "$imports" (core table $"shim table" (;0;)))
  (alias export $wasi:clocks/wall-clock@0.2.10 "now" (func $now (;4;)))
  (core func $"#core-func20 indirect-wasi:clocks/wall-clock@0.2.0-now" (@name "indirect-wasi:clocks/wall-clock@0.2.0-now") (;20;) (canon lower (func $now) (memory $memory)))
  (alias export $wasi:otel/tracing@0.3.0 "inner-span-context" (func $inner-span-context (;5;)))
  (core func $"#core-func21 indirect-wasi:otel/tracing@0.3.0-inner-span-context" (@name "indirect-wasi:otel/tracing@0.3.0-inner-span-context") (;21;) (canon lower (func $inner-span-context) (memory $memory) (realloc $cabi_realloc) string-encoding=utf8))
  (alias export $wasi:otel/tracing@0.3.0 "on-end" (func $on-end (;6;)))
  (core func $"#core-func22 indirect-wasi:otel/tracing@0.3.0-on-end" (@name "indirect-wasi:otel/tracing@0.3.0-on-end") (;22;) (canon lower (func $on-end) (memory $memory) string-encoding=utf8))
  (alias export $wasi:otel/tracing@0.3.0 "on-start" (func $on-start (;7;)))
  (core func $"#core-func23 indirect-wasi:otel/tracing@0.3.0-on-start" (@name "indirect-wasi:otel/tracing@0.3.0-on-start") (;23;) (canon lower (func $on-start) (memory $memory) string-encoding=utf8))
  (alias export $wasi:io/error@0.2.10 "[method]error.to-debug-string" (func $"[method]error.to-debug-string" (;8;)))
  (core func $"#core-func24 indirect-wasi:io/error@0.2.4-[method]error.to-debug-string" (@name "indirect-wasi:io/error@0.2.4-[method]error.to-debug-string") (;24;) (canon lower (func $"[method]error.to-debug-string") (memory $memory) (realloc $cabi_realloc) string-encoding=utf8))
  (alias export $wasi:io/streams@0.2.10 "[method]output-stream.blocking-write-and-flush" (func $"[method]output-stream.blocking-write-and-flush" (;9;)))
  (core func $"#core-func25 indirect-wasi:io/streams@0.2.4-[method]output-stream.blocking-write-and-flush" (@name "indirect-wasi:io/streams@0.2.4-[method]output-stream.blocking-write-and-flush") (;25;) (canon lower (func $"[method]output-stream.blocking-write-and-flush") (memory $memory)))
  (alias core export $"#core-instance16 wasi_snapshot_preview1" "environ_get" (core func $environ_get (;26;)))
  (alias core export $"#core-instance16 wasi_snapshot_preview1" "environ_sizes_get" (core func $environ_sizes_get (;27;)))
  (alias core export $"#core-instance16 wasi_snapshot_preview1" "proc_exit" (core func $proc_exit (;28;)))
  (alias export $wasi:cli/environment@0.2.10 "get-environment" (func $get-environment (;10;)))
  (alias core export $"#core-instance16 wasi_snapshot_preview1" "cabi_import_realloc" (core func $realloc (;29;)))
  (core func $"#core-func30 indirect-wasi:cli/environment@0.2.6-get-environment" (@name "indirect-wasi:cli/environment@0.2.6-get-environment") (;30;) (canon lower (func $get-environment) (memory $memory) (realloc $realloc) string-encoding=utf8))
  (alias export $wasi:io/streams@0.2.10 "[method]output-stream.blocking-write-and-flush" (func $"#func11 [method]output-stream.blocking-write-and-flush" (@name "[method]output-stream.blocking-write-and-flush") (;11;)))
  (core func $"#core-func31 indirect-wasi:io/streams@0.2.6-[method]output-stream.blocking-write-and-flush" (@name "indirect-wasi:io/streams@0.2.6-[method]output-stream.blocking-write-and-flush") (;31;) (canon lower (func $"#func11 [method]output-stream.blocking-write-and-flush") (memory $memory)))
  (core instance $fixup-args (;17;)
    (export "$imports" (table $"shim table"))
    (export "0" (func $"#core-func20 indirect-wasi:clocks/wall-clock@0.2.0-now"))
    (export "1" (func $"#core-func21 indirect-wasi:otel/tracing@0.3.0-inner-span-context"))
    (export "2" (func $"#core-func22 indirect-wasi:otel/tracing@0.3.0-on-end"))
    (export "3" (func $"#core-func23 indirect-wasi:otel/tracing@0.3.0-on-start"))
    (export "4" (func $"#core-func24 indirect-wasi:io/error@0.2.4-[method]error.to-debug-string"))
    (export "5" (func $"#core-func25 indirect-wasi:io/streams@0.2.4-[method]output-stream.blocking-write-and-flush"))
    (export "6" (func $environ_get))
    (export "7" (func $environ_sizes_get))
    (export "8" (func $proc_exit))
    (export "9" (func $"#core-func30 indirect-wasi:cli/environment@0.2.6-get-environment"))
    (export "10" (func $"#core-func31 indirect-wasi:io/streams@0.2.6-[method]output-stream.blocking-write-and-flush"))
  )
  (core instance $fixup (;18;) (instantiate $wit-component-fixup
      (with "" (instance $fixup-args))
    )
  )
  (type (;21;) (func (param "order" $order) (result $quote)))
  (alias core export $main "nebula:service/orders#create-order" (core func $nebula:service/orders#create-order (;32;)))
  (alias core export $main "cabi_post_nebula:service/orders#create-order" (core func $cabi_post_nebula:service/orders#create-order (;33;)))
  (func $create-order (;12;) (type 21) (canon lift (core func $nebula:service/orders#create-order) (memory $memory) (realloc $cabi_realloc) string-encoding=utf8 (post-return $cabi_post_nebula:service/orders#create-order)))
  (type (;22;) (option $order))
  (type (;23;) (func (param "order-id" string) (result 22)))
  (alias core export $main "nebula:service/orders#read-order" (core func $nebula:service/orders#read-order (;34;)))
  (alias core export $main "cabi_post_nebula:service/orders#read-order" (core func $cabi_post_nebula:service/orders#read-order (;35;)))
  (func $read-order (;13;) (type 23) (canon lift (core func $nebula:service/orders#read-order) (memory $memory) (realloc $cabi_realloc) string-encoding=utf8 (post-return $cabi_post_nebula:service/orders#read-order)))
  (type (;24;) (func (param "order-id" string)))
  (alias core export $main "nebula:service/orders#delete-order" (core func $nebula:service/orders#delete-order (;36;)))
  (func $delete-order (;14;) (type 24) (canon lift (core func $nebula:service/orders#delete-order) (memory $memory) (realloc $cabi_realloc) string-encoding=utf8))
  (alias export $nebula:core/types "item" (type $item (;25;)))
  (alias export $nebula:core/types "country" (type $country (;26;)))
  (alias export $nebula:core/types "order" (type $"#type27 order" (@name "order") (;27;)))
  (alias export $nebula:core/types "currency" (type $currency (;28;)))
  (alias export $nebula:core/types "quote" (type $"#type29 quote" (@name "quote") (;29;)))
  (component $nebula:service/orders-shim-component (;0;)
    (type (;0;) (record (field "sku" string) (field "quantity" u32) (field "unit-price" f64)))
    (import "import-type-item" (type (;1;) (eq 0)))
    (type (;2;) (enum "BE" "US" "UK" "JP" "CA" "AU"))
    (import "import-type-country" (type (;3;) (eq 2)))
    (type (;4;) (list 1))
    (type (;5;) (record (field "order-id" string) (field "items" 4) (field "destination" 3)))
    (import "import-type-order" (type (;6;) (eq 5)))
    (type (;7;) (enum "EUR" "USD" "GBP" "JPY" "CAD" "AUD"))
    (import "import-type-currency" (type (;8;) (eq 7)))
    (type (;9;) (record (field "order-id" string) (field "subtotal" f64) (field "tax" f64) (field "total" f64) (field "currency" 8)))
    (import "import-type-quote" (type (;10;) (eq 9)))
    (import "import-type-order0" (type (;11;) (eq 6)))
    (import "import-type-quote0" (type (;12;) (eq 10)))
    (type (;13;) (func (param "order" 11) (result 12)))
    (import "import-func-create-order" (func (;0;) (type 13)))
    (type (;14;) (option 11))
    (type (;15;) (func (param "order-id" string) (result 14)))
    (import "import-func-read-order" (func (;1;) (type 15)))
    (type (;16;) (func (param "order-id" string)))
    (import "import-func-delete-order" (func (;2;) (type 16)))
    (export (;17;) "order" (type 6))
    (export (;18;) "quote" (type 10))
    (type (;19;) (func (param "order" 17) (result 18)))
    (export (;3;) "create-order" (func 0) (func (type 19)))
    (type (;20;) (option 17))
    (type (;21;) (func (param "order-id" string) (result 20)))
    (export (;4;) "read-order" (func 1) (func (type 21)))
    (type (;22;) (func (param "order-id" string)))
    (export (;5;) "delete-order" (func 2) (func (type 22)))
  )
  (instance $nebula:service/orders-shim-instance (;10;) (instantiate $nebula:service/orders-shim-component
      (with "import-func-create-order" (func $create-order))
      (with "import-func-read-order" (func $read-order))
      (with "import-func-delete-order" (func $delete-order))
      (with "import-type-item" (type $item))
      (with "import-type-country" (type $country))
      (with "import-type-order" (type $"#type27 order"))
      (with "import-type-currency" (type $currency))
      (with "import-type-quote" (type $"#type29 quote"))
      (with "import-type-order0" (type $order))
      (with "import-type-quote0" (type $quote))
    )
  )
  (export $nebula:service/orders (;11;) "nebula:service/orders" (instance $nebula:service/orders-shim-instance))
  (type (;30;) (option $quote))
  (type (;31;) (func (param "order-id" string) (result 30)))
  (alias core export $main "nebula:service/quotes#read-quote" (core func $nebula:service/quotes#read-quote (;37;)))
  (alias core export $main "cabi_post_nebula:service/quotes#read-quote" (core func $cabi_post_nebula:service/quotes#read-quote (;38;)))
  (func $read-quote (;15;) (type 31) (canon lift (core func $nebula:service/quotes#read-quote) (memory $memory) (realloc $cabi_realloc) string-encoding=utf8 (post-return $cabi_post_nebula:service/quotes#read-quote)))
  (alias core export $main "nebula:service/quotes#delete-quote" (core func $nebula:service/quotes#delete-quote (;39;)))
  (func $delete-quote (;16;) (type 24) (canon lift (core func $nebula:service/quotes#delete-quote) (memory $memory) (realloc $cabi_realloc) string-encoding=utf8))
  (component $nebula:service/quotes-shim-component (;1;)
    (type (;0;) (record (field "sku" string) (field "quantity" u32) (field "unit-price" f64)))
    (import "import-type-item" (type (;1;) (eq 0)))
    (type (;2;) (enum "BE" "US" "UK" "JP" "CA" "AU"))
    (import "import-type-country" (type (;3;) (eq 2)))
    (type (;4;) (list 1))
    (type (;5;) (record (field "order-id" string) (field "items" 4) (field "destination" 3)))
    (import "import-type-order" (type (;6;) (eq 5)))
    (type (;7;) (enum "EUR" "USD" "GBP" "JPY" "CAD" "AUD"))
    (import "import-type-currency" (type (;8;) (eq 7)))
    (type (;9;) (record (field "order-id" string) (field "subtotal" f64) (field "tax" f64) (field "total" f64) (field "currency" 8)))
    (import "import-type-quote" (type (;10;) (eq 9)))
    (import "import-type-quote0" (type (;11;) (eq 10)))
    (type (;12;) (option 11))
    (type (;13;) (func (param "order-id" string) (result 12)))
    (import "import-func-read-quote" (func (;0;) (type 13)))
    (type (;14;) (func (param "order-id" string)))
    (import "import-func-delete-quote" (func (;1;) (type 14)))
    (export (;15;) "order" (type 6))
    (export (;16;) "quote" (type 10))
    (type (;17;) (option 16))
    (type (;18;) (func (param "order-id" string) (result 17)))
    (export (;2;) "read-quote" (func 0) (func (type 18)))
    (type (;19;) (func (param "order-id" string)))
    (export (;3;) "delete-quote" (func 1) (func (type 19)))
  )
  (instance $nebula:service/quotes-shim-instance (;12;) (instantiate $nebula:service/quotes-shim-component
      (with "import-func-read-quote" (func $read-quote))
      (with "import-func-delete-quote" (func $delete-quote))
      (with "import-type-item" (type $item))
      (with "import-type-country" (type $country))
      (with "import-type-order" (type $"#type27 order"))
      (with "import-type-currency" (type $currency))
      (with "import-type-quote" (type $"#type29 quote"))
      (with "import-type-quote0" (type $quote))
    )
  )
  (export $nebula:service/quotes (;13;) "nebula:service/quotes" (instance $nebula:service/quotes-shim-instance))
  (@producers
    (processed-by "wit-component" "0.241.2")
  )
)
