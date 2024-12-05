declare i32 @atoi(i8*)
declare i32 @printf(i8*, ...)
@.str_int = private constant [4 x i8] c"%d\0A\00"
@.str_float = private constant [7 x i8] c"%.08f\0A\00"
@.str_true = private constant [6 x i8] c"true\0A\00"
@.str_false = private constant [7 x i8] c"false\0A\00"
@.str_string = private constant [4 x i8] c"%s\0A\00"


@ia = global i32 0
@ib = global i32 0
@ic = global i32 0
@id = global i32 0
@ie = global i32 0
@fa = global double 0.0
@fb = global double 0.0
@fc = global double 0.0
@fd = global double 0.0
@fe = global double 0.0
@ba = global i1 false
@bb = global i1 false
@bc = global i1 false
@bd = global i1 false
@sa = global i8* null
@sb = global i8* null
@sc = global i8* null
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

define double @_fcd() {
  %1 = fadd double 1.000000, 0.0
  %2 = fadd double 0.007, 0.0
  %3 = fadd double %1, %2
  ret double %3
  ret double 0.0
}

define i8* @_fce() {
  %strfce = alloca i8*
  %1 = load i8*, i8** %strfce
  ret i8* %1
  ret i8* null
}

define i1 @_fcf() {
  %bafcf = alloca i1
  %1 = load i1, i1* %bafcf
  ret i1 %1
  ret i1 false
}

define i32 @_fcg(i32 %iafcg, double %fafcg) {
  %iafcg.addr = alloca i32
  store i32 %iafcg, i32* %iafcg.addr
  %fafcg.addr = alloca double
  store double %fafcg, double* %fafcg.addr
  %1 = call double @_fcd()
  %3 = fcmp ogt double %1, %2
  br i1 %3, label %L4true, label %L4false
L4true:
  call void @_fca()
  ret i32 %4
  br label %L4end
L4false:
  br label %L4end
L4end:
  %6 = call i32 @_fcb()
  ret i32 %6
  ret i32 0
}

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
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str_string, i32 0, i32 0), i8* %4)
  %6 = load i1, i1* @bb
  br i1 %6, label %L7true, label %L7false
L7true:
  %7 = load i32, i32* @ia
  %8 = load i32, i32* @ib
  %9 = add i32 %7, %8
  %10 = load double, double* @fa
  store double %11, double* @fb
  store i32 %12, i32* @id
  br label %L7end
L7false:
  br label %L7end
L7end:
  %13 = fadd double 0.01, 0.0
  ret double %13
  ret double 0.0
}

define double @_fci(i32 %iafci, i32 %ibfci, double %fafci, double %fbfci, i8* %safci) {
  %iafci.addr = alloca i32
  store i32 %iafci, i32* %iafci.addr
  %ibfci.addr = alloca i32
  store i32 %ibfci, i32* %ibfci.addr
  %fafci.addr = alloca double
  store double %fafci, double* %fafci.addr
  %fbfci.addr = alloca double
  store double %fbfci, double* %fbfci.addr
  %safci.addr = alloca i8*
  store i8* %safci, i8** %safci.addr
  %1 = call i32 @_fcb()
  %2 = call double @_fcd()
  %3 = call i32 @_fcg(i32 %1, double %2)
  %4 = call double @_fcd()
  %5 = call i8* @_fce()
  call double @_fch(i32 %3, double %4, i8* %5)
  %8 = add i32 12, 0
  %9 = add i32 %7, %8
  %10 = load i32, i32* @ic
  %11 = add i32 %9, %10
  %12 = call i32 @_fcb()
  %13 = add i32 %11, %12
  %14 = call i1 @_fcf()
  br i1 %14, label %L15true, label %L15false
L15true:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str_string, i32 0, i32 0), i8* %15)
  %17 = load i32, i32* @ia
  %18 = load double, double* @fa
  %19 = load i8*, i8** @sa
  %20 = call double @_fch(i32 %17, double %18, i8* %19)
  ret double %20
  br label %L15end
L15false:
  %22 = load double, double* @fa
  %24 = fmul double %22, %23
  %25 = call double @_fcd()
  %26 = fadd double %24, %25
  %27 = call double @_fcd()
  ret double %27
  br label %L15end
L15end:
  ret double 0.0
}

