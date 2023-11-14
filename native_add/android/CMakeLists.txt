cmake_minimum_required(VERSION 3.4.1)  # for example
add_library( native_add

             # Sets the library as a shared library.
             SHARED

             #指定C代码目录
             ../ios/Classes/native_add.cpp 
)