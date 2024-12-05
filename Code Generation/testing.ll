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
L0:
  %0 = alloca i32
  br label %return
return:
  ret void
}

define i32 @_fcb() {
L0:
  %0 = alloca i32
  %fafcb = alloca i32
  %1 = add i32 132, 0
  store i32 %1, i32* %fafcb
  %2 = load i32, i32* %fafcb
  %3 = load i32, i32* %fafcb
  store i32 %3, i32* %0
  br label %return
return:
  %4 = load i32, i32* %0
  ret i32 %4
}

define double @_fcd() {
L0:
  %0 = alloca double
  %1 = fadd double 1.000000, 0.0
  %2 = fadd double 0.007, 0.0
  %3 = fadd double %1, %2
  store double %3, double* %0
  br label %return
return:
  %4 = load double, double* %0
  ret double %4
}

define i8* @_fce() {
L0:
  %0 = alloca i8*
  %strfce = alloca i8*
  %1 = load i8*, i8** %strfce
  store i8* %1, i8** %0
  br label %return
return:
  %2 = load i8*, i8** %0
  ret i8* %2
}

define i1 @_fcf() {
L0:
  %0 = alloca i1
  %bafcf = alloca i1
  %1 = load i1, i1* %bafcf
  store i1 %1, i1* %0
  br label %return
return:
  %2 = load i1, i1* %0
  ret i1 %2
}

define i32 @_fcg(i32 %iafcg, double %fafcg) {
L0:
  %0 = alloca i32
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
  store i32 %4, i32* %0
  br label %return
L4false:
 br label %L4end
L4end:
  %5 = call i32 @_fcb()
  store i32 %5, i32* %0
  br label %return
return:
  %6 = load i32, i32* %0
  ret i32 %6
}

define double @_fch(i32 %iafch, double %fafch, i8* %safch) {
L0:
  %0 = alloca double
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
  %6 = load i1, i1* @bb
  br i1 %6, label %L7true, label %L7false
L7true:
  %7 = load i32, i32* @ia
  %8 = load i32, i32* @ib
  %9 = add i32 %7, %8
  store i32 %9, i32* %iafch.addr
  %10 = load i32, i32* %iafch.addr
  %11 = load double, double* @fa
  store double %11, double* %fafch.addr
  %12 = load double, double* %fafch.addr
  %13 = load double, double* %fafch.addr
  store double %13, double* @fb
  %14 = load i32, i32* %iafch.addr
  store i32 %14, i32* @id
  br label %L7end
L7false:
 br label %L7end
L7end:
  %15 = fadd double 0.01, 0.0
  store double %15, double* %0
  br label %return
return:
  %16 = load double, double* %0
  ret double %16
}

define double @_fci(i32 %iafci, i32 %ibfci, double %fafci, double %fbfci, i8* %safci) {
L0:
  %0 = alloca double
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
  %7 = load i32, i32* %ibfci.addr
  %8 = add i32 12, 0
  %9 = add i32 %7, %8
  %10 = load i32, i32* @ic
  %11 = add i32 %9, %10
  %12 = call i32 @_fcb()
  %13 = add i32 %11, %12
  store i32 %13, i32* %iafci.addr
  %14 = load i32, i32* %iafci.addr
  %15 = call i1 @_fcf()
  br i1 %15, label %L16true, label %L16false
L16true:
  %16 = load i8*, i8** %safci.addr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str_string, i32 0, i32 0), i8* %16)
  %18 = load i32, i32* @ia
  %19 = load double, double* @fa
  %20 = load i8*, i8** @sa
  %21 = call double @_fch(i32 %18, double %19, i8* %20)
  store double %21, double* %0
  br label %return
L16false:
  %22 = load double, double* @fa
  %23 = load double, double* %fbfci.addr
  %24 = fmul double %22, %23
  %25 = call double @_fcd()
  %26 = fadd double %24, %25
  store double %26, double* %fafci.addr
  %27 = load double, double* %fafci.addr
  %28 = call double @_fcd()
  store double %28, double* %0
  br label %return