define i32 @_fcj(i32 %iafcj, i32 %ibfcj, double %fafcj, double %fbfcj, i1 %bafcj) {
  %iafcj.addr = alloca i32
  store i32 %iafcj, i32* %iafcj.addr
  %ibfcj.addr = alloca i32
  store i32 %ibfcj, i32* %ibfcj.addr
  %fafcj.addr = alloca double
  store double %fafcj, double* %fafcj.addr
  %fbfcj.addr = alloca double
  store double %fbfcj, double* %fbfcj.addr
  %bafcj.addr = alloca i1
  store i1 %bafcj, i1* %bafcj.addr
  %fcjia = alloca i32
  %fcjib = alloca i32
  %1 = load i32, i32* @ia
  %2 = load i32, i32* @ib
  %3 = add i32 %1, %2
  %4 = load i32, i32* @ic
  %5 = load i32, i32* @id
  %6 = mul i32 %4, %5
  %7 = load i32, i32* @ie
  %8 = srem i32 %6, %7
  %9 = sub i32 %3, %8
  store i32 %9, i32* %fcjia
  %10 = load i32, i32* %fcjia
  %11 = load i32, i32* %fcjia
  %12 = call i32 @_fcb()
  %13 = load i32, i32* %fcjib
  %14 = call i32 @_fcb()
  %15 = load double, double* @fb
  %16 = load i8*, i8** @sa
  %17 = call double @_fch(i32 %14, double %15, i8* %16)
  %18 = load double, double* @fd
  %19 = load i8*, i8** @sb
  %20 = call double @_fci(i32 %12, i32 %13, double %17, double %18, i8* %19)
  %21 = call i32 @_fcg(i32 %11, double %20)
  %22 = icmp sgt i32 %10, %21
  br i1 %22, label %L23true, label %L23false
L23true:
  %23 = load i1, i1* @ba
  br i1 %23, label %L24true, label %L24false
L24true:
  %24 = fadd double 0.01, 0.0
  store double %24, double* @fc
  br label %L24end
L24false:
  %25 = load double, double* @fc
  %26 = load double, double* @fe
  %27 = fadd double %25, %26
  store double %27, double* @fc
  br i1 %28, label %L29true, label %L29false
L29true:
  br label %L29cond
L29cond:
  %29 = call i1 @_fcf()
  br i1 %29, label %L29body, label %L29end
L29body:
  %30 = load i32, i32* %fcjia
  %31 = call i32 @_fcb()
  %32 = add i32 12, 0
  %33 = sdiv i32 %31, %32
  %34 = add i32 %30, %33
  %35 = load i32, i32* @ia
  %37 = add i32 %35, %36
  %38 = load double, double* @fa
  %39 = call i32 @_fcg(i32 %37, double %38)
  %40 = add i32 %34, %39
  %42 = sub i32 %40, %41
  store i32 %42, i32* %fcjib
  br label %L29cond
L29end:
  br label %L29end
L29false:
  br label %L29end
L29end:
  br label %L24end
L24end:
  br label %L23end
L23false:
  br label %L23end
L23end:
  br label %L44cond
L44cond:
  %44 = load i1, i1* @bb
  br i1 %44, label %L44body, label %L44end
L44body:
  %45 = load i1, i1* @bc
  br i1 %45, label %L46true, label %L46false
L46true:
  %46 = load i1, i1* @bd
  %47 = alloca i1
  br i1 %46, label %L47_true, label %L47_false
L47_true:
  %48 = load i1, i1* @ba
  store i1 %48, i1* %47
  br label %L47_end
L47_false:
  store i1 false, i1* %47
  br label %L47_end
L47_end:
  %49 = load i1, i1* %47
  store i1 %49, i1* @bd
  %50 = load i1, i1* @ba
  %51 = alloca i1
  br i1 %50, label %L51_true, label %L51_false
L51_true:
  %52 = call i1 @_fcf()
  store i1 %52, i1* %51
  br label %L51_end
L51_false:
  store i1 false, i1* %51
  br label %L51_end
L51_end:
  %53 = load i1, i1* %51
  %54 = alloca i1
  br i1 %53, label %L54_true, label %L54_false
L54_true:
  store i1 true, i1* %54
  br label %L54_end
L54_false:
  %55 = load i1, i1* @bd
  %56 = alloca i1
  br i1 %55, label %L56_true, label %L56_false
L56_true:
  %57 = load i1, i1* @bc
  %58 = xor i1 %57, true
  store i1 %58, i1* %56
  br label %L56_end
L56_false:
  store i1 false, i1* %56
  br label %L56_end
L56_end:
  %59 = load i1, i1* %56
  store i1 %59, i1* %54
  br label %L54_end
L54_end:
  %60 = load i1, i1* %54
  store i1 %60, i1* @bd
  br label %L46end
L46false:
  br label %L46end
L46end:
  br label %L44cond
L44end:
  %61 = add i32 101, 0
  %62 = sub i32 0, %61
  ret i32 %62
  ret i32 0
}

