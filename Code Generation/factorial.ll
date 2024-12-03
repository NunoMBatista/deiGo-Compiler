define void @_main() {
  ret void
}

define i32 @main() {
  call void @_main()
  ret i32 0
}
