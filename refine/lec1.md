# LECTURE1

## 如何降低系统的复杂性？

就是将一系列简单的思想、过程（包括过程，过程也就是函数）、算法进行封装，然后成为一个模块（黑盒），进而通过模块的复用、组合来拼装成一个大的结构。

输入是一个过程，输出也是一个过程。

可以设计一门新的语言，通过隐藏某些细节，突出某些细节，从而达到降低这个特殊任务的复杂度的要求。

## primitive elements of programming language

## means of combination

## means of abstraction

``(define A (* 5 5))``

``(define square (lambda (x)(* x x)))``

``(define (square x) (* x x))``
前二个就是将``square``定义为一个过程，并没有本质区别。
第三个就是一个Syntactic sugar，方便使用
