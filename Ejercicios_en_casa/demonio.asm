if [ $# -eq 1]
then
	echo "Compilando y ejecutando"
	nasm -f elf $1.asm
