import cffi

ffi = cffi.FFI()
ffi.cdef("int main(int argc, char **argv);")
lib = ffi.dlopen("./lsti.so")


def lsti_main():
    lib.main(2, [ffi.new("char[]", "arg0"), ffi.new("char[]", "systemImage")])


if __name__ == "__main__":
    lsti_main()
