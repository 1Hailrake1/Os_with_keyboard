#include "../common.h"
#include "../drivers/screen.h"
#include "./utils.h"


s32		kmain()
{	
	clear_screen();
	
	kprint("Welcome to My OS\n");
	kprint("@Filimonov Stanislav ");
	return 0;
}
