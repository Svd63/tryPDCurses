env = Environment()

env['ENV']['PATH'] = ['E:/Svd63/winlibs-i686-posix-dwarf-gcc-15.0.0-snapshot20240616-mingw-w64msvcrt-12.0.0-r1/bin']
env['BUILDERS']['CustomCC'] = Builder(action='g++ -c -O2 -Wall -I./include -o$TARGET $SOURCE')
env['BUILDERS']['CustomLINK'] = Builder(action='g++ -o$TARGET $SOURCE ./lib/pdcurses.a')

raino = env.CustomCC(['rain.o'], ['rain.c'])
env.Alias('raino', raino)

raine = env.CustomLINK(['rain.exe'], ['rain.o'])
env.Alias('raine', raine)

env.Alias('rain', [raino, raine])

env.Alias('build', ['rain'])
Default('build')
