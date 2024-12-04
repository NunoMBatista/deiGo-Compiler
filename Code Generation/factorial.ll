declare i32 @atoi(i8*)
declare i32 @printf(i8*, ...)
@.str_int = private constant [4 x i8] c"%d\0A\00"
@.str_float = private constant [7 x i8] c"%.08f\0A\00"
@.str_true = private constant [6 x i8] c"true\0A\00"
@.str_false = private constant [7 x i8] c"false\0A\00"
@.str_string = private constant [4 x i8] c"%s\0A\00"


define double @_fcd() {
  %1 = fadd double 1.000000, 0.0
  %2 = fadd double 0.007, 0.0
  %3 = fadd double %1, %2
  ret double %3
  ret double 0.0
}

define void @_fca() {
  ret void
}

define i32 @_fcb() {
  %fafcb = alloca i32
  %1 = add i32 132, 0
  store i32 %1, i32* %fafcb
  %2 = load i32, i32* %fafcb
  ret i32 %2
  ret i32 0
}

@bb = global i1 false
@ia = global i32 0
@id = global i32 0
@ib = global i32 0
@fa = global double 0.0
@fb = global double 0.0
define double @_fch(i32 %iafch, double %fafch, i8* %safch) {
  %iafch.addr = alloca i32
  store i32 %iafch, i32* %iafch.addr
  %fafch.addr = alloca double
  store double %fafch, double* %fafch.addr
  %safch.addr = alloca i8*
  store i8* %safch, i8** %safch.addr
  %1 = call i32 @_fcb()
  %2 = call double @_fcd()
  call i32 @_fcg(i32 %1, double %2)
  %4 = load i8*, i8** %safch.addr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str_string, i32 0, i32 0), i8* %4)
  %6 = add i32 1, 0
  %7 = add i32 1, 0
  %8 = icmp eq i32 %6, %7
  store i1 %8, i1* @bb
  %9 = load i1, i1* @bb
  br i1 %9, label %L10true, label %L10false
L10true:
  %10 = alloca [6 x i8]
  store [6 x i8] c"FALSE\00", [6 x i8]* %10
  %ptr11 = getelementptr inbounds [6 x i8], [6 x i8]* %10, i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str_string, i32 0, i32 0), i8* %ptr11)
  %12 = load i32, i32* @ia
  %13 = load i32, i32* @ib
  %14 = add i32 %12, %13
  store i32 %14, i32* %iafch.addr
  %15 = load double, double* @fa
  store double %15, double* %fafch.addr
  %16 = load double, double* %fafch.addr
  store double %16, double* @fb
  %17 = load i32, i32* %iafch.addr
  store i32 %17, i32* @id
  br label %L10end
L10false:
  br label %L10end
L10end:
  %18 = alloca [5 x i8]
  store [5 x i8] c"TRUE\00", [5 x i8]* %18
  %ptr19 = getelementptr inbounds [5 x i8], [5 x i8]* %18, i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str_string, i32 0, i32 0), i8* %ptr19)
  %20 = fadd double 0.01, 0.0
  ret double %20
  ret double 0.0
}

define i32 @_fcg(i32 %iafcg, double %fafcg) {
  %iafcg.addr = alloca i32
  store i32 %iafcg, i32* %iafcg.addr
  %fafcg.addr = alloca double
  store double %fafcg, double* %fafcg.addr
  %1 = call double @_fcd()
  %2 = load double, double* %fafcg.addr
  %3 = fcmp ogt double %1, %2
  br i1 %3, label %L4true, label %L4false
L4true:
  call void @_fca()
  %4 = load i32, i32* %iafcg.addr
  ret i32 %4
  br label %L4end
L4false:
  br label %L4end
L4end:
  %6 = call i32 @_fcb()
  ret i32 %6
  ret i32 0
}

@x = global i32 0
define i1 @_fact(i32 %a, i32 %b) {
  %a.addr = alloca i32
  store i32 %a, i32* %a.addr
  %b.addr = alloca i32
  store i32 %b, i32* %b.addr
  %1 = load i32, i32* @x
  %2 = add i32 1, 0
  %3 = add i32 %1, %2
  store i32 %3, i32* @x
  %4 = add i32 1, 0
  %5 = add i32 1, 0
  %6 = icmp eq i32 %4, %5
  ret i1 %6
  ret i1 false
}

define void @_main() {
  %1 = add i32 1, 0
  store i32 %1, i32* @x
  %2 = add i32 1, 0
  %3 = add i32 1, 0
  %4 = icmp eq i32 %2, %3
  %5 = alloca i1
  br i1 %4, label %L5_true, label %L5_false
L5_true:
  store i1 true, i1* %5
  br label %L5_end
L5_false:
  %6 = add i32 1, 0
  %7 = add i32 1, 0
  %8 = call i1 @_fact(i32 %6, i32 %7)
  store i1 %8, i1* %5
  br label %L5_end
L5_end:
  %9 = load i1, i1* %5
  br i1 %9, label %L10true, label %L10false
L10true:
  %10 = load i32, i32* @x
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str_int, i32 0, i32 0), i32 %10)
  br label %L10end
L10false:
  br label %L10end
L10end:
  %12 = load i32, i32* @x
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str_int, i32 0, i32 0), i32 %12)
  ret void
}

define i32 @main() {
  call void @_main()
  ret i32 0
}