define void @_main() {
  %1 = add i32 1, 0
  store i32 %1, i32* @ia
  %2 = add i32 1, 0
  store i32 %2, i32* @ib
  %3 = add i32 1, 0
  store i32 %3, i32* @ic
  %4 = add i32 1, 0
  store i32 %4, i32* @id
  %5 = add i32 1, 0
  store i32 %5, i32* @ie
  %6 = fadd double 0.1, 0.0
  store double %6, double* @fa
  %7 = fadd double 0.1, 0.0
  store double %7, double* @fb
  %8 = fadd double 0.1, 0.0
  store double %8, double* @fc
  %9 = fadd double 0.1, 0.0
  store double %9, double* @fd
  %10 = fadd double 0.1, 0.0
  store double %10, double* @fe
  %mia = alloca i32
  %mib = alloca i32
  br label %L11cond
L11cond:
  %11 = load i32, i32* @ia
  %12 = load i32, i32* @ib
  %13 = icmp sgt i32 %11, %12
  %14 = alloca i1
  br i1 %13, label %L14_true, label %L14_false
L14_true:
  %15 = call i1 @_fcf()
  store i1 %15, i1* %14
  br label %L14_end
L14_false:
  store i1 false, i1* %14
  br label %L14_end
L14_end:
  %16 = load i1, i1* %14
  br i1 %16, label %L11body, label %L11end
L11body:
  %17 = call i32 @_fcb()
  %18 = call i32 @_fcb()
  %19 = load double, double* @fe
  %20 = call i32 @_fcg(i32 %18, double %19)
  %21 = load i32, i32* %mia
  %22 = call i32 @_fcb()
  %23 = call double @_fcd()
  %24 = call i32 @_fcg(i32 %22, double %23)
  %25 = add i32 123, 0
  %26 = load i32, i32* @ia
  %27 = call double @_fcd()
  %28 = call i8* @_fce()
  %29 = call double @_fch(i32 %26, double %27, i8* %28)
  %30 = call double @_fcd()
  %31 = load i8*, i8** @sc
  %32 = call double @_fci(i32 %24, i32 %25, double %29, double %30, i8* %31)
  %33 = call double @_fcd()
  %34 = call i1 @_fcf()
  %35 = call i32 @_fcj(i32 %20, i32 %21, double %32, double %33, i1 %34)
  %36 = icmp sgt i32 %17, %35
  br i1 %36, label %L37true, label %L37false
L37true:
  %37 = add i32 12, 0
  %38 = load i32, i32* @ia
  %39 = load double, double* @fa
  %40 = fadd double 100000000000.000000, 0.0
  %41 = load i1, i1* @ba
  %42 = call i32 @_fcj(i32 %37, i32 %38, double %39, double %40, i1 %41)
  store i32 %42, i32* %mib
  br label %L37end
L37false:
  %43 = load i32, i32* @ia
  %44 = call i32 @_fcb()
  %45 = add i32 %43, %44
  store i32 %45, i32* %mib
  br label %L37end
L37end:
  br label %L11cond
L11end:
  %46 = load i32, i32* %mib
  %47 = add i32 123, 0
  %48 = add i32 456, 0
  %49 = call i32 @_fcb()
  %50 = add i32 %48, %49
  %51 = call double @_fcd()
  %52 = fadd double 123.321, 0.0
  %53 = fadd double %51, %52
  %54 = call i32 @_fcg(i32 %50, double %53)
  %55 = add i32 %47, %54
  %56 = load i32, i32* @ia
  %57 = load i32, i32* @ib
  %58 = add i32 %56, %57
  %59 = load i32, i32* @ic
  %60 = add i32 12, 0
  %61 = sdiv i32 %59, %60
  %62 = sub i32 %58, %61
  %63 = load i32, i32* @id
  %64 = load i32, i32* @ie
  %65 = mul i32 %63, %64
  %66 = call i32 @_fcb()
  %67 = load double, double* @fa
  %68 = call i32 @_fcg(i32 %66, double %67)
  %69 = srem i32 %65, %68
  %70 = add i32 %62, %69
  %71 = load i32, i32* @ia
  %72 = load i32, i32* @ib
  %73 = add i32 %71, %72
  %74 = add i32 123, 0
  %75 = load double, double* @fa
  %76 = call double @_fcd()
  %77 = fadd double 100000000000.000000, 0.0
  %78 = fdiv double %76, %77
  %79 = fsub double %75, %78
  %80 = call double @_fcd()
  %81 = call i8* @_fce()
  %82 = call double @_fci(i32 %73, i32 %74, double %79, double %80, i8* %81)
  %83 = add i32 312, 0
  %84 = add i32 12, 0
  %85 = add i32 %83, %84
  %86 = call double @_fcd()
  %87 = fadd double 10000000000000000000000.000000, 0.0
  %88 = fadd double %86, %87
  %89 = call i8* @_fce()
  %90 = call double @_fch(i32 %85, double %88, i8* %89)
  %91 = call i1 @_fcf()
  %92 = alloca i1
  br i1 %91, label %L92_true, label %L92_false
L92_true:
  %93 = load i1, i1* @ba
  store i1 %93, i1* %92
  br label %L92_end
L92_false:
  store i1 false, i1* %92
  br label %L92_end
L92_end:
  %94 = load i1, i1* %92
  %95 = alloca i1
  br i1 %94, label %L95_true, label %L95_false
L95_true:
  store i1 true, i1* %95
  br label %L95_end
L95_false:
  %96 = load i1, i1* @bb
  store i1 %96, i1* %95
  br label %L95_end
L95_end:
  %97 = load i1, i1* %95
  %98 = call i32 @_fcj(i32 %55, i32 %70, double %82, double %90, i1 %97)
  %99 = add i32 %46, %98
  store i32 %99, i32* %mia
  ret void
}

define i32 @main() {
  call void @_main()
  ret i32 0
}