L16end:
return:
  %29 = load double, double* %0
  ret double %29
}

define i32 @_fcj(i32 %iafcj, i32 %ibfcj, double %fafcj, double %fbfcj, i1 %bafcj) {
L0:
  %0 = alloca i32
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
  %12 = load i32, i32* %fcjia
  %13 = call i32 @_fcb()
  %14 = load i32, i32* %fcjib
  %15 = call i32 @_fcb()
  %16 = load double, double* @fb
  %17 = load i8*, i8** @sa
  %18 = call double @_fch(i32 %15, double %16, i8* %17)
  %19 = load double, double* @fd
  %20 = load i8*, i8** @sb
  %21 = call double @_fci(i32 %13, i32 %14, double %18, double %19, i8* %20)
  %22 = call i32 @_fcg(i32 %12, double %21)
  %23 = icmp sgt i32 %11, %22
  br i1 %23, label %L24true, label %L24false
L24true:
  %24 = load i1, i1* @ba
  br i1 %24, label %L25true, label %L25false
L25true:
  %25 = fadd double 0.01, 0.0
  store double %25, double* @fc
  br label %L25end
L25false:
  %26 = load double, double* @fc
  %27 = load double, double* @fe
  %28 = fadd double %26, %27
  store double %28, double* @fc
  %29 = load i1, i1* %bafcj.addr
  br i1 %29, label %L30true, label %L30false
L30true:
  br label %L0cond
L0cond:
  %30 = call i1 @_fcf()
  br i1 %30, label %L0body, label %L0end
L0body:
  %31 = load i32, i32* %fcjia
  %32 = call i32 @_fcb()
  %33 = add i32 12, 0
  %34 = sdiv i32 %32, %33
  %35 = add i32 %31, %34
  %36 = load i32, i32* @ia
  %37 = load i32, i32* %iafcj.addr
  %38 = add i32 %36, %37
  %39 = load double, double* @fa
  %40 = call i32 @_fcg(i32 %38, double %39)
  %41 = add i32 %35, %40
  %42 = load i32, i32* %ibfcj.addr
  %43 = sub i32 %41, %42
  store i32 %43, i32* %fcjib
  %44 = load i32, i32* %fcjib
  %45 = load double, double* %fafcj.addr
  store double %45, double* %fbfcj.addr
  %46 = load double, double* %fbfcj.addr
  br label %L0cond
L0end:
  br label %L30end
L30false:
 br label %L30end
L30end:
 br label %L25end
L25end:
  br label %L24end
L24false:
 br label %L24end
L24end:
  br label %L1cond
L1cond:
  %47 = load i1, i1* @bb
  br i1 %47, label %L1body, label %L1end
L1body:
  %48 = load i1, i1* @bc
  br i1 %48, label %L49true, label %L49false
L49true:
  %49 = load i1, i1* @bd
  %50 = alloca i1
  br i1 %49, label %L50_true, label %L50_false
L50_true:
  %51 = load i1, i1* @ba
  store i1 %51, i1* %50
  br label %L50_end
L50_false:
  store i1 false, i1* %50
  br label %L50_end
L50_end:
  %52 = load i1, i1* %50
  store i1 %52, i1* @bd
  %53 = load i1, i1* @ba
  %54 = alloca i1
  br i1 %53, label %L54_true, label %L54_false
L54_true:
  %55 = call i1 @_fcf()
  store i1 %55, i1* %54
  br label %L54_end
L54_false:
  store i1 false, i1* %54
  br label %L54_end
L54_end:
  %56 = load i1, i1* %54
  %57 = alloca i1
  br i1 %56, label %L2_true, label %L2_false
L2_true:
  store i1 true, i1* %57
  br label %L2_end
L2_false:
  %58 = load i1, i1* @bd
  %59 = alloca i1
  br i1 %58, label %L59_true, label %L59_false
L59_true:
  %60 = load i1, i1* @bc
  %61 = xor i1 %60, true
  store i1 %61, i1* %59
  br label %L59_end
L59_false:
  store i1 false, i1* %59
  br label %L59_end
L59_end:
  %62 = load i1, i1* %59
  store i1 %62, i1* %57
  br label %L2_end
L2_end:
  %63 = load i1, i1* %57
  store i1 %63, i1* @bd
  br label %L49end
L49false:
 br label %L49end
L49end:
  br label %L1cond
L1end:
  %64 = add i32 101, 0
  %65 = sub i32 0, %64
  store i32 %65, i32* %0
  br label %return
return:
  %66 = load i32, i32* %0
  ret i32 %66
}

