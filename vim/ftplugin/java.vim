compiler maven
call SetTabstop(4)
call AutocloseForProgramming()

let g:ale_java_javalsp_executable = expand('~/Dropbox/bin/java-language-server/bin/java')
let g:ale_linters.java = ['javalsp']