define void @_main() {
L0:
  %0 = alloca i32
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
  br label %L3cond
L3cond:
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
  br i1 %16, label %L3body, label %L3end
L3body:
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
  %43 = load i32, i32* %mib
  br label %L37end
L37false:
  %44 = load i32, i32* @ia
  %45 = call i32 @_fcb()
  %46 = add i32 %44, %45
  store i32 %46, i32* %mib
  %47 = load i32, i32* %mib
 br label %L37end
L37end:
  br label %L3cond
L3end:
  %48 = load i32, i32* %mib
  %49 = add i32 123, 0
  %50 = add i32 456, 0
  %51 = call i32 @_fcb()
  %52 = add i32 %50, %51
  %53 = call double @_fcd()
  %54 = fadd double 123.321, 0.0
  %55 = fadd double %53, %54
  %56 = call i32 @_fcg(i32 %52, double %55)
  %57 = add i32 %49, %56
  %58 = load i32, i32* @ia
  %59 = load i32, i32* @ib
  %60 = add i32 %58, %59
  %61 = load i32, i32* @ic
  %62 = add i32 12, 0
  %63 = sdiv i32 %61, %62
  %64 = sub i32 %60, %63
  %65 = load i32, i32* @id
  %66 = load i32, i32* @ie
  %67 = mul i32 %65, %66
  %68 = call i32 @_fcb()
  %69 = load double, double* @fa
  %70 = call i32 @_fcg(i32 %68, double %69)
  %71 = srem i32 %67, %70
  %72 = add i32 %64, %71
  %73 = load i32, i32* @ia
  %74 = load i32, i32* @ib
  %75 = add i32 %73, %74
  %76 = add i32 123, 0
  %77 = load double, double* @fa
  %78 = call double @_fcd()
  %79 = fadd double 100000000000.000000, 0.0
  %80 = fdiv double %78, %79
  %81 = fsub double %77, %80
  %82 = call double @_fcd()
  %83 = call i8* @_fce()
  %84 = call double @_fci(i32 %75, i32 %76, double %81, double %82, i8* %83)
  %85 = add i32 312, 0
  %86 = add i32 12, 0
  %87 = add i32 %85, %86
  %88 = call double @_fcd()
  %89 = fadd double 10000000000000000000000.000000, 0.0
  %90 = fadd double %88, %89
  %91 = call i8* @_fce()
  %92 = call double @_fch(i32 %87, double %90, i8* %91)
  %93 = call i1 @_fcf()
  %94 = alloca i1
  br i1 %93, label %L94_true, label %L94_false
L94_true:
  %95 = load i1, i1* @ba
  store i1 %95, i1* %94
  br label %L94_end
L94_false:
  store i1 false, i1* %94
  br label %L94_end
L94_end:
  %96 = load i1, i1* %94
  %97 = alloca i1
  br i1 %96, label %L4_true, label %L4_false
L4_true:
  store i1 true, i1* %97
  br label %L4_end
L4_false:
  %98 = load i1, i1* @bb
  store i1 %98, i1* %97
  br label %L4_end
L4_end:
  %99 = load i1, i1* %97
  %100 = call i32 @_fcj(i32 %57, i32 %72, double %84, double %92, i1 %99)
  %101 = add i32 %48, %100
  store i32 %101, i32* %mia
  %102 = load i32, i32* %mia
  br label %return
return:
  ret void
}

define i32 @main() {
  call void @_main()
  ret i32 0
}
